USE biblioteca_db;

-- Consulta 1: Listar todos os livros (título e ISBN) publicados pela editora 'Tech Books Edições'.
-- (Usa: SELECT, JOIN, WHERE)
SELECT 
    L.titulo, 
    L.Isbn, 
    E.nome AS nome_editora
FROM Livro AS L
JOIN Editora AS E ON L.id_editora = E.id_editora
WHERE E.nome = 'Tech Books Edições';


-- Consulta 2: Listar todos os empréstimos ativos (que ainda não foram devolvidos).
-- (Usa: SELECT, JOIN, WHERE IS NULL)
SELECT 
    L.nome AS nome_leitor,
    Li.titulo AS titulo_livro,
    E.data_emprestimo,
    E.data_devolucao_prev
FROM Emprestimo AS E
JOIN Leitor AS L ON E.id_leitor = L.id_leitor
JOIN Exemplar AS Ex ON E.id_exemplar = Ex.id_exemplar
JOIN Livro AS Li ON Ex.Isbn = Li.Isbn
WHERE E.data_devolucao_real IS NULL;


-- Consulta 3: Mostrar o histórico de empréstimos de uma leitora específica (Maria Fernandes).
-- (Usa: SELECT, JOIN, WHERE, ORDER BY)
SELECT 
    Li.titulo,
    E.data_emprestimo,
    E.data_devolucao_real
FROM Emprestimo AS E
JOIN Leitor AS L ON E.id_leitor = L.id_leitor
JOIN Exemplar AS Ex ON E.id_exemplar = Ex.id_exemplar
JOIN Livro AS Li ON Ex.Isbn = Li.Isbn
WHERE L.nome = 'Maria' AND L.sobrenome = 'Fernandes'
ORDER BY E.data_emprestimo DESC;


-- Consulta 4: Listar todos os livros e seus respectivos autores.
-- (Usa: SELECT, Múltiplos JOINs)
SELECT 
    L.titulo,
    A.nome AS nome_autor,
    A.sobrenome AS sobrenome_autor
FROM Livro AS L
JOIN Escreve AS E ON L.Isbn = E.Isbn
JOIN Autor AS A ON E.id_autor = A.id_autor;


-- Consulta 5: Listar os leitores com multas pendentes e o valor da multa.
-- (Usa: SELECT, JOIN, WHERE)
SELECT 
    L.nome,
    L.sobrenome,
    M.valor,
    M.status_pagamento
FROM Multa AS M
JOIN Emprestimo AS E ON M.id_emprestimo = E.id_emprestimo
JOIN Leitor AS L ON E.id_leitor = L.id_leitor
WHERE M.status_pagamento = 'Pendente';