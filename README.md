# Projeto de Modelagem de Banco de Dados: Biblioteca Universitária

Este repositório contém os scripts SQL para a criação e gerenciamento do banco de dados "Biblioteca Saber & Conhecimento", desenvolvido para a disciplina de Modelagem de Banco de Dados.

## Sobre o Projeto

O projeto simula um sistema de gestão para uma biblioteca universitária, controlando o acervo (livros, exemplares), leitores, empréstimos e multas. O modelo lógico foi normalizado até a **Terceira Forma Normal (3FN)** para garantir a integridade e eliminar redundâncias.

## Modelo Lógico (DER)

(Inclua aqui a imagem final do seu DER, a `image_f0755f.png`)

## Scripts SQL

O banco de dados foi implementado em **MySQL**. Os scripts estão organizados na seguinte ordem de execução:

1.  **`01_Create_tables.sql`**: (DDL) Script de criação de todas as 8 tabelas, com chaves primárias, estrangeiras e restrições de integridade.
2.  **`02_Insere_dados.sql`**: (DML) Script de inserção de dados de exemplo (mock) para popular o banco.
3.  **`03_Scripts_select.sql`**: (DML) Exemplos de consultas complexas (`SELECT` com `JOIN`, `WHERE`, `ORDER BY`) para extrair informações do banco.
4.  **`04_Update_and_delete.sql`**: (DML) Exemplos de comandos de atualização e deleção (`UPDATE`, `DELETE`) que respeitam as regras de negócio.

## Como Executar

1.  Tenha um servidor MySQL em execução (via Workbench, XAMPP, Docker, etc.).
2.  Execute o script `01_Create_tables.sql` para criar a estrutura.
3.  Execute o script `02_Insere_dados.sql` para popular o banco.
4.  Execute os scripts `03_Scripts_select.sql` e `04_Update_and_delete.sql` para consultar e modificar os dados.