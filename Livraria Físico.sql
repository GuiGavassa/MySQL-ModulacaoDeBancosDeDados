/* Livraria Lógico: */

CREATE TABLE Cliente (
    nome VARCHAR,
    fk_contato_contato_PK INT,
    fk_endereco_endereco_PK INT,
    cpf VARCHAR,
    id_cliente INT PRIMARY KEY,
    UNIQUE (id_cliente, cpf, fk_endereco_endereco_PK, fk_contato_contato_PK)
);

CREATE TABLE Livro (
    autor VARCHAR,
    editora VARCHAR,
    genero VARCHAR,
    tipo VARCHAR,
    capa VARCHAR,
    tamanho VARCHAR,
    edicao VARCHAR,
    lancamento VARCHAR,
    id_Livro VARCHAR PRIMARY KEY UNIQUE,
    idioma VARCHAR,
    nome VARCHAR,
    preco INT
);

CREATE TABLE contato (
    contato_PK INT NOT NULL PRIMARY KEY UNIQUE,
    contato VARCHAR
);

CREATE TABLE endereco (
    endereco_PK INT NOT NULL PRIMARY KEY UNIQUE,
    logradouro VARCHAR,
    numero VARCHAR,
    bairro VARCHAR,
    CEP VARCHAR,
    cidade VARCHAR,
    UF VARCHAR,
    pais VARCHAR
);

CREATE TABLE comprar (
    fk_Livro_id_Livro VARCHAR,
    fk_Cliente_id_cliente INT,
    preco_Final INT,
    UNIQUE (fk_Livro_id_Livro, fk_Cliente_id_cliente)
);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_contato_contato_PK)
    REFERENCES contato (contato_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_3
    FOREIGN KEY (fk_endereco_endereco_PK)
    REFERENCES endereco (endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_1
    FOREIGN KEY (fk_Livro_id_Livro)
    REFERENCES Livro (id_Livro)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_2
    FOREIGN KEY (fk_Cliente_id_cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE RESTRICT;