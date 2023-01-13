/* create banco de dados */

CREATE TABLE cliente (
    cod_cliente INTEGER PRIMARY KEY,
    nome_cliente VARCHAR(100),
    cpf VARCHAR(14),
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    fk_clinica_cod_clinica INTEGER
);

CREATE TABLE animal (
    cod_animal INTEGER PRIMARY KEY,
    nome_animal VARCHAR(100),
    especie VARCHAR(100),
    fk_Cliente_cod_cliente INTEGER,
    fk_porte_animal_cod_portanimal INTEGER
);

CREATE TABLE produto (
    cod_produto INTEGER PRIMARY KEY,
    nome_produto VARCHAR(100),
    valor_unitario DECIMAL,
    estoque INTEGER,
    fk_clinica_cod_clinica INTEGER,
    fk_tipo_produto_cod_tipo_produto INTEGER
);

CREATE TABLE clinica (
    cod_clinica INTEGER PRIMARY KEY,
    bairro VARCHAR(100),
    rua VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE porte_animal (
    cod_portanimal INTEGER PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE tipo_produto (
    cod_tipo_produto INTEGER PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE atendimento_realiza (
    cod_atendimento INTEGER PRIMARY KEY,
    data_atendimento DATE,
    fk_tipo_atendimento_cod_tipatendimento INTEGER,
    fk_clinica_cod_clinica INTEGER,
    fk_Animal_cod_animal INTEGER
);

CREATE TABLE tipo_atendimento (
    cod_tipatendimento INTEGER PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE Venda_Compra (
    valor_total DECIMAL,
    quantidade INTEGER,
    cod_venda INTEGER PRIMARY KEY,
    fk_Cliente_cod_cliente INTEGER,
    fk_produto_cod_produto INTEGER
);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_clinica_cod_clinica)
    REFERENCES clinica (cod_clinica)
    ON DELETE RESTRICT;
 
ALTER TABLE Animal ADD CONSTRAINT FK_Animal_2
    FOREIGN KEY (fk_Cliente_cod_cliente)
    REFERENCES Cliente (cod_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Animal ADD CONSTRAINT FK_Animal_3
    FOREIGN KEY (fk_porte_animal_cod_portanimal)
    REFERENCES porte_animal (cod_portanimal)
    ON DELETE RESTRICT;
 
ALTER TABLE produto ADD CONSTRAINT FK_produto_2
    FOREIGN KEY (fk_clinica_cod_clinica)
    REFERENCES clinica (cod_clinica)
    ON DELETE RESTRICT;
 
ALTER TABLE produto ADD CONSTRAINT FK_produto_3
    FOREIGN KEY (fk_tipo_produto_cod_tipo_produto)
    REFERENCES tipo_produto (cod_tipo_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE atendimento_realiza ADD CONSTRAINT FK_atendimento_realiza_2
    FOREIGN KEY (fk_tipo_atendimento_cod_tipatendimento)
    REFERENCES tipo_atendimento (cod_tipatendimento)
    ON DELETE RESTRICT;
 
ALTER TABLE atendimento_realiza ADD CONSTRAINT FK_atendimento_realiza_3
    FOREIGN KEY (fk_clinica_cod_clinica)
    REFERENCES clinica (cod_clinica);
 
ALTER TABLE atendimento_realiza ADD CONSTRAINT FK_atendimento_realiza_4
    FOREIGN KEY (fk_Animal_cod_animal)
    REFERENCES Animal (cod_animal);
 
ALTER TABLE Venda_Compra ADD CONSTRAINT FK_Venda_Compra_2
    FOREIGN KEY (fk_Cliente_cod_cliente)
    REFERENCES Cliente (cod_cliente);
 
ALTER TABLE Venda_Compra ADD CONSTRAINT FK_Venda_Compra_3
    FOREIGN KEY (fk_produto_cod_produto)
    REFERENCES produto (cod_produto);