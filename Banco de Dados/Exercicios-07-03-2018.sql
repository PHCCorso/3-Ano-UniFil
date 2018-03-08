
-- Exercicio 1.1
ALTER TABLE Fita MODIFY(Cod_preco VARCHAR2(1) NULL);
-- R: A modificação funcionou porque é possível inserir
-- uma fita sem referenciar nenhum preço.

-- Exercicio 1.2
ALTER TABLE Fita ADD (Data_cadastro DATE NOT NULL);
-- R: A modificação funcionou porque a inserção da nova
-- coluna não altera a integridade dos dados na tabela

-- Exercicio 2.1
ALTER TABLE Preco MODIFY(Des_preco VARCHAR2(5));
-- R: não é possível diminuir o tamanho da coluna porque 
-- algum valor na tabela é maior que o novo valor definido.

-- Exercicio 2.2
ALTER TABLE Preco MODIFY(Des_preco VARCHAR2(30));
-- R: a modificação funcionou porque todos os valores cabem
-- no novo tamanho de texto definido.

-- Exercicio 3
SELECT DES_PRECO, VAL_PRECO FROM Preco ORDER BY VAL_PRECO DESC;

-- Exercicio 4
SELECT MAX(VAL_PRECO), MIN(VAL_PRECO) FROM Preco;

-- Exercicio 5
SELECT SUM(VAL_PRECO), AVG(VAL_PRECO) FROM Preco WHERE COD_PRECO IN ('B', 'C', 'D');

-- Exercicio 6
SELECT g.NOM_GENERO GENERO, 
       MAX(p.VAL_PRECO) MENOR, 
       MIN(p.VAL_PRECO) MAIOR 
  FROM FITA f 
  JOIN PRECO p 
 USING (COD_PRECO) 
  JOIN GENERO g
 USING (COD_GENERO)
 GROUP BY g.NOM_GENERO;

-- Exercicio 7
SELECT NOM_GENERO FROM GENERO ORDER BY NOM_GENERO DESC; 

-- Exercicio 8
SELECT g.NOM_GENERO, 
       SUM(p.VAL_PRECO) SOMA, 
       COUNT(f.COD_FITA) QTD,
       AVG(p.VAL_PRECO) MEDIA
  FROM FITA f 
  JOIN PRECO p 
 USING (COD_PRECO) 
  JOIN GENERO g
 USING (COD_GENERO)
 GROUP BY g.NOM_GENERO;
