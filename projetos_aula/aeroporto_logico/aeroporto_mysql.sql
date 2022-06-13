
CREATE TABLE idioma (
                cod_idioma INT NOT NULL,
                idioma VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_idioma)
);

ALTER TABLE idioma COMMENT 'Tabela que armazena os idiomas.';

ALTER TABLE idioma MODIFY COLUMN cod_idioma INTEGER COMMENT 'PK da tabela. Código identificador do idioma.';

ALTER TABLE idioma MODIFY COLUMN idioma VARCHAR(100) COMMENT 'Nome do idioma.';


CREATE TABLE telefone (
                cod_telefone INT NOT NULL,
                ddd CHAR(2) NOT NULL,
                numero_telefone VARCHAR(9) NOT NULL,
                PRIMARY KEY (cod_telefone)
);

ALTER TABLE telefone COMMENT 'Tabela que armazena as informações dos telefones.';

ALTER TABLE telefone MODIFY COLUMN cod_telefone INTEGER COMMENT 'PK da tabela. Código identificador do telefone.';

ALTER TABLE telefone MODIFY COLUMN ddd CHAR(2) COMMENT 'DDD do telefone.';

ALTER TABLE telefone MODIFY COLUMN numero_telefone VARCHAR(9) COMMENT 'Número de telefone (apenas dígitos numéricos).';


CREATE TABLE uf (
                uf CHAR(2) NOT NULL,
                nome_uf VARCHAR(100) NOT NULL,
                PRIMARY KEY (uf)
);

ALTER TABLE uf COMMENT 'Tabela que armazena as Unidades Federativas do Brasil.';

ALTER TABLE uf MODIFY COLUMN uf CHAR(2) COMMENT 'PK da tabela. Sigla da UF.';

ALTER TABLE uf MODIFY COLUMN nome_uf VARCHAR(100) COMMENT 'Nome por extenso da UF.';


CREATE TABLE cidade (
                cod_cidade INT NOT NULL,
                cidade VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_cidade)
);

ALTER TABLE cidade COMMENT 'Tabela que armazena as cidades.';

ALTER TABLE cidade MODIFY COLUMN cod_cidade INTEGER COMMENT 'PK da tabela. Código identificador da cidade.';

ALTER TABLE cidade MODIFY COLUMN cidade VARCHAR(100) COMMENT 'Nome da cidade';


CREATE TABLE bairro (
                cod_bairro INT NOT NULL,
                bairro VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_bairro)
);

ALTER TABLE bairro COMMENT 'Tabela que armazena os bairros.';

ALTER TABLE bairro MODIFY COLUMN cod_bairro INTEGER COMMENT 'PK da tabela. Código identificador do bairro.';

ALTER TABLE bairro MODIFY COLUMN bairro VARCHAR(100) COMMENT 'Nome do bairro.';


CREATE TABLE cep (
                cod_cep INT NOT NULL,
                cep CHAR(8) NOT NULL,
                PRIMARY KEY (cod_cep)
);

ALTER TABLE cep COMMENT 'Tabela que armazena os CEPs.';

ALTER TABLE cep MODIFY COLUMN cod_cep INTEGER COMMENT 'PK da tabela. Código identificador do CEP.';

ALTER TABLE cep MODIFY COLUMN cep CHAR(8) COMMENT 'Número do CEP.';


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

ALTER TABLE tripulantes COMMENT 'Tabela que armazena as informações dos tripulantes.';

ALTER TABLE tripulantes MODIFY COLUMN cod_tripulante INTEGER COMMENT 'PK da tabela. Código identificador do tripulante.';

ALTER TABLE tripulantes MODIFY COLUMN primeiro_nome VARCHAR(100) COMMENT 'Primeiro nome do tripulante.';

ALTER TABLE tripulantes MODIFY COLUMN nome_meio CHAR(1) COMMENT 'Inicial do primeiro sobrenome do tripulante.';

ALTER TABLE tripulantes MODIFY COLUMN ultimo_nome VARCHAR(100) COMMENT 'Último sobrenome do tripulante.';

ALTER TABLE tripulantes MODIFY COLUMN passaporte CHAR(8) COMMENT 'Número do passaporte.';

ALTER TABLE tripulantes MODIFY COLUMN cod_telefone INTEGER COMMENT 'FK da tabela telefone. Código identificador do telefone.';

ALTER TABLE tripulantes MODIFY COLUMN cod_idioma INTEGER COMMENT 'FK da tabela idioma. Código identificador do idioma.';

ALTER TABLE tripulantes MODIFY COLUMN logradouro VARCHAR(200) COMMENT 'Logradouro do endereço do tripulante.';

ALTER TABLE tripulantes MODIFY COLUMN numero_end VARCHAR(8) COMMENT 'Número do endereço do tripulante.';

ALTER TABLE tripulantes MODIFY COLUMN complemento_end VARCHAR(200) COMMENT 'Complemento do endereço.';

ALTER TABLE tripulantes MODIFY COLUMN cod_cep INTEGER COMMENT 'FK da tabela CEP. Código identificador do CEP.';

ALTER TABLE tripulantes MODIFY COLUMN cod_bairro INTEGER COMMENT 'FK da tabela bairro. Código identificador do bairro.';

ALTER TABLE tripulantes MODIFY COLUMN cod_cidade INTEGER COMMENT 'FK da tabela cidade. Código identificador da cidade.';

ALTER TABLE tripulantes MODIFY COLUMN uf CHAR(2) COMMENT 'FK da tabela uf. Código identificador do UF.';


CREATE TABLE pilotos (
                cod_tripulante INT NOT NULL,
                numero_brevet CHAR(8) NOT NULL,
                data_exp_brevet DATE NOT NULL,
                PRIMARY KEY (cod_tripulante)
);

ALTER TABLE pilotos COMMENT 'Tabela que armazena as informações dos pilotos.';

ALTER TABLE pilotos MODIFY COLUMN cod_tripulante INTEGER COMMENT 'PFK da tabela tripulantes. Código identificador do tripulante.';

ALTER TABLE pilotos MODIFY COLUMN numero_brevet CHAR(8) COMMENT 'Número de brevet do piloto.';

ALTER TABLE pilotos MODIFY COLUMN data_exp_brevet DATE COMMENT 'Data da expedição do brevet.';


CREATE TABLE comissarios (
                cod_tripulante INT NOT NULL,
                PRIMARY KEY (cod_tripulante)
);

ALTER TABLE comissarios COMMENT 'Tabela que armazena as informações dos comissários.';

ALTER TABLE comissarios MODIFY COLUMN cod_tripulante INTEGER COMMENT 'PFK da tabela tripulantes. Código identificador do tripulante.';


CREATE TABLE aeroportos (
                cod_aeroporto INT NOT NULL,
                cod_cidade INT NOT NULL,
                cod_telefone INT NOT NULL,
                PRIMARY KEY (cod_aeroporto)
);

ALTER TABLE aeroportos COMMENT 'Tabela que armazena as informações dos aeroportos.';

ALTER TABLE aeroportos MODIFY COLUMN cod_aeroporto INTEGER COMMENT 'PK da tabela. Código identificador do aeroporto.';

ALTER TABLE aeroportos MODIFY COLUMN cod_cidade INTEGER COMMENT 'FK da tabela cidade. Código identificador da cidade.';

ALTER TABLE aeroportos MODIFY COLUMN cod_telefone INTEGER COMMENT 'FK da tabela telefone. Código identificador do telefone.';


CREATE TABLE voos (
                cod_voo INT NOT NULL,
                data_partida DATE NOT NULL,
                horario_partida TIME NOT NULL,
                cod_aero_origem INT NOT NULL,
                cod_aero_destino INT NOT NULL,
                PRIMARY KEY (cod_voo)
);

ALTER TABLE voos COMMENT 'Tabela que armazena as informações do voo.';

ALTER TABLE voos MODIFY COLUMN cod_voo INTEGER COMMENT 'PK da tabela. Código identificador dos voos.';

ALTER TABLE voos MODIFY COLUMN data_partida DATE COMMENT 'Data de partida do voo.';

ALTER TABLE voos MODIFY COLUMN horario_partida TIME COMMENT 'Horário de partida do voo.';

ALTER TABLE voos MODIFY COLUMN cod_aero_origem INTEGER COMMENT 'FK da tabela aeroportos. Código identificador do aeroporto de origem.';

ALTER TABLE voos MODIFY COLUMN cod_aero_destino INTEGER COMMENT 'FK da tabela aeroportos. Código identificador do aeroporto de destino.';


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

ALTER TABLE passageiros COMMENT 'Tabela que armazena as informações dos passageiros.';

ALTER TABLE passageiros MODIFY COLUMN cod_passageiro INTEGER COMMENT 'PK da tabela. Código identificador dos passageiros.';

ALTER TABLE passageiros MODIFY COLUMN primeiro_nome VARCHAR(100) COMMENT 'Primeiro nome do passageiro.';

ALTER TABLE passageiros MODIFY COLUMN nome_meio VARCHAR(1) COMMENT 'Inicial do sobrenome do meio do passageiro.';

ALTER TABLE passageiros MODIFY COLUMN ultimo_nome VARCHAR(100) COMMENT 'Último sobrenome do passageiro.';

ALTER TABLE passageiros MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do passageiro.';

ALTER TABLE passageiros MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do passageiro.';


CREATE TABLE reservam (
                cod_passageiro INT NOT NULL,
                cod_voo INT NOT NULL,
                data_inicio DATE NOT NULL,
                data_fim DATE NOT NULL,
                PRIMARY KEY (cod_passageiro, cod_voo)
);

ALTER TABLE reservam COMMENT 'Tabela que armazena os detalhes da reserva do voo pelo passageiro.';

ALTER TABLE reservam MODIFY COLUMN cod_passageiro INTEGER COMMENT 'PFK da tabela passageiros. Código identificador dos passageiros.';

ALTER TABLE reservam MODIFY COLUMN cod_voo INTEGER COMMENT 'PFK da tabela voos. Código identificador dos voos.';

ALTER TABLE reservam MODIFY COLUMN data_inicio DATE COMMENT 'Data do início da reserva.';

ALTER TABLE reservam MODIFY COLUMN data_fim DATE COMMENT 'Data do fim da reserva.';


CREATE TABLE bagagens (
                cod_passageiro INT NOT NULL,
                cod_bagagem INT NOT NULL,
                cod_voo INT NOT NULL,
                peso DECIMAL(4,2) NOT NULL,
                fragil CHAR(1) NOT NULL,
                PRIMARY KEY (cod_passageiro, cod_bagagem)
);

ALTER TABLE bagagens COMMENT 'Tabela que armazena as informações das bagagens.';

ALTER TABLE bagagens MODIFY COLUMN cod_passageiro INTEGER COMMENT 'PFK da tabela passageiros. Código identificador dos passageiros.';

ALTER TABLE bagagens MODIFY COLUMN cod_bagagem INTEGER COMMENT 'PK da tabela. Código identificador das bagagens.';

ALTER TABLE bagagens MODIFY COLUMN cod_voo INTEGER COMMENT 'FK da tabela voos. Código identificador dos voos.';

ALTER TABLE bagagens MODIFY COLUMN peso DECIMAL(4, 2) COMMENT 'Peso da babagem em quilogramas.';

ALTER TABLE bagagens MODIFY COLUMN fragil CHAR(1) COMMENT 'Indicador de fragilidade (S para "sim" e N para "não").';


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
