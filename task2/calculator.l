%{
    #include <stdio.h>
	#include "y.tab.h"
	// #include "calculator.h"
	// #include "float.h"
	// #include "math.h"
	#include <stdbool.h>
	#include <string.h>
%}

%option noyywrap

%%

\n {return EOL;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return TIMES;}
"/" {return DIV;}
"(" {return LPARENTHESIS;}
")" {return RPARENTHESIS;}
[0-9]+\.[0-9]+ {sscanf(yytext, "%lf", &yylval.value); return NUMBER;}
[0-9]+ {sscanf(yytext, "%lf", &yylval.value); return NUMBER;}

%%