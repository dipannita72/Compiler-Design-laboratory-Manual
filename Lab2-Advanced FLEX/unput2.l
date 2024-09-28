%{
/* Implementation of unput() */
#include<string.h>
// Undefine the constant that flex uses when allocating its buffer
#undef YY_BUF_SIZE

// Pick some large constant. 
// In my version flex 2.5.35 Apple(flex-31) the default is 16384
#define YY_BUF_SIZE 1024*1024

#undef yywrap
#define yywrap() 1

%}

%%



[a-z]{2,4} {
	printf("match");
	ECHO;
    }

[a-zA-Z]+ {
	printf("\nmixed word = " );
	ECHO;
}

%%

main()
{
	yylex();
}