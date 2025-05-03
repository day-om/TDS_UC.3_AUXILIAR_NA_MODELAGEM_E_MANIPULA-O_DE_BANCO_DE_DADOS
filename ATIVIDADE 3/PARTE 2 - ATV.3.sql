/*Crie uma coluna “em atividade” com o tipo bit na tabela “médicos”, na qual o 0 (zero) representa o “não” e o 1 representa o “sim”. 
Crie o comando SQL para atualizar ao menos dois médicos com “não” e o restante com “sim”.*/

ALTER TABLE medico ADD em_atividade BIT(1);

UPDATE medico SET em_atividade = 0 WHERE id = 1;
UPDATE medico SET em_atividade = 0 WHERE id = 2;
UPDATE medico SET em_atividade = 1 WHERE id = 3;
UPDATE medico SET em_atividade = 1 WHERE id = 4;
UPDATE medico SET em_atividade = 1 WHERE id = 5;
UPDATE medico SET em_atividade = 1 WHERE id = 6;
UPDATE medico SET em_atividade = 1 WHERE id = 7;
UPDATE medico SET em_atividade = 1 WHERE id = 8;
UPDATE medico SET em_atividade = 1 WHERE id = 9;
UPDATE medico SET em_atividade = 1 WHERE id = 10;

/*Crie um comando SQL para atualizar as datas de alta nas internações em quartos de enfermaria para três dias após a entrada.*/
UPDATE internacao SET data_alta = data_entrada + 3 WHERE id = 1;
UPDATE internacao SET data_alta = data_entrada + 3 WHERE id = 3;
UPDATE internacao SET data_alta = data_entrada + 3 WHERE id = 4;
UPDATE internacao SET data_alta = data_entrada + 3 WHERE id = 7;

/*Crie comandos SQL para excluir o último convênio cadastrado. Note que também será necessáriaa exclusão das consultas relacionadas a esse convênio.*/
UPDATE consultas SET convenio_id = null WHERE convenio_id = 4;
UPDATE pacientes SET convenio_id = null WHERE convenio_id = 4;

/*EXCLUSÃO DO TIPO DE CONSULTA QUE ESTÃO COM O CONVÊNIO QUE FOI EXCLUÍDO*/
DELETE FROM convenios WHERE id = 4;

