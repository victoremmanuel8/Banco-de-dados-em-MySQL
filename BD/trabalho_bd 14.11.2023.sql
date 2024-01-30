create database bd_fabrica;
use bd_fabrica;

create table tb_setor (
cd_setor int auto_increment not null primary key,
nm_setor varchar(50)
);

insert into tb_setor (nm_setor) 
	values ('Financeiro'),
		   ('Operação'),
           ('Desenvolvimento'),
           ('Recurs_os Human_8'),
           ('Erro: Setor inválido.');

create table tb_cargo (
cd_cargo int auto_increment not null primary key,
nm_cargo varchar(70),
ds_cargo varchar(70)
);

insert into tb_cargo (nm_cargo, ds_cargo)
	values ('Contador', 'Administra os gastos da empresa.'),
		   ('Operador de Máquinas Pesadas', 'Pilota máquinas de construção (Trator, Empilhadeira, etc).'),
           ('Desenvolvedor de Software', 'Administra e faz manutenção no sistema da empresa'),
           ('Gerente de RH', 'Demite as pessoas.'),
           ('Erro: Cargo inválido', '-');

create table tb_funcionario (
cd_funcionario int auto_increment not null,
nm_funcionario varchar(100),
sg_sexoFuncionario char(1),
cd_setorFuncionario int,
cd_cargo int,

constraint pk_funcionario primary key (cd_funcionario),
constraint fk_setorFuncionario foreign key (cd_setorFuncionario) 
references tb_setor (cd_setor),
constraint fk_cargo foreign key (cd_cargo) 
references tb_cargo (cd_cargo)
);

insert into tb_funcionario(nm_funcionario, sg_sexoFuncionario, cd_setorFuncionario, cd_cargo) 
	values ('Felipe Costa', 'M', 1, 1),
		   ('Marisa Go_s', 'F', 4, 4),
		   ('Erro: Funcionário inválido','-', 5, 5),
           ('Victor Gomes', 'M', 3, 3);
           
create table tb_salario (
cd_salario int not null auto_increment,
vl_salario decimal(10,2),

constraint pk_salario primary key (cd_salario)
);

insert into tb_salario(vl_salario)
	values (2500.95),
		   (1900.00),
           (3950.00),
           (1900.00);

create table tb_salariofuncionario (
cd_funcionario int,
cd_salario int,

primary key (cd_funcionario, cd_salario),
constraint fk_codigoFuncionario foreign key (cd_funcionario)
references tb_funcionario (cd_funcionario),
constraint fk_salarioFuncionario foreign key (cd_salario)
references tb_salario (cd_salario)
);

insert into tb_salariofuncionario (cd_funcionario, cd_salario)
	values (1,1), (2,2), (3,3), (4,3);
    
select * from tb_salarioFuncionario;

select tb_funcionario.nm_funcionario,
tb_cargo.nm_cargo,
tb_funcionario.sg_sexoFuncionario from tb_funcionario inner join tb_cargo on tb_funcionario.cd_cargo = tb_cargo.cd_cargo;

select tb_funcionario.nm_funcionario,
tb_funcionario.sg_sexoFuncionario,
tb_cargo.nm_cargo,
tb_cargo.ds_cargo,
tb_setor.nm_setor,
tb_salario.vl_salario
from tb_funcionario 
inner join tb_cargo on tb_funcionario.cd_cargo = tb_cargo.cd_cargo
inner join tb_setor on tb_funcionario.cd_setorFuncionario = tb_setor.cd_setor
inner join tb_salario on tb_funcionario.cd_funcionario = tb_salario.cd_salario;

delete from tb_salarioFuncionario where tb_salarioFuncionario.cd_funcionario = 3;

delete tb_funcionario,
tb_cargo,
tb_setor
from tb_funcionario
inner join tb_cargo on tb_funcionario.cd_cargo = tb_cargo.cd_cargo 
inner join tb_setor on tb_funcionario.cd_setorFuncionario = tb_setor.cd_setor 
where tb_funcionario.cd_funcionario = 3 and tb_cargo.cd_cargo = 5 and tb_setor.cd_setor = 5;

update tb_funcionario, tb_cargo set tb_funcionario.cd_funcionario = tb_cargo.cd_cargo where cd_funcionario = 2;

