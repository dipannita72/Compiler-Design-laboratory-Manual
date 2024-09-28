
/* C declarations */
						
%{
	#include <stdio.h>
	#include <math.h>
	#define YYSTYPE int
%}


/* Bison declarations */
		
%start program	 /*define the start symble */	
		     
%token INT FLOAT CHAR ID SM CM   /* define token type for numbers */

%%	  	


/* Simple grammar rules */

program: 
       |program declaration
       ;

declaration: TYPE ID1 ','	{ 
					printf("\nValid Declaration\n");
					
				}


TYPE : INT	{printf("\nIts integer\n"); }

     | FLOAT	{printf("\nits float\n"); }

     | CHAR	{ printf("\nits character\n"); }
     ;

ID1  : ID1 ';' ID	{ printf("\n1\n");}

     |ID		{ printf("\n2\n");}
     ;
