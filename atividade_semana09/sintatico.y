%{
#include <stdio.h>
#include "lexico.c"
void yyerror(const char *msg);
%}


%start programa

%token  S_VAR
%token  S_PROGRAM
%token  S_IF
%token  S_THEN
%token  S_ELSE
%token 	S_PONTO
%token  S_VIRGULA
%token	S_PONTOVG
%token	S_BEGIN
%token	S_END
%token	S_ATRIB
%token	S_MAIS
%token	S_MENOS
%token	S_VEZES
%token	S_DIVI
%token	S_MAIORQUE
%token	S_MENORQUE
%token	S_MAIOR_IGUAL_QUE
%token	S_MENOR_IGUAL_QUE
%token	S_IGUAL
%token	S_DIFERENTE
%token  S_DOISPONTOS
%token  S_AND
%token  S_OR
%token 	S_IDENTIFICADOR
%token  S_INTEIRO


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
  expressao1 S_AND expressao2
  |expressao1 S_OR expressao2
  |expressao2
;

expressao2:
  expressao2 S_MAIORQUE expressao3
  |expressao2 S_MENORQUE expressao3
  |expressao2 S_MAIOR_IGUAL_QUE expressao3
  |expressao2 S_MENOR_IGUAL_QUE expressao3
  |expressao2 S_IGUAL expressao3
  |expressao2 S_DIFERENTE expressao3
  |expressao3
;

expressao3:
  expressao3 S_MAIS termo
  |expressao3 S_MENOS termo
  |termo
;

termo:
  termo S_VEZES fator
  |termo S_DIVI fator
  |fator
;

fator:
  S_IDENTIFICADOR
  |S_INTEIRO
;

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




