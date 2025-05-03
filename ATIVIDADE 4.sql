/*•	Todos os dados e o valor médio das consultas do ano de 2020 realizadas sem convênio*/

SELECT c.id,p.nome AS paciente,m.nome AS medico,e.nome AS especialidades, data_hora, valor,cc.nome AS convenio, carteirinha_convenio, AVG(valor) AS valor_medio
FROM consultas c 
JOIN pacientes p ON c.paciente_id = p.id
JOIN medico m ON c.medico_id = m.id
JOIN especialidades e ON c.especialidade_id = e.id
JOIN convenios cc ON c.convenio_id = cc.id
WHERE YEAR(data_hora) = 2020 AND c.convenio_id = NULL
GROUP BY c.id;

/*•	Todos os dados e o valor médio das consultas do ano de 2020 realizadas com convênio*/
SELECT c.id,p.nome AS paciente,m.nome AS medico,e.nome AS especialidades, data_hora, valor,cc.nome AS convenio, carteirinha_convenio, AVG(valor) AS valor_medio
FROM consultas c 
JOIN pacientes p ON c.paciente_id = p.id
JOIN medico m ON c.medico_id = m.id
JOIN especialidades e ON c.especialidade_id = e.id
JOIN convenios cc ON c.convenio_id = cc.id
WHERE YEAR(data_hora) = 2020 AND c.convenio_id IS NOT NULL
GROUP BY c.id;

/*Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta*/
SELECT * FROM internacao WHERE data_alta > data_prev_alta;

/*Receituário completo da primeira consulta registrada com receituário associado*/
SELECT * FROM receitas WHERE id = 1;

/*Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)*/
SELECT MAX(valor) FROM consultas WHERE convenio_id IS NULL;
SELECT * FROM consultas WHERE valor = 400.00 AND convenio_id IS NULL;

SELECT MIN(valor) FROM consultas WHERE convenio_id IS NULL;
SELECT * FROM consultas WHERE valor = 200.00 AND convenio_id IS NULL;

/*Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto 
e o número de dias entre a entrada e a alta*/
SELECT i.id, p.nome AS paciente, m.nome AS medico, i.procedimento, i.data_entrada, i.data_alta, t.descricao AS quarto, TIMESTAMPDIFF(DAY, i.data_entrada, i.data_alta) AS total_dias, t.valor_diaria,
t.valor_diaria * TIMESTAMPDIFF(DAY, i.data_entrada, i.data_alta) AS valor_total_internacao 
FROM internacao i 
JOIN pacientes p ON i.paciente_id = p.id
JOIN medico m ON i.medico_id = m.id
JOIN quarto q ON i.quarto_id = q.id
JOIN tipo_quarto t ON q.tipo_quarto_id = t.id
GROUP BY i.id;

/*Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”*/
SELECT i.data_entrada,i.procedimento, q.numero
FROM internacao i
JOIN quarto q ON i.quarto_id = q.id
JOIN tipo_quarto t ON q.tipo_quarto_id = t.id
WHERE t.id = 1
GROUP BY i.id;

/*Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta
 e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta*/
SELECT p.nome, c.data_hora, e.nome
FROM pacientes p 
JOIN consultas c ON c.paciente_id = c.id
JOIN especialidades e ON c.especialidade_id = e.id
WHERE TIMESTAMPDIFF(YEAR, c.data_hora, p.data_nascimento) < 18 AND e.nome != 'Pediatria';

/*Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, 
que tenham acontecido em “enfermaria”*/
SELECT p.nome AS paciente, m.nome AS medico, i.data_entrada AS data_internacao, i.procedimento
FROM internacao i
JOIN pacientes p ON i.paciente_id = p.id
JOIN medico m ON i.medico_id = m.id
JOIN medico_especialidades mm ON mm.medico_id = m.id
JOIN especialidades e ON mm.especialidades_id = e.id
JOIN quarto q ON i.quarto_id = q.id
JOIN tipo_quarto t ON q.tipo_quarto_id = t.id
WHERE e.nome = 'Gastroenterologia' AND t.id = 3;

/*Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou*/
SELECT m.nome,m.crm, COUNT(c.medico_id) AS quant_consultas
FROM consultas c
JOIN medico m ON c.medico_id = m.id
GROUP BY m.nome,m.crm;

/*Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação
 e os números de internações referentes a esses profissionais*/
SELECT e.nome, e.crm, COUNT(ie.internacao_id) AS num_internacoes 
FROM enfermeiro e
JOIN internacao_enfermeiro ie ON e.id = ie.enfermeiro_id
GROUP BY e.nome, e.crm
HAVING COUNT(ie.internacao_id) > 1;

/* TODOS OS DADOS DOS PACIENTES E, CASO POSSUAM, OS CONVENIOS QUE POSSUEM*/
SELECT p.nome,p.data_nascimento,p.endereco,p.telefone,p.email,p.cpf,p.rg,c.nome AS convenio
FROM pacientes p
JOIN convenios c ON p.convenio_id = c.id
GROUP BY p.id;

/*Separe cada uma das consultas por comentários que identifiquem o item solicitado.
 Inclua no script as cláusulas de INSERT,UPDATE eDELETE que possam ter sido necessárias aos testes:
 
 INSERT INTO consultas (data_hora, valor, carteirinha_convenio, medico_id, paciente_id, convenio_id, especialidade_id ) VALUES
("2020-07-10 10:00:00","200.00",null,1,10,null,4),
("2020-07-12 10:00:00","300.00",null,2,3,null,3),
("2020-07-10 09:00:00","300.00",null,3,2,null,3);*/
