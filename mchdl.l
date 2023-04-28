%{
    #include "y.tab.h"
%}

%%

, return TOK_COMMA;
; return TOK_SEMI;
\<- return TOK_ARROW;

\( return TOK_OPEN;
\) return TOK_CLOSE;

\{ return TOK_BEGIN;
\} return TOK_END;

[a-zA-Z]([_a-zA-Z0-9]+)? yylval.s = strdup(yytext); return TOK_IDENT;
[0-9]+ yylval.i = atoi(yytext); return TOK_NUM;
[ \t\n] /* whitespace */

%%

int yyerror(char *msg)
{
    fprintf(stderr, "%s\n", msg);
    exit(1);
}
