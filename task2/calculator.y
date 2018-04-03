%{
    #include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	#include <string.h>
	void yyerror(char *);
    int yylex(void);
    void print_result(double result);
%}
%union {
    double value;
}
%token EOL
%token PLUS MINUS TIMES DIV LPARENTHESIS RPARENTHESIS
%token <value> NUMBER
%type <value> expression

%%

start:
    expression EOL {print_result($1);} |
    expression EOL start {print_result($1);};
expression:
    expression PLUS expression {$$ = $1 + $3;} |
    expression MINUS expression {$$ = $1 - $3;} |
    expression TIMES expression {$$ = $1 * $3;} |
    expression DIV expression {$$ = $1 / $3;} |
    LPARENTHESIS expression RPARENTHESIS {$$ = $2;} |
    NUMBER {$$ = $1;} ;


%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

void print_result(double result){
    int result_rounded = roundf(result);
    if(result==result_rounded){
        printf("%d\n", result_rounded);
    }else{
        printf("%lf\n", result);
    }
}

int main(int argc, const char *argv[]) {
    yyparse();
    return 0;
}