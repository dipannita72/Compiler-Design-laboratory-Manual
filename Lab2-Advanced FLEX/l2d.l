DIGIT [0-9]
ID [a-z][a-z0-9]*
%%
{DIGIT}+    { int a=atoi( yytext );
		char c = yytext[2];
		printf("%c",c);
		printf( "An integer: %s (%d)\n", yytext, a);
		if(a%2 ==0){
		printf("even\n");
		}
		else{
			printf("odd\n");
	}
	} 
.
int yywrap()
{
	return 1;
}

int main()
{
	
            yyin = fopen( "m.c", "r" );
	    
	yylex();
	return 0;
}