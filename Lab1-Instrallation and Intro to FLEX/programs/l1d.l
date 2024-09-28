

%%

[/][*](.*)[*][/]	{printf("comment\n");}
[/][/].*	{printf("single comment\n");}
.
\n	
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	return 0;
}