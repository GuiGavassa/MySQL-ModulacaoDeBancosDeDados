/* Loja de Informática Lógica: */

CREATE TABLE Memoria_SSD (
    capacidade VARCHAR,
    velocidade VARCHAR,
    id_Ssd INT PRIMARY KEY
);

CREATE TABLE cliente (
    fk_telefone_telefone_PK INT,
    nome VARCHAR,
    rg VARCHAR,
    cpf VARCHAR,
    id_cliente INT PRIMARY KEY,
    fk_endereco_endereco_PK INT,
    data_nasc DATE
);

CREATE TABLE Mouse (
    sensor VARCHAR,
    resistencia VARCHAR,
    id_Mouse INT PRIMARY KEY
);

CREATE TABLE Processador (
    potencia VARCHAR,
    id_Processador INT PRIMARY KEY,
    geracao VARCHAR
);

CREATE TABLE Produto (
    marca VARCHAR,
    modelo VARCHAR,
    preco VARCHAR,
    numero_De_Serie VARCHAR,
    id_produto INT PRIMARY KEY
);

CREATE TABLE Teclado (
    switch VARCHAR,
    RGB VARCHAR,
    tamanho VARCHAR,
    id_Teclado INT PRIMARY KEY
);

CREATE TABLE Placa_de_Video (
    fans VARCHAR,
    potencia VARCHAR,
    consumo VARCHAR,
    geracao VARCHAR,
    id_Placa_de_video INT PRIMARY KEY
);

CREATE TABLE telefone (
    telefone_PK INT NOT NULL PRIMARY KEY,
    telefone VARCHAR
);

CREATE TABLE endereco (
    endereco_PK INT NOT NULL PRIMARY KEY,
    rua VARCHAR,
    complemento VARCHAR,
    cidade VARCHAR,
    numero VARCHAR,
    CEP VARCHAR,
    estado VARCHAR,
    bairro VARCHAR
);

CREATE TABLE comprar (
    fk_Produto_id_produto INT,
    fk_cliente_id_cliente INT
);

CREATE TABLE pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video (
    fk_Produto_id_produto INT,
    fk_Memoria_SSD_id_Ssd INT,
    fk_Mouse_id_Mouse INT,
    fk_Processador_id_Processador INT,
    fk_Teclado_id_Teclado INT,
    fk_Placa_de_Video_id_Placa_de_video INT
);
 
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_2
    FOREIGN KEY (fk_telefone_telefone_PK)
    REFERENCES telefone (telefone_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_3
    FOREIGN KEY (fk_endereco_endereco_PK)
    REFERENCES endereco (endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_1
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_2
    FOREIGN KEY (fk_cliente_id_cliente)
    REFERENCES cliente (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video ADD CONSTRAINT FK_pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video_1
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE NO ACTION;
 
ALTER TABLE pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video ADD CONSTRAINT FK_pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video_2
    FOREIGN KEY (fk_Memoria_SSD_id_Ssd)
    REFERENCES Memoria_SSD (id_Ssd)
    ON DELETE RESTRICT;
 
ALTER TABLE pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video ADD CONSTRAINT FK_pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video_3
    FOREIGN KEY (fk_Mouse_id_Mouse)
    REFERENCES Mouse (id_Mouse)
    ON DELETE RESTRICT;
 
ALTER TABLE pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video ADD CONSTRAINT FK_pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video_4
    FOREIGN KEY (fk_Processador_id_Processador)
    REFERENCES Processador (id_Processador)
    ON DELETE RESTRICT;
 
ALTER TABLE pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video ADD CONSTRAINT FK_pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video_5
    FOREIGN KEY (fk_Teclado_id_Teclado)
    REFERENCES Teclado (id_Teclado)
    ON DELETE RESTRICT;
 
ALTER TABLE pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video ADD CONSTRAINT FK_pertencer_Produto_Memoria_SSD_Mouse_Processador_Teclado_Placa_de_Video_6
    FOREIGN KEY (fk_Placa_de_Video_id_Placa_de_video)
    REFERENCES Placa_de_Video (id_Placa_de_video)
    ON DELETE RESTRICT;