
_sed:     file format elf32-i386


Disassembly of section .text:

00000000 <replace>:
#include "user.h"

char buf[512];

int
replace(int size, char *haystack, char *needle, char *replacement) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
	int i, j = 0, flag = 0,
   6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		start = 0, len,
  14:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
		output = 0, 
  1b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
		needleSize = strlen(needle), replacementSize = strlen(replacement);
  22:	8b 45 10             	mov    0x10(%ebp),%eax
  25:	89 04 24             	mov    %eax,(%esp)
  28:	e8 cd 04 00 00       	call   4fa <strlen>
  2d:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30:	8b 45 14             	mov    0x14(%ebp),%eax
  33:	89 04 24             	mov    %eax,(%esp)
  36:	e8 bf 04 00 00       	call   4fa <strlen>
  3b:	89 45 d8             	mov    %eax,-0x28(%ebp)

	char temp;

	for (i = 0; i < size; ++i) {
  3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  45:	e9 e1 00 00 00       	jmp    12b <replace+0x12b>
		++len;
  4a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
		if (haystack[i] == needle[j]) {
  4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  51:	03 45 0c             	add    0xc(%ebp),%eax
  54:	0f b6 10             	movzbl (%eax),%edx
  57:	8b 45 f0             	mov    -0x10(%ebp),%eax
  5a:	03 45 10             	add    0x10(%ebp),%eax
  5d:	0f b6 00             	movzbl (%eax),%eax
  60:	38 c2                	cmp    %al,%dl
  62:	75 54                	jne    b8 <replace+0xb8>
			++j;
  64:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			if (j == needleSize) {
  68:	8b 45 f0             	mov    -0x10(%ebp),%eax
  6b:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  6e:	0f 85 b3 00 00 00    	jne    127 <replace+0x127>
				++output;
  74:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
				flag = 1;
  78:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
				while (j > 0) {
  7f:	eb 2f                	jmp    b0 <replace+0xb0>
					if (j - 1 < replacementSize) 
  81:	8b 45 f0             	mov    -0x10(%ebp),%eax
  84:	83 e8 01             	sub    $0x1,%eax
  87:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  8a:	7d 20                	jge    ac <replace+0xac>
						haystack[i - (needleSize - j)] = replacement[j - 1];
  8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  8f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  92:	89 d1                	mov    %edx,%ecx
  94:	29 c1                	sub    %eax,%ecx
  96:	89 c8                	mov    %ecx,%eax
  98:	03 45 f4             	add    -0xc(%ebp),%eax
  9b:	03 45 0c             	add    0xc(%ebp),%eax
  9e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  a1:	83 ea 01             	sub    $0x1,%edx
  a4:	03 55 14             	add    0x14(%ebp),%edx
  a7:	0f b6 12             	movzbl (%edx),%edx
  aa:	88 10                	mov    %dl,(%eax)
					--j;
  ac:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
		if (haystack[i] == needle[j]) {
			++j;
			if (j == needleSize) {
				++output;
				flag = 1;
				while (j > 0) {
  b0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  b4:	7f cb                	jg     81 <replace+0x81>
  b6:	eb 6f                	jmp    127 <replace+0x127>
						haystack[i - (needleSize - j)] = replacement[j - 1];
					--j;
				}
			}
		}
		else if (haystack[i] == '\n') {
  b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  bb:	03 45 0c             	add    0xc(%ebp),%eax
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	3c 0a                	cmp    $0xa,%al
  c3:	75 5b                	jne    120 <replace+0x120>
			if (flag == 1) {
  c5:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
  c9:	75 46                	jne    111 <replace+0x111>
				temp = haystack[i];
  cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  ce:	03 45 0c             	add    0xc(%ebp),%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	88 45 d7             	mov    %al,-0x29(%ebp)
				haystack[i] = '\0';
  d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  da:	03 45 0c             	add    0xc(%ebp),%eax
  dd:	c6 00 00             	movb   $0x0,(%eax)
				printf(1, "%s", haystack + start);
  e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  e3:	03 45 0c             	add    0xc(%ebp),%eax
  e6:	89 44 24 08          	mov    %eax,0x8(%esp)
  ea:	c7 44 24 04 00 0c 00 	movl   $0xc00,0x4(%esp)
  f1:	00 
  f2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f9:	e8 3d 07 00 00       	call   83b <printf>
				flag = 0;
  fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
				haystack[i] = temp;
 105:	8b 45 f4             	mov    -0xc(%ebp),%eax
 108:	03 45 0c             	add    0xc(%ebp),%eax
 10b:	0f b6 55 d7          	movzbl -0x29(%ebp),%edx
 10f:	88 10                	mov    %dl,(%eax)
			}
			start = i;
 111:	8b 45 f4             	mov    -0xc(%ebp),%eax
 114:	89 45 e8             	mov    %eax,-0x18(%ebp)
			len = 0;
 117:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 11e:	eb 07                	jmp    127 <replace+0x127>
		}
		else
			j = 0;
 120:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		output = 0, 
		needleSize = strlen(needle), replacementSize = strlen(replacement);

	char temp;

	for (i = 0; i < size; ++i) {
 127:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 12b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 12e:	3b 45 08             	cmp    0x8(%ebp),%eax
 131:	0f 8c 13 ff ff ff    	jl     4a <replace+0x4a>
			len = 0;
		}
		else
			j = 0;
	}
	return output;
 137:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
 13a:	c9                   	leave  
 13b:	c3                   	ret    

0000013c <sed>:

void
sed(int fd, char *from, char *to) {
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	83 ec 28             	sub    $0x28,%esp
	int n, total = 0;
 142:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0) {
 149:	eb 24                	jmp    16f <sed+0x33>
		total += replace(n, buf, from, to);
 14b:	8b 45 10             	mov    0x10(%ebp),%eax
 14e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 152:	8b 45 0c             	mov    0xc(%ebp),%eax
 155:	89 44 24 08          	mov    %eax,0x8(%esp)
 159:	c7 44 24 04 60 0f 00 	movl   $0xf60,0x4(%esp)
 160:	00 
 161:	8b 45 f0             	mov    -0x10(%ebp),%eax
 164:	89 04 24             	mov    %eax,(%esp)
 167:	e8 94 fe ff ff       	call   0 <replace>
 16c:	01 45 f4             	add    %eax,-0xc(%ebp)
}

void
sed(int fd, char *from, char *to) {
	int n, total = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0) {
 16f:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 176:	00 
 177:	c7 44 24 04 60 0f 00 	movl   $0xf60,0x4(%esp)
 17e:	00 
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	89 04 24             	mov    %eax,(%esp)
 185:	e8 52 05 00 00       	call   6dc <read>
 18a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 18d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 191:	7f b8                	jg     14b <sed+0xf>
		total += replace(n, buf, from, to);
	}
	if(n < 0) {
 193:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 197:	79 24                	jns    1bd <sed+0x81>
		printf(1, "sed: read error\n");
 199:	c7 44 24 04 03 0c 00 	movl   $0xc03,0x4(%esp)
 1a0:	00 
 1a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a8:	e8 8e 06 00 00       	call   83b <printf>
		close(fd);
 1ad:	8b 45 08             	mov    0x8(%ebp),%eax
 1b0:	89 04 24             	mov    %eax,(%esp)
 1b3:	e8 34 05 00 00       	call   6ec <close>
		exit();
 1b8:	e8 07 05 00 00       	call   6c4 <exit>
	}
	else
		printf(1, "\n\nFound and Replaced %d occurences\n", total);
 1bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c4:	c7 44 24 04 14 0c 00 	movl   $0xc14,0x4(%esp)
 1cb:	00 
 1cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d3:	e8 63 06 00 00       	call   83b <printf>
}
 1d8:	c9                   	leave  
 1d9:	c3                   	ret    

000001da <main>:

int
main(int argc, char *argv[]) {
 1da:	55                   	push   %ebp
 1db:	89 e5                	mov    %esp,%ebp
 1dd:	83 e4 f0             	and    $0xfffffff0,%esp
 1e0:	83 ec 30             	sub    $0x30,%esp
	int i, fd, fromSet = 0;
 1e3:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
 1ea:	00 
	char *filename, *from, *to;

	if(argc <= 1){
 1eb:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 1ef:	7f 21                	jg     212 <main+0x38>
   		sed(0, "the", "xyz");
 1f1:	c7 44 24 08 38 0c 00 	movl   $0xc38,0x8(%esp)
 1f8:	00 
 1f9:	c7 44 24 04 3c 0c 00 	movl   $0xc3c,0x4(%esp)
 200:	00 
 201:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 208:	e8 2f ff ff ff       	call   13c <sed>
	    exit();
 20d:	e8 b2 04 00 00       	call   6c4 <exit>
	}
	else if (argc == 2) {
 212:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 216:	0f 85 81 00 00 00    	jne    29d <main+0xc3>
		if ((fd = open(argv[1], 0)) < 0) {
 21c:	8b 45 0c             	mov    0xc(%ebp),%eax
 21f:	83 c0 04             	add    $0x4,%eax
 222:	8b 00                	mov    (%eax),%eax
 224:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 22b:	00 
 22c:	89 04 24             	mov    %eax,(%esp)
 22f:	e8 d0 04 00 00       	call   704 <open>
 234:	89 44 24 18          	mov    %eax,0x18(%esp)
 238:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 23d:	79 31                	jns    270 <main+0x96>
			printf(1, "sed: cannot open %s\n", argv[1]);
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	83 c0 04             	add    $0x4,%eax
 245:	8b 00                	mov    (%eax),%eax
 247:	89 44 24 08          	mov    %eax,0x8(%esp)
 24b:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 252:	00 
 253:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 25a:	e8 dc 05 00 00       	call   83b <printf>
      		close(fd);
 25f:	8b 44 24 18          	mov    0x18(%esp),%eax
 263:	89 04 24             	mov    %eax,(%esp)
 266:	e8 81 04 00 00       	call   6ec <close>
      		exit();
 26b:	e8 54 04 00 00       	call   6c4 <exit>
		}
		sed(fd, "the", "xyz");
 270:	c7 44 24 08 38 0c 00 	movl   $0xc38,0x8(%esp)
 277:	00 
 278:	c7 44 24 04 3c 0c 00 	movl   $0xc3c,0x4(%esp)
 27f:	00 
 280:	8b 44 24 18          	mov    0x18(%esp),%eax
 284:	89 04 24             	mov    %eax,(%esp)
 287:	e8 b0 fe ff ff       	call   13c <sed>
		close(fd);
 28c:	8b 44 24 18          	mov    0x18(%esp),%eax
 290:	89 04 24             	mov    %eax,(%esp)
 293:	e8 54 04 00 00       	call   6ec <close>
 298:	e9 bc 01 00 00       	jmp    459 <main+0x27f>
	}
	else if (argc == 3) {
 29d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
 2a1:	0f 85 aa 00 00 00    	jne    351 <main+0x177>
		for (i = 1; i < argc; ++i) {
 2a7:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
 2ae:	00 
 2af:	eb 76                	jmp    327 <main+0x14d>
			if (argv[i][0] == '-') {
 2b1:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 2b5:	c1 e0 02             	shl    $0x2,%eax
 2b8:	03 45 0c             	add    0xc(%ebp),%eax
 2bb:	8b 00                	mov    (%eax),%eax
 2bd:	0f b6 00             	movzbl (%eax),%eax
 2c0:	3c 2d                	cmp    $0x2d,%al
 2c2:	75 39                	jne    2fd <main+0x123>
				if (fromSet == 0) {
 2c4:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
 2c9:	75 1d                	jne    2e8 <main+0x10e>
					from = argv[i] + 1;
 2cb:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 2cf:	c1 e0 02             	shl    $0x2,%eax
 2d2:	03 45 0c             	add    0xc(%ebp),%eax
 2d5:	8b 00                	mov    (%eax),%eax
 2d7:	83 c0 01             	add    $0x1,%eax
 2da:	89 44 24 20          	mov    %eax,0x20(%esp)
					fromSet = 1;
 2de:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
 2e5:	00 
 2e6:	eb 3a                	jmp    322 <main+0x148>
				}
				else
					to = argv[i] + 1;
 2e8:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 2ec:	c1 e0 02             	shl    $0x2,%eax
 2ef:	03 45 0c             	add    0xc(%ebp),%eax
 2f2:	8b 00                	mov    (%eax),%eax
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 2fb:	eb 25                	jmp    322 <main+0x148>
			}
			else {
				printf(1, "sed: illegal argument %s\n", argv[1]);
 2fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 300:	83 c0 04             	add    $0x4,%eax
 303:	8b 00                	mov    (%eax),%eax
 305:	89 44 24 08          	mov    %eax,0x8(%esp)
 309:	c7 44 24 04 55 0c 00 	movl   $0xc55,0x4(%esp)
 310:	00 
 311:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 318:	e8 1e 05 00 00       	call   83b <printf>
				exit();
 31d:	e8 a2 03 00 00       	call   6c4 <exit>
		}
		sed(fd, "the", "xyz");
		close(fd);
	}
	else if (argc == 3) {
		for (i = 1; i < argc; ++i) {
 322:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)
 327:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 32b:	3b 45 08             	cmp    0x8(%ebp),%eax
 32e:	7c 81                	jl     2b1 <main+0xd7>
				printf(1, "sed: illegal argument %s\n", argv[1]);
				exit();
			}
		}

		sed(0, from, to);
 330:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 334:	89 44 24 08          	mov    %eax,0x8(%esp)
 338:	8b 44 24 20          	mov    0x20(%esp),%eax
 33c:	89 44 24 04          	mov    %eax,0x4(%esp)
 340:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 347:	e8 f0 fd ff ff       	call   13c <sed>
	    exit();
 34c:	e8 73 03 00 00       	call   6c4 <exit>
	}
	else if (argc == 4) {
 351:	83 7d 08 04          	cmpl   $0x4,0x8(%ebp)
 355:	0f 85 ea 00 00 00    	jne    445 <main+0x26b>
		for (i = 1; i < argc; ++i) {
 35b:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
 362:	00 
 363:	eb 61                	jmp    3c6 <main+0x1ec>
			if (argv[i][0] == '-') {
 365:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 369:	c1 e0 02             	shl    $0x2,%eax
 36c:	03 45 0c             	add    0xc(%ebp),%eax
 36f:	8b 00                	mov    (%eax),%eax
 371:	0f b6 00             	movzbl (%eax),%eax
 374:	3c 2d                	cmp    $0x2d,%al
 376:	75 39                	jne    3b1 <main+0x1d7>
				if (fromSet == 0) {
 378:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
 37d:	75 1d                	jne    39c <main+0x1c2>
					from = argv[i] + 1;
 37f:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 383:	c1 e0 02             	shl    $0x2,%eax
 386:	03 45 0c             	add    0xc(%ebp),%eax
 389:	8b 00                	mov    (%eax),%eax
 38b:	83 c0 01             	add    $0x1,%eax
 38e:	89 44 24 20          	mov    %eax,0x20(%esp)
					fromSet = 1;
 392:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
 399:	00 
 39a:	eb 25                	jmp    3c1 <main+0x1e7>
				}
				else
					to = argv[i] + 1;
 39c:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 3a0:	c1 e0 02             	shl    $0x2,%eax
 3a3:	03 45 0c             	add    0xc(%ebp),%eax
 3a6:	8b 00                	mov    (%eax),%eax
 3a8:	83 c0 01             	add    $0x1,%eax
 3ab:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 3af:	eb 10                	jmp    3c1 <main+0x1e7>
			}
			else
				filename = argv[i];
 3b1:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 3b5:	c1 e0 02             	shl    $0x2,%eax
 3b8:	03 45 0c             	add    0xc(%ebp),%eax
 3bb:	8b 00                	mov    (%eax),%eax
 3bd:	89 44 24 24          	mov    %eax,0x24(%esp)

		sed(0, from, to);
	    exit();
	}
	else if (argc == 4) {
		for (i = 1; i < argc; ++i) {
 3c1:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)
 3c6:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 3ca:	3b 45 08             	cmp    0x8(%ebp),%eax
 3cd:	7c 96                	jl     365 <main+0x18b>
			}
			else
				filename = argv[i];
		}

		if ((fd = open(filename, 0)) < 0) {
 3cf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3d6:	00 
 3d7:	8b 44 24 24          	mov    0x24(%esp),%eax
 3db:	89 04 24             	mov    %eax,(%esp)
 3de:	e8 21 03 00 00       	call   704 <open>
 3e3:	89 44 24 18          	mov    %eax,0x18(%esp)
 3e7:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 3ec:	79 2d                	jns    41b <main+0x241>
			printf(1, "sed: cannot open %s\n", filename);
 3ee:	8b 44 24 24          	mov    0x24(%esp),%eax
 3f2:	89 44 24 08          	mov    %eax,0x8(%esp)
 3f6:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 3fd:	00 
 3fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 405:	e8 31 04 00 00       	call   83b <printf>
      		close(fd);
 40a:	8b 44 24 18          	mov    0x18(%esp),%eax
 40e:	89 04 24             	mov    %eax,(%esp)
 411:	e8 d6 02 00 00       	call   6ec <close>
      		exit();
 416:	e8 a9 02 00 00       	call   6c4 <exit>
		}
		sed(fd, from, to);
 41b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 41f:	89 44 24 08          	mov    %eax,0x8(%esp)
 423:	8b 44 24 20          	mov    0x20(%esp),%eax
 427:	89 44 24 04          	mov    %eax,0x4(%esp)
 42b:	8b 44 24 18          	mov    0x18(%esp),%eax
 42f:	89 04 24             	mov    %eax,(%esp)
 432:	e8 05 fd ff ff       	call   13c <sed>
		close(fd);
 437:	8b 44 24 18          	mov    0x18(%esp),%eax
 43b:	89 04 24             	mov    %eax,(%esp)
 43e:	e8 a9 02 00 00       	call   6ec <close>
 443:	eb 14                	jmp    459 <main+0x27f>
	}

	else
		printf(1, "Sed accepts either 0 - 3 arguments.\n");
 445:	c7 44 24 04 70 0c 00 	movl   $0xc70,0x4(%esp)
 44c:	00 
 44d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 454:	e8 e2 03 00 00       	call   83b <printf>

	exit();
 459:	e8 66 02 00 00       	call   6c4 <exit>
 45e:	90                   	nop
 45f:	90                   	nop

00000460 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 465:	8b 4d 08             	mov    0x8(%ebp),%ecx
 468:	8b 55 10             	mov    0x10(%ebp),%edx
 46b:	8b 45 0c             	mov    0xc(%ebp),%eax
 46e:	89 cb                	mov    %ecx,%ebx
 470:	89 df                	mov    %ebx,%edi
 472:	89 d1                	mov    %edx,%ecx
 474:	fc                   	cld    
 475:	f3 aa                	rep stos %al,%es:(%edi)
 477:	89 ca                	mov    %ecx,%edx
 479:	89 fb                	mov    %edi,%ebx
 47b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 47e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 481:	5b                   	pop    %ebx
 482:	5f                   	pop    %edi
 483:	5d                   	pop    %ebp
 484:	c3                   	ret    

00000485 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
 488:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 48b:	8b 45 08             	mov    0x8(%ebp),%eax
 48e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 491:	90                   	nop
 492:	8b 45 0c             	mov    0xc(%ebp),%eax
 495:	0f b6 10             	movzbl (%eax),%edx
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	88 10                	mov    %dl,(%eax)
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
 4a0:	0f b6 00             	movzbl (%eax),%eax
 4a3:	84 c0                	test   %al,%al
 4a5:	0f 95 c0             	setne  %al
 4a8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 4ac:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 4b0:	84 c0                	test   %al,%al
 4b2:	75 de                	jne    492 <strcpy+0xd>
    ;
  return os;
 4b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4b7:	c9                   	leave  
 4b8:	c3                   	ret    

000004b9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4b9:	55                   	push   %ebp
 4ba:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 4bc:	eb 08                	jmp    4c6 <strcmp+0xd>
    p++, q++;
 4be:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 4c2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 4c6:	8b 45 08             	mov    0x8(%ebp),%eax
 4c9:	0f b6 00             	movzbl (%eax),%eax
 4cc:	84 c0                	test   %al,%al
 4ce:	74 10                	je     4e0 <strcmp+0x27>
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
 4d3:	0f b6 10             	movzbl (%eax),%edx
 4d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d9:	0f b6 00             	movzbl (%eax),%eax
 4dc:	38 c2                	cmp    %al,%dl
 4de:	74 de                	je     4be <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	0f b6 00             	movzbl (%eax),%eax
 4e6:	0f b6 d0             	movzbl %al,%edx
 4e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ec:	0f b6 00             	movzbl (%eax),%eax
 4ef:	0f b6 c0             	movzbl %al,%eax
 4f2:	89 d1                	mov    %edx,%ecx
 4f4:	29 c1                	sub    %eax,%ecx
 4f6:	89 c8                	mov    %ecx,%eax
}
 4f8:	5d                   	pop    %ebp
 4f9:	c3                   	ret    

000004fa <strlen>:

uint
strlen(char *s)
{
 4fa:	55                   	push   %ebp
 4fb:	89 e5                	mov    %esp,%ebp
 4fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 500:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 507:	eb 04                	jmp    50d <strlen+0x13>
 509:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 50d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 510:	03 45 08             	add    0x8(%ebp),%eax
 513:	0f b6 00             	movzbl (%eax),%eax
 516:	84 c0                	test   %al,%al
 518:	75 ef                	jne    509 <strlen+0xf>
    ;
  return n;
 51a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 51d:	c9                   	leave  
 51e:	c3                   	ret    

0000051f <memset>:

void*
memset(void *dst, int c, uint n)
{
 51f:	55                   	push   %ebp
 520:	89 e5                	mov    %esp,%ebp
 522:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 525:	8b 45 10             	mov    0x10(%ebp),%eax
 528:	89 44 24 08          	mov    %eax,0x8(%esp)
 52c:	8b 45 0c             	mov    0xc(%ebp),%eax
 52f:	89 44 24 04          	mov    %eax,0x4(%esp)
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	89 04 24             	mov    %eax,(%esp)
 539:	e8 22 ff ff ff       	call   460 <stosb>
  return dst;
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 541:	c9                   	leave  
 542:	c3                   	ret    

00000543 <strchr>:

char*
strchr(const char *s, char c)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	83 ec 04             	sub    $0x4,%esp
 549:	8b 45 0c             	mov    0xc(%ebp),%eax
 54c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 54f:	eb 14                	jmp    565 <strchr+0x22>
    if(*s == c)
 551:	8b 45 08             	mov    0x8(%ebp),%eax
 554:	0f b6 00             	movzbl (%eax),%eax
 557:	3a 45 fc             	cmp    -0x4(%ebp),%al
 55a:	75 05                	jne    561 <strchr+0x1e>
      return (char*)s;
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	eb 13                	jmp    574 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 561:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	84 c0                	test   %al,%al
 56d:	75 e2                	jne    551 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 56f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 574:	c9                   	leave  
 575:	c3                   	ret    

00000576 <gets>:

char*
gets(char *buf, int max)
{
 576:	55                   	push   %ebp
 577:	89 e5                	mov    %esp,%ebp
 579:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 57c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 583:	eb 44                	jmp    5c9 <gets+0x53>
    cc = read(0, &c, 1);
 585:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 58c:	00 
 58d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 590:	89 44 24 04          	mov    %eax,0x4(%esp)
 594:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 59b:	e8 3c 01 00 00       	call   6dc <read>
 5a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 5a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5a7:	7e 2d                	jle    5d6 <gets+0x60>
      break;
    buf[i++] = c;
 5a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ac:	03 45 08             	add    0x8(%ebp),%eax
 5af:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 5b3:	88 10                	mov    %dl,(%eax)
 5b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 5b9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 5bd:	3c 0a                	cmp    $0xa,%al
 5bf:	74 16                	je     5d7 <gets+0x61>
 5c1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 5c5:	3c 0d                	cmp    $0xd,%al
 5c7:	74 0e                	je     5d7 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cc:	83 c0 01             	add    $0x1,%eax
 5cf:	3b 45 0c             	cmp    0xc(%ebp),%eax
 5d2:	7c b1                	jl     585 <gets+0xf>
 5d4:	eb 01                	jmp    5d7 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 5d6:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 5d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5da:	03 45 08             	add    0x8(%ebp),%eax
 5dd:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 5e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5e3:	c9                   	leave  
 5e4:	c3                   	ret    

000005e5 <stat>:

int
stat(char *n, struct stat *st)
{
 5e5:	55                   	push   %ebp
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 5f2:	00 
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	89 04 24             	mov    %eax,(%esp)
 5f9:	e8 06 01 00 00       	call   704 <open>
 5fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 601:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 605:	79 07                	jns    60e <stat+0x29>
    return -1;
 607:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 60c:	eb 23                	jmp    631 <stat+0x4c>
  r = fstat(fd, st);
 60e:	8b 45 0c             	mov    0xc(%ebp),%eax
 611:	89 44 24 04          	mov    %eax,0x4(%esp)
 615:	8b 45 f4             	mov    -0xc(%ebp),%eax
 618:	89 04 24             	mov    %eax,(%esp)
 61b:	e8 fc 00 00 00       	call   71c <fstat>
 620:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 623:	8b 45 f4             	mov    -0xc(%ebp),%eax
 626:	89 04 24             	mov    %eax,(%esp)
 629:	e8 be 00 00 00       	call   6ec <close>
  return r;
 62e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 631:	c9                   	leave  
 632:	c3                   	ret    

00000633 <atoi>:

int
atoi(const char *s)
{
 633:	55                   	push   %ebp
 634:	89 e5                	mov    %esp,%ebp
 636:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 639:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 640:	eb 23                	jmp    665 <atoi+0x32>
    n = n*10 + *s++ - '0';
 642:	8b 55 fc             	mov    -0x4(%ebp),%edx
 645:	89 d0                	mov    %edx,%eax
 647:	c1 e0 02             	shl    $0x2,%eax
 64a:	01 d0                	add    %edx,%eax
 64c:	01 c0                	add    %eax,%eax
 64e:	89 c2                	mov    %eax,%edx
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	0f b6 00             	movzbl (%eax),%eax
 656:	0f be c0             	movsbl %al,%eax
 659:	01 d0                	add    %edx,%eax
 65b:	83 e8 30             	sub    $0x30,%eax
 65e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 661:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 665:	8b 45 08             	mov    0x8(%ebp),%eax
 668:	0f b6 00             	movzbl (%eax),%eax
 66b:	3c 2f                	cmp    $0x2f,%al
 66d:	7e 0a                	jle    679 <atoi+0x46>
 66f:	8b 45 08             	mov    0x8(%ebp),%eax
 672:	0f b6 00             	movzbl (%eax),%eax
 675:	3c 39                	cmp    $0x39,%al
 677:	7e c9                	jle    642 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 67c:	c9                   	leave  
 67d:	c3                   	ret    

0000067e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 68a:	8b 45 0c             	mov    0xc(%ebp),%eax
 68d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 690:	eb 13                	jmp    6a5 <memmove+0x27>
    *dst++ = *src++;
 692:	8b 45 f8             	mov    -0x8(%ebp),%eax
 695:	0f b6 10             	movzbl (%eax),%edx
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	88 10                	mov    %dl,(%eax)
 69d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 6a1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6a5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 6a9:	0f 9f c0             	setg   %al
 6ac:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 6b0:	84 c0                	test   %al,%al
 6b2:	75 de                	jne    692 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 6b7:	c9                   	leave  
 6b8:	c3                   	ret    
 6b9:	90                   	nop
 6ba:	90                   	nop
 6bb:	90                   	nop

000006bc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6bc:	b8 01 00 00 00       	mov    $0x1,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <exit>:
SYSCALL(exit)
 6c4:	b8 02 00 00 00       	mov    $0x2,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <wait>:
SYSCALL(wait)
 6cc:	b8 03 00 00 00       	mov    $0x3,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <pipe>:
SYSCALL(pipe)
 6d4:	b8 04 00 00 00       	mov    $0x4,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <read>:
SYSCALL(read)
 6dc:	b8 05 00 00 00       	mov    $0x5,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <write>:
SYSCALL(write)
 6e4:	b8 10 00 00 00       	mov    $0x10,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <close>:
SYSCALL(close)
 6ec:	b8 15 00 00 00       	mov    $0x15,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <kill>:
SYSCALL(kill)
 6f4:	b8 06 00 00 00       	mov    $0x6,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <exec>:
SYSCALL(exec)
 6fc:	b8 07 00 00 00       	mov    $0x7,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <open>:
SYSCALL(open)
 704:	b8 0f 00 00 00       	mov    $0xf,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <mknod>:
SYSCALL(mknod)
 70c:	b8 11 00 00 00       	mov    $0x11,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <unlink>:
SYSCALL(unlink)
 714:	b8 12 00 00 00       	mov    $0x12,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <fstat>:
SYSCALL(fstat)
 71c:	b8 08 00 00 00       	mov    $0x8,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <link>:
SYSCALL(link)
 724:	b8 13 00 00 00       	mov    $0x13,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <mkdir>:
SYSCALL(mkdir)
 72c:	b8 14 00 00 00       	mov    $0x14,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <chdir>:
SYSCALL(chdir)
 734:	b8 09 00 00 00       	mov    $0x9,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <dup>:
SYSCALL(dup)
 73c:	b8 0a 00 00 00       	mov    $0xa,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    

00000744 <getpid>:
SYSCALL(getpid)
 744:	b8 0b 00 00 00       	mov    $0xb,%eax
 749:	cd 40                	int    $0x40
 74b:	c3                   	ret    

0000074c <sbrk>:
SYSCALL(sbrk)
 74c:	b8 0c 00 00 00       	mov    $0xc,%eax
 751:	cd 40                	int    $0x40
 753:	c3                   	ret    

00000754 <sleep>:
SYSCALL(sleep)
 754:	b8 0d 00 00 00       	mov    $0xd,%eax
 759:	cd 40                	int    $0x40
 75b:	c3                   	ret    

0000075c <uptime>:
SYSCALL(uptime)
 75c:	b8 0e 00 00 00       	mov    $0xe,%eax
 761:	cd 40                	int    $0x40
 763:	c3                   	ret    

00000764 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	83 ec 28             	sub    $0x28,%esp
 76a:	8b 45 0c             	mov    0xc(%ebp),%eax
 76d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 770:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 777:	00 
 778:	8d 45 f4             	lea    -0xc(%ebp),%eax
 77b:	89 44 24 04          	mov    %eax,0x4(%esp)
 77f:	8b 45 08             	mov    0x8(%ebp),%eax
 782:	89 04 24             	mov    %eax,(%esp)
 785:	e8 5a ff ff ff       	call   6e4 <write>
}
 78a:	c9                   	leave  
 78b:	c3                   	ret    

0000078c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 78c:	55                   	push   %ebp
 78d:	89 e5                	mov    %esp,%ebp
 78f:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 792:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 799:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 79d:	74 17                	je     7b6 <printint+0x2a>
 79f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7a3:	79 11                	jns    7b6 <printint+0x2a>
    neg = 1;
 7a5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 7af:	f7 d8                	neg    %eax
 7b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7b4:	eb 06                	jmp    7bc <printint+0x30>
  } else {
    x = xx;
 7b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 7b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7c3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 7c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c9:	ba 00 00 00 00       	mov    $0x0,%edx
 7ce:	f7 f1                	div    %ecx
 7d0:	89 d0                	mov    %edx,%eax
 7d2:	0f b6 90 18 0f 00 00 	movzbl 0xf18(%eax),%edx
 7d9:	8d 45 dc             	lea    -0x24(%ebp),%eax
 7dc:	03 45 f4             	add    -0xc(%ebp),%eax
 7df:	88 10                	mov    %dl,(%eax)
 7e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 7e5:	8b 55 10             	mov    0x10(%ebp),%edx
 7e8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 7eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ee:	ba 00 00 00 00       	mov    $0x0,%edx
 7f3:	f7 75 d4             	divl   -0x2c(%ebp)
 7f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7fd:	75 c4                	jne    7c3 <printint+0x37>
  if(neg)
 7ff:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 803:	74 2a                	je     82f <printint+0xa3>
    buf[i++] = '-';
 805:	8d 45 dc             	lea    -0x24(%ebp),%eax
 808:	03 45 f4             	add    -0xc(%ebp),%eax
 80b:	c6 00 2d             	movb   $0x2d,(%eax)
 80e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 812:	eb 1b                	jmp    82f <printint+0xa3>
    putc(fd, buf[i]);
 814:	8d 45 dc             	lea    -0x24(%ebp),%eax
 817:	03 45 f4             	add    -0xc(%ebp),%eax
 81a:	0f b6 00             	movzbl (%eax),%eax
 81d:	0f be c0             	movsbl %al,%eax
 820:	89 44 24 04          	mov    %eax,0x4(%esp)
 824:	8b 45 08             	mov    0x8(%ebp),%eax
 827:	89 04 24             	mov    %eax,(%esp)
 82a:	e8 35 ff ff ff       	call   764 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 82f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 833:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 837:	79 db                	jns    814 <printint+0x88>
    putc(fd, buf[i]);
}
 839:	c9                   	leave  
 83a:	c3                   	ret    

0000083b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 83b:	55                   	push   %ebp
 83c:	89 e5                	mov    %esp,%ebp
 83e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 841:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 848:	8d 45 0c             	lea    0xc(%ebp),%eax
 84b:	83 c0 04             	add    $0x4,%eax
 84e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 851:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 858:	e9 7d 01 00 00       	jmp    9da <printf+0x19f>
    c = fmt[i] & 0xff;
 85d:	8b 55 0c             	mov    0xc(%ebp),%edx
 860:	8b 45 f0             	mov    -0x10(%ebp),%eax
 863:	01 d0                	add    %edx,%eax
 865:	0f b6 00             	movzbl (%eax),%eax
 868:	0f be c0             	movsbl %al,%eax
 86b:	25 ff 00 00 00       	and    $0xff,%eax
 870:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 873:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 877:	75 2c                	jne    8a5 <printf+0x6a>
      if(c == '%'){
 879:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 87d:	75 0c                	jne    88b <printf+0x50>
        state = '%';
 87f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 886:	e9 4b 01 00 00       	jmp    9d6 <printf+0x19b>
      } else {
        putc(fd, c);
 88b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 88e:	0f be c0             	movsbl %al,%eax
 891:	89 44 24 04          	mov    %eax,0x4(%esp)
 895:	8b 45 08             	mov    0x8(%ebp),%eax
 898:	89 04 24             	mov    %eax,(%esp)
 89b:	e8 c4 fe ff ff       	call   764 <putc>
 8a0:	e9 31 01 00 00       	jmp    9d6 <printf+0x19b>
      }
    } else if(state == '%'){
 8a5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8a9:	0f 85 27 01 00 00    	jne    9d6 <printf+0x19b>
      if(c == 'd'){
 8af:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8b3:	75 2d                	jne    8e2 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8b8:	8b 00                	mov    (%eax),%eax
 8ba:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8c1:	00 
 8c2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8c9:	00 
 8ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ce:	8b 45 08             	mov    0x8(%ebp),%eax
 8d1:	89 04 24             	mov    %eax,(%esp)
 8d4:	e8 b3 fe ff ff       	call   78c <printint>
        ap++;
 8d9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8dd:	e9 ed 00 00 00       	jmp    9cf <printf+0x194>
      } else if(c == 'x' || c == 'p'){
 8e2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 8e6:	74 06                	je     8ee <printf+0xb3>
 8e8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 8ec:	75 2d                	jne    91b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 8ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8f1:	8b 00                	mov    (%eax),%eax
 8f3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8fa:	00 
 8fb:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 902:	00 
 903:	89 44 24 04          	mov    %eax,0x4(%esp)
 907:	8b 45 08             	mov    0x8(%ebp),%eax
 90a:	89 04 24             	mov    %eax,(%esp)
 90d:	e8 7a fe ff ff       	call   78c <printint>
        ap++;
 912:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 916:	e9 b4 00 00 00       	jmp    9cf <printf+0x194>
      } else if(c == 's'){
 91b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 91f:	75 46                	jne    967 <printf+0x12c>
        s = (char*)*ap;
 921:	8b 45 e8             	mov    -0x18(%ebp),%eax
 924:	8b 00                	mov    (%eax),%eax
 926:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 929:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 92d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 931:	75 27                	jne    95a <printf+0x11f>
          s = "(null)";
 933:	c7 45 f4 95 0c 00 00 	movl   $0xc95,-0xc(%ebp)
        while(*s != 0){
 93a:	eb 1e                	jmp    95a <printf+0x11f>
          putc(fd, *s);
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	0f b6 00             	movzbl (%eax),%eax
 942:	0f be c0             	movsbl %al,%eax
 945:	89 44 24 04          	mov    %eax,0x4(%esp)
 949:	8b 45 08             	mov    0x8(%ebp),%eax
 94c:	89 04 24             	mov    %eax,(%esp)
 94f:	e8 10 fe ff ff       	call   764 <putc>
          s++;
 954:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 958:	eb 01                	jmp    95b <printf+0x120>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 95a:	90                   	nop
 95b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95e:	0f b6 00             	movzbl (%eax),%eax
 961:	84 c0                	test   %al,%al
 963:	75 d7                	jne    93c <printf+0x101>
 965:	eb 68                	jmp    9cf <printf+0x194>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 967:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 96b:	75 1d                	jne    98a <printf+0x14f>
        putc(fd, *ap);
 96d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 970:	8b 00                	mov    (%eax),%eax
 972:	0f be c0             	movsbl %al,%eax
 975:	89 44 24 04          	mov    %eax,0x4(%esp)
 979:	8b 45 08             	mov    0x8(%ebp),%eax
 97c:	89 04 24             	mov    %eax,(%esp)
 97f:	e8 e0 fd ff ff       	call   764 <putc>
        ap++;
 984:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 988:	eb 45                	jmp    9cf <printf+0x194>
      } else if(c == '%'){
 98a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 98e:	75 17                	jne    9a7 <printf+0x16c>
        putc(fd, c);
 990:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 993:	0f be c0             	movsbl %al,%eax
 996:	89 44 24 04          	mov    %eax,0x4(%esp)
 99a:	8b 45 08             	mov    0x8(%ebp),%eax
 99d:	89 04 24             	mov    %eax,(%esp)
 9a0:	e8 bf fd ff ff       	call   764 <putc>
 9a5:	eb 28                	jmp    9cf <printf+0x194>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9a7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9ae:	00 
 9af:	8b 45 08             	mov    0x8(%ebp),%eax
 9b2:	89 04 24             	mov    %eax,(%esp)
 9b5:	e8 aa fd ff ff       	call   764 <putc>
        putc(fd, c);
 9ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9bd:	0f be c0             	movsbl %al,%eax
 9c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 9c4:	8b 45 08             	mov    0x8(%ebp),%eax
 9c7:	89 04 24             	mov    %eax,(%esp)
 9ca:	e8 95 fd ff ff       	call   764 <putc>
      }
      state = 0;
 9cf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9d6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 9da:	8b 55 0c             	mov    0xc(%ebp),%edx
 9dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e0:	01 d0                	add    %edx,%eax
 9e2:	0f b6 00             	movzbl (%eax),%eax
 9e5:	84 c0                	test   %al,%al
 9e7:	0f 85 70 fe ff ff    	jne    85d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9ed:	c9                   	leave  
 9ee:	c3                   	ret    
 9ef:	90                   	nop

000009f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9f6:	8b 45 08             	mov    0x8(%ebp),%eax
 9f9:	83 e8 08             	sub    $0x8,%eax
 9fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ff:	a1 48 0f 00 00       	mov    0xf48,%eax
 a04:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a07:	eb 24                	jmp    a2d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a09:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a0c:	8b 00                	mov    (%eax),%eax
 a0e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a11:	77 12                	ja     a25 <free+0x35>
 a13:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a16:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a19:	77 24                	ja     a3f <free+0x4f>
 a1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a1e:	8b 00                	mov    (%eax),%eax
 a20:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a23:	77 1a                	ja     a3f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a25:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a28:	8b 00                	mov    (%eax),%eax
 a2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a2d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a30:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a33:	76 d4                	jbe    a09 <free+0x19>
 a35:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a38:	8b 00                	mov    (%eax),%eax
 a3a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a3d:	76 ca                	jbe    a09 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a3f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a42:	8b 40 04             	mov    0x4(%eax),%eax
 a45:	c1 e0 03             	shl    $0x3,%eax
 a48:	89 c2                	mov    %eax,%edx
 a4a:	03 55 f8             	add    -0x8(%ebp),%edx
 a4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a50:	8b 00                	mov    (%eax),%eax
 a52:	39 c2                	cmp    %eax,%edx
 a54:	75 24                	jne    a7a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 a56:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a59:	8b 50 04             	mov    0x4(%eax),%edx
 a5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5f:	8b 00                	mov    (%eax),%eax
 a61:	8b 40 04             	mov    0x4(%eax),%eax
 a64:	01 c2                	add    %eax,%edx
 a66:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a69:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6f:	8b 00                	mov    (%eax),%eax
 a71:	8b 10                	mov    (%eax),%edx
 a73:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a76:	89 10                	mov    %edx,(%eax)
 a78:	eb 0a                	jmp    a84 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 a7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a7d:	8b 10                	mov    (%eax),%edx
 a7f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a82:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 a84:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a87:	8b 40 04             	mov    0x4(%eax),%eax
 a8a:	c1 e0 03             	shl    $0x3,%eax
 a8d:	03 45 fc             	add    -0x4(%ebp),%eax
 a90:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a93:	75 20                	jne    ab5 <free+0xc5>
    p->s.size += bp->s.size;
 a95:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a98:	8b 50 04             	mov    0x4(%eax),%edx
 a9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9e:	8b 40 04             	mov    0x4(%eax),%eax
 aa1:	01 c2                	add    %eax,%edx
 aa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 aa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aac:	8b 10                	mov    (%eax),%edx
 aae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab1:	89 10                	mov    %edx,(%eax)
 ab3:	eb 08                	jmp    abd <free+0xcd>
  } else
    p->s.ptr = bp;
 ab5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 abb:	89 10                	mov    %edx,(%eax)
  freep = p;
 abd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac0:	a3 48 0f 00 00       	mov    %eax,0xf48
}
 ac5:	c9                   	leave  
 ac6:	c3                   	ret    

00000ac7 <morecore>:

static Header*
morecore(uint nu)
{
 ac7:	55                   	push   %ebp
 ac8:	89 e5                	mov    %esp,%ebp
 aca:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 acd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 ad4:	77 07                	ja     add <morecore+0x16>
    nu = 4096;
 ad6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 add:	8b 45 08             	mov    0x8(%ebp),%eax
 ae0:	c1 e0 03             	shl    $0x3,%eax
 ae3:	89 04 24             	mov    %eax,(%esp)
 ae6:	e8 61 fc ff ff       	call   74c <sbrk>
 aeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 aee:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 af2:	75 07                	jne    afb <morecore+0x34>
    return 0;
 af4:	b8 00 00 00 00       	mov    $0x0,%eax
 af9:	eb 22                	jmp    b1d <morecore+0x56>
  hp = (Header*)p;
 afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b04:	8b 55 08             	mov    0x8(%ebp),%edx
 b07:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b0d:	83 c0 08             	add    $0x8,%eax
 b10:	89 04 24             	mov    %eax,(%esp)
 b13:	e8 d8 fe ff ff       	call   9f0 <free>
  return freep;
 b18:	a1 48 0f 00 00       	mov    0xf48,%eax
}
 b1d:	c9                   	leave  
 b1e:	c3                   	ret    

00000b1f <malloc>:

void*
malloc(uint nbytes)
{
 b1f:	55                   	push   %ebp
 b20:	89 e5                	mov    %esp,%ebp
 b22:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b25:	8b 45 08             	mov    0x8(%ebp),%eax
 b28:	83 c0 07             	add    $0x7,%eax
 b2b:	c1 e8 03             	shr    $0x3,%eax
 b2e:	83 c0 01             	add    $0x1,%eax
 b31:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b34:	a1 48 0f 00 00       	mov    0xf48,%eax
 b39:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b3c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b40:	75 23                	jne    b65 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b42:	c7 45 f0 40 0f 00 00 	movl   $0xf40,-0x10(%ebp)
 b49:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b4c:	a3 48 0f 00 00       	mov    %eax,0xf48
 b51:	a1 48 0f 00 00       	mov    0xf48,%eax
 b56:	a3 40 0f 00 00       	mov    %eax,0xf40
    base.s.size = 0;
 b5b:	c7 05 44 0f 00 00 00 	movl   $0x0,0xf44
 b62:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b65:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b68:	8b 00                	mov    (%eax),%eax
 b6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 b6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b70:	8b 40 04             	mov    0x4(%eax),%eax
 b73:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b76:	72 4d                	jb     bc5 <malloc+0xa6>
      if(p->s.size == nunits)
 b78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b7b:	8b 40 04             	mov    0x4(%eax),%eax
 b7e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b81:	75 0c                	jne    b8f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b86:	8b 10                	mov    (%eax),%edx
 b88:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b8b:	89 10                	mov    %edx,(%eax)
 b8d:	eb 26                	jmp    bb5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b92:	8b 40 04             	mov    0x4(%eax),%eax
 b95:	89 c2                	mov    %eax,%edx
 b97:	2b 55 ec             	sub    -0x14(%ebp),%edx
 b9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b9d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba3:	8b 40 04             	mov    0x4(%eax),%eax
 ba6:	c1 e0 03             	shl    $0x3,%eax
 ba9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 baf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bb2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bb8:	a3 48 0f 00 00       	mov    %eax,0xf48
      return (void*)(p + 1);
 bbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc0:	83 c0 08             	add    $0x8,%eax
 bc3:	eb 38                	jmp    bfd <malloc+0xde>
    }
    if(p == freep)
 bc5:	a1 48 0f 00 00       	mov    0xf48,%eax
 bca:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 bcd:	75 1b                	jne    bea <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 bcf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bd2:	89 04 24             	mov    %eax,(%esp)
 bd5:	e8 ed fe ff ff       	call   ac7 <morecore>
 bda:	89 45 f4             	mov    %eax,-0xc(%ebp)
 bdd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 be1:	75 07                	jne    bea <malloc+0xcb>
        return 0;
 be3:	b8 00 00 00 00       	mov    $0x0,%eax
 be8:	eb 13                	jmp    bfd <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bed:	89 45 f0             	mov    %eax,-0x10(%ebp)
 bf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf3:	8b 00                	mov    (%eax),%eax
 bf5:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 bf8:	e9 70 ff ff ff       	jmp    b6d <malloc+0x4e>
}
 bfd:	c9                   	leave  
 bfe:	c3                   	ret    
