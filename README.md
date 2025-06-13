Este repositório contém o projeto de um sistema de controle acadêmico, desenvolvido como parte da disciplina de Banco de Dados na Universidade Estadual da Paraíba (UEPB).

O projeto abrange um modelo relacional detalhado para gerenciar informações acadêmicas, incluindo entidades como:

* **Professor**: Detalhes do professor, como matrícula, CPF, nome, e-mail, área de atuação e carga horária semanal.
* **Disponibilidade Professor**: Gerencia a disponibilidade de cada professor por dia da semana e horários.
* **Telefone Professor**: Armazena múltiplos números de telefone para cada professor.
* **Formação Professor**: Registra a formação acadêmica dos professores.
* **Professor Leciona Disciplina**: Associa professores a turmas e disciplinas que lecionam.
* **Disciplina**: Informações sobre as disciplinas, incluindo código, tipo, ementa, nome e carga horária.
* **Pré-requisitos Disciplina**: Define os pré-requisitos para cada disciplina.
* **Sala Aloca Disciplina**: Aloca disciplinas a salas de aula em dias e horários específicos, considerando o período letivo.
* **Sala de Aula**: Informações sobre as salas de aula, como código, nome e capacidade máxima.
* **Disponibilidade Sala**: Gerencia a disponibilidade das salas de aula.
* **Local Sala**: Detalha a localização da sala (bloco, andar).
* **Recursos Sala**: Lista os recursos disponíveis em cada sala e suas quantidades.
* **Curso**: Informações básicas sobre os cursos (código, nome).
* **Disciplina Curso**: Associa disciplinas a cursos, incluindo número máximo e mínimo de vagas e semestre de oferta.
* **Aluno**: Detalhes do aluno, como matrícula, CPF, data de nascimento, nome, e-mail, curso matriculado, status da matrícula e projeto associado.
* **Telefone Aluno**: Armazena números de telefone para cada aluno.
* **Endereço Aluno**: Registra o endereço completo do aluno.
* **Aluno Matrícula Disciplina**: Gerencia a matrícula dos alunos em disciplinas, incluindo frequência, média final e situação.
* **Notas Aluno**: Armazena as notas detalhadas dos alunos por disciplina.
* **Aluno Projeto**: Associa alunos a projetos, com informações sobre função, carga horária, avaliação e atividades.
* **TCC (Trabalho de Conclusão de Curso)**: Informações sobre o TCC, incluindo tópicos como escrita, defesa, projeto e tema de pesquisa.
* **Aluno TCC**: Relaciona alunos e professores orientadores a um TCC, com notas e avaliações.
* **Projeto**: Detalhes gerais do projeto, como título, carga horária semanal, descrição, duração e área de atuação.
* **Projeto Extensão**: Informações específicas para projetos de extensão, como progresso e atividades realizadas.
* **Projeto Estágio**: Detalhes sobre projetos de estágio, incluindo a empresa ou organização.
* **Relatório Estágio**: Armazena os relatórios de estágio, tipo de relatório e avaliações de professor e empresa.

Este modelo relacional serve como base para a implementação de um banco de dados robusto e eficiente para a gestão acadêmica.
