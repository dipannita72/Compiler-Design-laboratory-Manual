/*bison flex different file*/

/* C Declarations */

%{
	#include <stdio.h>
	#include "id.tab.h"	/* header for token defination */
%}

ID	[a-zA-z][a-zA-z0-9_]*


/*RE and Action*/

%%

[ \t]+	
"int"	return(INT);
"char"	return(CHAR);
"float"	return(FLOAT);          
{ID}	return(ID);
[,;]	return(*yytext);	
.	{ printf("\nunknown character"); }
%%

/* user subroutines */

int main()
{
	printf("Declaration : ");
	/*yyin = fopen("a.txt","r");*/
	yyparse();
	return 0;
}

void yyerror (char const *s)
{
	fprintf (stderr, "%s\n", s);
}

int yywrap()
{
	return 0;
}
