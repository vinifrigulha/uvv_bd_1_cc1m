# PSet1
## Praticando o *PostgreSQL*, *MariaDB/MySQL* e *Oracle Database*

### Aluno: Vinícius Frigulha Ribeiro
### Professor: Abrantes Araujo Silva Filho
### Monitora: Suellen Miranda Amorim

##

### Introdução:

Este PSet teve o objetivo de implementar o projeto lógico (esquematizado abaixo) apresentado nos capítulos 5 e 6 do livro _Sistemas de Banco de Dados_, 7ª edição, dos autores **Elmasri & Navathe**, nos seguintes Sistemas de Gerenciamento de Banco de Dados (SGBDs):
* PostgreSQL; 
* MariaDB/MySQL; 
* Oracle Database (este foi um desafio).

![Projeto Lógico](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imgs/sql-p-a.PNG "Projeto Lógico - Elmasri")

>**OBS:** Como foi feita uma tradução da linguagem original desse livro para o português, foi necessário alterar a precisão do campo `funcionario.endereco` de *varchar(30)* para *varchar(50)* para que os dados fossem corretamente preenchidos.

Para realizar o projeto, ferramentas auxiliares foram utilizadas. São elas: 
* Oracle VM VirtualBox - onde ocorrerá a virtualização do Oracle Linux, que é onde os programas estão instalados;
* SQL Power Architect - onde será feito o projeto lógico;
* DBeaver - onde serão digitados os scripts dos SGBDs citados.

##

## PostgreSQL:

## MariaDB/MySQL:

A primeira coisa a ser feita é abrir o terminal do Oracle Linux e entrar no usuário `root` do MariaDB pelos comandos da imagem abaixo:

![Login root MySQL](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imgs/root-mysql.PNG "Login root MySQL")

Depois do login, o usuário *root* será responsável por criar o Banco de Dados `uvv` e o usuário `vinicius`, concedendo a ele todos os privilégios para trabalhar nesse BD. Após isso, digitamos *exit* para sairmos do usuário `root`.

![Comandos do root](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imgs/root2-mysql.PNG "Comandos do root")

OBS: Em `uvv.*` definimos o banco de dados que o usuário terá seus privilégios, que é o `uvv`, além das tabelas que ele poderá trabalhar, representado pelo `*`, que significa todas as tabelas.

Agora realizaremos o login do usuário `vinicius`. O comando é bem parecido, basta trocar *root* por *vinicius* na primeira linha:

![Login do vinicius](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imgs/vinicius-mysql.PNG "Login do vinicius")

Depois de logado, basta executar o comando abaixo para ler o script do MariaDB:

##

## Oracle Database:

#### **Considerações finais:** 
Neste PSet tive meu primeiro contato com a tecnologia Git e GitHub, além de aprender a fazer esta documentação com a linguagem de marcação Markdown.
Também foi inédita a utilização do PostgreSQL e do Oracle Database, o que tornou este projeto mais desafiante.
No final, creio que fiz um bom trabalho, pois estou um passo mais próximo do meu crescimento na área de Design e Desenvolvimento de Banco de Dados.
