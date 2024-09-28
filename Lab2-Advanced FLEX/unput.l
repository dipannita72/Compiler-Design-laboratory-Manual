%{
/* Implementation of unput() */
#undef yywrap
#define yywrap() 1

%}

%%

"st" {
	printf("\nThe unput char = ");
	ECHO;
}

[a-z]+ {
	printf("\nlowercase word = ");
	ECHO;
	unput('t');
	printf("\nlowercase word after unput 't' = ");
	ECHO;
	unput('s');
	printf("\nlowercase word after unput 's' = ");
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