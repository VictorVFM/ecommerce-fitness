CREATE DATABASE IF NOT EXISTS ecommerce_fitness 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;

USE ecommerce_fitness;



CREATE TABLE cliente(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	documento VARCHAR(14) NOT NULL UNIQUE,
	telefone VARCHAR(11) NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	status BOOL NOT NULL
);


CREATE TABLE loja(
	id INT PRIMARY KEY NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    nomeFantasia VARCHAR(100)  NOT NULL,
    dataFundacao DATE NOT NULL    
);

CREATE TABLE funcionario(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	sexo CHAR NOT NULL,
	data_nascimento DATE NOT NULL,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,	
	telefone VARCHAR(11) NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	funcao VARCHAR(40) NOT NULL,
	status BOOL NOT NULL
);


CREATE TABLE veiculo(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(30) NOT NULL,
    ano YEAR NOT NULL,
    placa VARCHAR(7) NOT NULL UNIQUE,
    status BOOL NOT NULL
);


CREATE TABLE funcionarioVeiculo(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_Entregador INT NOT NULL,
    id_Veiculo INT NOT NULL,
    CONSTRAINT fk_Funcionario_FuncionarioVeiculo FOREIGN KEY(id_Entregador) REFERENCES funcionario(id),
    CONSTRAINT fk_Veiculo_FuncionarioVeiculo FOREIGN KEY(id_Veiculo) REFERENCES veiculo(id)
);



CREATE TABLE endereco(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	cep VARCHAR(9),
	estado VARCHAR(2) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero VARCHAR(6),
	id_Cliente INT NOT NULL,
	status BOOL NOT NULL,
	CONSTRAINT fk_Cliente_Endereco FOREIGN KEY(id_Cliente) REFERENCES cliente(id)
);




CREATE TABLE fornecedor(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome_fantasia VARCHAR(60) NOT NULL,
	cnpj VARCHAR(14) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	telefone VARCHAR(11) NOT NULL UNIQUE,
	status BOOL NOT NULL	
);

CREATE TABLE ingrediente(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	id_Fornecedor INT NOT NULL,
	CONSTRAINT fk_Fornecedor_Ingrediente FOREIGN KEY(id_Fornecedor) REFERENCES fornecedor(id)
);

CREATE TABLE comida(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	kcal INT NOT NULL
);


CREATE TABLE comidaIngrediente(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_Comida INT NOT NULL,
	id_Ingrediente INT NOT NULL,
	CONSTRAINT fk_Comida_ComidaIngrediente FOREIGN KEY(id_Comida) REFERENCES comida(id),
	CONSTRAINT fk_Ingrediente_ComidaIngrediente FOREIGN KEY (id_Ingrediente) REFERENCES ingrediente(id)
);


CREATE TABLE pedido(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_Cliente INT NOT NULL,
	Id_Funcionario INT NOT NULL,
	dataPedido DATE NOT NULL,
	tipoPagamento INT NOT NULL,
	status VARCHAR(15) NOT NULL,
	CONSTRAINT fk_Cliente_Pedido FOREIGN KEY(id_Cliente) REFERENCES cliente(id),
	CONSTRAINT fk_Funcionario_Pedido FOREIGN KEY(id_Funcionario) REFERENCES funcionario(id)
);



CREATE TABLE entrega(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_Pedido INT NOT NULL,
    id_Entregador INT NOT NULL,
    dataEnvio DATE NOT NULL,
    dataEntrega DATE,
    CONSTRAINT fk_Pedido_Entrega FOREIGN KEY(id_Pedido) REFERENCES pedido(id),
    CONSTRAINT fk_Funcionario_Entrega FOREIGN KEY(id_Entregador) REFERENCES funcionario(id)

    
);

CREATE TABLE itensPedido(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_Pedido INT NOT NULL,
	id_Comida INT NOT NULL,
	quantidade INT NOT NULL,
	CONSTRAINT fk_Pedido_ItensPedido FOREIGN KEY(id_Pedido) REFERENCES pedido(id),
	CONSTRAINT fk_Comida_ItensPedido FOREIGN KEY(id_Pedido) REFERENCES comida(id)

);



##Criação de Logs

CREATE TABLE cliente_Log(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_Cliente INT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(255),
    descricao TEXT,
    CONSTRAINT fk_Cliente_Cliente_Log FOREIGN KEY (id_Cliente) REFERENCES cliente(id)
);


CREATE TABLE funcionario_Log(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_Funcionario INT,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(255),
    descricao TEXT,
   CONSTRAINT fk_Cliente_Funcionario_Log FOREIGN KEY (id_Funcionario) REFERENCES funcionario(id)
);


CREATE TABLE eventosPedido(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_Pedido INT NOT NULL,
	data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,	
	acao VARCHAR(255) NOT NULL,
	descricao TEXT NOT NULL,
	status VARCHAR(40) NOT NULL,
	CONSTRAINT fk_Pedido_EventosPedido FOREIGN KEY(id_Pedido) REFERENCES pedido(id)
);

##Criação de Procedure

DELIMITER $$
CREATE PROCEDURE inserir_Cliente_Log(IN input_id INT,IN input_acao VARCHAR(255), IN input_descricao TEXT)
BEGIN
	INSERT INTO cliente_Log (id_Cliente, acao, descricao) VALUES (input_id, input_acao, input_descricao);
END $$
DELIMITER ;



DELIMITER $$

CREATE PROCEDURE inserir_Funcionario_Log( IN input_id INT, IN input_acao VARCHAR(255), IN input_descricao TEXT)
BEGIN
    INSERT INTO funcionario_Log (id_Funcionario, acao, descricao) VALUES (input_id, input_acao, input_descricao);
END $$

DELIMITER ;



## Criação de Triggers

DELIMITER //

CREATE TRIGGER cliente_after_insert
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    CALL inserir_Cliente_Log(NEW.id, 'Inserção', CONCAT('Novo cliente cadastrado com nome ', NEW.nome, ' e email ', NEW.email));
END //

DELIMITER ;



DELIMITER //

CREATE TRIGGER cliente_after_update
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
    IF OLD.nome <> NEW.nome OR OLD.email <> NEW.email THEN
        CALL inserir_Cliente_Log(NEW.id, 'Alteração', CONCAT('Cliente atualizado - Nome: ', OLD.nome, ' -> ', NEW.nome, '; Email: ', OLD.email, ' -> ', NEW.email));
    END IF;
END //

DELIMITER ;







DELIMITER //

CREATE TRIGGER funcionario_after_insert
AFTER INSERT ON funcionario
FOR EACH ROW
BEGIN
    CALL inserir_Funcionario_Log(NEW.id, 'Inserção', CONCAT('Novo funcionário cadastrado com nome ', NEW.nome, ' e email ', NEW.email));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER funcionario_after_update
AFTER UPDATE ON funcionario
FOR EACH ROW
BEGIN
    IF OLD.nome <> NEW.nome OR OLD.email <> NEW.email OR OLD.funcao <> NEW.funcao THEN
        CALL inserir_Funcionario_Log(NEW.id, 'Alteração', CONCAT('Funcionário atualizado - Nome: ', OLD.nome, ' -> ', NEW.nome, '; Email: ', OLD.email, ' -> ', NEW.email, '; Função: ', OLD.funcao, ' -> ', NEW.funcao));
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER funcionario_after_delete
AFTER DELETE ON funcionario
FOR EACH ROW
BEGIN
    CALL inserir_Funcionario_Log(OLD.id, 'Exclusão', CONCAT('Funcionário excluído - Nome: ', OLD.nome, '; Email: ', OLD.email));
END //

DELIMITER ;



