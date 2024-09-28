%{
/* Implementation of yyrestart() */
#undef yywrap
#define yywrap() 1

%}

%%

[a-zA-Z]+ {
	printf("\nmixed word = " );
	ECHO;
	return;
}

%%

main()
{
	yylex();
	FILE *fpt;
	fpt=fopen("input.txt","r+");
	yyrestart(fpt);
	yylex();
	printf("\nEnd of 2nd yylex"); 
	FILE *ft;
	ft=fopen("input.txt","r+");
	yyrestart(ft);
	yylex();
	printf("\nEnd of 1st yylex");
	
}