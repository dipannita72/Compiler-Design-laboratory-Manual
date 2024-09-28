%{
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);

    int sym[26];
%}

%token INTEGER VARIABLE

%%

program:
        program statement '\n'
        | /* NULL */
        ;

statement:
        expression                      { printf("%d\n", $1); }
        ;

expression:
        expression '+' term				{ $$ = $1 + $3; }
        | expression '-' term           { $$ = $1 + $3; }
        | term							{ $$ = $1; }
        ;
term:
		term '*' factor					{ $$ = $1 * $3; }
		|term '/' factor				{ $$ = $1 / $3; }
		|factor							{ $$ = $1; }
		;
factor:
		INTEGER							{$$ = $1; }
		|'(' expression ')'				{$$ = $2; }

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
}
