-- Criar o banco de dados.
CREATE DATABASE IF NOT EXISTS biblioteca_db;
USE biblioteca_db;

-- Tabelas "Pai" (sem chaves estrangeiras)
CREATE TABLE IF NOT EXISTS Editora (
  id_editora INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Autor (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100),
  nacionalidade VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Leitor (
  id_leitor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100),
  matricula VARCHAR(20) NOT NULL UNIQUE,
  tipo_leitor VARCHAR(30) DEFAULT 'Aluno',
  telefone VARCHAR(20),
  email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabelas dependentes (nível 1)
CREATE TABLE IF NOT EXISTS Livro (
  Isbn VARCHAR(20) PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  edicao INT,
  ano_publicacao INT,
  id_editora INT NOT NULL,
  FOREIGN KEY (id_editora) REFERENCES Editora(id_editora)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Exemplar (
  id_exemplar INT AUTO_INCREMENT PRIMARY KEY,
  Isbn VARCHAR(20) NOT NULL,
  status VARCHAR(30) DEFAULT 'Disponível',
  localizacao VARCHAR(50),
  numero_chamada VARCHAR(30),
  FOREIGN KEY (Isbn) REFERENCES Livro(Isbn)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabela Associativa (N:N)
CREATE TABLE IF NOT EXISTS Escreve (
  id_autor INT NOT NULL,
  Isbn VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_autor, Isbn),
  FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  FOREIGN KEY (Isbn) REFERENCES Livro(Isbn)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- Tabelas de Transação (nível 2)
CREATE TABLE IF NOT EXISTS Emprestimo (
  id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
  id_leitor INT NOT NULL,
  id_exemplar INT NOT NULL,
  data_emprestimo DATE NOT NULL,
  data_devolucao_prev DATE NOT NULL,
  data_devolucao_real DATE NULL,
  FOREIGN KEY (id_leitor) REFERENCES Leitor(id_leitor)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  FOREIGN KEY (id_exemplar) REFERENCES Exemplar(id_exemplar)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- Tabela de Transação (nível 3)
CREATE TABLE IF NOT EXISTS Multa (
  id_multa INT AUTO_INCREMENT PRIMARY KEY,
  id_emprestimo INT NOT NULL,
  valor DECIMAL(10, 2) NOT NULL,
  status_pagamento VARCHAR(30) DEFAULT 'Pendente',
  FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);