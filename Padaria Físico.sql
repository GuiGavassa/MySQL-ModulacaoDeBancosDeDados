/* Padaria Lógico: */

CREATE TABLE Cliente (
    nome VARCHAR,
    cpf VARCHAR,
    data_nascimento VARCHAR,
    fk_contato_contato_PK INT,
    id_Cliente VARCHAR PRIMARY KEY
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY
);

CREATE TABLE Salgados (
    pao VARCHAR,
    pao_De_Leite VARCHAR,
    pao_De_Queijo VARCHAR,
    croissant VARCHAR,
    pastel_De_Belem VARCHAR,
    joelho VARCHAR,
    coxinha VARCHAR,
    id_Salgado INT PRIMARY KEY
);

CREATE TABLE Doces (
    bolo VARCHAR,
    rosquinha VARCHAR,
    carolina VARCHAR,
    sonho VARCHAR,
    quindim VARCHAR,
    brigadeiro VARCHAR,
    id_Doce INT PRIMARY KEY
);

CREATE TABLE contato (
    contato_PK INT NOT NULL PRIMARY KEY,
    contato VARCHAR
);

CREATE TABLE comprar (
    fk_Produto_id_produto INT,
    fk_Cliente_id_Cliente VARCHAR
);

CREATE TABLE pertencer_Salgados_Produto_Doces (
    fk_Salgados_id_Salgado INT,
    fk_Produto_id_produto INT,
    fk_Doces_id_Doce INT
);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_contato_contato_PK)
    REFERENCES contato (contato_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_1
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_2
    FOREIGN KEY (fk_Cliente_id_Cliente)
    REFERENCES Cliente (id_Cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE pertencer_Salgados_Produto_Doces ADD CONSTRAINT FK_pertencer_Salgados_Produto_Doces_1
    FOREIGN KEY (fk_Salgados_id_Salgado)
    REFERENCES Salgados (id_Salgado)
    ON DELETE RESTRICT;
 
ALTER TABLE pertencer_Salgados_Produto_Doces ADD CONSTRAINT FK_pertencer_Salgados_Produto_Doces_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE NO ACTION;
 
ALTER TABLE pertencer_Salgados_Produto_Doces ADD CONSTRAINT FK_pertencer_Salgados_Produto_Doces_3
    FOREIGN KEY (fk_Doces_id_Doce)
    REFERENCES Doces (id_Doce)
    ON DELETE RESTRICT;