all: tabh lexsintatico compila
tabh:
	bison -d sintatico.y
lexsintatico:
	flex -i -o lexico.c lexico.l
	bison sintatico.y -o sintatico.c
compila:
	gcc sintatico.c -o compilador.bin
teste:
	./compilador.bin < programa.pas
apaga:
	rm -f sintatico.tab.h
	rm -f sintatico.tab.c
	rm -f lexico.c
	rm -f sintatico.c
	rm -f compilador.bin
	clear
	ls -l