CREATE DATABASE hospital_db_Dayanne;
USE hospital_db_Dayanne;

CREATE TABLE medico (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
data_nascimento DATE NOT NULL,
cpf VARCHAR(11) NOT NULL,
crm VARCHAR (10) NOT NULL,
uf_crm VARCHAR(5) NOT NULL,
telefone VARCHAR (15) NOT NULL,
endereco VARCHAR(45) NOT NULL
);

CREATE TABLE especialidades (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL
);

CREATE TABLE medico_especialidades (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
medico_id INT NOT NULL,
especialidades_id INT NOT NULL,
FOREIGN KEY (medico_id) REFERENCES medico (id),
FOREIGN KEY (especialidades_id) REFERENCES especialidades (id)
);

CREATE TABLE consultas (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_hora DATETIME NOT NULL,
valor DECIMAL(9,2) NOT NULL,
carteirinha_convenio VARCHAR(45),
medico_id INT NOT NULL,
paciente_id INT NOT NULL,
convenio_id INT,
especialidade_id INT NOT NULL,
FOREIGN KEY (medico_id) REFERENCES medico (id),
FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
FOREIGN KEY (convenio_id) REFERENCES convenios (id),
FOREIGN KEY (especialidade_id) REFERENCES especialidades (id)
);

CREATE TABLE pacientes (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45) NOT NULL,
data_nascimento DATE NOT NULL,
endereco VARCHAR (45) NOT NULL,
telefone VARCHAR (15) NOT NULL,
email VARCHAR (45) NOT NULL,
cpf VARCHAR (11) NOT NULL,
rg VARCHAR (15) NOT NULL
);
ALTER TABLE  pacientes ADD convenio_id INT;
ALTER TABLE pacientes ADD FOREIGN KEY (convenio_id) REFERENCES convenios (id);

CREATE TABLE medicamentos (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45) NOT NULL,
quantidade INT NOT NULL,
instrucoes VARCHAR (100) NOT NULL
);

CREATE TABLE receitas (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data DATE NOT NULL,
observacoes VARCHAR (200) NOT NULL
);
ALTER TABLE receitas ADD consulta_id INT;
ALTER TABLE receitas ADD FOREIGN KEY (consulta_id) REFERENCES consultas (id);

CREATE TABLE medicamentos_receitas (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE medicamentos_receitas ADD medicamentos_id INT;
ALTER TABLE medicamentos_receitas ADD receitas_id INT;
ALTER TABLE medicamentos_receitas ADD FOREIGN KEY  (medicamentos_id) REFERENCES medicamentos (id);
ALTER TABLE medicamentos_receitas ADD FOREIGN KEY  (receitas_id) REFERENCES receitas (id);

CREATE TABLE quarto (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero INT NOT NULL
);
ALTER TABLE quarto ADD tipo_quarto_id INT;
ALTER TABLE quarto ADD FOREIGN KEY  (tipo_quarto_id) REFERENCES tipo_quarto (id);

CREATE TABLE tipo_quarto (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR (45) NOT NULL,
valor_diaria DECIMAL (9,2) NOT  NULL
);

CREATE TABLE internacao (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_entrada DATE NOT NULL,
data_prev_alta DATE NOT NULL,
data_alta DATE NOT NULL,
procedimento VARCHAR(45) NOT NULL
);
ALTER TABLE internacao ADD medico_id INT;
ALTER TABLE internacao ADD paciente_id INT;
ALTER TABLE internacao ADD quarto_id INT;
ALTER TABLE internacao ADD FOREIGN KEY  (medico_id) REFERENCES medico (id);
ALTER TABLE internacao ADD FOREIGN KEY  (paciente_id) REFERENCES pacientes (id);
ALTER TABLE internacao ADD FOREIGN KEY  (quarto_id) REFERENCES quarto (id);

CREATE TABLE internacao_enfermeiro (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE internacao_enfermeiro ADD internacao_id INT;
ALTER TABLE internacao_enfermeiro ADD enfermeiro_id INT;
ALTER TABLE internacao_enfermeiro ADD FOREIGN KEY  (internacao_id) REFERENCES internacao (id);
ALTER TABLE internacao_enfermeiro ADD FOREIGN KEY  (enfermeiro_id) REFERENCES enfermeiro(id);

CREATE TABLE enfermeiro (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45) NOT NULL,
cpf VARCHAR (45) NOT NULL,
crm VARCHAR (45) NOT NULL
);

CREATE TABLE convenios (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45) NOT NULL,
cnpj VARCHAR (20) NOT NULL,
tempo_carencia INT NOT NULL
);





