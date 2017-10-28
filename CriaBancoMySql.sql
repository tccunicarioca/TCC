
USE [sonarServicos]
GO

DROP TABLE PRESTADOR_SERVICO;
DROP TABLE SERVICO;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(

	ID_CLIENTE INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NM_CLIENTE VARCHAR(80),
	NR_CNPJ_CPF VARCHAR(14),
	NM_ENDERECO VARCHAR(255),
	NR_TEL_CEL VARCHAR(15),
	NR_TEL_COM VARCHAR(15),
	NR_TEL_RES VARCHAR(15),
	NM_EMAIL_CLI VARCHAR(100),
	DT_CLIENTE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IDX_CPF_CNPJ
ON CLIENTE(NR_CNPJ_CPF);

CREATE INDEX IDX_CLIENTE_ENDERECO
ON CLIENTE (NM_ENDERECO);

CREATE INDEX IDX_CLIENTE_EMAIL
ON CLIENTE (NM_EMAIL_CLI);

CREATE TABLE SERVICO(
	
	ID_SERVICO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NM_SERVICO VARCHAR(100) NOT NULL

);

CREATE INDEX IDX_NM_SERVICO
ON SERVICO(NM_SERVICO);

CREATE TABLE PRESTADOR_SERVICO(

	ID_PRESTADOR INT NOT NULL,
	ID_SERVICO INT NOT NULL,
	NR_ORCAMENTO DECIMAL(7,2) NOT NULL DEFAULT 0.00,
	DT_PRESTADOR DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (ID_PRESTADOR, ID_SERVICO),
	CONSTRAINT FK_CLI_PRESTADOR
	FOREIGN KEY (ID_PRESTADOR)
	REFERENCES CLIENTE (ID_CLIENTE)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT FK_SER_PRESTADOR
	FOREIGN KEY (ID_SERVICO)
	REFERENCES SERVICO (ID_SERVICO)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION

);

CREATE INDEX IDX_CLI_PREST
ON PRESTADOR_SERVICO(ID_PRESTADOR, ID_SERVICO);

CREATE TABLE INTERESSE(

	ID_INTERESSE INT NOT NULL AUTO_INCREMENT,
	ID_PRESTADOR INT NOT NULL,
	ID_CLIENTE INT,
	ID_SERVICO INT NOT NULL,
	DT_INTERESSE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	NM_END_INTERESSE VARCHAR(256) NOT NULL,
	NR_AVALIACAO INT NOT NULL DEFAULT 0,
	NM_COMENTARIO VARCHAR(256),
	NM_RESPOSTA VARCHAR(256),
	DT_AVALIACAO DATETIME,
	PRIMARY KEY (ID_INTERESSE, ID_PRESTADOR, ID_SERVICO),
	CONSTRAINT FK_CLI_INTERSSE
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(ID_CLIENTE)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT FK_SER_INTERESSE
	FOREIGN KEY (ID_PRESTADOR, ID_SERVICO)
	REFERENCES PRESTADOR_SERVICO(ID_PRESTADOR, ID_SERVICO)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
    );

CREATE INDEX IDX_INTERESSE
ON INTERESSE(NR_AVALIACAO);

-- CASOS DE TESTES --

-- Inserção de cliente

INSERT INTO CLIENTE (NM_CLIENTE, NR_CNPJ_CPF, NM_ENDERECO, NR_TEL_RES, NR_TEL_COM, NR_TEL_CEL, NM_EMAIL_CLI) VALUES ('Zé do Pneu', '10040030021', 'Rua da Borracha, 185', '2122222222', '2122222444', '2199999999', 'zedopneu@gmail.com');
INSERT INTO CLIENTE (NM_CLIENTE, NR_CNPJ_CPF, NM_ENDERECO, NR_TEL_RES, NR_TEL_COM, NR_TEL_CEL, NM_EMAIL_CLI) VALUES ('Zé da Chave', '10130412012', 'Microsoft', '2122332233', '2122223333', '2188888888', 'jaodachave@gmail.com');

-- Inserção de serviço
INSERT INTO SERVICO (NM_SERVICO) VALUES ('Borracheiro');
INSERT INTO SERVICO (NM_SERVICO) VALUES ('Mecânico');

-- Cliente se torna prestador
INSERT INTO PRESTADOR_SERVICO (ID_PRESTADOR, ID_SERVICO, NR_ORCAMENTO) SELECT ID_CLIENTE, ID_SERVICO, 70.00 FROM CLIENTE, SERVICO WHERE NR_CNPJ_CPF = '10130412012' AND ID_SERVICO = 2;
INSERT INTO PRESTADOR_SERVICO (ID_PRESTADOR, ID_SERVICO, NR_ORCAMENTO) SELECT ID_CLIENTE, ID_SERVICO, 50.00 FROM CLIENTE, SERVICO WHERE NR_CNPJ_CPF = '10040030021' AND ID_SERVICO = 1;
-- Aplicação de Interesse
INSERT INTO INTERESSE(NM_END_INTERESSE, ID_PRESTADOR, ID_CLIENTE, ID_SERVICO) VALUES ('Rua Carobeira, 185', 1, 1, 1);
INSERT INTO INTERESSE(NM_END_INTERESSE, ID_PRESTADOR, ID_CLIENTE, ID_SERVICO) VALUES ('Rua Carobeira, 185', 2,1,2);

-- Avaliação do Interesse

UPDATE interesse 
SET NR_AVALIACAO = 5,  NM_COMENTARIO = 'Excelente borracheiro. Me atendeu de madrugada! Recomendo!' , DT_AVALIACAO = CURRENT_TIMESTAMP
WHERE ID_INTERESSE = 1;

-- Avaliação do Interesse

UPDATE interesse 
SET NR_AVALIACAO = 1,  NM_COMENTARIO = 'Só não dou menos porque não dá! Fodeu meu carro!' , DT_AVALIACAO = CURRENT_TIMESTAMP
WHERE ID_INTERESSE = 2;


-- Resposta à Avaliação
UPDATE interesse
SET NM_RESPOSTA = 'Prazer Realizar Seu Serviço'
WHERE ID_INTERESSE = 1;

-- Resposta à Avaliação

UPDATE interesse
SET NM_RESPOSTA = 'Seu carro não vê manutenção desde 2012, e a culpa é minha?'
WHERE ID_INTERESSE = 2;
