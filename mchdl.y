%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    int yyerror(char *msg);
%}

%union {
    char *s;
    int i;
}

%token <s> TOK_IDENT
%token <i> TOK_NUM
%token TOK_BEGIN TOK_END
%token TOK_OPEN TOK_CLOSE
%token TOK_ARROW TOK_SEMI
%token TOK_COMMA

%%

file : global
     | file global
     ;

global : TOK_SEMI
       | def TOK_SEMI
       | def TOK_BEGIN body TOK_END
       ;

def : TOK_NUM TOK_IDENT TOK_OPEN defargs TOK_CLOSE
    ;

defargs : var
        | defargs TOK_COMMA var
        ;

body : expr
     | body expr
     ;

expr : var TOK_ARROW call TOK_SEMI
     | var TOK_ARROW TOK_IDENT TOK_SEMI
     ;

var : TOK_NUM TOK_IDENT
    ;

call : TOK_IDENT TOK_OPEN args TOK_CLOSE
     ;

args : TOK_IDENT
     | args TOK_COMMA TOK_IDENT
     ;

%%

int main()
{
    yyparse();
}
