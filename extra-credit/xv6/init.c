// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "bcrypt.h"

#define MAX_PASSWORD 12
#define SALT 16

char *argv[] = { "sh", 0 };

void try_login();

uchar
randomc () 
{
  // acceptable characters for random char
  const uchar charset[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  int index = random() % (sizeof charset - 1);

  return charset[index];
}

void
create_password()
{
  int valid = 0;
  int i;
  int new_password_file = 0;
  
  char pass[MAX_PASSWORD];
  char confirm[MAX_PASSWORD];
  uchar salt[SALT];
  // SALT + newline delim, Salted password
  uchar* hashed;

  while (!valid) {
    printf(0, "Enter password: ");
    gets(pass, MAX_PASSWORD);
    printf(0, "Re-enter to confirm: ");
    gets(confirm, MAX_PASSWORD);
    
    if (strcmp(pass, confirm) == 0) {
      valid = 1;
    }
    else {
      printf(0, "Passwords do not match. Try again.\n");
    }
  }

  for (i = 0; i < SALT; ++i) {
    salt[i] = randomc();
  }

  for (i = 0; i < MAX_PASSWORD; ++i) {
    if (pass[i] == '\n') {
      pass[i] = '\0';
    }
  }

  hashed = bcrypt(pass, salt);

  new_password_file = open("passwords", O_CREATE|O_RDWR);
  write(new_password_file, salt, SALT);
  write(new_password_file, hashed, BCRYPT_HASHLEN);
  
  printf(0, "Password successfully set. You may now use it to log in.\n");

  close(new_password_file);
  try_login();
}

void
try_login() 
{
  int pass_file_fd = open("passwords", O_RDONLY);
  int i;

  char pass[MAX_PASSWORD];
  uchar saltBuffer[SALT + 1];
  uchar hashBuffer[BCRYPT_HASHLEN + 1];

  if (pass_file_fd < 1) {
    printf(0, "No password set. Please choose one.\n");
    close(pass_file_fd);
    create_password();
  }
  else {
    read(pass_file_fd, saltBuffer, SALT);
    read(pass_file_fd, hashBuffer, BCRYPT_HASHLEN);
    saltBuffer[SALT] = '\0';
    hashBuffer[BCRYPT_HASHLEN] = '\0';

    while (1) {
      printf(0, "Enter password: ");
      gets(pass, MAX_PASSWORD);

      for (i = 0; i < MAX_PASSWORD; ++i) {
        if (pass[i] == '\n') {
          pass[i] = '\0';
        }
      }

      if (bcrypt_checkpass(pass, saltBuffer, hashBuffer) != 0) {
        printf(0, "Invalid password, try again.\n");
      }
      else {
        break;
      }
    }

    close(pass_file_fd);
  }
}

int
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }

  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    // LOGIN FUNCTION
    try_login();
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
}
