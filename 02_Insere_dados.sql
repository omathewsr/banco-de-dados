USE biblioteca_db;

-- 1. Inserir Editoras
INSERT INTO Editora (nome, telefone) VALUES 
('Saber & Cia', '1122223333'),
('Tech Books Edições', '2144445555'),
('Leitura Acadêmica', '3166667777');

-- 2. Inserir Autores
INSERT INTO Autor (nome, sobrenome, nacionalidade) VALUES 
('Carlos', 'Drummond', 'Brasileira'),
('Ana', 'Beatriz', 'Brasileira'),
('Robert', 'Martin', 'Americana');

-- 3. Inserir Leitores
INSERT INTO Leitor (nome, sobrenome, matricula, tipo_leitor, telefone, email) VALUES
('Maria', 'Fernandes', '2025001', 'Aluno', '24999991111', 'maria.f@email.com'),
('Pedro', 'Gomes', '2025002', 'Aluno', '24999992222', 'pedro.g@email.com'),
('Lucas', 'Silva', '2025003', 'Professor', '24999993333', 'lucas.s@email.com');

-- 4. Inserir Livros (Usando IDs das Editoras)
INSERT INTO Livro (Isbn, titulo, edicao, ano_publicacao, id_editora) VALUES
('978-85-12345-01-1', 'Modelagem de Banco de Dados', 3, 2024, (SELECT id_editora FROM Editora WHERE nome = 'Tech Books Edições')),
('978-85-12345-02-2', 'Sistemas Operacionais Modernos', 5, 2023, (SELECT id_editora FROM Editora WHERE nome = 'Tech Books Edições')),
('978-85-12345-03-3', 'Poesia Reunida', 1, 2022, (SELECT id_editora FROM Editora WHERE nome = 'Saber & Cia'));

-- 5. Ligar Autores aos Livros (Tabela Escreve)
INSERT INTO Escreve (id_autor, Isbn) VALUES
((SELECT id_autor FROM Autor WHERE sobrenome = 'Beatriz'), '978-85-12345-01-1'),
((SELECT id_autor FROM Autor WHERE sobrenome = 'Martin'), '978-85-12345-02-2'),
((SELECT id_autor FROM Autor WHERE sobrenome = 'Drummond'), '978-85-12345-03-3');

-- 6. Inserir Exemplares (Cópias dos livros)
INSERT INTO Exemplar (Isbn, status, localizacao, numero_chamada) VALUES
('978-85-12345-01-1', 'Disponível', 'Corredor A1', '651.12 C12m'),
('978-85-12345-01-1', 'Disponível', 'Corredor A1', '651.12 C12m'),
('978-85-12345-02-2', 'Disponível', 'Corredor B2', '005.43 M31s'),
('978-85-12345-03-3', 'Manutenção', 'Restauro', '869.91 D79p');

-- 7. Inserir Empréstimos (Simulando cenários)
-- Empréstimo 1: Devolvido com Atraso
INSERT INTO Emprestimo (id_leitor, id_exemplar, data_emprestimo, data_devolucao_prev, data_devolucao_real) VALUES
(1, 1, '2025-10-01', '2025-10-10', '2025-10-15');

-- Empréstimo 2: Ainda não devolvido (dentro do prazo)
INSERT INTO Emprestimo (id_leitor, id_exemplar, data_emprestimo, data_devolucao_prev, data_devolucao_real) VALUES
(2, 3, '2025-11-10', '2025-11-20', NULL);

-- Atualizar o status dos exemplares emprestados
UPDATE Exemplar SET status = 'Emprestado' WHERE id_exemplar IN (1, 3);

-- 8. Inserir Multas (Baseado no Empréstimo 1)
INSERT INTO Multa (id_emprestimo, valor, status_pagamento) VALUES
(1, 12.50, 'Pendente');