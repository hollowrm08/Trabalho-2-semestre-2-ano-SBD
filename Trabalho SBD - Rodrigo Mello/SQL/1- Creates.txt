create table Tb_Instrutor(
   Id_Instrutor int,
   Nm_Instrutor varchar(50) not null,
   Vl_Salario float not null,
   Nu_RG char (11) not null,
   Nu_Cpf char (11) not null,
   Ds_Email varchar(50),
   Nu_telefone varchar(10)
);

create table Tb_Aluno(
   Id_Aluno int,
   Nu_Matricula varchar(30) not null,
   Nm_Aluno varchar(40) not null,
   Nu_RG char (11) not null,
   Nu_Cpf char (11) not null,
   Ds_Email varchar(50)
);

create table Tb_Carro(
   Id_Carro int,
   Nm_Modelo_Carro varchar(40) not null,
   Nm_Cor varchar(15) not null,
   Nu_Placa char(8) not null
);

create table Tb_Prova(
   Id_Prova int,
   Nu_Nota float not null check (Nu_Nota <=10 and Nu_Nota >= 0),
   Nm_Tipo_Prova char(2) not null,
   Id_Carro int,
   Dia_Prova date,
   Id_Instrutor int,
   Id_Aluno int
);

create table Tb_Aula(
   Id_Aula int,
   Id_Instrutor int not null,
   Nm_Tipo_De_Aula char(2) not null,
   Id_Carro int,
   Dia_Aula date,
   Nm_Sala int
);


