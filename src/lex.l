%{
  #include <stdio.h>
  #include <string.h>
  #include "y.tab.h"
  #include "tree.h"

  #define N  9 //Number of reserved words

  #define RED "\033[0;31m"
  #define NC "\033[0m"

  int isID(char *var);
%}

DIGIT [0-9]
LETTER [a-zA-Z]

%%
"//".*                                    { /* DO NOTHING */ }
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { /* DO NOTHING */ }

{DIGIT}                     {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(DEC_CONST);
                            }
[1-9]{DIGIT}*               {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(DEC_CONST);
                            }
"*"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('*');
                            }
"/"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('/');
                            }
"%"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('%');
                            }
"+"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('+');
                            }
"-"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('-');
                            }
"!"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('!');
                            }
"="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('=');
                            }
"<"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('<');
                            }
">"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('>');
                            }
"<="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(LE);
                             }
">="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(GE);
                             }
"=="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(EQ);
                             }
"!="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(NE);
                             }
"&&"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(AND);
                             }
"||"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(OR);
                             }
"+="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(PLE);
                             }
"-="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(MNE);
                             }
"*="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(MLE);
                             }
"/="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(SBE);
                             }
"%="                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(MDE);
                             }
"("                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('(');
                            }
")"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(')');
                            }
"{"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('{');
                            }
"}"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return('}');
                            }
","                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(',');
                            }
";"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(';');
                            }
":"                         {
                               /*printf("%s\n",yytext);*/
                               strcpy(yylval.ystr, yytext);
                               return(':');
                            }


{LETTER}({LETTER}|{DIGIT}|"_")*   {

                                     /*printf("%s\n",yytext);*/
                                     int i = isID(yytext);
                                     if(i==ID)
                                        strcpy(yylval.ystr, yytext);
                                     else
                                        yylval.yint = i;
                                     return(i);
                                  }

[ \f\r\t]+                        // DO NOTHING
[\n]                              { line_number++; }
.                                 {
                                    printf("%sUnexpected character: %s\n%s",RED, yytext, NC);
                                  }

%%

static char *syms[N]={"break","continue","else","for","if","int","print","var","while"};
static int symsVal[N]={BREAK, CONTINUE, ELSE, FOR, IF, INT, PRINT, VAR, WHILE};

/*
 * Returns 0 if the string given is a reserved word, or ID (1) if the string is an id.
 */
int isID(char *var) {
    int i = 0;

    // Check if the variable given is reserved
    for(i=0; i < N; i++) {
      if (strcmp(var,syms[i]) == 0)
          return symsVal[i];
    }

    return ID;
}
