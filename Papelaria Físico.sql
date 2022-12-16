/* Papelaria Lógico: */

CREATE TABLE Cliente (
    nome CHARACTER,
    cpf CHARACTER,
    endereco CHARACTER,
    contato CHARACTER,
    id_cliente INTEGER PRIMARY KEY
);

CREATE TABLE Produto (
    caneta INTEGER,
    folha_de_Almaco INTEGER,
    folha_A4 INTEGER,
    caderno INTEGER,
    lapis INTEGER,
    borracha INTEGER,
    apontador INTEGER,
    id_produto INTEGER PRIMARY KEY
);

CREATE TABLE Servico (
    impressao FLOAT,
    xerox FLOAT,
    id_Servico INTEGER PRIMARY KEY
);

CREATE TABLE comprar_Cliente_Produto_Servico (
    fk_Cliente_id_cliente INTEGER,
    fk_Produto_id_produto INTEGER,
    fk_Servico_id_Servico INTEGER
);
 
ALTER TABLE comprar_Cliente_Produto_Servico ADD CONSTRAINT FK_comprar_Cliente_Produto_Servico_1
    FOREIGN KEY (fk_Cliente_id_cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE NO ACTION;
 
ALTER TABLE comprar_Cliente_Produto_Servico ADD CONSTRAINT FK_comprar_Cliente_Produto_Servico_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar_Cliente_Produto_Servico ADD CONSTRAINT FK_comprar_Cliente_Produto_Servico_3
    FOREIGN KEY (fk_Servico_id_Servico)
    REFERENCES Servico (id_Servico)
    ON DELETE RESTRICT;