#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
	FILE *FP = stdin;

	if(argc == 2) {
		FP = fopen(argv[1], "r");
	}

	char prec;

	while((prec = getc(FP)) != EOF) {
		if(prec == '/') {
			prec = getc(FP);
			if(prec == '/') {
				while((prec = getc(FP)) != '\n');
				prec = 0;
			}
			else if(prec == '*') {
				while(getc(FP) != '*' || getc(FP) != '/');
				prec = 0;
			}
			else {
				putchar('/');
			}
		}
		if(prec) {
			putchar(prec);
		}
	}

	return 0;
}
