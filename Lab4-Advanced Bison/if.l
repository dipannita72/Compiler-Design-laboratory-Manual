/* C Declarations */

%{
	#include<stdio.h>
	#include "IF.tab.h"
	#include<stdlib.h>
	extern int yylval;
%}

/* RE and Actions */

%%

[0-9]+	{ 
		yylval = atoi(yytext);
		return NUM;
	}

[a-z]	{
		yylval = *yytext - 'a';
		return	VAR;
	}

"if"	{ return IF;	}
"else"	{ return ELSE;	}

[-+/*<>=,();] 	{
			yylval = yytext[0];
			return *yytext;
		}

[ \t\n]*	;

.	{
		yyerror("Unknown Character.\n");
	}
%%

