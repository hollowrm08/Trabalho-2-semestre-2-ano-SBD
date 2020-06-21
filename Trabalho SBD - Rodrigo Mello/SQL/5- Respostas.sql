-- 1)

alter table Tb_Carro
alter column Nu_Placa type char(8);

-- 2)
select nm_instrutor from tb_instrutor 
where Ds_email = lower(Ds_email) 
and Ds_email like ('%@%.com%');


-- 3)

create view vw_exer3v1 as select id_carro, count(*) numero from tb_prova 
where id_carro in (select id_carro from tb_carro) 
group by id_carro
order by numero;

select nm_modelo_carro , nu_placa from tb_carro A, 

vw_exer3v1 B where A.id_carro = B.id_carro limit 2;

-- 4)

create view vw_exer4v1 as select id_instrutor, vl_salario from tb_instrutor 
where vl_salario = (select max(a.vl_salario) from tb_instrutor a);

create view vw_exer4v2 as select id_carro from tb_prova A, vw_exer4v1 B 
where A.id_instrutor = B.id_instrutor;

select distinct nm_cor from tb_carro C, vw_exer4v2 D
 where C.id_carro = D.id_carro;

-- 5)

create view vw_exer5v1 as select A.id_instrutor, count (B.*) numero from tb_instrutor A, tb_aula B 
where A.id_instrutor = B.id_instrutor 
group by A.id_instrutor;


create view vw_exer5v1 as select A.id_instrutor, count (B.*) numero from tb_instrutor A, tb_aula B 
where A.id_instrutor = B.id_instrutor group by 

A.id_instrutor;
select nu_telefone from tb_instrutor A, vw_exer5v2 B 
where A.id_instrutor = B.id_instrutor;

-- 6)

create view vw_exer6v1 as select * from (select id_instrutor, id_carro, count(*) numero from tb_prova 
group by (id_instrutor, id_Carro)) A 
where id_carro in (select id_carro from tb_carro);

select nm_instrutor,  nm_modelo_carro from vw_exer6v1 A, tb_instrutor B, tb_carro C 
where B.id_instrutor = A.id_instrutor 
and C.id_carro = A.id_carro;

-- 7)

select nm_aluno from tb_aluno 
where id_aluno = (select id_aluno from tb_prova 
where nu_nota = (select min(nu_nota) pior_nota from tb_prova 
where nm_tipo_prova = 'PR'));

-- 8)  create view vw_exer8v1 as select id_aluno, count (*) provas from tb_prova 
group by id_aluno order by provas desc;

create view vw_exer8v2 as select id_aluno from vw_exer8v1 
where provas = (select max(provas) from vw_exer8v1);

select nu_rg  from tb_aluno A, vw_exer8v2 B 
where A.id_aluno = B.id_aluno;

-- 9)
create view vw_exer9v1 as select id_instrutor, nm_instrutor from tb_instrutor 
where nm_instrutor ilike ('%a%a%') 
or nm_instrutor ilike ('%e%e%') 
or nm_instrutor ilike ('%i%i%') 
or nm_instrutor ilike ('%o%o%') 
or nm_instrutor ilike ('%u%u%');

create view vw_exer9v2 as select distinct id_carro from tb_aula A, vw_exer9v1 B 
where A.id_instrutor = B.id_instrutor and id_carro in (select id_carro from tb_carro);

select nm_modelo_carro from tb_carro A, vw_Exer9v2 B 
where A.id_Carro = B.id_carro;

-- 10) 

create view vw_exer10v1 as select id_aluno from tb_prova 
where 2019 = extract (year from dia_prova) 
and 03 = extract (month from dia_prova);

select distinct nm_aluno from tb_aluno A, vw_exer10v1 B 
where A.id_aluno = B.id_aluno;
