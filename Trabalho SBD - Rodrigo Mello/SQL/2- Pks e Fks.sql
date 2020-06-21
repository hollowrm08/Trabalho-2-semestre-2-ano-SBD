alter table tb_instrutor add primary key (Id_Instrutor);
alter table tb_aluno add primary key (Id_Aluno);
alter table tb_carro add primary key (Id_Carro);
alter table tb_prova add primary key (Id_Prova);
alter table tb_aula add primary key (Id_Aula);


alter table tb_prova
   add foreign key (Id_Carro) References Tb_Carro(Id_Carro),
   add foreign key (Id_Instrutor) References Tb_Instrutor(Id_Instrutor),
   add foreign key (Id_Aluno) References Tb_Aluno(Id_Aluno);

alter table tb_aula
   add foreign key (Id_Carro) References Tb_Carro(Id_Carro),
   add foreign key (Id_Instrutor) References Tb_Instrutor(Id_Instrutor);




