/* C Declarations */

%{
	#include<stdio.h>
	int sym[26];
%}

/* bison declarations */

%token NUM VAR IF ELSE
 //The %nonassoc indicates no associativity is implied

%nonassoc IFX
%nonassoc ELSE
%left '<' '>'
%left '+' '-'
%left '*' '/'


/* Grammar rules and actions follow.  */

%%

program: /* NULL */

	| program statement
	;

statement: ';'

	| expression ';' 			{ printf("value of expression: %d\n", $1); }

        | VAR '=' expression ';' 		{ 
							sym[$1] = $3; 
							printf("Value of the variable: %d\t\n",$3);
						}
| IF '(' expression ')' statement  ELSE statement  {
								 	printf("\n1\n");
								   }

	| IF '(' expression ')' statement %prec IFX{
								printf("\n2\n");
								
							}

	
	;

expression: NUM				{ $$ = $1; 	}

	| VAR				{ $$ = sym[$1]; }

	| expression '+' expression	{ $$ = $1 + $3; }

	| expression '-' expression	{ $$ = $1 - $3; }

	| expression '*' expression	{ $$ = $1 * $3; }

	| expression '/' expression	{ 	$$ = $1 / $3;}

	| expression '<' expression	{ $$ = $1 < $3; }

	| expression '>' expression	{ $$ = $1 > $3; }

	| '(' expression ')'		{ $$ = $2;	}
	;
%%

int yywrap()
{
return 1;
}

main(){
	yyparse();
}

yyerror(char *s){
	printf( "%s\n", s);
}

