%{
int word_count = 0;
int b = 0;

%}

%%

a	|
ab	|
abc	|
abcd	{ECHO; REJECT;}  
.
%%

int yywrap()
{
	return 1;
}

int main()
{

	int i = yylex();
	printf("%d", i);

	//int t = yylex();
	//printf("%d", t);
}
