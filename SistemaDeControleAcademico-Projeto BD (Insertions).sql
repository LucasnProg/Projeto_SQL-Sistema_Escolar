--INSERÇÕES EM TODAS AS TABELAS

INSERT INTO Professor VALUES (1, '12345678901', 'Lucas Silva', 'lucas@uepb.edu.br', 'Computação', 20);
INSERT INTO Professor VALUES (2, '23456789012', 'Manoel Lima', 'manoel@uepb.edu.br', 'Computação', 20);
INSERT INTO Professor VALUES (3, '34567890123', 'Miguel Souza', 'miguel@uepb.edu.br', 'Computação', 16);

INSERT INTO disponibilidade_professor VALUES (1, 'Segunda', '08:00', '12:00');
INSERT INTO disponibilidade_professor VALUES (2, 'Terça', '14:00', '18:00');
INSERT INTO disponibilidade_professor VALUES (3, 'Quarta', '10:00', '12:00');

INSERT INTO telefone_professor VALUES (1, '83999990001');
INSERT INTO telefone_professor VALUES (2, '83999990002');
INSERT INTO telefone_professor VALUES (3, '83999990003');

INSERT INTO formacao_professor VALUES (1, 'Doutorado em IA');
INSERT INTO formacao_professor VALUES (2, 'Mestrado em BD');
INSERT INTO formacao_professor VALUES (3, 'Especialização em Redes');

INSERT INTO disciplina VALUES (101, 'Obrigatória', 'Ementa IA', 'Introdução à IA', 60);
INSERT INTO disciplina VALUES (102, 'Optativa', 'Ementa BD', 'Modelagem de Dados', 60);
INSERT INTO disciplina VALUES (103, 'Obrigatória', 'Ementa Redes', 'Fundamentos de Redes', 60);

INSERT INTO professor_leciona_disciplina VALUES (1, 1, 101);
INSERT INTO professor_leciona_disciplina VALUES (2, 2, 102);
INSERT INTO professor_leciona_disciplina VALUES (3, 3, 103);

INSERT INTO prerequisitos_disciplina VALUES (101, 103);

INSERT INTO sala_de_aula VALUES (1, 'Sala 101', 40);
INSERT INTO sala_de_aula VALUES (2, 'Sala 102', 30);
INSERT INTO sala_de_aula VALUES (3, 'Sala 103', 35);

INSERT INTO sala_aloca_disciplina VALUES (101, 1, 'Segunda', '08:00', '10:00', '2024.1');
INSERT INTO sala_aloca_disciplina VALUES (102, 2, 'Terça','10:00', '12:00', '2024.1');

INSERT INTO disponibilidade_sala VALUES (1, 'Segunda', '08:00', '12:00');
INSERT INTO disponibilidade_sala VALUES (2, 'Terça', '10:00', '12:00');

INSERT INTO local_sala VALUES (1, 'A', 1);
INSERT INTO local_sala VALUES (2, 'B', 2);

INSERT INTO recursos_sala VALUES (1, 'Projetor', 1);
INSERT INTO recursos_sala VALUES (2, 'Quadro Branco', 1);

INSERT INTO curso VALUES (10, 'Ciência da Computação');
INSERT INTO curso VALUES (11, 'Sistemas de Informação');

INSERT INTO aluno VALUES (1001, '78945612301', '2000-01-01', 'Mateus Andrade', 'mateus@aluno.uepb.edu.br', 10, 'Matriculado');
INSERT INTO aluno VALUES (1002, '65432178902', '1999-05-10', 'Levi Costa', 'levi@aluno.uepb.edu.br', 11, 'Matriculado');

INSERT INTO aluno_matricula_disciplina VALUES (101, 1001, '2024.1', 0);
INSERT INTO aluno_matricula_disciplina VALUES (102, 1001, '2024.1', 0);

INSERT INTO telefone_aluno VALUES (1001, '83988880001');
INSERT INTO telefone_aluno VALUES (1002, '83988880002');

INSERT INTO endereco_aluno VALUES (1001, 'Rua A', 'Centro', 'Apto 1', '58000000', 10);
INSERT INTO endereco_aluno VALUES (1002, 'Rua B', 'Bairro B', 'Casa', '58000001', 20);

INSERT INTO notas_aluno VALUES (1001, 101, 8.0, 9.0, 7.5, 9.5);
INSERT INTO notas_aluno VALUES (1002, 102, 9.0, 8.5, 9.5, 9.0);

INSERT INTO projeto VALUES (500, 'Projeto IA', 10, 'Estudo de algoritmos', '2025-05-24', 'IA', 1);
INSERT INTO projeto VALUES (501, 'Projeto BD', 8, 'Estudo de SGBDs', '2025-05-24', 'Banco de Dados', 2);

INSERT INTO aluno_projeto VALUES (500, 1001, 'Desenvolvedor', 10, 'texto de avaliação', 'Implementação de protótipo');
INSERT INTO aluno_projeto VALUES (501, 1002, 'Analista', 8, 'texto de avaliação', 'Modelagem de dados');

INSERT INTO tcc VALUES (300, '', '', '', '', 'IA na Saúde');

INSERT INTO aluno_tcc VALUES (1, 300, 1001,10,'Texto de avaliacao');

INSERT INTO projeto_extensao VALUES (500, 'Em andamento', 'Oficinas realizadas');

INSERT INTO projeto_estagio VALUES (501, 'Tech Solutions');

INSERT INTO relatorio_estagio VALUES (501, 'Relatório Final', 'Final', 'texto de avaliação', 'texto de avaliação');
