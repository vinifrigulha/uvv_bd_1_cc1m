CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(50),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INT NOT NULL,
                PRIMARY KEY (cpf)
);

ALTER TABLE funcionario COMMENT 'Criação da tabela "funcionario"';


CREATE TABLE departamento (
                numero_departamento INT NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                PRIMARY KEY (numero_departamento)
);

ALTER TABLE departamento COMMENT 'Criação da tabela "departamento"';


CREATE UNIQUE INDEX departamento_idx
 ON departamento
 ( nome_departamento );

CREATE TABLE  localizacoes_departamento (
                numero_departamento INT NOT NULL,
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY (numero_departamento, local)
);

ALTER TABLE  localizacoes_departamento COMMENT 'Criação da tabela "localizacoes_departamento".';


CREATE TABLE projeto (
                numero_projeto INT NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INT NOT NULL,
                PRIMARY KEY (numero_projeto)
);

ALTER TABLE projeto COMMENT 'Criação da tabela "projeto".';


CREATE UNIQUE INDEX projeto_idx
 ON projeto
 ( nome_projeto );

CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto_trabalha_em INT NOT NULL,
                horas DECIMAL(3,1) NOT NULL,
                PRIMARY KEY (cpf_funcionario, numero_projeto_trabalha_em)
);

ALTER TABLE trabalha_em COMMENT 'Criação da tabela "trabalha_em"';


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
);

ALTER TABLE dependente COMMENT 'Criação da tabela "dependente".';


ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE  localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto_trabalha_em)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Começarei inserindo os dados da tabela "funcionario".
 * Para isso, foi necessário estabelecer uma ordem, pois quando inserimos um funcionário que não seja um supervisor, 
 * é-nos acusado um erro de integridade.*/

INSERT INTO funcionario VALUES
(88866555576, 'Jorge', 'E', 'Brito', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, 88866555576, 1),

/*OBS: Diferentemente do dado funcionario.cpf_supervisor do modelo do Elmasri, não é possível inserir um dado nulo aqui.
 * Para contornar essa situação, percebendo que ele é o "supervisor dos supervisores", tive a ideia de colocar o seu próprio cpf nesse campo.*/

/*Com o "Jorge" cadastrado, agora é possível cadastrar os supervisores e depois os outros funcionários, 
 * ou um supervisor e seus supervisionados e depois o outro supervisor e seus supervisionados, como foi feito aqui:*/

/*Cadastro do supervisor "Fernando" e depois dos seus supervisionados*/

(33344555587, 'Fernando', 'T', 'Wong', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, 88866555576, 5),
(12345678966, 'João', 'B', 'Silva', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, 33344555587, 5),
(66688444476, 'Ronaldo', 'K', 'Lima', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, 33344555587, 5),
(45345345376, 'Joice', 'A', 'Leite', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, 33344555587, 5),

/*Cadastro da supervisora "Jennifer" e depois dos seus supervisionados*/

(98765432168, 'Jennifer', 'S', 'Souza', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, 88866555576, 4),
(99988777767, 'Alice', 'J', 'Zelaya', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, 98765432168, 4),
(98798798733, 'André', 'V', 'Pereira', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, 98765432168, 4);

/*Com os funcionários cadastrados, agora é possível direcioná-los para os seus departamentos*/

INSERT INTO departamento VALUES
(1, 'Matriz', 88866555576, '1981-06-19'),
(5, 'Pesqusia', 33344555587, '1988-05-22'),
(4, 'Administração', 98765432168, '1995-01-01');

/*Com os dados de "departamento" cadastrados, cadastraremos as localizações deles*/

INSERT INTO localizacoes_departamento VALUES
(1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Santo André'),
(5, 'Itu'),
(5, 'São Paulo');

/*Ainda como consequência dos dados da tabela "departamento" cadastrados, é possível cadastrar os dados da tabela "projeto"*/

INSERT INTO projeto VALUES
(1, 'ProdutoX', 'Santo André', 5),
(2, 'ProdutoY', 'Itu', 5),
(3, 'ProdutoZ', 'São Paulo', 5),
(10, 'Informatização', 'Mauá', 4),
(20, 'Reorganiazãço', 'São Paulo', 1),
(30, 'Novosbenefícios', 'Mauá', 4);

/*Como consequência dos dados da tabela "funcionario" cadastrados, já é possível cadastrar os dados de "dependente"*/

INSERT INTO dependente VALUES
(33344555587, 'Alicia', 'F', '1986-04-05', 'Filha'),
(33344555587, 'Tiago', 'M', '1983-10-25', 'Filho'),
(33344555587, 'Janaína', 'F', '1958-05-03', 'Esposa'),
(98765432168, 'Antonio', 'M', '1942-02-28', 'Marido'),
(12345678966, 'Michael', 'M', '1988-01-04', 'Filho'),
(12345678966, 'Alicia', 'F', '1988-12-30', 'Filha'),
(12345678966, 'Elizabeth', 'F', '1967-05-05', 'Esposa');

/*Por fim, inserimos os dados da última tabela do projeto lógico.*/

INSERT INTO trabalha_em VALUES
(12345678966, 1, 32.5),
(12345678966, 2, 7.5),
(66688444476, 3, 40),
(45345345376, 1, 20),
(45345345376, 2, 20),
(33344555587, 2, 10),
(33344555587, 3, 10),
(33344555587, 10, 10),
(33344555587, 20, 10),
(99988777767, 30, 30),
(99988777767, 10, 10),
(98798798733, 10, 35),
(98798798733, 30, 5),
(98765432168, 30, 20),
(98765432168, 20, 15),
(88866555576, 20, 0);

/*Aqui também foi feita uma adpatação do campo "trabalha_em.horas" do último funcionário, que é o "Jorge".
No Elmasri temos NULL, mas como a restrição é NOT NULL, inseri 0, permitindo concluir o exercício.*/