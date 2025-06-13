--CREATES DE TABELAS
CREATE TABLE IF NOT EXISTS professor(
	matricula INTEGER PRIMARY KEY,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	nome VARCHAR(50),
	email VARCHAR(50),
	area_atuacao VARCHAR(50),
	ch_semanal INTEGER
);

CREATE TABLE IF NOT EXISTS disponibilidade_professor(
	matricula_professor INTEGER,
	dia_da_semana VARCHAR(30),
	hora_inicio TIME,
	hora_fim TIME
);

CREATE TABLE IF NOT EXISTS telefone_professor(
	matricula_professor INTEGER,
	num_telefone VARCHAR(11),
	CONSTRAINT mat_telefone PRIMARY KEY (matricula_professor, num_telefone)
);

CREATE TABLE IF NOT EXISTS formacao_professor(
	matricula_professor INTEGER,
	formacao_academica VARCHAR(50),
	CONSTRAINT mat_formacao PRIMARY KEY (matricula_professor, formacao_academica)
);

CREATE TABLE IF NOT EXISTS disciplina(
	codigo INTEGER PRIMARY KEY,
	tipo VARCHAR(50),
	ementa TEXT,
	nome VARCHAR(50),
	carga_horaria INTEGER
);

CREATE TABLE IF NOT EXISTS professor_leciona_disciplina(
	cod_turma INTEGER,
	mat_professor INTEGER,
	cod_disciplina INTEGER,
	CONSTRAINT turma_disciplina_professor PRIMARY KEY (cod_disciplina, cod_turma, mat_professor)
);

CREATE TABLE IF NOT EXISTS prerequisitos_disciplina(
	cod_disciplina INTEGER,
	pre_requisito VARCHAR(50),
	CONSTRAINT prequisitos_disciplina PRIMARY KEY (cod_disciplina, pre_requisito)
);

CREATE TABLE IF NOT EXISTS sala_de_aula(
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(50),
	capacidade_maxima INTEGER
);

CREATE TABLE IF NOT EXISTS sala_aloca_disciplina(
	cod_disciplina INTEGER,
	cod_sala INTEGER,
	dia_da_semana VARCHAR(30),
	hora_inicio TIME,
	hora_fim TIME,
	periodo_letivo VARCHAR(15),
	CONSTRAINT conjunto_pk_sala_disciplina PRIMARY KEY (cod_disciplina, cod_sala, dia_da_semana, hora_inicio, hora_fim, periodo_letivo)
);

CREATE TABLE IF NOT EXISTS disponibilidade_sala(
	cod_sala INTEGER,
	dia_da_semana VARCHAR(30),
	hora_inicio TIME,
	hora_fim TIME,
	CONSTRAINT conjunto_pk_disponibilidade_sala PRIMARY KEY (cod_sala, dia_da_semana, hora_inicio, hora_fim)
);

CREATE TABLE IF NOT EXISTS local_sala(
	cod_sala INTEGER PRIMARY KEY,
	bloco VARCHAR(1),
	andar VARCHAR(1)
);

CREATE TABLE IF NOT EXISTS recursos_sala(
	cod_sala INTEGER,
	recurso VARCHAR(30),
	quantidade_recurso INTEGER,
	CONSTRAINT conjunto_pk_recursos_sala PRIMARY KEY (cod_sala, recurso)
);

CREATE TABLE IF NOT EXISTS curso(
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS disciplina_curso(
	cod_disciplina INTEGER,
	cod_curso INTEGER,
	max_vagas INTEGER,
	min_vagas INTEGER,
	semestre_oferecida INTEGER,
	CONSTRAINT conjunto_pk_disciplina_curso PRIMARY KEY (cod_disciplina, cod_curso)
);

CREATE TABLE IF NOT EXISTS aluno(
	matricula INTEGER PRIMARY KEY,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	data_nascimento VARCHAR(30),
	nome VARCHAR(50),
	email VARCHAR(50),
	curso_matriculado VARCHAR(50),
	status_matricula VARCHAR(20),
	cod_projeto INTEGER 
);

CREATE TABLE IF NOT EXISTS telefone_aluno(
	mat_aluno INTEGER,
	num_telefone VARCHAR(11),
	CONSTRAINT conjunto_pk_telefone_aluno PRIMARY KEY (mat_aluno, num_telefone)
);

CREATE TABLE IF NOT EXISTS endereco_aluno(
	mat_aluno INTEGER,
	rua VARCHAR(50),
	bairro VARCHAR(50),
	complemento VARCHAR(50),
	cep VARCHAR(8),
	numero INTEGER,
	CONSTRAINT conjunto_pk_endereco_aluno PRIMARY KEY (mat_aluno, numero)
);

CREATE TABLE IF NOT EXISTS notas_aluno(
	mat_aluno INTEGER,
	cod_disciplina INTEGER,
	nota1_1 NUMERIC(4,2),
	nota1_2 NUMERIC(4,2),
	nota2_1 NUMERIC(4,2),
	nota2_2 NUMERIC(4,2),
	CONSTRAINT conjunto_pk_notas_aluno PRIMARY KEY (mat_aluno, cod_disciplina)
);

CREATE TABLE IF NOT EXISTS aluno_matricula_disciplina(
	cod_disciplina INTEGER,
	mat_aluno INTEGER,
	periodo_letivo VARCHAR(15),
	frequencia_aluno INTEGER,
	--media final NUMERIC(2,2) #será uma view e sera calculada, por ser uma tributo derivativo--
	--situacao_aluno VARCHAR(20) #será definido com base no valor da media final--
	CONSTRAINT conjunto_pk_aluno_disciplina PRIMARY KEY (cod_disciplina, mat_aluno)
);

CREATE TABLE IF NOT EXISTS projeto(
	codigo INTEGER PRIMARY KEY,
	titulo VARCHAR(50),
	ch_semanal INTEGER,
	descricao TEXT,
	duracao DATE,
	area_atuacao VARCHAR(50),
	mat_professor INTEGER
);

CREATE TABLE IF NOT EXISTS aluno_projeto(
	cod_projeto INTEGER,
	mat_aluno INTEGER,
	funcao_projeto VARCHAR(50),
	ch_aluno INTEGER,
	avaliacao_aluno TEXT,
	atividade_aluno TEXT,
	CONSTRAINT pk_aluno_projeto PRIMARY KEY (mat_aluno, cod_projeto)
);
 
CREATE TABLE IF NOT EXISTS tcc(
	codigo INTEGER PRIMARY KEY,
	escrita TEXT,
	defesa TEXT,
	projeto TEXT,
	desenvolvimento TEXT,
	tema_pesquisa VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS aluno_tcc(
	mat_professor INTEGER,
	cod_tcc INTEGER,
	mat_aluno INTEGER,
	nota NUMERIC(4,2),
	avaliacao TEXT,
	CONSTRAINT conjunto_pk_aluno_tcc PRIMARY KEY (mat_professor, cod_tcc, mat_aluno)
);

CREATE TABLE IF NOT EXISTS projeto_extensao(
	cod_projeto INTEGER PRIMARY KEY,
	progresso VARCHAR(50),
	atividades_realizadas TEXT
);

CREATE TABLE IF NOT EXISTS projeto_estagio(
	cod_projeto INTEGER PRIMARY KEY,
	empresa_org VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS relatorio_estagio(
	cod_projeto INTEGER,
	relatorio TEXT,
	tipo_relatorio VARCHAR(50),
	avalicao_professor TEXT,
	avalaicao_empresa TEXT,
	CONSTRAINT conjunto_pk_relatorio_estagio PRIMARY KEY (cod_projeto, relatorio)
);

--ALTERS para incluir chaves estrangeiras

ALTER TABLE disponibilidade_professor ADD CONSTRAINT fk_prof_disp FOREIGN KEY (matricula_professor) REFERENCES professor(matricula);

ALTER TABLE telefone_professor ADD CONSTRAINT fk_tel_prof FOREIGN KEY (matricula_professor) REFERENCES professor(matricula);

ALTER TABLE formacao_professor ADD CONSTRAINT fk_prof_formacao FOREIGN KEY (matricula_professor) REFERENCES professor(matricula);

ALTER TABLE professor_leciona_disciplina ADD CONSTRAINT fk_prof_disc FOREIGN KEY (mat_professor) REFERENCES professor(matricula);

ALTER TABLE professor_leciona_disciplina ADD CONSTRAINT fk_disc_prof FOREIGN KEY (cod_disciplina) REFERENCES disciplina(codigo);

ALTER TABLE prerequisitos_disciplina ADD CONSTRAINT fk_disc_prereq FOREIGN KEY (cod_disciplina) REFERENCES disciplina(codigo);

ALTER TABLE sala_aloca_disciplina ADD CONSTRAINT fk_disc_sala FOREIGN KEY (cod_disciplina) REFERENCES disciplina(codigo);

ALTER TABLE sala_aloca_disciplina ADD CONSTRAINT fk_sala_disc FOREIGN KEY (cod_sala) REFERENCES sala_de_aula(codigo);

ALTER TABLE disponibilidade_sala ADD CONSTRAINT fk_sala_disp FOREIGN KEY (cod_sala) REFERENCES sala_de_aula(codigo);

ALTER TABLE local_sala ADD CONSTRAINT fk_sala_local FOREIGN KEY (cod_sala) REFERENCES sala_de_aula(codigo);

ALTER TABLE recursos_sala ADD CONSTRAINT fk_sala_recurso FOREIGN KEY (cod_sala) REFERENCES sala_de_aula(codigo);

ALTER TABLE disciplina_curso ADD CONSTRAINT fk_disc_curso FOREIGN KEY (cod_disciplina) REFERENCES disciplina(codigo);

ALTER TABLE disciplina_curso ADD CONSTRAINT fk_curso_disc FOREIGN KEY (cod_curso) REFERENCES curso(codigo);

ALTER TABLE aluno ADD CONSTRAINT fk_projeto_aluno FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo);

ALTER TABLE telefone_aluno ADD CONSTRAINT fk_tel_aluno FOREIGN KEY (mat_aluno) REFERENCES aluno(matricula);

ALTER TABLE endereco_aluno ADD CONSTRAINT fk_end_aluno FOREIGN KEY (mat_aluno) REFERENCES aluno(matricula);

ALTER TABLE notas_aluno ADD CONSTRAINT fk_aluno_notas FOREIGN KEY (mat_aluno) REFERENCES aluno(matricula);

ALTER TABLE notas_aluno ADD CONSTRAINT fk_disc_notas FOREIGN KEY (cod_disciplina) REFERENCES disciplina(codigo);

ALTER TABLE aluno_matricula_disciplina ADD CONSTRAINT fk_disc_mat FOREIGN KEY (cod_disciplina) REFERENCES disciplina(codigo);

ALTER TABLE aluno_matricula_disciplina ADD CONSTRAINT fk_aluno_mat FOREIGN KEY (mat_aluno) REFERENCES aluno(matricula);

ALTER TABLE projeto ADD  CONSTRAINT fk_prof_projeto FOREIGN KEY (mat_professor) REFERENCES professor(matricula);

ALTER TABLE aluno_tcc ADD  CONSTRAINT fk_aluno_tcc FOREIGN KEY (mat_aluno) REFERENCES aluno(matricula);

ALTER TABLE aluno_tcc ADD CONSTRAINT fk_tcc_aluno FOREIGN KEY (cod_tcc) REFERENCES tcc(codigo);

ALTER TABLE aluno_tcc ADD  CONSTRAINT fk_prof_tcc FOREIGN KEY (mat_professor) REFERENCES professor(matricula);

ALTER TABLE projeto_extensao ADD CONSTRAINT fk_proj_ext FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo);

ALTER TABLE projeto_estagio ADD CONSTRAINT fk_proj_est FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo);

ALTER TABLE relatorio_estagio ADD CONSTRAINT fk_rel_estagio FOREIGN KEY (cod_projeto) REFERENCES projeto_estagio(cod_projeto);

ALTER TABLE aluno_projeto ADD CONSTRAINT fk_mat_aluno FOREIGN KEY (mat_aluno) REFERENCES aluno(matricula);

ALTER TABLE aluno_projeto ADD CONSTRAINT fk_cod_projeto FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo);
