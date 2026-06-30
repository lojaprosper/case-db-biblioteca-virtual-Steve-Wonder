CREATE DATABASE pessoa1;
USE pessoa1;

-- ------------------------------------------------------------
-- Tabela: Pessoa
-- Representa qualquer entidade humana no sistema
-- (usuário, cliente, colaborador, participante, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa              INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    telefone        VARCHAR(20),
    status_pessoa          VARCHAR(20) DEFAULT 'ativo'
);

-- ------------------------------------------------------------
-- Tabela: Item
-- Representa qualquer recurso, produto ou elemento do sistema
-- (produto, livro, equipamento, serviço, vaga, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS item (
    id_item                    INT AUTO_INCREMENT PRIMARY KEY,
    nome                  VARCHAR(100) NOT NULL,
    categoria             VARCHAR(50),
    descricao             TEXT,
    valor                 DECIMAL(10, 2),
    quantidade_disponivel INT DEFAULT 0
);

-- ------------------------------------------------------------
-- Tabela: Registro
-- Representa uma relação entre Pessoa e Item
-- (compra, empréstimo, inscrição, reserva, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registro (
    id_registro           INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa    INT NOT NULL,
    id_item      INT NOT NULL,
    data_registro DATE DEFAULT NULL,
    observacao   TEXT,
    status_registro       VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_item)   REFERENCES item(id_item)
);

-- ------------------------------------------------------------
-- Dados
-- Quais outros dados poderiam fazer parte do seu banco?
-- ------------------------------------------------------------

INSERT INTO pessoa (nome, email, data_nascimento, telefone, status_pessoa) VALUES
('Ana Lima', 'ana@email.com', '1995-03-12', '11999990001', 'ativo'),
('Carlos Souza', 'carlos@email.com', '1988-07-22', '11988881111', 'ativo'),
('Mariana Dias', 'mariana@email.com', '2001-11-05', '11977772222', 'ativo'),
('João Silva', 'joao@email.com', '1990-01-15', '11966663333', 'ativo'),
('Beatriz Costa', 'beatriz@email.com', '1998-05-20', '11955554444', 'ativo'),
('Lucas Rocha', 'lucas@email.com', '1992-09-10', '11944445555', 'ativo'),
('Fernanda Lima', 'fernanda@email.com', '1985-12-01', '11933336666', 'ativo'),
('Pedro Alves', 'pedro@email.com', '2000-04-18', '11922227777', 'ativo');

INSERT INTO item (nome, categoria, descricao, valor, quantidade_disponivel) VALUES
('Dom Casmurro', 'Literatura', 'Machado de Assis', 25.00, 5),
('O Hobbit', 'Fantasia', 'J.R.R. Tolkien', 45.00, 3),
('1984', 'Ficção', 'George Orwell', 35.00, 4),
('Sapiens', 'História', 'Yuval Noah Harari', 60.00, 2),
('Clean Code', 'Tecnologia', 'Robert Martin', 120.00, 6),
('O Pequeno Príncipe', 'Infantil', 'Saint-Exupéry', 20.00, 10),
('Duna', 'Ficção', 'Frank Herbert', 55.00, 3),
('Orgulho e Preconceito', 'Romance', 'Jane Austen', 30.00, 5),
('Harry Potter', 'Fantasia', 'J.K. Rowling', 40.00, 7);

INSERT INTO registro (id_pessoa, id_item, data_registro, observacao, status_registro) VALUES
(1, 1, '2025-01-10', NULL, 'concluido'),
(2, 2, '2026-06-20', 'Empréstimo ativo', 'ativo'),
(3, 3, '2026-06-21', NULL, 'ativo'),
(4, 4, '2026-06-22', 'Reserva', 'pendente'),
(5, 5, '2026-06-23', NULL, 'ativo'),
(6, 6, '2026-06-24', 'Retirada rápida', 'concluido'),
(7, 7, '2026-06-25', NULL, 'ativo'),
(8, 8, '2026-06-26', 'Pendente de validação', 'pendente');

-- Inserindo 1 Pessoa
INSERT INTO pessoa (nome, email, data_nascimento, telefone, status_pessoa) 
VALUES ('Amanda Oliveira', 'amanda.oli@email.com', '1997-08-25', '11911112222', 'ativo');

-- Inserindo 1 Item
INSERT INTO item (nome, categoria, descricao, valor, quantidade_disponivel) 
VALUES ('A Culpa é das Estrelas', 'Romance', 'Obra de John Green', 32.50, 4);

-- Inserindo 1 Registro (ID 9 para pessoa e 10 para item, seguindo a sequência)
INSERT INTO registro (id_pessoa, id_item, data_registro, observacao, status_registro) 
VALUES (9, 10, '2026-06-29', 'Empréstimo para novo membro', 'ativo');

UPDATE registro 
SET status_registro = 'concluido' 
WHERE id_pessoa = 9 AND id_item = 10 AND status_registro = 'ativo';

DELETE FROM item 
WHERE id_item = 4;

-- 1. Adiciona a coluna de status
ALTER TABLE item ADD COLUMN situacao VARCHAR(20) DEFAULT 'disponivel';

-- 2. Atualiza o item para 'inativo' ou 'danificado' em vez de deletar
UPDATE item SET situacao = 'danificado' WHERE id_item = 4;

DELETE FROM item 
WHERE id_item = 4;

UPDATE item 
SET situacao = 'removido' 
WHERE id_item = 5;

UPDATE item 
SET situacao = 'removido' 
WHERE id_item = 4;

SELECT * FROM item WHERE situacao = 'disponivel';

-- Caso precise remover o registro de empréstimo primeiro para depois deletar o item
DELETE FROM registro WHERE id_item = 7;
DELETE FROM item WHERE id_item = 7;

-- Adicionando as colunas necessárias à tabela pessoa
ALTER TABLE pessoa 
ADD COLUMN endereco_residencial VARCHAR(255);

-- Adicionando colunas de idioma e ano de publicação à tabela item
ALTER TABLE item 
ADD COLUMN idioma VARCHAR(30) DEFAULT 'Português',
ADD COLUMN ano_publicacao INT;

SELECT nome, categoria, idioma, ano_publicacao 
FROM item 
WHERE ano_publicacao > 2020 
  AND idioma = 'Português'
ORDER BY ano_publicacao DESC;

SELECT 
    p.nome AS leitor, 
    i.nome AS livro, 
    i.ano_publicacao, 
    r.data_registro
FROM registro r
JOIN pessoa p ON r.id_pessoa = p.id_pessoa
JOIN item i ON r.id_item = i.id_item
WHERE i.ano_publicacao > 2020
ORDER BY i.ano_publicacao DESC;



-- ------------------------------------------------------------
-- Agora:
-- 1. Defina o contexto do seu sistema (Fase 1)
-- 2. Gere dados coerentes com esse contexto com IA (Fase 2)
--    e adicione os dados usando INSERT
-- 3. Formule suas perguntas e escreva os comandos abaixo (Fase 3)
-- ------------------------------------------------------------

-- Pergunta 1 (UPDATE):
-- [escreva aqui uma pergunta que pode ser respondida usando UPDATE]
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]



-- Pergunta 2 (DELETE):
-- [escreva aqui uma pergunta que pode ser respondida usando DELETE]
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]


-- Pergunta 3 (ALTER TABLE):
-- [escreva aqui uma pergunta que pode ser respondida usando ALTER TABLE]
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]
