%{
/* Implementation of input() */
#undef yywrap
#define yywrap() 1

%}

%%

[a-zA-Z0-9]+ {

	printf("\nContains mixed letters = ");
	ECHO;
}

"/*" {
	//printf("\nThe comment begins");
	char c;
	while(c=input()!='*');
	if(c=input()=='/')
		printf("\nThe comment ends");		
}

%%

main()
{
	yylex();
}