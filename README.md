### Atividade 1 

Contexto

Um pequeno hospital local quer desenvolver um novo sistema que atenda melhor às suas necessidades. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas espera-se que esses dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, é necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um diagrama entidade-relacionamento (DER).

Atividade

Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:

O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulários de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes também precisam de cadastro contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com as informações de data e hora de realização, médico responsável, nome do paciente, valor da consulta, nome do convênio e o número da carteira (se tiver convênio). Também é necessário indicar na consulta qual é a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso.Essas informações podem ser armazenadas em forma de um único texto.


Utilizando esses requisitos e a planilha presente em Conteúdo > Material complementarcomo complemento, crie um DER para esse projeto de banco de dados. Utilize a ferramenta MySQL Workbench para a criação desse diagrama.

Nomeie seu banco de dados no padrão “hospital_db_seu_nome”. Veja o exemplo a seguir: “hospital_db_fulano_de_tal” (por favor, não utilize esse nome, pois é apenas um exemplo).

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Atividade 2 

Contexto

Após a primeira versão do projeto de banco de dados para o sistema hospitalar, notou-se a necessidade de expansão das funcionalidades, incluindo alguns requisitos essenciais a essa versão do software. As funcionalidades em questão são para o controle na internação de pacientes. Será necessário expandir o modelo ER desenvolvido e montar o banco de dados, criando as tabelas para o início dos testes.


Atividade

Considere a seguinte descrição e o diagrama ER a seguir:

No hospital, as internações têm sido registradas por meio de formulários eletrônicos que gravam os dados em arquivos. Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados. As internações precisam ser vinculadas a quartos, com a numeração e o tipo. Cada tipo de quarto tem sua descrição e o seu valor diário (em princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).

Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).

A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.


O seguinte fragmento de diagrama ER modela esses novos requisitos:


Descrição da imagem: Diagrama ER mostrando entidade "Quarto" e atributos "id" (chave) e "numero". Abaixo está entidade "Tipo_quarto", com atributos "id" (chave), "descrição" e "valor_diaria". Ambas se ligam por relacionamento "possui", com cardinalidade N do lado de "Quarto", e 1 do lado de "Tipo_quarto". À direita está a entidade "Internacao", que tem atributos "id" (chave), "data_entrada", "data_prev_alta", "data_alta" e "procedimento", e está ligada à entidade "Quarto" pelo relacionamento "ocupa", com cardinalidade 1 do lado de "Quarto" e cardinalidade N do lado de "Internacao". Abaixo de internação há uma nota que diz: "Uma internação está associada a 1 paciente e a 1 médico". À direita, há a entidade "Enfermeiro", com atributos "Id" (chave), "nome", "cpf", "cre". Ela está ligada a "Internacao" por relacionamento "requer", com cardinalidade N em ambos os lados.

Figura – Diagrama ER

Fonte: Senac EAD (2023)

Realize os seguintes passos:

Faça a ligação desse diagrama ao diagrama desenvolvido na atividade 1, construindo relacionamentos com entidades relacionadas.
Crie um script SQL para a geração do banco de dados e para instruções de montagem de cada uma das entidades/tabelas presentes no diagrama completo (considerando as entidades do diagrama da atividade 1 e as novas entidades propostas no diagrama anterior). Também crie tabelas para relacionamentos quando necessário. Aplique colunas e chaves primárias e estrangeiras.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Atividade 3 

Contexto

Com o banco de dados para o sistema hospitalar completamente montado, é necessário incluir dados para realizar os devidos testes e validar sua viabilidade quanto a sistema. Nesta etapa, também é importante realizar a separação de alguns scripts iniciais para o banco, com os dados que serão necessários a um povoamento inicial do sistema.

Atividade

Parte 1

Crie o script de povoamento geral das tabelas desenvolvidas na atividade 2. Observe as seguintes regras:

Inclua ao menos dez médicos.
Inclua ao menos sete especialidades (considere que “entre as especialidades há pediatria, clínica geral, gastroenterologia e dermatologia”).
Inclua ao menos dez pacientes.
Inclua dez consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais do que uma consulta). As consultas devem ter ocorrido entre 01/01/2017 e 31/12/2022.
Inclua ao menos cinco consultas, que devem ter receituário com dois ou mais medicamentos.
Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas a convênios existentes.
Inclua ao menos três quartos.
Inclua ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. As internações devem ter ocorrido entre 01/01/2017 e 31/12/2022.
Considerando que, “em princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
Inclua dados de seis profissionais de enfermaria. Associe cada internação a pelo menos dois enfermeiros.
Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.
 

Crie um script para o povoamento básico (dos itens essenciais para a implantação do sistema).

Crie um script para o povoamento geral de dados (parte 1). Caso necessário, utilize sites geradores de CPF e de CNPJ para ajudar na definição de dados (pesquise “gerar CNPJ e CPF”na internet, poisvocê precisará disso para criar os CPFs dos pacientes/enfermeiros e CNPJ dos convênios). Utilize nomes significativos para as pessoas cadastradas. Aplique dados os mais próximos possíveis da realidade.

Parte 2

Realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão:

Crie uma coluna “em atividade” com o tipo bit na tabela “médicos”, na qual o 0 (zero) representa o “não” e o 1 representa o “sim”. Crie o comando SQL para atualizar ao menos dois médicos com “não” e o restante com “sim”.
Crie um comando SQL para atualizar as datas de alta nas internações em quartos de enfermaria para três dias após a entrada.
Crie comandos SQL para excluir o último convênio cadastrado. Note que também será necessáriaa exclusão das consultas relacionadas a esse convênio.
Crie um novo script com as operações em SQL solicitadas anteriormente (parte 2).

Entrega

No espaço dedicado à entrega da atividade, envie o arquivo compactado (RAR, ZIP ou 7z) com os seguintes scripts:

Script de criação do banco de dados desenvolvido na atividade 2
Script de povoamento básico (itens essenciais)
Script de povoamento geral (inserts) da parte 1
Script com os comandos SQL da parte 2
Observação:os scripts prontos devem estar estruturados de tal maneira que sua execução total – sem alterações – seja bem-sucedida, ou seja, ao clicar no botão de execução do script, ele rode sem apresentar erros no console de saída.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Atividade 4

Contexto

Uma vez que o banco esteja bem estruturado, é possível realizar testes, simulando relatórios ou telas que o sistema possa necessitar. A tarefa consiste em criar consultas que levem aos resultados esperados.

Atividade

Crie um script e nele inclua consultas que retornem:

Todos os dados e o valor médio das consultas do ano de 2020 realizadas semconvênio
Todos os dados e o valor médio das consultas do ano de 2020 realizadas porconvênio
Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
Receituário completo da primeira consulta registrada com receituário associado
Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)
Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta
Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta
Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou
Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação e os números de internações referentes a esses profissionais.
 

Inclua ainda uma consulta extra idealizada por você. No script, em bloco de comentário, escreva o que a consulta deve trazer como resultado e, em seguida, escreva em SQL essa consulta. É necessário que essa consulta envolva múltiplas tabelas.

Separe cada uma das consultas por comentários que identifiquem o item solicitado. Inclua no script as cláusulas de INSERT,UPDATE eDELETE que possam ter sido necessárias aos testes.

 

Observação 1: se necessário, inclua novos registros no banco de dados para testar adequadamente.

Observação 2: podem ser úteis as funções de data do MySQL, como DATEDIFF(data1, data2) para número de dias entre duas datas, CURDATE() ou NOW() para data atual, DATE(dataehora) para extrair a data de um “datetime”, YEAR(data) para o ano de uma data, TIMESTAMPDIFF(YEAR, data1, data2) para número de anos entre duas datas, entre outras. Consulte a documentação do MySQL (“Date and Time Functions”) para mais informações.

 

Entrega

No espaço dedicado à entrega da atividade, envie o arquivo .sql com as consultas formuladas.
