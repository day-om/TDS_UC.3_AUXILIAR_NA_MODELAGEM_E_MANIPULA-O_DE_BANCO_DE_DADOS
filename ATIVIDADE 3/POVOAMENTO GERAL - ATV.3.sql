/*Inclua ao menos dez médicos*/
INSERT INTO medico (nome , data_nascimento, CPF, CRM, UF_CRM, telefone, endereco ) VALUES
("Carlos Eduardo Farias", "1998-02-01" , "12332185212", "123456", "PI", "3232-1221", "Cond.Fevereiro,Apartamento 12,Jockey" ),
("Maria Clara Oliveira", "1993-11-21" , "09867823432", "098765", "PI", "3248-8965", "Rua das Flores,2345,Acarape" ),
("Ramón Gonçalves Pereira", "1985-08-13" , "12525834554", "309137", "PI", "987654323", "Cond.Vila Azul,Apt 23,Mocambinho" ),
("Eduarda Maria Veras", "1979-05-24" , "02589615489", "", "SP", "3547-3623", "Res. Casa Branca,Casa 25,Qd.18,Dirceu" ),
("Vítor Marcelo Alves", "1990-09-30" , "69385478921", "696438", "RJ", "3254-7865", "Rua nove,3476,Bairro Alagoas" ),
("Carol Fonseca Marques", "1987-10-14" , "12823545612", "458978", "PI", "987640328", "Cond.Carlos Magno,Apt 9,Bairro: Noivos" ),
("Marcelo Torres Gonzaga", "1994-07-19" , "02589514732", "128954", "PI", "3209-7864", "Cond.Fevereiro, Apt.16,Jockey"),
("Letícia Madureira de Souza", "1980-12-29" , "12385259678", "987456", "SP", "3267-7899", "Rua Frei Carvalho,2378,Bairro Torres" ),
("Débora Magalhães Verdes", "1995-05-12" , "15923575665", "147852", "PI", "3290-5643", "Cond.Verdes Pastos, Apt.12 ,Bairro Macaúba"),
("Diego Damaseno Veras", "1982-03-28" , "02648286145", "753951", "CE", "3259-8726", "Rua Medeiros,1987,Alto alegre" );

/*Inclua ao menos dez pacientes*/
INSERT INTO pacientes (nome , data_nascimento, endereco, telefone, email, CPF, RG,convenio_id) VALUES
("Guilhermina Soares","1980-02-11","R.Doze 1234,B.Morros","997543210","soares@gmail.com","48140132055","45.900.835-3",null),
("Pablo Silva","1998-10-21","R.Alegria 0908 B.Divino","988654321","silva@gmail.com","71688241043","13.911.344-7",1),
("Jonas Ribeiro","2000-03-01","R.Novembro 7104 B.Mafuá", "981238754","ribeiro@gmail.com","82308161078","43.388.376-5",2),
("Luana Mendes","1996-08-25","R.Vida 1002 B.Dirceu I","999654310","mesndes@gmail.com","40406605017","41.825.152-6",3),
("Vivian Bacelar","1985-09-12","R.Amarante 3212 B.Real Copagre","9953407","bacelar@gmail.com","64186035083","50.353.286-1",null),
("Genivaldo Pessoa","1973-06-13","R.Luis M. 2345 B.Cabral","998763450","pessoa@gmail.com","77240251004","16.710.984-4",null),
("Mavie Luz","2002-05-23","R.Melo 2345 B.Hortas","999345678","luz@gmail.com","21098759095","41.425.198-2",4),
("Lurdes Visosa","1987-04-24","R.Altos 2395 B.Alto alegre","995431023","visosa@gmail.com","49940306008","22.671.405-6",null),
("Diego Araújo","2005-09-30","R.Linhares 123 B.Macaúba","995432871","araujo@gmail.com","27726618060","47.053.743-7",2),
("Jaqueline Olimpio","2008-10-16","R.Verdes 2435 B.Mocambinho","995321456","olimpio@gmail.com","76621944004","39.007.818-9",4);

/*Inclua dez consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais do que uma consulta).
As consultas devem ter ocorrido entre 01/01/2017 e 31/12/2022.*/
INSERT INTO consultas (data_hora, valor, carteirinha_convenio, medico_id, paciente_id, convenio_id, especialidade_id ) VALUES
("2017-07-10 10:00:00","200.00","947916823710018",1,2,1,4),
("2017-07-12 10:00:00","300.00",null,2,1,null,3),
("2018-07-10 09:00:00","300.00","947916823710018",3,2,1,3),
("2017-08-12 08:00:00","250.00","283280814570007",4,3,2,2),
("2018-03-05 10:00:00","300.00","945055932170007",5,4,3,1),
("2018-04-16 07:00:00","250.00",null,6,5,null,6),
("2019-02-10 08:00:00","400.00","197968696580002",7,7,4,5),
("2019-03-12 09:00:00","200.00",null,8,6,null,1),
("2020-02-10 10:00:00","300.00","283280814570007",9,3,2,1),
("2020-03-12 11:00:00","200.00",null,10,8,null,5);

/*Inclua ao menos cinco consultas, que devem ter receituário com dois ou mais medicamentos.*/
INSERT INTO receitas (data,  observacoes, consulta_id) VALUES
("2017-07-10","HIRUDOID POMADA- Aplicar uma camada de sobre a região afetada, espalhando suavemente três a quatro vezes ao dia.DUPIXENT- 2 injeções sob a pele (subcutâneas) de uma só vez, em locais diferentes.",1),
("2017-07-12","GASTROBION- 1 a 2 colheres de sobremesa, 4 vezes ao dia.FLORATIL- consumido por via oral, com o auxílio de um copo de água para ajudar na deglutição.",2),
("2018-07-10","BLUE MAG GASTRO- Dissolver na boca ou mastigar até 3 pastilhas ao dia.OMEPRAZOL- tomar as cápsulas com líquido, por via oral imediatamente antes das refeições,preferencialmente pela manhã.",3),
("2017-08-12","DORFLEX- O uso recomendado é de 1 a 2 comprimidos até 4 vezes ao dia.DIPIRONA MONOIDRATADA- 10 a 20 mL em administração única ou até o máximo de 20 mL, 4 vezes ao dia.",4),
("2018-03-05","AMOXILINA- Um comprimido de 8h/8hNOVALGINA- Tomar o comprimido com líquido (aproximadamente ½ a 1 copo), por via oral.",5);

/*Inclua ao menos três quartos.*/
INSERT INTO quarto (numero,tipo_quarto_id) VALUES
(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),
(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),
(112,3),(113,3),(114,3),(115,3),(116,3),(117,3);

/*Inclua ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez.
 As internações devem ter ocorrido entre 01/01/2017 e 31/12/2022.*/
INSERT INTO internacao (data_entrada,data_prev_alta,data_alta,procedimento,medico_id,paciente_id,quarto_id) VALUES 
("2017-07-12","2017-07-17","2017-07-16","Hidratação,medicamentos para alívio da dor",2,1,3),
("2018-07-10","2018-07-15","2018-07-15","Hidratação,medicamentos para alívio da dor",3,2,2),
("2018-04-16","2018-04-19","2018-04-19","Uso de antinflamatório,medicamentos para dor",6,5,3),
("2018-08-10","2018-08-17","2018-08-16","Cirurgia:Substituição articular",6,5,3),
("2019-02-10","2019-02-10","2019-02-10","Tratamento de crise de sinusite",7,7,1),
("2020-08-12","2020-08-15","2020-08-15","Cirurgia de correção do septo nasal.",7,7,1),
("2020-03-12","2020-03-12","2020-03-12","Tratamento de crise de sinusite",10,8,3);

/*Inclua dados de seis profissionais de enfermaria. Associe cada internação a pelo menos dois enfermeiros.*/
INSERT INTO enfermeiro (nome, cpf,crm) VALUES 
("Maria de Jesus","06287658002","986340"),
("João Ribeiro","68598951013","756894"),
("Madalena Cunha","89605676044","025349"),
("Jonas Lages","49711990040","789354"),
("Nazaré Feitosa","28096018019","456289"),
("Lucas Melo","43558730054","756984");







INSERT INTO internacao_enfermeiro (internacao_id,enfermeiro_id) VALUES
(1,2),
(1,1),
(2,3),
(2,6),
(3,5),
(3,3),
(4,4),
(4,6),
(5,1),
(5,4),
(6,2),
(6,3),
(7,6),
(7,1);