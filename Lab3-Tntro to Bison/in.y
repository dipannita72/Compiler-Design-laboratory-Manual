%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <malloc.h>
	#define YYSTYPE double
	#include <math.h>
%}

%token NUMBER PLUS MINUS GUN VAG NEWLINE LP RP
%left PLUS MINUS
%left GUN VAG
%right EXPONEN

%%

start: /* empty */
	|start line
	;
line: NEWLINE
	|exp NEWLINE {printf("\t%.10g\n",$1);}
	;
exp:exp PLUS term	{$$ = $1 + $3;}
	|exp MINUS term	{$$ = $1 - $3;}
	|term	{$$ = $1;}
	;
term:term GUN factor	{$$ = $1 * $3;}
	|term VAG factor	{$$ = $1 / $3;}
	|factor	{$$ = $1;}
	;
factor:LP exp RP	{$$ = $2;}
	|NUMBER		{$$ = $1;}
	;

%%

int main()
{
yyparse();
return 0;
}

yyerror(char *s)
{
printf("%s",s);
return 0;
}
