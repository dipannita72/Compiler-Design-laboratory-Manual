%{
/* This flex program is to check use of yyless() function. The yyless(n) function, accepts n characters of the token and then they will be re-scanned for finding the next match. It basically keeps reducing n characters and returns the string for re-scanning . */
/* Implementation of yyless() */
#undef yywrap
#define yywrap() 1
%}

%%

[a-z]+ {
	printf("\nLowercase word = ");
	ECHO;
	yyless(2);
	printf("\nThe word after yyless() = ");
	ECHO;
}

[a-zA-Z]+ {

	printf("\nMixed letter is = ");	
	ECHO;

}

%%

main()
{
yylex();
}