
char lexema[300];
int  valor_semantico=-1;
int numero_da_linha=0;

int inteiro(char s[]){
	int tam=0;
	int base=1;
	int digito;
	int valor=0;
	while(s[tam] != '\0') tam++; //conta o tamanho da string
	tam--;
	while(tam >=0){
		digito = (s[tam]-'0');
		valor = valor + digito * base;
		base = base*10;
		tam--;
	}
	return valor;
}
