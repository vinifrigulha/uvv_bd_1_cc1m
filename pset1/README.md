# PSet1
## Praticando o *PostgreSQL*, *MariaDB/MySQL* e *Oracle Database*

### Aluno: Vinícius Frigulha Ribeiro
### Professor: Abrantes Araujo Silva Filho
### Monitora: Suellen Miranda Amorim

##

### Introdução:

Este PSet teve o objetivo de implementar o projeto lógico apresentado nos capítulos 5 e 6 do livro _Sistemas de Banco de Dados_, 7ª edição, dos autores **Elmasri & Navathe**, nos seguintes Sistemas de Gerenciamento de Banco de Dados (SGBDs):
* PostgreSQL; 
* MariaDB/MySQL; e
* Oracle Database.

Para realizar o projeto, ferramentas auxiliares foram utilizadas. São elas: 
* Oracle VM VirtualBox - onde ocorrerá a virtualização do Oracle Linux, que é onde os programas estão instalados;
* SQL Power Architect - onde será feito o projeto lógico; e
* DBeaver - onde serão testados os scripts do projeto lógico.

##

### Projeto Lógico (SQL Power Architect):

Já dentro do ambiente virtual, inicio este PSet construindo o projeto lógico do Elmasri no *SQL Power Architect*. A partir dele irei extrair os scripts das tabelas, já com as relações feitas, para todos os SGBDs. O resultado final é este:

![Projeto Lógico](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/elmasri-sqlpa.PNG "Projeto Lógico - Elmasri")

>**OBS:** Como foi feita uma tradução da linguagem original desse livro para o português, foi necessário alterar a precisão do campo `funcionario.endereco` de *varchar(30)* para *varchar(50)* para que os dados fossem corretamente preenchidos.

##

### PostgreSQL

Ainda no SQL Power Architect, basta extraírmos o script em SQL das tabelas e suas relações:

![Projeto Lógico PSQL](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/PostgreSQL/psql-sqlpa.PNG "SQL do Projeto Lógico")

Com o script extraído, basta copiar e colar em algum lugar - no meu caso, eu colei no Bloco de Notas no Windows (fora da máquina vitual).

Agora, partiremos para o Terminal do Linux para configurarmos o usuário, o banco de dados e o esquema.
Começamos iniciando o Postgres, conforme a imagem abaixo.

![PSQL no Terminal](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/PostgreSQL/1-psql.PNG "PSQL no Terminal")

Criaremos o usuário `vinicius`, que será o responsável por trabalhar no nosso banco de dados.

![Criação do usuário vinicius](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/PostgreSQL/2-psql.PNG "Criação do usuário vinicius")

Com o usuário criado, criaremos o banco de dados `uvv`.

![Criação do banco de dados uvv](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/PostgreSQL/3-psql.PNG "Criação do Banco de Dados uvv")

Após esse processo, trocaremos para o usuário `vinicius` para que ele crie o esquema `elmasri` e o defina como padrão. 

![Criação do esquema elmasri](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/PostgreSQL/4-psql.PNG "Criação do esquema elmasri")

Chegando nesta etapa, basta inserir o script do projeto lógico, que estava no bloco de notas, e os dados de cada tabela.

>**OBS:** Todo esse passo a passo, inclusive as senhas utilizadas, estarão no arquivo [script_psql.txt](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/script_psql.txt)

##

### MariaDB/MySQL

Voltando ao SQL Power Architect, basta extraírmos o script em SQL das tabelas e suas relações, desta vez para o MariaDB/MySQL:

![Projeto Lógico MySQL](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/MySQL/mysql-sqlpa.PNG "SQL do Projeto Lógico")

Com o script extraído, novamente o guardarei no Bloco de Notas do Windows.

Novamente abriremos o Terminal do Linux para começarmos a trabalhar neste SGBD. 
Inicialmente, entraremos com o usuário `root`, que é o adinistrador do MariaDB/MySQL.

![MySQL no Terminal](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/MySQL/1-mysql.PNG "MySQL no Terminal")

Daí, o primeiro passo é criar o banco de dados `uvv`. 
Logo em seguida, criaremos o usuário `vinicius` e garantiremos os privilégios para ele trabalhar no BD `uvv`:

![Criação do BD uvv e do usuário vinicius](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/MySQL/2-mysql.png "Criação do BD uvv e do usuário vinicius")

Com o usuário criado e configurado, trocaremos do usuário `root` para o usuário `vinicius`.
Após isso, basta selecionar o banco de dados `uvv`.

![Trocando de usuário](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imagens/MySQL/3-mysql.png "Trocando de usuário")

Com o banco de dados `uvv` selecionado, iniciaremos a inserção das tabelas e dados, similarmente ao PostgreSQL.

>**OBS:** Todo esse passo a passo, inclusive as senhas utilizadas, estarão no arquivo [script_mysql.txt](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/script_mysql.txt)

##

### Oracle Database

![Script do Oracle Database](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/imgs/oracle-architect.PNG "Script do Oracle Database")
>**OBS:** Assim como no PostgreSQL, já defina o *schema* como `elmasri`.


##

### Considerações finais: 
Neste PSet tive meu primeiro contato com a tecnologia Git e GitHub, além de aprender a fazer esta documentação com a linguagem de marcação Markdown.
Também foi inédita a utilização do PostgreSQL e do Oracle Database, o que tornou este projeto mais desafiante.
No final, creio que fiz um bom trabalho, pois estou um passo mais próximo do meu crescimento na área de Design e Desenvolvimento de Banco de Dados.
