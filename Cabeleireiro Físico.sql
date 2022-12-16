/* Cabeleireiro Lógico: */

CREATE TABLE Cliente (
    nome VARCHAR,
    data_nascimento VARCHAR,
    fk_contato_contato_PK INT,
    id_Cliente INT PRIMARY KEY,
    cpf VARCHAR,
    UNIQUE (id_Cliente, fk_contato_contato_PK, cpf)
);

CREATE TABLE Servico (
    corte VARCHAR,
    prancha VARCHAR,
    luzes VARCHAR,
    barba VARCHAR,
    sobrancelha VARCHAR,
    pintura VARCHAR,
    id_Servico INT PRIMARY KEY UNIQUE
);

CREATE TABLE Produto (
    condicionador VARCHAR,
    shampoo VARCHAR,
    creme VARCHAR,
    gel_de_cabelo VARCHAR,
    bomba_hidratacao VARCHAR,
    matizador VARCHAR,
    pomada VARCHAR,
    id_Produto INT PRIMARY KEY UNIQUE
);

CREATE TABLE contato (
    contato_PK INT NOT NULL PRIMARY KEY UNIQUE,
    contato VARCHAR
);

CREATE TABLE agendamento (
    agendamento_PK INT NOT NULL PRIMARY KEY UNIQUE,
    data DATE,
    horario TIME
);

CREATE TABLE comprar (
    fk_Cliente_id_Cliente INT,
    fk_Servico_id_Servico INT,
    fk_agendamento_agendamento INT,
    UNIQUE (fk_agendamento_agendamento, fk_Servico_id_Servico, fk_Cliente_id_Cliente)
);

CREATE TABLE comprar (
    fk_Produto_id_Produto INT,
    fk_Cliente_id_Cliente INT,
    UNIQUE (fk_Produto_id_Produto, fk_Cliente_id_Cliente)
);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_contato_contato_PK)
    REFERENCES contato (contato_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_1
    FOREIGN KEY (fk_Cliente_id_Cliente)
    REFERENCES Cliente (id_Cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_2
    FOREIGN KEY (fk_Servico_id_Servico)
    REFERENCES Servico (id_Servico)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_3
    FOREIGN KEY (fk_agendamento_agendamento???)
    REFERENCES ??? (???);
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_1
    FOREIGN KEY (fk_Produto_id_Produto)
    REFERENCES Produto (id_Produto)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_2
    FOREIGN KEY (fk_Cliente_id_Cliente)
    REFERENCES Cliente (id_Cliente)
    ON DELETE RESTRICT;