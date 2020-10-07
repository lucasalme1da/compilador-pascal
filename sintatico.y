%{
#include <stdio.h>
#include "lexico.c"
void yyerror(const char *msg);
%}

%start programa

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

programa:
  S_PROGRAM S_IDENTIFICADOR S_PONTOVG bloco S_PONTO
;

bloco:
  corpo
;

corpo:
  S_BEGIN expressao1 S_END
;

expressao1:
  expressao1 S_AND expressao2 {printf("\n Operacao Logica AND");}
  |expressao1 S_OR expressao2 {printf("\n Operacao Logica OR");}
  |expressao2
;

expressao2:
  expressao2 S_VERDADEIRO expressao3 {printf("\n Operacao V");}
  |expressao2 S_FALSO expressao3 {printf("\n Operacao F");}
  |expressao3
;

expressao3:
  expressao3 S_MAIOR_QUE expressao4 {printf("\n Operacao Relacional >");}
  |expressao3 S_MENOR_QUE expressao4 {printf("\n Operacao Relacional <");}
  |expressao3 S_MAIOR_IGUAL_QUE expressao4 {printf("\n Operacao Relacional >=");}
  |expressao3 S_MENOR_IGUAL_QUE expressao4 {printf("\n Operacao Relacional <=");}
  |expressao3 S_IGUAL expressao4 {printf("\n Operacao Relacional <>");}
  |expressao3 S_DIFERENTE expressao4 {printf("\n Operacao Relacional =");}
  |expressao4
;

expressao4:
  expressao4 S_SOMA termo {printf("\n Operacao SOMA");}
  |expressao4 S_SUBT termo {printf("\n Operacao SUBTRACAO");}  
  |termo
;

termo:
  termo S_MULT fator {printf("\n Operacao MULTIPLICACAO");}
  |termo S_DIVI_REAL fator {printf("\n Operacao DIVISAO");}
  |fator 
; 

fator:
  S_IDENTIFICADOR {printf("\n Identificador: %s", yytext);}
  |S_INTEIRO {printf("\n Numero: %s", yytext);}
  |S_PAR_ABRE expressao1 S_PAR_FECHA
;

%%

void yyerror(const char *msg){
	printf("Erro sintatico!\n");
}

int main(int argc, char **argv){
	if(argc < 2){
		printf("Uso: ./compilador.bin <arquivo_pascal.pas>\n\n");
		exit(1);
	}

	yyin = fopen(argv[1],"r");
	if( !yyparse() ){
		printf("\nCompilação terminada. Programa correto.\n");
	}
	else{
		printf("Erro de compilação\n");

	}
	fclose(yyin);
}




