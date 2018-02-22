CREATE TABLE cliente (
    Cod_cliente     number(5) NOT NULL,
    Nom_cliente     varchar2(30) NOT NULL,
    Ind_Sexo        varchar2(1) NOT NULL,
    Num_telefone    varchar2(11),
    Des_endereco    varchar2(30) 
);

ALTER TABLE cliente 
      ADD CONSTRAINT pk_cliente 
      PRIMARY KEY (Cod_cliente); 
      
ALTER TABLE cliente 
      ADD (Num_celular varchar2(11) NOT NULL);

INSERT INTO cliente VALUES (12345, 'Clarêncio Esclarecido', 'M', '12345678', 'Rua Escura 666', '987654321');

SELECT * FROM cliente;

ALTER TABLE cliente ADD(RG varchar2(11));
ALTER TABLE cliente ADD(CPF varchar2(11));

ALTER TABLE cliente MODIFY (CPF NOT NULL); -- Se houver ao menos um campo nulo na tabela, esse comando falha.

UPDATE cliente SET CPF = '1234567890';

ALTER TABLE cliente MODIFY (CPF NOT NULL); -- Agora funciona.

SELECT * FROM cliente;

DESC cliente;
