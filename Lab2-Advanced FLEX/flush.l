%{
/* Implementation of yy_flush_bffer() */
#undef yywrap
#define yywrap() 1

%}

%%

[a-z]+ {
	printf("\nlowercase word using yytext = %s ",yytext);
	printf("\nlowercase word using echo = ");
	ECHO;
	printf("\nlength of the word = %d",yyleng);

	YY_FLUSH_BUFFER;

	printf("\nlowercase word using echo yy_flush_buffer = ");
	ECHO;
	//printf("\nlength of the word yy_flush_buffer = %d",yyleng);
	printf("\nlowercase word using yytext after yy_flush_buffer =%s",yytext);
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