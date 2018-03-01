
-- Exerc�cio 1:
CREATE TABLE Genero(
    Cod_genero VARCHAR2(2) NOT NULL,
    Nom_genero VARCHAR2(15) NOT NULL,
    CONSTRAINT "GeneroPK" PRIMARY KEY (Cod_genero)
);

-- Exerc�cio 2:
CREATE TABLE Fita(
    Cod_fita NUMBER(6) NOT NULL,
    Cod_genero VARCHAR2(50) NOT NULL,
    Tit_fita VARCHAR2(50) NOT NULL,
    Qtd_fita NUMBER(2) NOT NULL,
    Cod_preco VARCHAR2(1) NOT NULL,
    CONSTRAINT "FitaPK" PRIMARY KEY (Cod_fita)
);

-- Exerc�cio 3:
CREATE TABLE Preco(
    Cod_preco VARCHAR2(1) NOT NULL,
    Des_preco VARCHAR(20) NOT NULL,
    Val_preco NUMBER(5,2) NOT NULL,
    CONSTRAINT "PrecoPK" PRIMARY KEY (Cod_preco)
);

-- Exerc�cio 4:
ALTER TABLE Fita 
        ADD CONSTRAINT "Fita_GeneroFK" 
    FOREIGN KEY (Cod_genero) REFERENCES Genero (Cod_genero);
    
ALTER TABLE Fita 
        ADD CONSTRAINT "Fita_PrecoFK" 
    FOREIGN KEY (Cod_preco) REFERENCES Preco (Cod_preco);

-- Exerc�cio 5:    
INSERT INTO Fita VALUES (1, 1, 'Fitando', 1, 1);
-- R: Essa inser��o n�o funciona, pois a restri��o de chave
-- estrangeira foi violada, ou seja, a entrada n�o existe na
-- tabela "Genero".

-- Exerc�cio 6:
INSERT INTO Genero VALUES (1, 'Com�dia');
INSERT INTO Fita VALUES (1, 1, 'Fitando', 1, null);
-- R: Essa inser��o n�o funciona, pois viola a restri��o "NOT NULL"
-- na coluna "Cod_preco".

-- Exerc�cio 7:
ALTER TABLE Preco ADD CONSTRAINT "Preco_SemNegativos" CHECK (Val_preco >= 0); 
INSERT INTO Preco VALUES (1, 'Um pre�o qualquer', -100);
-- R: Essa inser��o n�o funcionou, pois violou a restri��o que acabou
-- de ser criada.

-- Exerc�cio 9:

INSERT INTO Preco VALUES (1, 'Normal', 15.00);
INSERT INTO Preco VALUES (2, 'Lan�amento', 30.00);
INSERT INTO Preco VALUES (3, 'Promo��o', 10.50);
INSERT INTO Preco VALUES (4, 'Especial', 7.00);
INSERT INTO Preco VALUES (5, 'Cortesia', 0.00);

-- Exerc�cio 8:
INSERT INTO Genero VALUES (2, 'Terror');
INSERT INTO Genero VALUES (3, 'Drama');
INSERT INTO Genero VALUES (4, 'A��o');
INSERT INTO Genero VALUES (5, 'Suspense');
INSERT INTO Genero VALUES (6, 'Romance');

INSERT INTO Fita VALUES (1, 1, 'Gente Grande', 1, 1);
INSERT INTO Fita VALUES (2, 1, 'Bob Esponja', 1, 1);
INSERT INTO Fita VALUES (3, 2, 'Annabelle', 1, 1);
INSERT INTO Fita VALUES (4, 1, 'Jeca Tatu', 1, 5);
INSERT INTO Fita VALUES (5, 4, 'Transformers', 1, 3);

-- Exercicio 10:

UPDATE Preco 
   SET Val_preco = Val_preco + (Val_preco * 0.05)
 WHERE Cod_preco IN (1,2);
 
 -- Exercicio 11:
 DELETE Preco WHERE Cod_preco = 1;
 -- R: Essa linha n�o pode ser exclu�da porque ela � referenciada
 -- na tabela "Fita" e, se fosse removida, violaria as restri��es
 -- de chave estrangeira dessa tabela.
 
-- Exercicio 12:
 DELETE Preco 
  WHERE Cod_preco NOT IN (SELECT DISTINCT f.Cod_preco FROM Fita f);
        