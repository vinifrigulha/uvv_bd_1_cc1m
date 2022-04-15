
CREATE TABLE elmasri.funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR2(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR2(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR2(50),
                sexo CHAR(1),
                salario NUMBER(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento NUMBER NOT NULL,
                CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (cpf)
);
COMMENT ON TABLE elmasri.funcionario IS 'Criação da tabela "funcionario"';


CREATE TABLE elmasri.departamento (
                numero_departamento NUMBER NOT NULL,
                nome_departamento VARCHAR2(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (numero_departamento)
);
COMMENT ON TABLE elmasri.departamento IS 'Criação da tabela "departamento"';


CREATE UNIQUE INDEX elmasri.departamento_idx
 ON elmasri.departamento
 ( nome_departamento );

CREATE TABLE elmasri. localizacoes_departamento (
                numero_departamento NUMBER NOT NULL,
                local VARCHAR2(15) NOT NULL,
                CONSTRAINT PK_LOCALIZACOES_DEPARTAMENTO PRIMARY KEY (numero_departamento, local)
);
COMMENT ON TABLE elmasri. localizacoes_departamento IS 'Criação da tabela "localizacoes_departamento".';


CREATE TABLE elmasri.projeto (
                numero_projeto NUMBER NOT NULL,
                nome_projeto VARCHAR2(15) NOT NULL,
                local_projeto VARCHAR2(15),
                numero_departamento NUMBER NOT NULL,
                CONSTRAINT PK_PROJETO PRIMARY KEY (numero_projeto)
);
COMMENT ON TABLE elmasri.projeto IS 'Criação da tabela "projeto".';


CREATE UNIQUE INDEX elmasri.projeto_idx
 ON elmasri.projeto
 ( nome_projeto );

CREATE TABLE elmasri.trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto_trabalha_em NUMBER NOT NULL,
                horas NUMBER(3,1) NOT NULL,
                CONSTRAINT PK_TRABALHA_EM PRIMARY KEY (cpf_funcionario, numero_projeto_trabalha_em)
);
COMMENT ON TABLE elmasri.trabalha_em IS 'Criação da tabela "trabalha_em"';


CREATE TABLE elmasri.dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR2(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR2(15),
                CONSTRAINT PK_DEPENDENTE PRIMARY KEY (cpf_funcionario, nome_dependente)
);
COMMENT ON TABLE elmasri.dependente IS 'Criação da tabela "dependente".';


ALTER TABLE elmasri.dependente ADD CONSTRAINT FUNCIONARIO_DEPENDENTE_FK
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT FUNCIONARIO_TRABALHA_EM_FK
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.departamento ADD CONSTRAINT FUNCIONARIO_DEPARTAMENTO_FK
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.funcionario ADD CONSTRAINT FUNCIONARIO_FUNCIONARIO_FK
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionario (cpf)
NOT DEFERRABLE;

ALTER TABLE elmasri.projeto ADD CONSTRAINT DEPARTAMENTO_PROJETO_FK
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
NOT DEFERRABLE;

ALTER TABLE elmasri. localizacoes_departamento ADD CONSTRAINT DEPARTAMENTO_LOCALIZACOES_D323
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT PROJETO_TRABALHA_EM_FK
FOREIGN KEY (numero_projeto_trabalha_em)
REFERENCES elmasri.projeto (numero_projeto)
NOT DEFERRABLE;
