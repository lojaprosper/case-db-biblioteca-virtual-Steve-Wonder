CREATE DATABASE IF NOT EXISTS sistema_base;
USE sistema_base;

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
('Ana Lima',      'ana.lima@email.com',      '1995-03-12', '11999990001', 'ativo');

INSERT INTO item (nome, categoria, descricao, valor, quantidade_disponivel) VALUES
('Item A', 'Categoria 1', 'Descrição do item A', 49.90,  10);

INSERT INTO registro (id_pessoa, id_item, data_registro, observacao, status_registro) VALUES
(1,1, '2025-01-10', NULL,                'concluido');

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
