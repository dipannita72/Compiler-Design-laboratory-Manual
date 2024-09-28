

%%

[+-]?[0-9]+[.][0-9]+|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+	{printf("floating value\n");}

%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("floating value recognization\n");
	yylex();
	return 0;
}