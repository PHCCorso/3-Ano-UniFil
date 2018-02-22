Create table cliente (
    Cod_cliente     number(5) not null,
    Nom_cliente     varchar2(30) not null,
    Ind_Sexo        varchar2(1) not null,
    Num_telefone    varchar2(11),
    Des_endereco    varchar2(30) 
);

alter table cliente 
      add constraint pk_cliente 
      primary key (Cod_cliente); 
      
alter table cliente 
      add (num_celular varchar2(11) not null);

insert into cliente values (12345, 'Clarêncio Esclarecido', 'M', '12345678', 'Rua Escura 666', '987654321');

select * from cliente;

alter table cliente add(RG varchar2(11));
alter table cliente add(CPF varchar2(11));

alter table cliente modify (cpf not null); -- Se houver ao menos um campo nulo na tabela, esse comando falha.

update cliente set CPF = '1234567890';

alter table cliente modify (cpf not null); -- Agora funciona.

select * from cliente;

desc cliente;
