%{
/* Implementation of yyterminate() */
#undef yywrap
#define yywrap() 1

%}

%%

[a-z]+ {
	printf("\nlowercase word = ");
	ECHO;
	printf("\nStart of yyteminate()");
	yyterminate();
	printf("\nEnd of yyterminate");
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