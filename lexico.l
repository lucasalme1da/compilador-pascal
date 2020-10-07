%{
#include <stdio.h>	
#include "sintatico.tab.h"
int linha = 1;
%}

%option noyywrap

%%
 /* OPERADORES ARITMÉTICOS */
"-"					{return S_SUBT;}
"+"					{return S_SOMA;}
"*"					{return S_MULT;}
"/"					{return S_DIVI_REAL;}
div 				{return S_DIVI_INT;}
mod 				{return S_RESTO_DIVI;}

 /* OPERADORES RELACIONAIS */
">"					{return S_MAIOR_QUE;}
"<"					{return S_MENOR_QUE;}
">="				{return S_MAIOR_IGUAL_QUE;}
"<="				{return S_MENOR_IGUAL_QUE;}
"="					{return S_IGUAL;}
"<>"				{return S_DIFERENTE;}

 /* OPERADORES LÓGICOS */
true				{return S_VERDADEIRO;}
false				{return S_FALSO;}
or 					{return S_OR;}
and					{return S_AND;}
not					{return S_NOT;}


 /* OUTROS SIMBOLOS DA LINGUAGEM PASCAL */
"("	 				{return S_PAR_ABRE;}
")"	 				{return S_PAR_FECHA;}
var 				{return S_VAR;}
program				{return S_PROGRAM;}
if 					{return S_IF;}
then 				{return S_THEN;}
else				{return S_ELSE;}
"."					{return S_PONTO;}
","					{return S_VIRGULA;}
";"					{return S_PONTOVG;}
begin				{return S_BEGIN;}
end					{return S_END;}
":="				{return S_ATRIB;}
":"					{return S_DOISPONTOS;}
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
