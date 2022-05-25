# PSet 2
## Praticando comandos SQL (*Structured Query Language*)

### Aluno: Vinícius Frigulha Ribeiro
### Professor: Abrantes Araújo Silva Filho
### Monitora: Suellen Miranda Amorim

##

### Introdução:

Este PSet teve o objetivo de recuperar dados do script feito no PSet 1 por meio de comandos SQL esde o nível básico ao avançado.

Para resolvê-lo, utilizei a sintaxe do MariaDB/MySQL, logo para ser possível obter os mesmos resultados, 
utilize [este script](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/script_mysql.txt "Script MariaDB/MySQL").

##

### Códigos:

**Questão 01:**

~~~SQL
SELECT DISTINCT
	(SELECT 
	CONCAT('R$', ROUND(AVG(salario), 2)) 
	FROM funcionario
	WHERE numero_departamento = 1) "MÉDIA SALARIAL - DEPARTAMENTO 1",
	(SELECT 
	CONCAT('R$', ROUND(AVG(salario), 2)) 
	FROM funcionario
	WHERE numero_departamento = 4) "MÉDIA SALARIAL - DEPARTAMENTO 4",
	(SELECT 
	CONCAT('R$', ROUND(AVG(salario), 2)) 
	FROM funcionario
	WHERE numero_departamento = 5) "MÉDIA SALARIAL - DEPARTAMENTO 5"
FROM funcionario;
~~~

*Resultado:*
MÉDIA SALARIAL - DEPARTAMENTO 1     | MÉDIA SALARIAL - DEPARTAMENTO 4     | MÉDIA SALARIAL - DEPARTAMENTO 5
:-----------------------------------|:------------------------------------|:-----------------------------------
R$55000.00			    | R$31000.00			  | R$33250.00


**Questão 02:**

~~~SQL
SELECT DISTINCT
	(SELECT CONCAT('R$', ROUND(AVG(salario), 2)) 
	FROM funcionario
	WHERE sexo = 'M') "MÉDIA SALARIAL - HOMENS",
	(SELECT CONCAT('R$', ROUND(AVG(salario), 2)) 
	FROM funcionario
	WHERE sexo = 'F') "MÉDIA SALARIAL - MULHERES"
FROM funcionario;
~~~

*Resultado:*
**MÉDIA SALARIAL - HOMENS** | **MÉDIA SALARIAL - MULHERES**
:---------------------------|:-----------------------------
R$37600.00		    | R$31000.00 


**Questão 03:**

~~~SQL
SELECT 
	d.nome_departamento "DEPARTAMENTO",
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "FUNCIONÁRIO", 
	DATE_FORMAT(f.data_nascimento, '%d/%m/%Y') "DATA DE NASCIMENTO", 
	CONCAT(TIMESTAMPDIFF(YEAR, f.data_nascimento, CURRENT_DATE()), ' anos') "IDADE",
	CONCAT('R$', f.salario) "SALÁRIO"
FROM funcionario f
INNER JOIN 
	departamento d ON f.numero_departamento = d.numero_departamento
ORDER BY f.numero_departamento, f.salario DESC;
~~~

*Resultado:*
**DEPARTAMENTO** | **FUNCIONÁRIO**  | **DATA DE NASCIMENTO** | **IDADE** | **SALÁRIO**
:----------------|:-----------------|:-----------------------|:----------|:-----------
Matriz           | Jorge E Brito    | 10/11/1937             | 84 anos   | R$55000.00
Administração    | Jennifer S Souza | 20/06/1941             | 80 anos   | R$43000.00
Administração    | André V Pereira  | 29/03/1969             | 53 anos   | R$25000.00
Administração    | Alice J Zelaya   | 19/01/1968             | 54 anos   | R$25000.00
Pesquisa         | Fernando T Wong  | 08/12/1955             | 66 anos   | R$40000.00
Pesquisa         | Ronaldo K Lima   | 15/09/1962             | 59 anos   | R$38000.00
Pesquisa         | João B Silva     | 09/01/1965             | 57 anos   | R$30000.00
Pesquisa         | Joice A Leite    | 31/07/1972             | 49 anos   | R$25000.00


**Questão 04:**

~~~SQL
SELECT 
	CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) "FUNCIONÁRIO",
	CONCAT(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE()), ' anos') "IDADE",
	CONCAT('R$', salario) "SALÁRIO ATUAL",
	CASE
	WHEN salario < 35000 THEN CONCAT('R$', ROUND(salario*1.2, 2))
	ELSE CONCAT('R$', ROUND(salario*1.15, 2))
	END "REAJUSTE SALARIAL"
FROM funcionario
ORDER BY salario ASC;
~~~

*Resultado:*
FUNCIONÁRIO 	 | IDADE   | SALÁRIO ATUAL | REAJUSTE SALARIAL
:----------------|:--------|:--------------|:------------
Joice A Leite    | 49 anos | R$25000.00    | R$30000.00
André V Pereira  | 53 anos | R$25000.00    | R$30000.00
Alice J Zelaya   | 54 anos | R$25000.00    | R$30000.00
João B Silva     | 57 anos | R$30000.00    | R$36000.00
Ronaldo K Lima   | 59 anos | R$38000.00    | R$43700.00
Fernando T Wong  | 66 anos | R$40000.00    | R$46000.00
Jennifer S Souza | 80 anos | R$43000.00    | R$49450.00
Jorge E Brito    | 84 anos | R$55000.00    | R$63250.00


**Questão 05:**

~~~SQL
SELECT 
	d.nome_departamento "DEPARTAMENTO", 
	CONCAT(g.primeiro_nome, ' ', g.nome_meio, ' ', g.ultimo_nome) "GERÊNCIA", 
	CONCAT(f.primeiro_nome, ' ',f.nome_meio, ' ',f.ultimo_nome) "FUNCIONÁRIO", 
	CONCAT('R$', f.salario) "SALÁRIO"
FROM funcionario f
INNER JOIN 
	departamento d 
ON d.numero_departamento = f.numero_departamento
INNER JOIN 
	funcionario g
	ON g.cpf = d.cpf_gerente
ORDER BY d.nome_departamento ASC, f.salario DESC;
~~~

*Resultado:*
DEPARTAMENTO    | GERÊNCIA         | FUNCIONÁRIO      | SALÁRIO    
:---------------|:-----------------|:-----------------|:-----------
Administração   | Jennifer S Souza | Jennifer S Souza | R$43000.00 
Administração   | Jennifer S Souza | Alice J Zelaya   | R$25000.00 
Administração   | Jennifer S Souza | André V Pereira  | R$25000.00 
Matriz          | Jorge E Brito    | Jorge E Brito    | R$55000.00 
Pesquisa        | Fernando T Wong  | Fernando T Wong  | R$40000.00 
Pesquisa        | Fernando T Wong  | Ronaldo K Lima   | R$38000.00 
Pesquisa        | Fernando T Wong  | João B Silva     | R$30000.00 
Pesquisa        | Fernando T Wong  | Joice A Leite    | R$25000.00 


**Questão 06:**

~~~SQL
SELECT 
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "FUNCIONÁRIO",
	d.nome_departamento "DEPARTAMENTO",
	CONCAT(dp.nome_dependente, ' ', f.nome_meio, ' ', f.ultimo_nome) "DEPENDENTE",
	CONCAT(TIMESTAMPDIFF(YEAR, dp.data_nascimento, CURRENT_DATE()), ' anos') "IDADE - DEPENDENTE",
	CASE
	WHEN dp.sexo = 'M' THEN 'Masculino'
	ELSE 'Feminino'
	END "SEXO - DEPENDENTE"
FROM funcionario f
INNER JOIN 
	departamento d ON f.numero_departamento = d.numero_departamento
INNER JOIN 
	dependente dp ON f.cpf = dp.cpf_funcionario;
~~~

*Resultado:*
FUNCIONÁRIO      | DEPARTAMENTO    | DEPENDENTE        | IDADE - DEPENDENTE | SEXO - DEPENDENTE
:----------------|:----------------|:------------------|:-------------------|:------------------
João B Silva     | Pesquisa        | Alicia B Silva    | 33 anos            | Feminino         
João B Silva     | Pesquisa        | Elizabeth B Silva | 55 anos            | Feminino          
João B Silva     | Pesquisa        | Michael B Silva   | 34 anos            | Masculino         
Fernando T Wong  | Pesquisa        | Alicia T Wong     | 36 anos            | Feminino          
Fernando T Wong  | Pesquisa        | Janaína T Wong    | 64 anos            | Feminino          
Fernando T Wong  | Pesquisa        | Tiago T Wong      | 38 anos            | Masculino         
Jennifer S Souza | Administração   | Antonio S Souza   | 80 anos            | Masculino         


**Questão 07:**

~~~SQL
SELECT 
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "FUNCIONÁRIO",
	d.nome_departamento "DEPARTAMENTO",
	CONCAT('R$', f.salario) "SALÁRIO"
FROM funcionario f
LEFT OUTER JOIN 
	dependente dp ON f.cpf = dp.cpf_funcionario
INNER JOIN 
	departamento d ON f.numero_departamento = d.numero_departamento
WHERE dp.cpf_funcionario IS NULL
ORDER BY f.salario DESC;

~~~
*Resultado:*
FUNCIONÁRIO      | DEPARTAMENTO    | SALÁRIO
:----------------|:----------------|:-----------
Jorge E Brito    | Matriz          | R$55000.00 
Ronaldo K Lima   | Pesquisa        | R$38000.00 
Joice A Leite    | Pesquisa        | R$25000.00 
André V Pereira  | Administração   | R$25000.00 
Alice J Zelaya   | Administração   | R$25000.00 


**Questão 08:**

~~~SQL
SELECT 
	d.nome_departamento "DEPARTAMENTO",
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "FUNCIONÁRIO",
	p.nome_projeto "PROJETO",
	CONCAT(t.horas, 'h') "HORAS"
FROM trabalha_em t
INNER JOIN 
	funcionario f
ON f.cpf = t.cpf_funcionario
INNER JOIN 
	projeto p ON p.numero_projeto = t.numero_projeto
INNER JOIN 
	departamento d ON d.numero_departamento = f.numero_departamento
ORDER BY t.horas, d.numero_departamento;
~~~

*Resultado:*
DEPARTAMENTO    | FUNCIONÁRIO      | PROJETO           | HORAS
:---------------|:-----------------|:------------------|:-----
Matriz          | Jorge E Brito    | Reorganização     | NULL  
Administração   | André V Pereira  | Novos Benefícios  | 5.0h  
Pesquisa        | João B Silva     | Produto Y         | 7.5h  
Administração   | Alice J Zelaya   | Informatização    | 10.0h 
Pesquisa        | Fernando T Wong  | Reorganização     | 10.0h 
Pesquisa        | Fernando T Wong  | Produto Z         | 10.0h 
Pesquisa        | Fernando T Wong  | Produto Y         | 10.0h 
Pesquisa        | Fernando T Wong  | Informatização    | 10.0h 
Administração   | Jennifer S Souza | Reorganização     | 15.0h 
Administração   | Jennifer S Souza | Novos Benefícios  | 20.0h 
Pesquisa        | Joice A Leite    | Produto X         | 20.0h 
Pesquisa        | Joice A Leite    | Produto Y         | 20.0h 
Administração   | Alice J Zelaya   | Novos Benefícios  | 30.0h 
Pesquisa        | João B Silva     | Produto X         | 32.5h 
Administração   | André V Pereira  | Informatização    | 35.0h 
Pesquisa        | Ronaldo K Lima   | Produto Z         | 40.0h 


**Questão 09:**

~~~SQL
SELECT 
	p.nome_projeto "PROJETO",
	d.nome_departamento "DEPARTAMENTO",
	CONCAT(SUM(t.horas), 'h') "SOMA DE HORAS" 
FROM projeto p
INNER JOIN 
	departamento d ON d.numero_departamento = p.numero_departamento
INNER JOIN 
	trabalha_em t ON t.numero_projeto = p.numero_projeto
GROUP BY p.nome_projeto
ORDER BY p.numero_projeto;
~~~

*Resultado:*
PROJETO           | DEPARTAMENTO    | SOMA DE HORAS
:-----------------|:----------------|:--------------
Produto X         | Pesquisa        | 52.5h         
Produto Y         | Pesquisa        | 37.5h         
Produto Z         | Pesquisa        | 50.0h         
Informatização    | Administração   | 55.0h         
Reorganização     | Matriz          | 25.0h         
Novos Benefícios  | Administração   | 55.0h         


**Questão 10:**

~~~SQL
SELECT 
	CONCAT('R$', ROUND(AVG(f.salario), 2)) "MÉDIA SALARIAL",
	d.nome_departamento "DEPARTAMENTO"
FROM funcionario f
INNER JOIN 
	departamento d ON f.numero_departamento = d.numero_departamento
GROUP BY d.numero_departamento
ORDER BY d.numero_departamento;
~~~

*Resultado:*
MÉDIA SALARIAL  | DEPARTAMENTO  
:---------------|:--------------
R$55000.00      | Matriz        
R$31000.00      | Administração 
R$33250.00      | Pesquisa      

> OBS: Como essa questão foi repetida, tomei a liberdade de fazê-la de uma forma diferente da que fiz na Questão 01.

**Questão 11:**

~~~SQL
SELECT 
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "FUNCIONÁRIO",
	p.nome_projeto "PROJETO",
	CONCAT(t.horas, 'h') "HORAS",
	CONCAT('R$', ROUND((t.horas*50), 2)) "VALOR RECEBIDO"
FROM trabalha_em t
INNER JOIN 
	funcionario f ON f.cpf = t.cpf_funcionario
INNER JOIN 
	projeto p ON p.numero_projeto = t.numero_projeto
ORDER BY t.horas;
~~~

*Resultado:*
FUNCIONÁRIO      | PROJETO           | HORAS | VALOR RECEBIDO
:----------------|:------------------|:------|:-------------
Jorge E Brito    | Reorganização     | NULL  | NULL           
André V Pereira  | Novos Benefícios  | 5.0h  | R$250.00       
João B Silva     | Produto Y         | 7.5h  | R$375.00       
Fernando T Wong  | Reorganização     | 10.0h | R$500.00       
Fernando T Wong  | Produto Z         | 10.0h | R$500.00       
Alice J Zelaya   | Informatização    | 10.0h | R$500.00       
Fernando T Wong  | Produto Y         | 10.0h | R$500.00       
Fernando T Wong  | Informatização    | 10.0h | R$500.00       
Jennifer S Souza | Reorganização     | 15.0h | R$750.00       
Jennifer S Souza | Novos Benefícios  | 20.0h | R$1000.00      
Joice A Leite    | Produto Y         | 20.0h | R$1000.00      
Joice A Leite    | Produto X         | 20.0h | R$1000.00      
Alice J Zelaya   | Novos Benefícios  | 30.0h | R$1500.00      
João B Silva     | Produto X         | 32.5h | R$1625.00      
André V Pereira  | Informatização    | 35.0h | R$1750.00      
Ronaldo K Lima   | Produto Z         | 40.0h | R$2000.00      


**Questão 12:**

~~~SQL
SELECT 
	d.nome_departamento "DEPARTAMENTO",
	p.nome_projeto "PROJETO",
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "FUNCIONÁRIO"
FROM trabalha_em t
INNER JOIN 
	funcionario f ON f.cpf = t.cpf_funcionario
INNER JOIN 
	projeto p ON p.numero_projeto = t.numero_projeto
INNER JOIN 
	departamento d ON d.numero_departamento = p.numero_departamento
WHERE t.horas IS NULL;
~~~

*Resultado:*
DEPARTAMENTO | PROJETO         | FUNCIONÁRIO  
:------------|:----------------|:-------------
Matriz       | Reorganização   | Jorge E Brito


**Questão 13:**

~~~SQL
SELECT 
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "PRESENTEADOS",
	CASE
	WHEN f.sexo = 'M' THEN 'Masculino'
	ELSE 'Feminino'
	END "SEXO",
	CONCAT(TIMESTAMPDIFF(YEAR, f.data_nascimento, CURRENT_DATE()), ' anos') "IDADE"
	FROM funcionario f
UNION
SELECT 
	CONCAT(dp.nome_dependente, ' ', f.nome_meio, ' ', f.ultimo_nome) "PRESENTEADOS",
	CASE
	WHEN dp.sexo = 'M' THEN 'Masculino'
	ELSE 'Feminino'
	END "SEXO",
	CONCAT(TIMESTAMPDIFF(YEAR, dp.data_nascimento, CURRENT_DATE()), ' anos') "IDADE"
FROM dependente dp
INNER JOIN 
	funcionario f ON f.cpf = dp.cpf_funcionario
ORDER BY IDADE DESC;
~~~

*Resultado:*
PRESENTEADOS      | SEXO      | IDADE   
:-----------------|:----------|:-------
Jorge E Brito     | Masculino | 84 anos 
Jennifer S Souza  | Feminino  | 80 anos 
Antonio S Souza   | Masculino | 80 anos 
Fernando T Wong   | Masculino | 66 anos 
Janaína T Wong    | Feminino  | 64 anos 
Ronaldo K Lima    | Masculino | 59 anos 
João B Silva      | Masculino | 57 anos 
Elizabeth B Silva | Feminino  | 55 anos 
Alice J Zelaya    | Feminino  | 54 anos 
André V Pereira   | Masculino | 53 anos 
Joice A Leite     | Feminino  | 49 anos 
Tiago T Wong      | Masculino | 38 anos 
Alicia T Wong     | Feminino  | 36 anos 
Michael B Silva   | Masculino | 34 anos 
Alicia B Silva    | Feminino  | 33 anos 


**Questão 14:**

~~~SQL
SELECT 
	d.nome_departamento "DEPARTAMENTO",
	CASE
	WHEN COUNT(f.cpf) = 1 THEN CONCAT(COUNT(f.cpf), ' funcionário')
	WHEN COUNT(f.cpf) > 1 THEN CONCAT(COUNT(f.cpf), ' funcionários')
	END "Nº DE FUNCIONÁRIOS"
FROM funcionario f
INNER JOIN 
	departamento d ON d.numero_departamento = f.numero_departamento
GROUP BY d.numero_departamento
ORDER BY d.numero_departamento;
~~~

*Resultado:*
DEPARTAMENTO    | N° DE FUNCIONÁRIOS   
:---------------|:--------------------
Matriz          | 1 funcionário
Administração   | 3 funcionários
Pesquisa        | 4 funcionários


**Questão 15:**

~~~SQL
SELECT 
	CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) "FUNCIONÁRIO",
	d.nome_departamento "DEPARTAMENTO",
	p.nome_projeto "PROJETO"
FROM trabalha_em t
LEFT OUTER JOIN 
	funcionario f ON f.cpf = t.cpf_funcionario
INNER JOIN 
	departamento d ON d.numero_departamento = f.numero_departamento
LEFT OUTER JOIN 
	projeto p ON p.numero_projeto = t.numero_projeto
ORDER BY f.numero_departamento;
~~~

*Resultado:*
FUNCIONÁRIO      | DEPARTAMENTO    | PROJETO          
:----------------|:----------------|:-----------------
Jorge E Brito    | Matriz          | Reorganização    
Jennifer S Souza | Administração   | Reorganização    
Jennifer S Souza | Administração   | Novos Benefícios 
André V Pereira  | Administração   | Informatização   
André V Pereira  | Administração   | Novos Benefícios 
Alice J Zelaya   | Administração   | Informatização   
Alice J Zelaya   | Administração   | Novos Benefícios 
João B Silva     | Pesquisa        | Produto X        
João B Silva     | Pesquisa        | Produto Y        
Fernando T Wong  | Pesquisa        | Produto Y        
Fernando T Wong  | Pesquisa        | Produto Z        
Fernando T Wong  | Pesquisa        | Informatização   
Fernando T Wong  | Pesquisa        | Reorganização    
Joice A Leite    | Pesquisa        | Produto X        
Joice A Leite    | Pesquisa        | Produto Y        
Ronaldo K Lima   | Pesquisa        | Produto Z        

##

### Considerações Finais:

Devido ao grande tempo investido no aprendizado dos comandos utilizados na resolução deste PSet, sendo pelo livro (citado no PSet 1), pela comunidade ou por vídeos, este Problem Set acabou sendo mais tranquilo que o primeiro.

Foi muito curioso o processo de aprendizagem, pois chegou um momento em que os códigos vinham a minha mente de forma visual e automática.

Com certeza foi uma experiência interessante aprofundar no comando SELECT...FROM, um dos mais importantes, senão o mais importante, comando do SQL.

