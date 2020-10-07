%{
#include <stdio.h>	
#include "sintatico.tab.h"
int linha = 1;
%}

%option noyywrap

%%
var 				{return S_VAR;}
program			{return S_PROGRAM;}
if 					{return S_IF;}
then 				{return S_THEN;}
else				{return S_ELSE;}
"."					{return S_PONTO;}
","					{return S_VIRGULA;}
";"					{return S_PONTOVG;}
begin				{return S_BEGIN;}
end					{return S_END;}
":="				{return S_ATRIB;}
"+"					{return S_MAIS;}
"-"         {return S_MENOS;}
"*"					{return S_VEZES;}
"/"					{return S_DIVI;}
">"					{return S_MAIORQUE;}
"<"					{return S_MENORQUE;}
">="				{return S_MAIOR_IGUAL_QUE;}
"<="				{return S_MENOR_IGUAL_QUE;}
"="					{return S_IGUAL;}
"<>"				{return S_DIFERENTE;}
":"					{return S_DOISPONTOS;}
or 					{return S_OR;}
and					{return S_AND;}

[a-z][a-z0-9]*		{return S_IDENTIFICADOR;}
[0-9]+				{return S_INTEIRO;}
[ \t]				/* ignora */
[\n]				{linha++;}
<<EOF>>				{return 0;}
.			{
			printf("Erro. Símbolo desconhecido: [%s]\n",yytext);
			printf("Na linha %d\n",linha);
			exit(1);
			}
