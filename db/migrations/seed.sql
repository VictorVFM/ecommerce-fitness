##Populando Banco
INSERT INTO cliente (nome, email, documento, telefone, senha, status) VALUES ('João Silva', 'joao@example.com', '12345678901', '1122334455', 'senha123', 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, status) VALUES ('Maria Souza', 'maria@example.com', '98765432109', '9988776655', 'senha456', 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, status) VALUES ('Carlos Santos', 'carlos@example.com', '65432198701', '7766554433', 'senha789', 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, status) VALUES ('Ana Oliveira', 'ana@example.com', '36985214701', '5544332211', 'senhaabc', 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, status) VALUES ('Pedro Pereira', 'pedro@example.com', '25896314701', '3322115544', 'senhaxyz', 1);


UPDATE cliente SET email = 'carlos_novo@example.com' WHERE nome = 'Carlos Santos';


INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('João Silva', 'M', '1990-05-15', '12345678901', 'joao@example.com', '1122334455', 'senha123', 'Gerente', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Maria Souza', 'F', '1985-08-20', '98765432109', 'maria@example.com', '9988771655', 'senha456', 'Atendente', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Carlos Santos', 'M', '1988-03-10', '65432198701', 'carlos@example.com', '7866554433', 'senha789', 'Técnico', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Ana Oliveira', 'F', '1992-11-25', '36985214701', 'ana@example.com', '5544332211', 'senhaabc', 'Analista', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Pedro Pereira', 'M', '1995-07-03', '25896314701', 'pedro@example.com', '3322115544', 'senhaxyz', 'Estagiário', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Luana Costa', 'F', '1987-12-12', '74185296301', 'luana@example.com', '6677889900', 'senha123', 'Analista', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Rafael Oliveira', 'M', '1991-06-28', '85296374101', 'rafael@example.com', '11223344565', 'senha456', 'Técnico', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Juliana Almeida', 'F', '1990-09-17', '96385274101', 'juliana@example.com', '9988776655', 'senha789', 'Atendente', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Gustavo Santos', 'M', '1994-04-08', '65498732101', 'gustavo@example.com', '7766554433', 'senhaabc', 'Estagiário', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Carla Lima', 'F', '1989-02-22', '96321478501', 'carla@example.com', '5544392211', 'senhaxyz', 'Gerente', 1);


UPDATE funcionario SET funcao = 'Atendente' WHERE sexo = 'F';















