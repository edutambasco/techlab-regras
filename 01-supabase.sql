-- =========================================================
-- TechLab Cursos: banco de dados da aula de Agentes com n8n
-- Rode no Supabase: SQL Editor -> New query -> Run
-- Pode rodar quantas vezes quiser (os drops limpam antes).
-- =========================================================

drop table if exists public.faq;
drop table if exists public.cursos;

create table public.cursos (
  id             bigint generated always as identity primary key,
  nome           text not null,
  area           text not null,            -- Dados, IA, Programação, Automação, Cloud
  nivel          text not null,            -- Iniciante, Intermediário, Avançado
  descricao      text not null,
  carga_horaria  integer not null,         -- em horas
  modalidade     text not null,            -- Online ao vivo, Gravado, Presencial
  preco          numeric(10,2) not null,
  parcelas_max   integer not null default 12,
  data_inicio    date,
  vagas          integer not null default 30,
  pre_requisitos text,
  ativo          boolean not null default true,
  criado_em      timestamptz not null default now()
);

create table public.faq (
  id        bigint generated always as identity primary key,
  categoria text not null,
  pergunta  text not null,
  resposta  text not null
);

insert into public.cursos
(nome, area, nivel, descricao, carga_horaria, modalidade, preco, parcelas_max, data_inicio, vagas, pre_requisitos, ativo)
values
('Python para Dados', 'Dados', 'Iniciante',
 'Aprenda Python do zero com foco em análise de dados usando Pandas e visualização.',
 40, 'Online ao vivo', 697.00, 12, current_date + 15, 25, 'Nenhum', true),
('SQL do Zero ao Avançado', 'Dados', 'Iniciante',
 'Consultas, joins, funções de janela e modelagem de dados na prática.',
 32, 'Gravado', 397.00, 10, null, 999, 'Nenhum', true),
('Power BI Profissional', 'Dados', 'Intermediário',
 'Dashboards, DAX e storytelling com dados para tomada de decisão.',
 36, 'Online ao vivo', 797.00, 12, current_date + 30, 20, 'Excel básico', true),
('IA Generativa para Negócios', 'IA', 'Iniciante',
 'Uso estratégico de ChatGPT, Claude e Gemini em processos de negócio, com engenharia de prompt.',
 24, 'Online ao vivo', 597.00, 12, current_date + 10, 30, 'Nenhum', true),
('Agentes de IA com n8n', 'Automação', 'Intermediário',
 'Construa agentes com memória, ferramentas e integrações reais usando n8n.',
 30, 'Online ao vivo', 897.00, 12, current_date + 20, 20, 'Lógica básica', true),
('Machine Learning na Prática', 'IA', 'Avançado',
 'Modelos supervisionados e não supervisionados com scikit-learn e projetos reais.',
 48, 'Online ao vivo', 1297.00, 12, current_date + 45, 15, 'Python para Dados', true),
('Automação com Python', 'Programação', 'Intermediário',
 'Automatize planilhas, e-mails, PDFs e sites com Python.',
 28, 'Gravado', 497.00, 10, null, 999, 'Python básico', true),
('Cloud AWS Fundamentos', 'Cloud', 'Iniciante',
 'Conceitos de nuvem e principais serviços da AWS, com preparação para a certificação Cloud Practitioner.',
 20, 'Gravado', 347.00, 6, null, 999, 'Nenhum', true),
('Excel Avançado (turma encerrada)', 'Dados', 'Intermediário',
 'Turma antiga, não deve aparecer para o agente.',
 20, 'Presencial', 297.00, 6, current_date - 60, 0, 'Excel básico', false);

insert into public.faq (categoria, pergunta, resposta) values
('Certificado', 'Os cursos têm certificado?',
 'Sim. Todos os cursos emitem certificado digital de conclusão para quem tiver no mínimo 75% de presença ou progresso.'),
('Pagamento', 'Quais são as formas de pagamento?',
 'Cartão de crédito em até 12x, PIX e boleto à vista.'),
('Reembolso', 'Posso pedir reembolso?',
 'Sim, em até 7 dias após a compra, conforme o Código de Defesa do Consumidor.'),
('Aulas', 'As aulas ao vivo ficam gravadas?',
 'Sim. Todas as aulas ao vivo ficam gravadas na plataforma por 12 meses.'),
('Aulas', 'Qual o horário das aulas ao vivo?',
 'As turmas ao vivo acontecem às terças e quintas, das 19h30 às 22h30.'),
('Acesso', 'Por quanto tempo tenho acesso ao curso gravado?',
 'O acesso aos cursos gravados é de 12 meses a partir da compra.'),
('Suporte', 'Como tiro dúvidas durante o curso?',
 'Pela comunidade exclusiva da turma e em plantões semanais com os monitores.');

-- Conferência rápida (rode depois do Run):
-- select nome, area, nivel, preco, modalidade, ativo from public.cursos order by area, preco;
-- select count(*) as cursos_ativos from public.cursos where ativo = true;  -- esperado: 8
