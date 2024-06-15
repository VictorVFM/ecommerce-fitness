DROP DATABASE ecommerce_fitness;
CREATE DATABASE ecommerce_fitness CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE ecommerce_fitness;


CREATE TABLE tipo_cliente(
                             id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                             nome VARCHAR(100) NOT NULL,
                             status BOOL NOT NULL
);

CREATE TABLE cliente(
                        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                        nome VARCHAR(100) NOT NULL,
                        email VARCHAR(100) NOT NULL UNIQUE,
                        documento VARCHAR(14) UNIQUE,
                        telefone VARCHAR(11) UNIQUE,
                        senha VARCHAR(255) NOT NULL,
                        id_tipo INT NOT NULL,
                        imagem TEXT,
                        status BOOL NOT NULL,
                        CONSTRAINT fk_Tipo_Cliente_Cliente FOREIGN KEY(id_tipo) REFERENCES tipo_cliente(id)
);

CREATE TABLE cartao_cliente (
                                id INT PRIMARY KEY AUTO_INCREMENT,
                                id_Cliente INT NOT NULL,
                                numero_cartao VARCHAR(16) NOT NULL,
                                nome_titular VARCHAR(100) NOT NULL,
                                validade DATE NOT NULL,
                                cvv VARCHAR(3) NOT NULL,
                                status BOOL NOT NULL,
                                CONSTRAINT fk_Cliente_CartaoCliente FOREIGN KEY(id_Cliente) REFERENCES cliente(id)
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
                            funcao ENUM("ADMINISTRADOR","COZINHEIRO","ENTREGADOR") NOT NULL,
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
                            quantidade INT NOT NULL DEFAULT 0,
                            status BOOL NOT NULL,
                            CONSTRAINT fk_Fornecedor_Ingrediente FOREIGN KEY(id_Fornecedor) REFERENCES fornecedor(id)
);

CREATE TABLE categoria_comida(
                                 id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                 nome VARCHAR(50) NOT NULL,
                                 imagem TEXT,
                                 status BOOL NOT NULL
);



CREATE TABLE comida(
                       id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                       nome VARCHAR(50) NOT NULL,
                       preco DOUBLE NOT NULL,
                       kcal INT NOT NULL,
                       id_categoria INT NOT NULL,
                       imagem TEXT,
                       status BOOL NOT NULL,
                       CONSTRAINT fk_categoriaComida_comida FOREIGN KEY(id_categoria) REFERENCES categoria_comida(id)
);


CREATE TABLE comida_ingrediente(
                                   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                   id_Comida INT NOT NULL,
                                   id_Ingrediente INT NOT NULL,
                                   CONSTRAINT fk_Comida_ComidaIngrediente FOREIGN KEY(id_Comida) REFERENCES comida(id),
                                   CONSTRAINT fk_Ingrediente_ComidaIngrediente FOREIGN KEY (id_Ingrediente) REFERENCES ingrediente(id)
);

CREATE TABLE tipo_pagamento(
                               id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                               nome VARCHAR(100) NOT NULL,
                               status BOOL NOT NULL
);



CREATE TABLE pedido(
                       id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                       id_Cliente INT NOT NULL,
                       Id_Funcionario INT NOT NULL,
                       data_pedido DATE NOT NULL DEFAULT (CURRENT_DATE),
                       id_tipo_pagamento INT NOT NULL,
                       endereco VARCHAR(255) NOT NULL,
                       etapa ENUM("NOVO","EM_PREPARO","EM_ROTA_DE_ENTREGA","ENTREGUE","CANCELADO") NOT NULL,
                       status VARCHAR(15) NOT NULL,
                       CONSTRAINT fk_Cliente_Pedido FOREIGN KEY(id_Cliente) REFERENCES cliente(id),
                       CONSTRAINT fk_Funcionario_Pedido FOREIGN KEY(id_Funcionario) REFERENCES funcionario(id),
                       CONSTRAINT fk_TipoPagamento_Pedido FOREIGN KEY(id_tipo_pagamento) REFERENCES tipo_pagamento(id)
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

CREATE TABLE itens_pedido(
                             id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                             id_Pedido INT NOT NULL,
                             id_Comida INT NOT NULL,
                             quantidade INT NOT NULL,
                             CONSTRAINT fk_Pedido_ItensPedido FOREIGN KEY(id_Pedido) REFERENCES pedido(id),
                             CONSTRAINT fk_Comida_ItensPedido FOREIGN KEY(id_Pedido) REFERENCES comida(id)
);


CREATE TABLE avaliacao_cliente(
                                  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                  id_Cliente INT NOT NULL,
                                  id_Pedido INT NOT NULL,
                                  nota INT NOT NULL,
                                  comentario TEXT,
                                  data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  CONSTRAINT fk_Cliente_Avaliacao FOREIGN KEY (id_Cliente) REFERENCES cliente(id),
                                  CONSTRAINT fk_Pedido_Avaliacao FOREIGN KEY (id_Pedido) REFERENCES pedido(id)
);

CREATE TABLE cupom_desconto (
                                id INT PRIMARY KEY AUTO_INCREMENT,
                                codigo VARCHAR(50) NOT NULL UNIQUE,
                                desconto DECIMAL(5,2) NOT NULL,
                                validade DATE NOT NULL,
                                status BOOL NOT NULL
);

CREATE TABLE lista_de_desejos (
                                  id INT PRIMARY KEY AUTO_INCREMENT,
                                  id_cliente INT NOT NULL,
                                  id_comida INT NOT NULL,
                                  CONSTRAINT fk_cliente_wishlist FOREIGN KEY (id_cliente) REFERENCES cliente(id),
                                  CONSTRAINT fk_comida_wishlist FOREIGN KEY (id_comida) REFERENCES comida(id)
);

CREATE TABLE favoritos (
                           id INT PRIMARY KEY AUTO_INCREMENT,
                           id_cliente INT NOT NULL,
                           id_comida INT NOT NULL,
                           CONSTRAINT fk_cliente_favoritos FOREIGN KEY (id_cliente) REFERENCES cliente(id),
                           CONSTRAINT fk_comida_favoritos FOREIGN KEY (id_comida) REFERENCES comida(id)
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


CREATE TABLE pedido_Log(
                           id INT PRIMARY KEY AUTO_INCREMENT,
                           id_Pedido INT NOT NULL,
                           data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           acao VARCHAR(255),
                           descricao TEXT,
                           CONSTRAINT fk_Pedido_Pedido_Log FOREIGN KEY (id_Pedido) REFERENCES pedido(id)
);

##Criação de VIEWS
CREATE VIEW usuario AS
SELECT cliente.id, cliente.nome, cliente.email, cliente.documento, cliente.telefone, cliente.senha, tipo_cliente.nome AS tipo,cliente.status
FROM cliente
         JOIN tipo_cliente ON cliente.id_tipo = tipo_cliente.id
UNION ALL
SELECT funcionario.id, funcionario.nome, funcionario.email, funcionario.cpf AS documento, funcionario.telefone, funcionario.senha, funcionario.funcao AS tipo,funcionario.status
FROM funcionario;



##view ingrediente funcionou
CREATE VIEW pedidos_ingredientes AS
SELECT
    i.nome AS ingrediente,
    SUM(ci.id_Ingrediente) AS quantidade_pedida
FROM
    comida_ingrediente ci
        JOIN
    ingrediente i ON ci.id_Ingrediente = i.id
GROUP BY
    i.nome
ORDER BY
    quantidade_pedida DESC;


##view de pedidos por cliente funcionou
CREATE VIEW pedidos_por_cliente AS
SELECT
    c.nome AS cliente,
    COUNT(p.id) AS total_pedidos
FROM
    pedido p
        JOIN
    cliente c ON p.id_Cliente = c.id
GROUP BY
    c.nome;

CREATE VIEW pedidos_hoje AS
SELECT *
FROM pedido
WHERE data_pedido = CURDATE();


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


DELIMITER $$

CREATE PROCEDURE pedidos_por_data(IN input_data DATE)
BEGIN
SELECT *
FROM pedido
WHERE dataPedido = input_data;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE comidas_baixas_kcal(IN max_kcal INT)
BEGIN
SELECT *
FROM comida
WHERE kcal < max_kcal;
END $$

DELIMITER ;

DELIMITER $$

DELIMITER //

CREATE PROCEDURE buscar_pedidos_por_email(IN input_email VARCHAR(100))
BEGIN
    DECLARE user_id INT;
    DECLARE user_tipo VARCHAR(20);

    -- Verifica se o e-mail pertence a um cliente
SELECT id INTO user_id
FROM cliente
WHERE email = input_email;

IF user_id IS NOT NULL THEN
        SET user_tipo = 'cliente';
ELSE
        -- Verifica se o e-mail pertence a um funcionário
SELECT id INTO user_id
FROM funcionario
WHERE email = input_email;

IF user_id IS NOT NULL THEN
            SET user_tipo = 'funcionario';
END IF;
END IF;

    IF user_id IS NOT NULL THEN
        IF user_tipo = 'cliente' THEN
SELECT *
FROM pedido
WHERE id_Cliente = user_id;
ELSE
SELECT *
FROM pedido
WHERE Id_Funcionario = user_id;
END IF;
ELSE
SELECT 'Nenhum usuário encontrado com o e-mail fornecido' AS message;
END IF;
END //

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


DELIMITER //

CREATE TRIGGER pedido_after_insert
    AFTER INSERT ON pedido
    FOR EACH ROW
BEGIN
    INSERT INTO pedido_Log (id_Pedido, acao, descricao)
    VALUES (NEW.id, 'Inserção', CONCAT('Novo pedido cadastrado com ID ', NEW.id));
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER pedido_after_update
    AFTER UPDATE ON pedido
    FOR EACH ROW
BEGIN
    IF OLD.etapa <> NEW.etapa OR OLD.status <> NEW.status THEN
        INSERT INTO pedido_Log (id_Pedido, acao, descricao)
        VALUES (NEW.id, 'Alteração', CONCAT('Pedido atualizado - Etapa: ', OLD.etapa, ' -> ', NEW.etapa, '; Status: ', OLD.status, ' -> ', NEW.status));
END IF;
END //

DELIMITER ;
