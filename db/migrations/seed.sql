
USE ecommerce_fitness;

##Populando Banco


INSERT INTO tipo_cliente(nome,status) VALUES('CLIENTE_NORMAL',1);

INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('João Silva', 'joao@example.com', '12345678901', '1122334455', 'senha123', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Maria Souza', 'maria@example.com', '98765432109', '9988776655', 'senha456', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Carlos Santos', 'carlos@example.com', '65432198701', '7766554433', 'senha789', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Ana Oliveira', 'ana@example.com', '36985214701', '5544332211', 'senhaabc', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Pedro Pereira', 'pedro@example.com', '25896314701', '3322115544', 'senhaxyz', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Fernanda Lima', 'fernanda@example.com', '11223344567', '9988774455', 'senha1122', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Ricardo Gonçalves', 'ricardo@example.com', '22334455678', '8877665544', 'senha3344', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Beatriz Costa', 'beatriz@example.com', '33445566789', '7766534433', 'senha5566', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Gustavo Almeida', 'gustavo@example.com', '44556677890', '6655443322', 'senha7788', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Larissa Ferreira', 'larissa@example.com', '55667788901', '5544331211', 'senha9900', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Felipe Rodrigues', 'felipe@example.com', '66778899012', '4433221100', 'senha1123', 1, 1);
INSERT INTO cliente (nome, email, documento, telefone, senha, id_tipo, status) VALUES ('Patrícia Barbosa', 'patricia@example.com', '77889900123', '3322110099', 'senha4567', 1, 1);

UPDATE cliente SET email = 'carlos_novo@example.com' WHERE nome = 'Carlos Santos';

INSERT INTO cartao_cliente (id_Cliente, numero_cartao, nome_titular, validade, cvv, status)
VALUES 
    (1, '1234567812345678', 'João da Silva', '2025-12-31', '123', 1),
    (2, '8765432187654321', 'Maria Oliveira', '2024-10-31', '456', 1),
    (3, '1111222233334444', 'Carlos Santos', '2023-05-31', '789', 1),
    (4, '9876543298765432', 'Ana Souza', '2026-08-31', '321', 1),
    (5, '5555666677778888', 'Pedro Pereira', '2024-11-30', '999', 1),
    (6, '4444333322221111', 'Fernanda Lima', '2025-07-31', '111', 1),
    (7, '6666555544443333', 'Ricardo Gonçalves', '2026-09-30', '222', 1),
    (8, '7777666655554444', 'Beatriz Costa', '2027-01-31', '333', 1),
    (9, '8888777766665555', 'Gustavo Almeida', '2023-12-31', '444', 1),
    (10, '9999888877776666', 'Larissa Ferreira', '2024-05-31', '555', 1),
    (11, '1111000099998888', 'Felipe Rodrigues', '2025-03-31', '666', 1),
    (12, '2222111100009999', 'Patrícia Barbosa', '2026-06-30', '777', 1);


INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES('Veio da Lancha', 'M', '1990-05-14', '12242s9', 'admin@gmail.com', '644220', '$2a$10$gEy6LIjP9QXuPqvJV5HAculbeACnRyKkgoehWlzB/o8V4WikEfowa', 'ADMINISTRADOR', 1);
INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('João Silva', 'M', '1990-05-15', '12345678901', 'joao@example.com', '1122334455', 'senha123', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Maria Souza', 'F', '1985-08-20', '98765432109', 'maria@example.com', '9988771655', 'senha456', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Carlos Santos', 'M', '1988-03-10', '65432198701', 'carlos@example.com', '7866554433', 'senha789', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Ana Oliveira', 'F', '1992-11-25', '36985214701', 'ana@example.com', '5544332211', 'senhaabc', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Pedro Pereira', 'M', '1995-07-03', '25896314701', 'pedro@example.com', '3322115544', 'senhaxyz', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Luana Costa', 'F', '1987-12-12', '74185296301', 'luana@example.com', '6677889900', 'senha123', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Rafael Oliveira', 'M', '1991-06-28', '85296374101', 'rafael@example.com', '11223344565', 'senha456', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Juliana Almeida', 'F', '1990-09-17', '96385274101', 'juliana@example.com', '9988776655', 'senha789', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Gustavo Santos', 'M', '1994-04-08', '65498732101', 'gustavo@example.com', '7766554433', 'senhaabc', 'ENTREGADOR', 1);

INSERT INTO funcionario (nome, sexo, data_nascimento, cpf, email, telefone, senha, funcao, status)
VALUES ('Carla Lima', 'F', '1989-02-22', '96321478501', 'carla@example.com', '5544392211', 'senhaxyz', 'ENTREGADOR', 1);











INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Pães da Fazenda', '12345678901234', 'paesfazenda@gmail.com', '1122334455', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Laticínios Leite Bom', '9876432109876', 'leitebom@laticinios.com', '998776655', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Hortifruti Sabor Natural', '5678901345678', 'sabornatural@hortifruti.com', '3322114455', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Doces Delícias Caseiras', '24680135792468', 'deliciasdoces@outlook.com', '6677889900', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Carnes Nobres do Sítio', '13579246802468', 'carnesnobre@sitio.com', '9988776655', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Frutas Frescas da Fazenda', '9875432109876', 'frutasfazenda@gmail.com', '112334455', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Verduras Orgânicas Naturais', '56789012345678', 'verdurasnaturais@organicos.com', '332114455', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Especiarias do Oriente', '2480135792468', 'especiariasoriente@outlook.com', '667789900', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Grãos e Cereais do Campo', '1379246802468', 'graoscampo@agricultura.com', '99886655', 1);

INSERT INTO fornecedor (nome_fantasia, cnpj, email, telefone, status)
VALUES ('Bebidas Refrescantes Naturais', '123458901234', 'bebidasnaturais@gmail.com', '12334455', 1);






-- Fornecedor: Pães da Fazenda
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Farinha de Trigo Orgânica', 1, 1000, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Fermento Natural', 1, 500, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Azeite Extra Virgem', 1, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Sementes de Linhaça', 1, 200, 1);

-- Fornecedor: Laticínios Leite Bom
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Leite Fresco Integral', 2, 700, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Queijo Minas Frescal', 2, 400, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Manteiga com Sal', 2, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Iogurte Natural', 2, 600, 1);

-- Fornecedor: Hortifruti Sabor Natural
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Maçãs Orgânicas', 3, 200, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Tomates Frescos', 3, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Cenouras Orgânicas', 3, 400, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Espinafre Fresco', 3, 150, 1);

-- Fornecedor: Doces Delícias Caseiras
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Açúcar Mascavo', 4, 600, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Geleia de Morango Artesanal', 4, 250, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Chocolate Meio Amargo', 4, 200, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Doce de Leite Cremoso', 4, 400, 1);

-- Fornecedor: Carnes Nobres do Sítio
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Filé Mignon', 5, 350, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Linguiça Artesanal', 5, 200, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Peito de Frango Orgânico', 5, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Costela Bovina', 5, 150, 1);

-- Fornecedor: Frutas Frescas da Fazenda
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Bananas Orgânicas', 6, 400, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Morangos Frescos', 6, 250, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Abacaxis Maduros', 6, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Laranjas Suculentas', 6, 200, 1);

-- Fornecedor: Verduras Orgânicas Naturais
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Alface Crespa', 7, 200, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Cebolas Orgânicas', 7, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Pimentões Vermelhos', 7, 150, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Rúcula Fresca', 7, 250, 1);

-- Fornecedor: Especiarias do Oriente
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Cúrcuma em Pó', 8, 150, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Gengibre Fresco', 8, 200, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Pimenta do Reino Preta', 8, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Cravo da Índia', 8, 250, 1);

-- Fornecedor: Grãos e Cereais do Campo
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Arroz Integral', 9, 400, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Feijão Carioca', 9, 250, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Quinoa em Grãos', 9, 200, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Aveia em Flocos Finos', 9, 350, 1);

-- Fornecedor: Bebidas Refrescantes Naturais
INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Água de Coco Natural', 10, 200, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Suco de Laranja Fresco', 10, 300, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Chá de Hibisco', 10, 150, 1);

INSERT INTO ingrediente (nome, id_Fornecedor, quantidade, status)
VALUES ('Café Arábica Moído', 10, 400, 1);




INSERT INTO categoria_comida (nome, status)
VALUES ('Saladas Verdes', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Pratos Proteicos', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Smoothies Saudáveis', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Lanches Fitness', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Refeições Low Carb', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Sopas Nutritivas', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Refeições Vegetarianas', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Pratos Veganos', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Refeições Sem Glúten', 1);

INSERT INTO categoria_comida (nome, status)
VALUES ('Refeições Sem Lactose', 1);







-- LINHA 1
-- Saladas Verdes
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Salada de Pepino com Ovo', 25.99, 200, 1, 'imagem_salada_med.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Salada de Quinoa e Abacate', 22.50, 250, 1, 'imagem_salada_quinoa_abacate.png', 1);

-- Pratos Proteicos
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Salada de Alface Roxa com Nozes', 30.00, 300, 1, 'imagem_frango_legumes.png', 1);


-- LINHA 2
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Salada de Verduras com Queijo', 35.50, 320, 1, 'imagem_salmão_maracujá.png', 1);

-- Smoothies Saudáveis
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Enroladinho de Queijo com Espinafre', 12.99, 150, 3, 'imagem_smoothie_frutas_vermelhas.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Panqueca de Frango com Salsinha', 10.50, 180, 2, 'imagem_smoothie_banana_aveia.png', 1);

-- LINHA 3
-- Lanches Fitness
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Wrap de Frango e Vegetais', 15.75, 220, 2, 'imagem_wrap_frango_vegetais.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Croissant de Frango', 12.00, 190, 2, 'imagem_sanduiche_integral_queijo.png', 1);

-- Refeições Low Carb
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Sorvete de Fruta Natural', 27.00, 280, 5, 'imagem_escondidinho_batata_doce.png', 1);


-- LINHA 4
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Pirâmide de Azeitonas', 18.50, 250, 7, 'imagem_hamburguer_frango.png', 1);

-- Sopas Nutritivas
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Leite Condensado Zero com Morango', 20.99, 180, 5, 'imagem_sopa_detox_legumes.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Sorvete de Creme com Chocolate 50% Cacau', 18.00, 220, 5, 'imagem_sopa_abobora.png', 1);


-- LINHA 5
-- Refeições Vegetarianas
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Sanduíche de Guacamole Light', 23.50, 220, 4, 'imagem_espaguete_abobrinha_pesto.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Sanduíche de Salada', 28.00, 260, 4, 'imagem_risoto_cogumelos.png', 1);

-- Pratos Veganos
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Sanduíche de Queijo Integral', 25.99, 300, 4, 'imagem_feijoada_vegana.png', 1);


-- LINHA 6
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Bolinho de Lentilha com Quinoa', 18.50, 240, 4, 'imagem_bolinho_lentilha_quinoa.png', 1);

-- Refeições Sem Glúten
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Smoothie de Frutas Vermelhas', 30.00, 280, 3, 'imagem_pizza_integral.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Torta Creme com Morango', 28.50, 260, 3, 'imagem_torta_legumes_sem_gluten.png', 1);


-- LINHA 7
-- Refeições Sem Lactose
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Bolo de Blueberry', 12.99, 180, 5, 'imagem_pao_batata_doce_sem_lactose.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Pudim Light', 15.50, 200, 5, 'imagem_sorvete_frutas_naturais.png', 1);







-- Saladas Verdes
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Peixe Grelhado com Tomate', 25.99, 200, 2, 'imagem_salada_med.png', 1);

-- LINHA 8
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Salada Caesar', 22.50, 250, 1, 'imagem_salada_quinoa_abacate.png', 1);

-- Pratos Proteicos
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Abobrinha com Legumes', 30.00, 300, 7, 'imagem_frango_legumes.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Salada de Abobrinha com Lentilha e Ovos', 35.50, 320, 1, 'imagem_salmão_maracujá.png', 1);

-- LINHA 9
-- Smoothies Saudáveis
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Espaguete de Abobrinha ao Pesto', 12.99, 150, 7, 'imagem_smoothie_frutas_vermelhas.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Macarronada Integral', 10.50, 180, 7, 'imagem_smoothie_banana_aveia.png', 1);

-- Lanches Fitness
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Risoto de Cogumelos', 15.75, 220, 7, 'imagem_wrap_frango_vegetais.png', 1);


-- LINHA 10
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Carbonara Light com Frango', 12.00, 190, 7, 'imagem_sanduiche_integral_queijo.png', 1);

-- Refeições Low Carb
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Macarronada Alho Óleo', 27.00, 280, 7, 'imagem_escondidinho_batata_doce.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Espaguete ao Molho Integral ', 18.50, 250, 7, 'imagem_hamburguer_frango.png', 1);


-- LINHA 11
-- Sopas Nutritivas
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Yakishoba de Salmão Light', 20.99, 180, 6, 'imagem_sopa_detox_legumes.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Yakishoba de Frango Light', 18.00, 220, 6, 'imagem_sopa_abobora.png', 1);

-- Refeições Vegetarianas
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Frango Grelhado com Legumes', 23.50, 220, 2, 'imagem_espaguete_abobrinha_pesto.png', 1);


-- LINHA 12
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Salmão ao Molho de Maracujá', 28.00, 260, 2, 'imagem_risoto_cogumelos.png', 1);

-- Pratos Veganos
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Panqueca de Legumes', 25.99, 300, 8, 'imagem_feijoada_vegana.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Morango com Creme de Whey', 18.50, 240, 5, 'imagem_bolinho_lentilha_quinoa.png', 1);


-- LINHA 13
-- Refeições Sem Glúten
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Sopa Detox', 30.00, 280, 6, 'imagem_pizza_integral.png', 1);

INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Sanduíche de Espinafre com Queijo', 28.50, 260, 4, 'imagem_torta_legumes_sem_gluten.png', 1);

-- Refeições Sem Lactose
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Festival de Torrada com Frutas', 12.99, 180, 5, 'imagem_pao_batata_doce_sem_lactose.png', 1);


-- LINHA 14
INSERT INTO comida (nome, preco, kcal, id_categoria, imagem, status)
VALUES ('Brownie Integral', 15.50, 200, 3, 'imagem_sorvete_frutas_naturais.png', 1);







-- Salada Mediterrânea
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (1, 5); -- Folhas Verdes
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (1, 10); -- Tomate Cereja
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (1, 16); -- Azeitonas Pretas
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (1, 20); -- Queijo Feta

-- Salada de Quinoa e Abacate (ID 2)
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (2, 7); -- Quinoa em Grãos
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (2, 18); -- Abacate
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (2, 6); -- Folhas de Rúcula
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (2, 19); -- Sementes de Girassol

-- Frango Grelhado com Legumes(ID 33)
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (33, 8); -- Peito de Frango
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (33, 14); -- Cenoura Ralada
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (33, 15); -- Abobrinha em Cubos
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (33, 17); -- Molho de Soja

-- Salmão ao Molho de Maracujá(ID 34)
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (34, 9); -- Filé de Salmão
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (34, 11); -- Maracujá
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (34, 12); -- Gengibre
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (34, 13); -- Pimenta Dedo-de-Moça

-- Smoothie de Frutas Vermelhas(ID 17)
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (17, 1); -- Morangos Frescos
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (17, 2); -- Framboesas
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (17, 3); -- Mirtilos
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (17, 4); -- Amoras

-- Smoothie de Banana e Aveia
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (6, 21); -- Banana
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (6, 22); -- Aveia em Flocos Finos
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (6, 23); -- Leite de Amêndoas
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (6, 24); -- Mel

-- Wrap de Frango e Vegetais(ID 7)
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (7, 8); -- Peito de Frango
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (7, 14); -- Cenoura Ralada
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (7, 15); -- Abobrinha em Cubos
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (7, 25); -- Wrap Integral

-- Sanduíche Integral com Queijo (ID 15)
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (15, 26); -- Pão Integral
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (15, 27); -- Queijo Minas Frescal
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (15, 28); -- Alface
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (15, 29); -- Tomate

-- Escondidinho de Batata Doce
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (9, 30); -- Batata Doce
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (9, 31); -- Carne Moída Magra
INSERT INTO comida_ingrediente (id_Comida, id_Ingrediente)
VALUES (9, 32); -- Queijo Cottage

UPDATE comida SET imagem = CONCAT('food_',id,'.png') WHERE id BETWEEN 1 AND 32;
UPDATE comida SET imagem = CONCAT('food_',id,'.jpg') WHERE id BETWEEN 33 AND 40;

UPDATE comida SET id_categoria = 3 WHERE id_categoria = 9;
UPDATE comida SET id_categoria = 4 WHERE id_categoria = 10;

UPDATE categoria_comida SET imagem = CONCAT('menu_',id,'.png') WHERE id BETWEEN 1 AND 10;


INSERT INTO tipo_pagamento (nome, status) VALUES ('Cartão de Crédito', 1);
INSERT INTO tipo_pagamento (nome, status) VALUES ('Boleto Bancário', 1);
INSERT INTO tipo_pagamento (nome, status) VALUES ('Transferência Bancária', 1);
INSERT INTO tipo_pagamento (nome, status) VALUES ('Dinheiro', 1);
INSERT INTO tipo_pagamento (nome, status) VALUES ('Cheque', 1);


INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (1, 1, '2024-05-05', 1, 'Rua Barão de Jaguara | 123 | Centro | Campinas | SP | 13015-130', 'CANCELADO', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (2, 2, '2024-05-06', 2, 'Avenida Francisco Glicério | 456 | Centro | Campinas | SP | 13012-100', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (3, 3, '2024-05-07', 3, 'Rua Dr. Quirino | 789 | Centro | Campinas | SP | 13015-081', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (4, 4, '2024-05-08', 4, 'Rua José Paulino | 101 | Centro | Campinas | SP | 13013-000', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (5, 5, '2024-06-07', 5, 'Avenida Andrade Neves | 112 | Botafogo | Campinas | SP | 13013-160', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (6, 2, '2024-02-10', 1, 'Rua Sacramento | 100 | Centro | Campinas | SP | 13010-150', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (7, 3, '2024-03-15', 2, 'Rua José de Alencar | 200 | Centro | Campinas | SP | 13013-090', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (8, 4, '2024-02-20', 3, 'Rua Barão de Atibaia | 300 | Centro | Campinas | SP | 13015-120', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (9, 5, '2024-04-05', 1, 'Rua General Osório | 400 | Centro | Campinas | SP | 13010-111', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (10, 6, '2024-04-10', 2, 'Rua Cônego Cipião | 500 | Centro | Campinas | SP | 13010-050', 'ENTREGUE', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (11, 7, '2024-04-15', 3, 'Rua Ferreira Penteado | 600 | Centro | Campinas | SP | 13013-160', 'EM_ROTA_DE_ENTREGA', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (12, 8, '2024-04-20', 4, 'Rua Doutor Campos Sales | 700 | Centro | Campinas | SP | 13015-081', 'EM_ROTA_DE_ENTREGA', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (1, 9, '2024-05-01', 1, 'Rua Regente Feijó | 800 | Centro | Campinas | SP | 13013-061', 'EM_ROTA_DE_ENTREGA', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (2, 10, '2024-05-05', 2, 'Rua Sampainho | 900 | Centro | Campinas | SP | 13013-130', 'EM_ROTA_DE_ENTREGA', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (3, 11, '2024-05-10', 3, 'Rua Álvaro Muller | 101 | Centro | Campinas | SP | 13023-001', 'EM_ROTA_DE_ENTREGA', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (4, 2, '2024-05-15', 4, 'Rua Bernardino de Campos | 202 | Centro | Campinas | SP | 13024-040', 'EM_ROTA_DE_ENTREGA', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (5, 3, '2024-05-20', 5, 'Rua Culto à Ciência | 303 | Centro | Campinas | SP | 13010-080', 'NOVO', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (6, 4, '2024-06-01', 1, 'Rua Sete de Setembro | 404 | Centro | Campinas | SP | 13025-040', 'NOVO', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (7, 5, '2024-06-05', 2, 'Rua Barreto Leme | 505 | Centro | Campinas | SP | 13020-040', 'NOVO', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (8, 6, '2024-06-10', 3, 'Rua Luzitana | 606 | Centro | Campinas | SP | 13023-040', 'NOVO', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (9, 7, '2024-06-15', 4, 'Rua Álvaro Ribeiro | 707 | Centro | Campinas | SP | 13022-040', 'NOVO', '1');

INSERT INTO pedido (id_Cliente, Id_Funcionario, data_pedido, id_tipo_pagamento, endereco, etapa, status)
VALUES (10, 8, '2024-06-20', 5, 'Rua Benjamin Constant | 808 | Centro | Campinas | SP | 13026-040', 'NOVO', '1');




INSERT INTO loja (id, cnpj, nomeFantasia, dataFundacao) VALUES (1, '12345678901234', 'Loja 1', '2020-01-01');

INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (1, 1, 3);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (1, 5, 2);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (2, 7, 1);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (2, 10, 4);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (3, 15, 5);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (3, 20, 3);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (4, 22, 2);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (4, 25, 1);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (5, 30, 4);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (5, 35, 5);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (6, 40, 3);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (7, 8, 2);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (8, 18, 1);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (9, 28, 4);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (10, 4, 5);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (11, 12, 3);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (12, 16, 2);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (13, 23, 1);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (14, 27, 4);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (15, 31, 5);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (16, 6, 3);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (17, 9, 2);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (18, 13, 1);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (19, 19, 4);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (20, 21, 5);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (21, 24, 3);
INSERT INTO itens_pedido (id_Pedido, id_Comida, quantidade) VALUES (22, 32, 2);

INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Honda', 'CG 160 Start', 'Vermelha', 2023, 'ABC1234', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Yamaha', 'Factor 150', 'Preto', 2022, 'DEF5678', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Suzuki', 'Yes 125', 'Branco', 2021, 'GHI9012', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Kawasaki', 'Ninja 300', 'Verde', 2023, 'JKL3456', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Harley-Davidson', 'Iron 883', 'Preto', 2020, 'MNO7890', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('BMW', 'G 310 GS', 'Azul', 2022, 'PQR1234', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Triumph', 'Street Triple RS', 'Laranja', 2021, 'STU5678', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Ducati', 'Monster 797', 'Vermelha', 2023, 'VWX9012', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('KTM', 'Duke 200', 'Laranja', 2022, 'YZA3456', 1);
INSERT INTO veiculo (marca, modelo, cor, ano, placa, status) VALUES('Royal Enfield', 'Himalayan 411', 'Preto', 2020, 'BCD6789', 1);


INSERT INTO funcionarioVeiculo (id_Entregador, id_Veiculo) VALUES(2, 1), (3,2),(4,3),(5,4),(6,5),(7,6),(8,7),(9,8),(10,9),(11,10);


INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13087-540', 'SP', 'Campinas', 'Jardim do Lago II', 'Rua Ana Maria Gonçalves Bueno', '91', 5, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13070-112', 'SP', 'Campinas', 'Jardim Proença', 'Rua Doutor Alberto Sarmento', '97', 4, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13090-720', 'SP', 'Campinas', 'Jardim das Paineiras', 'Rua José Resende Filho', '315', 3, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13085-521', 'SP', 'Campinas', 'Jardim Santa Genebra', 'Rua Doutor Carlos Guimarães', '103', 2, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13076-003', 'SP', 'Campinas', 'Parque Industrial', 'Rua José Rocha Bomfim', '204', 1, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13044-001', 'SP', 'Campinas', 'Jardim Nova Europa', 'Rua Elpídio Gomes', '207', 1, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13083-012', 'SP', 'Campinas', 'Jardim Bela Vista', 'Rua Professor Germano Negrini', '244', 2, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13098-667', 'SP', 'Campinas', 'Parque das Universidades', 'Rua Alzira de Aguiar Aranha', '69', 4, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13070-295', 'SP', 'Campinas', 'Jardim Proença', 'Rua Doutor Atilio Tognato', '50', 2, 1);
INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, id_Cliente, status) VALUES('13046-327', 'SP', 'Campinas', 'Vila Nova Teixeira', 'Rua Doutor Zerbini', '460', 3, 1);

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (2, 2, '2024-05-06', '2024-05-07');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (3, 3, '2024-05-07', '2024-05-08');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (4, 4, '2024-05-08', '2024-05-09');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (5, 5, '2024-06-07', '2024-06-08');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (6, 2, '2024-02-10', '2024-02-11');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (7, 3, '2024-03-15', '2024-03-16');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (8, 4, '2024-02-20', '2024-02-21');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (9, 5, '2024-04-05', '2024-04-06');

INSERT INTO entrega (id_Pedido, id_Entregador, dataEnvio, dataEntrega)
VALUES (10, 6, '2024-04-10', '2024-04-11');



INSERT INTO avaliacao_cliente (id_Cliente, id_Pedido, nota, comentario)
VALUES (1, 1, 5, 'Excelente serviço e comida de alta qualidade.'),
       (2, 2, 4, 'Gostei muito, mas poderia ter mais opções vegetarianas.'),
       (3, 3, 3, 'Comida boa, mas entrega atrasou um pouco.'),
       (4, 4, 5, 'Adorei! Tudo perfeito, desde a embalagem até o sabor.'),
       (5, 5, 2, 'Não fiquei satisfeito com o atendimento.'),
       (6, 6, 4, 'Bom atendimento, mas a comida chegou fria.'),
       (7, 7, 5, 'Entrega rápida e comida deliciosa!'),
       (8, 8, 3, 'Comida ok, mas faltou talheres.'),
       (9, 9, 4, 'Gostei bastante, recomendo.'),
       (10, 10, 5, 'Perfeito! Melhor experiência de todas.');
      
      

INSERT INTO cupom_desconto (codigo, desconto, validade, status)
VALUES
    ('DESC10OFF', 10.00, '2024-12-31', 1),
    ('FRETEGRATIS', 5.00, '2024-06-30', 1),
    ('VERAO15', 15.00, '2024-09-30', 1),
    ('PROMO20', 20.00, '2024-07-31', 1),
    ('BEMVINDO5', 5.00, '2024-08-31', 1),
    ('BLACKFRIDAY25', 25.00, '2024-11-29', 1),
    ('ANO30', 30.00, '2025-01-01', 1),
    ('PRIMAVERA10', 10.00, '2024-05-31', 1),
    ('INVERNO25', 25.00, '2024-12-15', 1),
    ('FERIADO20', 20.00, '2024-12-25', 1),
    ('OUTONO15', 15.00, '2024-10-31', 1);

   


INSERT INTO lista_de_desejos (id_cliente, id_comida)
VALUES
    (1, 5),
    (2, 10),
    (3, 15),
    (4, 3),
    (5, 7),
    (6, 12),
    (7, 1),
    (8, 9),
    (9, 18),
    (10, 2),
    (11, 6),
    (12, 14),
    (2, 4),
    (6, 11),
    (7, 20);
   
   
INSERT INTO favoritos (id_cliente, id_comida)
VALUES
    (1, 3),
    (2, 7),
    (3, 12),
    (4, 1),
    (5, 5),
    (6, 9),
    (7, 2),
    (8, 6),
    (9, 11),
    (10, 4),
    (11, 8),
    (12, 13),
    (3, 10),
    (9, 15),
    (11, 19);



