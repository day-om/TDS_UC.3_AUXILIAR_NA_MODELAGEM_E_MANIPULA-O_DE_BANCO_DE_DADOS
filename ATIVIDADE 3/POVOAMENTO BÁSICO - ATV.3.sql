
/*Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.*/

/*Considerando que, “em princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.*/
INSERT INTO tipo_quarto (descricao, valor_diaria) VALUES 
("Apt- com arcondicionado, banheiro e frigobar", 100.00),
("Quarto- Duas camas,banheiro e frigobar", 150.00),
("Enfer- vários pacientes e banheiro coletivo.", 80.00);

/*Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas a convênios existentes.*/
INSERT INTO convenios (nome,cnpj,tempo_carencia) VALUES
("IASPE","42.027.577/0001-37",1),
("Mais vida","80.512.476/0001-40",1),
("Saúde+","65.361.730/0001-63",2),
("MEDMAIS","00.468.448/0001-34",2);

/*Inclua ao menos sete especialidades (considere que “entre as especialidades há pediatria, clínica geral, gastroenterologia e dermatologia”)*/
INSERT INTO especialidades (nome) VALUES
("Pediatria"),
("Clínica Geral"),
("Gastroenterologia"),
("Dermatologia"),
("Otorrinologia"),
("Ortopedia"),
("Neurologia");