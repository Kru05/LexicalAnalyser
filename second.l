%{
#include <stdio.h>
%}

letter[a-zA-Z]
digit[0-9]
id {letter}*|({letter}{digit})+
quotes "\"".*"\""
mline ("/*"(.*(\n)*.*)*"*/")
sline ("//".*)

%%
String|float|int|double|char {printf("%s This is a Data Type\n",yytext);}
{mline} {printf("%s This is a multi-line comment",yytext);}
{sline} {printf("%s This is a single line comment",yytext);}
([A-Z][a-z]*)*  {printf("%s This is a class name\n",yytext);}
public {printf("%s This is an access modifier\n",yytext);}
void {printf("%s This is a return type\n",yytext);}
class|static|main {printf("%s This is a keyword\n",yytext);}
System.out.println {printf("%s This is a system function\n",yytext);}
{quotes} {printf("%s This is text\n",yytext);}
{id} {printf("%s This is an identifier\n",yytext);}

"+"|"-"|"*"|"/" {printf("%s This is an operator\n",yytext);}
; {printf("%s This is a termination statement\n",yytext);}
"{"|"}"|"("|")" {printf("%s This is a bracket\n",yytext);}
"=" {printf("%s This is an assignment operator\n",yytext);}
.|, 
%%

main()
{
yyin = fopen("Second.java", "r");
yylex();
}

int yywrap()
{
return 1;
}
