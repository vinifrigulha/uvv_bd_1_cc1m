
CREATE TABLE idioma (
                cod_idioma INT NOT NULL,
                idioma VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_idioma)
);


CREATE TABLE telefone (
                cod_telefone INT NOT NULL,
                ddd CHAR(2) NOT NULL,
                numero_telefone VARCHAR(9) NOT NULL,
                PRIMARY KEY (cod_telefone)
);


CREATE TABLE uf (
                uf CHAR(2) NOT NULL,
                nome_uf VARCHAR(100) NOT NULL,
                PRIMARY KEY (uf)
);


CREATE TABLE cidade (
                cod_cidade INT NOT NULL,
                cidade VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_cidade)
);


CREATE TABLE bairro (
                cod_bairro INT NOT NULL,
                bairro VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_bairro)
);


CREATE TABLE cep (
                cod_cep INT NOT NULL,
                cep CHAR(8) NOT NULL,
                PRIMARY KEY (cod_cep)
);


CREATE TABLE tripulantes (
                cod_tripulante INT NOT NULL,
                primeiro_nome VARCHAR(100) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(100) NOT NULL,
                passaporte CHAR(8) NOT NULL,
                cod_telefone INT NOT NULL,
                cod_idioma INT NOT NULL,
                logradouro VARCHAR(200) NOT NULL,
                numero_end VARCHAR(8) NOT NULL,
                complemento_end VARCHAR(200),
                cod_cep INT NOT NULL,
                cod_bairro INT NOT NULL,
                cod_cidade INT NOT NULL,
                uf CHAR(2) NOT NULL,
                PRIMARY KEY (cod_tripulante)
);


CREATE TABLE pilotos (
                cod_tripulante INT NOT NULL,
                numero_brevet CHAR(8) NOT NULL,
                data_exp_brevet DATE NOT NULL,
                PRIMARY KEY (cod_tripulante)
);


CREATE TABLE comissarios (
                cod_tripulante INT NOT NULL,
                PRIMARY KEY (cod_tripulante)
);


CREATE TABLE aeroportos (
                cod_aeroporto INT NOT NULL,
                cod_cidade INT NOT NULL,
                cod_telefone INT NOT NULL,
                PRIMARY KEY (cod_aeroporto)
);


CREATE TABLE voos (
                cod_voo INT NOT NULL,
                data_partida DATE NOT NULL,
                horario_partida TIME NOT NULL,
                cod_aero_origem INT NOT NULL,
                cod_aero_destino INT NOT NULL,
                PRIMARY KEY (cod_voo)
);


CREATE TABLE voo_trip (
                cod_voo INT NOT NULL,
                cod_tripulante INT NOT NULL,
                PRIMARY KEY (cod_voo, cod_tripulante)
);


CREATE TABLE passageiros (
                cod_passageiro INT NOT NULL,
                primeiro_nome VARCHAR(100) NOT NULL,
                nome_meio VARCHAR(1),
                ultimo_nome VARCHAR(100) NOT NULL,
                data_nascimento DATE NOT NULL,
                sexo CHAR(1) NOT NULL,
                PRIMARY KEY (cod_passageiro)
);


CREATE TABLE reservam (
                cod_passageiro INT NOT NULL,
                cod_voo INT NOT NULL,
                data_inicio DATE NOT NULL,
                data_fim DATE NOT NULL,
                PRIMARY KEY (cod_passageiro, cod_voo)
);


CREATE TABLE bagagens (
                cod_passageiro INT NOT NULL,
                cod_bagagem INT NOT NULL,
                cod_voo INT NOT NULL,
                peso DECIMAL(4,2) NOT NULL,
                fragil CHAR(1) NOT NULL,
                PRIMARY KEY (cod_passageiro, cod_bagagem)
);


ALTER TABLE tripulantes ADD CONSTRAINT idioma_tripulantes_fk
FOREIGN KEY (cod_idioma)
REFERENCES idioma (cod_idioma)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE aeroportos ADD CONSTRAINT telefone_aeroportos_fk
FOREIGN KEY (cod_telefone)
REFERENCES telefone (cod_telefone)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT telefone_tripulantes_fk
FOREIGN KEY (cod_telefone)
REFERENCES telefone (cod_telefone)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT uf_tripulantes_fk
FOREIGN KEY (uf)
REFERENCES uf (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT cidade_tripulantes_fk
FOREIGN KEY (cod_cidade)
REFERENCES cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE aeroportos ADD CONSTRAINT cidade_aeroportos_fk
FOREIGN KEY (cod_cidade)
REFERENCES cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT bairro_tripulantes_fk
FOREIGN KEY (cod_bairro)
REFERENCES bairro (cod_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tripulantes ADD CONSTRAINT cep_tripulantes_fk
FOREIGN KEY (cod_cep)
REFERENCES cep (cod_cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comissarios ADD CONSTRAINT tripulantes_comissarios_fk
FOREIGN KEY (cod_tripulante)
REFERENCES tripulantes (cod_tripulante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pilotos ADD CONSTRAINT tripulantes_pilotos_fk
FOREIGN KEY (cod_tripulante)
REFERENCES tripulantes (cod_tripulante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voo_trip ADD CONSTRAINT tripulantes_voo_trip_fk
FOREIGN KEY (cod_tripulante)
REFERENCES tripulantes (cod_tripulante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voos ADD CONSTRAINT aeroportos_voos_fk
FOREIGN KEY (cod_aero_origem)
REFERENCES aeroportos (cod_aeroporto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voos ADD CONSTRAINT aeroportos_voos_fk1
FOREIGN KEY (cod_aero_destino)
REFERENCES aeroportos (cod_aeroporto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE bagagens ADD CONSTRAINT voos_bagagens_fk
FOREIGN KEY (cod_voo)
REFERENCES voos (cod_voo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE reservam ADD CONSTRAINT voos_reservam_fk
FOREIGN KEY (cod_voo)
REFERENCES voos (cod_voo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE voo_trip ADD CONSTRAINT voos_voo_trip_fk
FOREIGN KEY (cod_voo)
REFERENCES voos (cod_voo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE bagagens ADD CONSTRAINT passageiros_bagagens_fk
FOREIGN KEY (cod_passageiro)
REFERENCES passageiros (cod_passageiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE reservam ADD CONSTRAINT passageiros_reservam_fk
FOREIGN KEY (cod_passageiro)
REFERENCES passageiros (cod_passageiro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
