#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <locale.h>

/*1)- Considerando o cadastro de uma agenda de endere�os, nomes, idade e telefones
de cinco pessoas, defina a estrutura de registro apropriada, o diagrama de blocos e as 
codifica��es de um programa que efetuem as seguintes tarefas*/
#define M 5

typedef struct{
	int ida; 
	char tel[15];
	char ende[100];
	char nome[50];
}cadastro;

void cadastrar(cadastro cad[], int *n);
void pesquisar(cadastro cad[], int n);
void ordenar(cadastro cad[], int n);
void alterar(cadastro cad[], int n);
cadastro cad[M];//importante

int main(){
	setlocale(LC_ALL, "Portuguese");
	int res;
	int n=0;
	do {
		printf("Bem vindo ao menu da agenda!\n\n");
		printf("Digite 1 para registrar um cadastro.\n");
		printf("Digite 2 para pesquisar uma idade especifica.\n");
		printf("Digite 3 para ver a classifica��a em ordem alfab�tica.\n");
		printf("Digite 4 para alterar um registro com erro.\n");
		printf("Digite 5 para encerrar a agenda.\n");
		scanf("%i", &res);
		getchar();
		switch (res){
			case 1: cadastrar(cad, &n);
				break;
			case 2: pesquisar(cad, n);
				break;
			case 3: ordenar(cad, n);
				break;
			case 4: alterar(cad, n);
				break;
			case 5: 
				break;
			default: printf("Op��o inv�lida. Tente novamente.\n");
		}
	}while(res!=5);
    system("cls");
	printf("Agenda:\n");
	for (int i=0; i<n; i++){
		printf("\nCadastro %i\n", i+1);
		printf("Nome: %s\nIdade: %i\nEndere�o: %s\nTelefone: %s\n", cad[i].nome, cad[i].ida, cad[i].ende, cad[i].tel);		
	}
	printf("\nEncerrando...");
	return 0;
}

void cadastrar(cadastro cad[], int *n){
	setlocale(LC_ALL, "Portuguese");
	if (*n>=M){
		printf("Numeros de cadastros maximos atingido\n");
		return;
	}
	printf("Digite o nome: ");
	fgets(cad[*n].nome, sizeof(cad[*n].nome), stdin);
	cad[*n].nome[strcspn(cad[*n].nome, "\n")] = '\0';
	fflush(stdin);
	
	printf("Digite a idade: ");
	scanf("%i", &cad[*n].ida);
	fflush(stdin);
	
	printf("Digite o endere�o: ");
	fgets(cad[*n].ende, sizeof(cad[*n].ende), stdin);
    cad[*n].ende[strcspn(cad[*n].ende, "\n")] = '\0';
    fflush(stdin);
	
	printf("Digite a telefone: ");
	fgets(cad[*n].tel, sizeof(cad[*n].tel), stdin);
    cad[*n].tel[strcspn(cad[*n].tel, "\n")] = '\0';
    fflush(stdin);
	
	printf("\nNome: %s.\nIdade: %i.\nEndere�o: %s.\nTelefone: %s\n", cad[*n].nome, cad[*n].ida, cad[*n].ende, cad[*n].tel);
	(*n)++;
	system("cls");
}
		
void pesquisar(cadastro cad[], int n){
	setlocale(LC_ALL, "Portuguese");
	int acha, idaPes;
	char resp='s';
	
	while(resp == 's' || resp == 'S'){
		printf("\nEntre com a idade a ser pesquisada:");
		scanf("%i", &idaPes); fflush(stdin);
		int a=n;
		acha=0;
		while (a!=0){
		for(int i=0; i<n; i++){
			a--;
			if (idaPes == cad[i].ida){
				acha=1;
				printf("Nome: %s\nIdade: %i\nEndere�o: %s\nTelefone: %s\n", cad[i].nome, cad[i].ida, cad[i].ende, cad[i].tel);
				}
			}
		}
	
		if (!acha){
			printf ("%d n�o foi localizado!", idaPes);
		}
		printf ("\nDeseja continuar a pesquisa? [S]im / [N]�o + <enter>\n");
		resp=getchar(); fflush(stdin);
		system("cls");
	}
}	

void ordenar(cadastro cad[], int n){
	setlocale(LC_ALL, "Portuguese");
	cadastro aux;
	for (int i=0; i<n-1; i++){
		for (int j=i+1;j<n;j++){ 
			if (strcmp(cad[i].nome, cad[j].nome) > 0){
				aux=cad[i];
				cad[i]=cad[j];
				cad[j]=aux;
			}
		}
	}
	printf("\nCadastros em ordem alfab�tica:\n");
	for (int i=0; i<n; i++){
		printf ("Nome: %2d ---> %s\n", i+1, cad[i].nome);
	}
}

void alterar(cadastro cad[], int n){
	setlocale(LC_ALL, "Portuguese");
	int q, i;
	
	printf("Qual cadastro quer alterar?\n");
	for (i=0; i<n; i++){
		printf("Cadastro %i - %s.\n", i+1, cad[i].nome);		
	}
	scanf("%i", &q);fflush(stdin);	
	printf("Altera��o do cadastro %i\n", i+1);
	
	printf("Digite o nome: ");
	fgets(cad[q-1].nome, sizeof(cad[q-1].nome), stdin);
	cad[q-1].nome[strcspn(cad[q-1].nome, "\n")] = '\0';
	fflush(stdin);
	
	printf("Digite a idade: ");
	scanf("%i", &cad[q-1].ida);
	fflush(stdin);
	
	printf("Digite o endere�o: ");
	fgets(cad[q-1].ende, sizeof(cad[q-1].ende), stdin);
    cad[q-1].ende[strcspn(cad[q-1].ende, "\n")] = '\0';
    fflush(stdin);
	
	printf("Digite a telefone: ");
	fgets(cad[q-1].tel, sizeof(cad[q-1].tel), stdin);
    cad[q-1].tel[strcspn(cad[q-1].tel, "\n")] = '\0';
    fflush(stdin);
    system("cls");
	printf("Cadastro alterado com sucesso.\n");
	printf("Nome: %s.\nIdade: %i.\nEndere�o: %s.\nTelefone: %s\n", cad[q-1].nome, cad[q-1].ida, cad[q-1].ende, cad[q-1].tel);
	
}

