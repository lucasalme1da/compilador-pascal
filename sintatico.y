 /* (9 mod (5 + 2)) * 7 */

%{
#include <stdio.h>
#include "lexico.c"
void yyerror(const char *msg);
%}

/* --------------------------------------------------
   | SÍMBOLOS TERMINAIS DA LINGUAGEM PASCAL SIMPLES |
   +------------------------------------------------- */

%expect 1			

%start programa /*símbolo inicial da gramática */

%token 			S_SUBT
%token 			S_SOMA
%token 			S_MULT
%token 			S_DIVI_REAL
%token 			S_DIVI_INT
%token 			S_RESTO_DIVI
%token 			S_MAIOR_QUE
%token 			S_MENOR_QUE
%token 			S_MAIOR_IGUAL_QUE
%token 			S_MENOR_IGUAL_QUE
%token 			S_IGUAL
%token 			S_DIFERENTE
%token 			S_VERDADEIRO
%token 			S_FALSO
%token 			S_OR
%token 			S_AND
%token 			S_NOT
%token 			S_PAR_ABRE
%token 			S_PAR_FECHA
%token 			S_VAR
%token 			S_PROGRAM
%token 			S_IF
%token 			S_THEN
%token 			S_ELSE
%token 			S_PONTO
%token 			S_VIRGULA
%token 			S_PONTOVG
%token 			S_BEGIN
%token 			S_END
%token 			S_ATRIB
%token 			S_MAIS
%token 			S_VEZES
%token 			S_DOISPONTOS
%token 			S_IDENTIFICADOR
%token 			S_INTEIRO

%%

/* --------------------------------------------
   | PRODUÇÕES SINTÁTICAS DA LINGUAGEM PASCAL |
   +------------------------------------------- */

programa:
	S_PROGRAM S_IDENTIFICADOR S_PONTOVG bloco S_PONTO
;

bloco:
	corpo
;

corpo: 
	S_BEGIN seq_expressoes S_END
;

seq_expressoes:
	seq_expressoes S_PONTOVG expressao 
	| expressao
;

expressao: 
	S_PAR_ABRE expressao S_PAR_FECHA
	| expressao 
;

falso_ou_verdadeiro:
	S_VERDADEIRO
	| S_FALSO
;

multiplicacao_e_divisao:
	S_INTEIRO S_MULT S_INTEIRO 
	| S_INTEIRO S_DIVI_REAL S_INTEIRO
;

soma_e_subtracao: 
	S_INTEIRO S_MAIS S_INTEIRO 
	| S_INTEIRO S_SUBT S_INTEIRO
;


operacao_logica: 
	operacao_relacional S_OR operacao_relacional 
	| operacao_relacional S_AND operacao_relacional
	| S_VERDADEIRO | S_FALSO;
	operacao_relacional S_OR operacao_relacional 
	| operacao_relacional S_AND operacao_relacional
	| S_VERDADEIRO | S_FALSO;



	
expressao:
	expressao S_MAIS mult_ou_div
	| expressao S_MENOS mult_ou_div
	| mult_ou_div	
;

mult_ou_div: 
	mult_ou_div S_MULT maior_menor
	| mult_ou_div S_DIVI_REAL maior_menor
	| maior_menor
;

maior_menor:
	maior_menor S_MENOR_QUE and_or
	| maior_menor S_MAIOR_QUE and_or
	| maior_menor S_MAIOR_IGUAL_QUE and_or
	| maior_menor S_MENOR_IGUAL_QUE and_or
	| maior_menor S_IGUAL and_or
	| maior_menor S_DIFERENTE and_or
	| and_or
;

and_or:
	and_or S_AND parenteses
	| and_or S_OR parenteses
	| parenteses
;

parenteses:
	parenteses 
	| S_PAR_ABRE termo S_PAR_FECHA
	| termo
	| S_PAR_ABRE
	| S_PAR_FECHA
;

termo:
	S_INTEIRO | boolean
;

boolean:
	S_VERDADEIRO
	| S_FALSO
;

((2+2) * 5) / 4 > 20

/* ====================================== */

expressao:
	S_PAR_ABRE and_or S_PAR_FECHA
	| and_or
;

and_or: 
	logico AND logico
	| logico OR logico
	| logico
;

logico:
	mul_div S_MAIOR_QUE mul_div
	| mul_div S_MENOR_QUE mul_div
	| mul_div S_MAIOR_IGUAL_QUE mul_div
	| mul_div S_MENOR_IGUAL_QUE mul_div
	| mul_div
;

mul_div:
	som_sub S_MULT som_sub
	| som_sub S_DIVI_REAL som_sub
	| som_sub
;

som_sub:
	termo S_SOMA termo
	| termo S_SUBT termo
	| termo
;

termo:
	S_INTEIRO
;



expressao MAIOR_QUE termo

expressao S_DIVI_REAL termo MAIOR_QUE termo

S_PAR_ABRE expressao S_PAR_FECHA S_DIVI_REAL termo MAIOR_QUE termo

S_PAR_ABRE expressao S_MULT termo S_PAR_FECHA S_DIVI_REAL termo MAIOR_QUE termo

S_PAR_ABRE S_PAR_ABRE expressao S_PAR_FECHA  S_MULT termo S_PAR_FECHA S_DIVI_REAL termo MAIOR_QUE termo

S_PAR_ABRE S_PAR_ABRE termo S_SOMA termo S_PAR_FECHA  S_MULT termo S_PAR_FECHA S_DIVI_REAL termo MAIOR_QUE termo

/* ====================================== */


9 > 8 + 1
expressao S_MAIS mult_ou_div
mult_ou_div S_MAIS maior_menor
maior_menor S_MAIS  and_or
maior_menor S_MAIOR_QUE maior_menor S_MAIS parenteses
and_or S_MAIOR_QUE and_or  S_MAIS termo
parenteses S_MAIOR_QUE parenteses S_MAIS S_INTEIRO
termo S_MAIOR_QUE termo S_MAIS S_INTEIRO
S_INTEIRO S_MAIOR_QUE S_INTEIRO S_MAIS S_INTEIRO

%%

void yyerror(const char *msg){
	printf("Erro sintatico\n");
}

int main(int argc, char **argv){
	if(argc < 2){
		printf("Uso: ./compilador.bin <arquivo_pascal.pas>\n\n");
		exit(1);
	}

	yyin = fopen(argv[1],"r");
	if( !yyparse() ){
		printf("Compilação terminada. Programa correto.\n");
	}
	else{
		printf("Erro de compilação\n");

	}
	fclose(yyin);
}



























