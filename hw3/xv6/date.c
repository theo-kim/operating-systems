#include "types.h"
#include "user.h"
#include "date.h"

int
main(int argc, char *argv[])
{
	struct rtcdate r;
	int i = date(&r);
	if (i != 0) {
		printf(2, "date failed\n");
		exit();
	}

	// Date currently in UTC, convert to EST
	if (r.hour < 5) {
		r.hour = 24 - (5 - r.hour);
		r.day = r.day - 1;
	}
	else {
		r.hour -= 5;
	}
  	printf(1, "%d-%d-%d %d:%d:%d\n", r.year, r.month, r.day, r.hour, r.minute, r.second);

	exit();
}