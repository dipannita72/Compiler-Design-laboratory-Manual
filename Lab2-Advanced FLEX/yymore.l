%{

/*This flex program is to check use of yymore() function. The yymore() function will output yytext, when the action part of any rule which has yymore() is finished.It basically outputs the matched input only after the rule has been executed. */
/* Implementing yymore() */
#undef yywrap
#define yywrap() 1

%}

%%

[a-z]+ {

	printf("\nLowercase letter = ");
	ECHO;
	printf("\nStart of 1st yymore\n");
	yymore();
	printf("\nEnd of 1st yymore\n");
}

[A-Z]+ {
	printf("\nUppercase letter = ");
	ECHO;
	printf("\nStart of 2nd yymore\n");
	yymore();
	printf("\nEnd of 2nd yymore\n");
}
\n

%%


main()
{

yylex();

}

