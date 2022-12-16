/* Oficina Mecanica Logico: */

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome_cliente CHARACTER,
    cpf_cliente CHARACTER,
    fk_contato_cliente_contato_cliente_PK INT
);

CREATE TABLE carro (
    id_carro INT PRIMARY KEY,
    placa_carro CHARACTER,
    modelo_carro CHARACTER,
    fk_peca_trocada_carro_peca_trocada_carro_PK INT,
    data_chegada DATE,
    data_entrega DATE
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario CHARACTER,
    cpf_funcionario CHARACTER,
    data_nascimento_funcionario DATE,
    salario_funcionario FLOAT,
    cnpj_funcionario CHARACTER,
    fk_contato_funcionario_contato_funcionario_PK INT
);

CREATE TABLE pagamento (
    valor_pagamento FLOAT,
    tipo_pagamento CHARACTER,
    id_pagamento INT PRIMARY KEY,
    data_pagamento DATE,
    hora_pagamento TIMESTAMP,
    id_transacao INT
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    preco_produto FLOAT,
    marca_produto CHARACTER
);

CREATE TABLE calota (
    cor_calota CHARACTER,
    material_calota CHARACTER,
    tamanho_calota FLOAT,
    id_calota INT,
    fk_produtos_id_produto INT,
    PRIMARY KEY (id_calota, fk_produtos_id_produto)
);

CREATE TABLE limpador_de_parabrisa (
    tamanho_limpador FLOAT,
    id_limpador INT,
    material_limpador CHARACTER,
    fk_produtos_id_produto INT,
    PRIMARY KEY (id_limpador, fk_produtos_id_produto)
);

CREATE TABLE oleo_de_motor (
    id_oleo INT,
    litros_oleo FLOAT,
    baixa_temp FLOAT,
    alta_temp FLOAT,
    fk_produtos_id_produto INT,
    PRIMARY KEY (id_oleo, fk_produtos_id_produto)
);

CREATE TABLE contato_cliente (
    contato_cliente_PK INT NOT NULL PRIMARY KEY,
    contato_cliente CHARACTER
);

CREATE TABLE peca_trocada_carro (
    peca_trocada_carro_PK INT NOT NULL PRIMARY KEY,
    peca_trocada_carro CHARACTER
);

CREATE TABLE contato_funcionario (
    contato_funcionario_PK INT NOT NULL PRIMARY KEY,
    telefone_funcionario CHARACTER,
    email_funcionario CHARACTER
);

CREATE TABLE encaminha (
    fk_carro_id_carro INT,
    fk_cliente_id_cliente INT
);

CREATE TABLE restaura (
    fk_funcionario_id_funcionario INT,
    fk_carro_id_carro INT
);

CREATE TABLE compra (
    fk_produtos_id_produto INT,
    fk_cliente_id_cliente INT
);

CREATE TABLE escolhe (
    fk_pagamento_id_pagamento INT,
    fk_cliente_id_cliente INT
);
 
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_2
    FOREIGN KEY (fk_contato_cliente_contato_cliente_PK)
    REFERENCES contato_cliente (contato_cliente_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE carro ADD CONSTRAINT FK_carro_2
    FOREIGN KEY (fk_peca_trocada_carro_peca_trocada_carro_PK)
    REFERENCES peca_trocada_carro (peca_trocada_carro_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_2
    FOREIGN KEY (fk_contato_funcionario_contato_funcionario_PK)
    REFERENCES contato_funcionario (contato_funcionario_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE calota ADD CONSTRAINT FK_calota_2
    FOREIGN KEY (fk_produtos_id_produto)
    REFERENCES produtos (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE limpador_de_parabrisa ADD CONSTRAINT FK_limpador_de_parabrisa_2
    FOREIGN KEY (fk_produtos_id_produto)
    REFERENCES produtos (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE oleo_de_motor ADD CONSTRAINT FK_oleo_de_motor_2
    FOREIGN KEY (fk_produtos_id_produto)
    REFERENCES produtos (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE encaminha ADD CONSTRAINT FK_encaminha_1
    FOREIGN KEY (fk_carro_id_carro)
    REFERENCES carro (id_carro)
    ON DELETE RESTRICT;
 
ALTER TABLE encaminha ADD CONSTRAINT FK_encaminha_2
    FOREIGN KEY (fk_cliente_id_cliente)
    REFERENCES cliente (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE restaura ADD CONSTRAINT FK_restaura_1
    FOREIGN KEY (fk_funcionario_id_funcionario)
    REFERENCES funcionario (id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE restaura ADD CONSTRAINT FK_restaura_2
    FOREIGN KEY (fk_carro_id_carro)
    REFERENCES carro (id_carro)
    ON DELETE RESTRICT;
 
ALTER TABLE compra ADD CONSTRAINT FK_compra_1
    FOREIGN KEY (fk_produtos_id_produto)
    REFERENCES produtos (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE compra ADD CONSTRAINT FK_compra_2
    FOREIGN KEY (fk_cliente_id_cliente)
    REFERENCES cliente (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE escolhe ADD CONSTRAINT FK_escolhe_1
    FOREIGN KEY (fk_pagamento_id_pagamento)
    REFERENCES pagamento (id_pagamento)
    ON DELETE RESTRICT;
 
ALTER TABLE escolhe ADD CONSTRAINT FK_escolhe_2
    FOREIGN KEY (fk_cliente_id_cliente)
    REFERENCES cliente (id_cliente)
    ON DELETE RESTRICT;