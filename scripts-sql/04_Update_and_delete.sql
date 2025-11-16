USE biblioteca_db;

-- 1. O leitor Pedro Gomes (ID 2) devolve o livro (Empréstimo ID 2).
UPDATE Emprestimo
SET data_devolucao_real = CURDATE()
WHERE id_emprestimo = 2;

-- 2. Após a devolução, o status do exemplar (ID 3) deve voltar a 'Disponível'.
UPDATE Exemplar
SET status = 'Disponível'
WHERE id_exemplar = 3;

-- 3. A leitora Maria Fernandes (ID 1) pagou a multa pendente (Multa ID 1).
UPDATE Multa
SET status_pagamento = 'Pago'
WHERE id_multa = 1;


-- ========== COMANDOS DELETE ==========

-- AVISO: Muitos comandos DELETE falharão por padrão por causa das 
-- restrições de Chave Estrangeira (ON DELETE RESTRICT). Isso é uma 
-- PROTEÇÃO para garantir a integridade dos dados.

-- 1. Tentar deletar uma Editora que possui livros (VAI FALHAR).
--    (Isso demonstra a integridade referencial funcionando)
-- DELETE FROM Editora 
-- WHERE nome = 'Tech Books Edições';
-- (Resultado esperado: Erro, pois a editora está ligada a livros)


-- 2. Deletar um leitor que não possui empréstimos (VAI FUNCIONAR).
--    (Lucas Silva, ID 3, foi criado para este teste)
DELETE FROM Leitor
WHERE id_leitor = 3;


-- 3. Deletar a multa que acabou de ser paga (VAI FUNCIONAR).
--    (Após o UPDATE 3, podemos arquivar ou deletar a multa paga)
DELETE FROM Multa
WHERE id_multa = 1 AND status_pagamento = 'Pago';