use manicure_projeto;
-- =====================================================
--                   CONSULTAS SQL
-- Projeto: Sistema de Agendamento para Manicure Autônoma
-- Objetivo: Praticar consultas SQL do básico ao intermediário.
-- =====================================================

-- =====================================================
--                 CONSULTAS BÁSICAS
--        SELECT, DISTINCT, ORDER BY e LIMIT.
-- ===================================================== 

-- ----------------------------------------------------- --
-- Consulta 01
-- Exibe todos os clientes cadastrados.
-- ----------------------------------------------------- --
SELECT * FROM tb_clientes;

-- ----------------------------------------------------- --
-- Consulta 02
-- Exibe o nome e telefone dos clientes em ordem alfabética.
-- ----------------------------------------------------- --
SELECT nome AS Nome, telefone FROM tb_clientes ORDER BY nome;

-- ----------------------------------------------------- --
-- Consulta 03
-- Lista os serviços cadastrados, mostrando tipo, valor e
-- duração, ordenados do menor para o maior valor.
-- ----------------------------------------------------- --
SELECT tipo AS Servicos, valor AS Custo, duracao_min AS Duracao FROM tb_servicos ORDER BY valor, tipo;

-- ----------------------------------------------------- --
-- Consulta 04
-- Exibe as formas de pagamento utilizadas, sem repetir
-- valores.
-- ----------------------------------------------------- --
SELECT DISTINCT forma AS Forma_Pagamento FROM tb_pagamentos;

-- ----------------------------------------------------- --
-- Consulta 05
-- Exibe os cinco agendamentos mais recentes, considerando
-- a data e hora de início.
-- ----------------------------------------------------- --
SELECT id_agendamento, inicio, fim FROM tb_agendamentos ORDER BY inicio DESC LIMIT 5;

-- ===================================================== --
--              CONSULTAS COM FILTROS
--    WHERE, AND, OR, IN, BETWEEN, LIKE e IS NULL.
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 06
-- Exibe todos os clientes com o nome "Ana Luiza".
-- ----------------------------------------------------- --
SELECT nome, telefone FROM tb_clientes WHERE nome = 'Ana Luiza';

-- ----------------------------------------------------- --
-- Consulta 07
-- Exibe todos os serviços com valor superior a R$ 70,00.
-- ----------------------------------------------------- --
SELECT tipo, valor FROM tb_servicos WHERE valor > 70.00 ORDER BY valor DESC;

-- ----------------------------------------------------- --
-- Consulta 08
-- Lista os agendamentos com status "Concluído".
-- ----------------------------------------------------- --
SELECT id_agendamento, id_cliente, status_agendamento FROM tb_agendamentos WHERE status_agendamento = 'Concluído';

-- ----------------------------------------------------- --
-- Consulta 09
-- Exibe os pagamentos realizados nas formas "Pix" ou
-- "Crédito".
-- ----------------------------------------------------- --
SELECT id_pagamento, valor_pago, forma FROM tb_pagamentos WHERE forma = 'Pix' OR forma = 'Crédito';
 -- Pode se usar o forma IN('Pix', 'Crédito');

-- ----------------------------------------------------- --
-- Consulta 10
-- Lista os serviços com duração entre 45 e 90 minutos.
-- ----------------------------------------------------- --
SELECT tipo, duracao_min FROM tb_servicos WHERE duracao_min BETWEEN 45 AND 90;

-- ----------------------------------------------------- --
-- Consulta 11
-- Exibe os clientes cujo nome começa com a letra "M".
-- ----------------------------------------------------- --
SELECT nome, telefone FROM tb_clientes WHERE nome LIKE 'M%';
-- Pode se usar o LEFT(nome, 1) = 'M';

-- ----------------------------------------------------- --
-- Consulta 12
-- Lista os agendamentos que não possuem observações.
-- ----------------------------------------------------- --
SELECT id_agendamento, id_cliente, observacao FROM tb_agendamentos WHERE observacao IS NULL;

-- ===================================================== --
--             FUNÇÕES DE AGREGAÇÃO
--          COUNT, SUM, AVG, MAX e MIN.
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 13
-- Exibe a quantidade total de clientes cadastrados.
-- ----------------------------------------------------- --
SELECT COUNT(id_cliente) AS Clientes_Cadastrados FROM tb_clientes; 

-- ----------------------------------------------------- --
-- Consulta 14
-- Exibe o valor total arrecadado com os pagamentos
-- realizados.
-- ----------------------------------------------------- --
SELECT SUM(valor_pago) AS Total_Arrecadado from tb_pagamentos;

-- ----------------------------------------------------- --
-- Consulta 15
-- Exibe o valor médio dos serviços cadastrados.
-- ----------------------------------------------------- --
SELECT ROUND(AVG(valor), 2) AS Media_Servicos FROM tb_servicos;

-- ----------------------------------------------------- --
-- Consulta 16
-- Exibe o serviço de maior valor e o serviço de menor valor.
-- ----------------------------------------------------- --
SELECT tipo, valor FROM tb_servicos
WHERE valor = (
SELECT MAX(valor) FROM tb_servicos) 
OR valor = (SELECT MIN(valor) FROM tb_servicos);
 
-- ----------------------------------------------------- --
-- Consulta 17
-- Exibe a duração média dos serviços cadastrados.
-- ----------------------------------------------------- --
SELECT ROUND(AVG(duracao_min)) AS Duracao_Media FROM tb_servicos;

-- ===================================================== --
--             AGRUPAMENTO DE DADOS
--              GROUP BY e HAVING.
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 18
-- Exibe a quantidade de agendamentos por status.
-- ----------------------------------------------------- --
SELECT status_agendamento AS 'Status', COUNT(id_agendamento) AS Quantidade_Agendamentos FROM tb_agendamentos
GROUP BY status_agendamento;

-- ----------------------------------------------------- --
-- Consulta 19
-- Exibe a quantidade de pagamentos por forma de pagamento.
-- ----------------------------------------------------- --
SELECT forma AS Forma_Pagamento, COUNT(id_pagamento) AS Quantidade_Pagamentos FROM tb_pagamentos
GROUP BY forma;

-- ----------------------------------------------------- --
-- Consulta 20
-- Exibe o valor total arrecadado por forma de pagamento.
-- ----------------------------------------------------- --
SELECT forma AS Forma_Pagamento, SUM(valor_pago) AS Total_Arrecadado FROM tb_pagamentos
GROUP BY forma;

-- ----------------------------------------------------- --
-- Consulta 21
-- Exibe os serviços cuja média de valor seja superior a
-- R$ 60,00.
-- ----------------------------------------------------- --
SELECT tipo AS Servicos, ROUND(AVG(valor), 2)  AS Media_Valor FROM tb_servicos
GROUP BY tipo HAVING Media_Valor > 60 ORDER BY Media_Valor DESC;

-- ===================================================== --
--         CONSULTAS COM RELACIONAMENTOS
--      INNER JOIN, LEFT JOIN e RIGHT JOIN.
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 22
-- Exibe o nome do cliente, a data e hora do agendamento
-- e o status do atendimento.
-- ----------------------------------------------------- --
SELECT c.nome, inicio, fim, status_agendamento FROM tb_agendamentos a 
INNER JOIN tb_clientes c ON a.id_cliente = c.id_cliente;

-- ----------------------------------------------------- --
-- Consulta 23
-- Exibe o nome do cliente, o serviço realizado e o valor
-- do serviço.
-- ----------------------------------------------------- --
SELECT nome, tipo, valor_pago FROM tb_pagamentos p
 JOIN tb_agendamentos a ON p.id_agendamento = a.id_agendamento
 JOIN tb_clientes c ON a.id_cliente = c.id_cliente
 JOIN tb_servicos s ON a.id_servico = s.id_servico order by nome;

-- ----------------------------------------------------- --
-- Consulta 24
-- Exibe o nome do cliente, o serviço contratado, a forma
-- de pagamento e o valor pago.
-- ----------------------------------------------------- --
SELECT nome, tipo, forma, valor_pago FROM tb_pagamentos p
 JOIN tb_agendamentos a ON p.id_agendamento = a.id_agendamento
 JOIN tb_clientes c ON a.id_cliente = c.id_cliente
 JOIN tb_servicos s ON a.id_servico = s.id_servico order by nome;

-- ----------------------------------------------------- --
-- Consulta 25
-- Exibe todos os clientes, inclusive aqueles que não
-- possuem agendamentos.
-- Utilize LEFT JOIN.
-- ----------------------------------------------------- --
SELECT nome, id_agendamento FROM tb_clientes c
LEFT JOIN tb_agendamentos a 
ON c.id_cliente = a.id_cliente ORDER BY nome;

-- ----------------------------------------------------- --
-- Consulta 26
-- Exibe os agendamentos juntamente com seus pagamentos,
-- quando existirem.
-- Utilize LEFT JOIN.
-- ----------------------------------------------------- --
SELECT a.id_agendamento, id_pagamento FROM tb_agendamentos a
LEFT JOIN tb_pagamentos p
ON a.id_agendamento = p.id_agendamento;
  
-- ----------------------------------------------------- --
-- Consulta 27
-- Exibe o nome do cliente, o serviço realizado, a data do
-- atendimento e o valor pago, ordenando pela data.
-- ----------------------------------------------------- --
SELECT nome, tipo, inicio AS DataAtendimento, valor_pago FROM tb_pagamentos p
JOIN tb_agendamentos a ON p.id_agendamento = a.id_agendamento
JOIN tb_clientes c ON a.id_cliente = c.id_cliente
JOIN tb_servicos s ON a.id_servico = s.id_servico ORDER BY inicio;
 
-- ----------------------------------------------------- --
-- Consulta 28
-- Exibe a quantidade de agendamentos realizados por cada
-- cliente.
-- ----------------------------------------------------- --
SELECT nome, count(id_agendamento) AS Agendamentos FROM tb_agendamentos a
JOIN tb_clientes c ON a.id_cliente = c.id_cliente
GROUP BY nome ORDER BY Agendamentos DESC;

-- ===================================================== --
--              CONSULTAS COM CASE
--      Classificação e criação de condições.
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 29
-- Classifica os pagamentos como "Pago" ou "Em aberto"
-- com base no status do pagamento.
-- ----------------------------------------------------- --
SELECT id_pagamento,forma, valor_pago, CASE
WHEN status_pagamento = 'Pago'
THEN 'Pago'
ELSE 'Em aberto'
END AS Status_Pagamento
FROM tb_pagamentos;
-- Neste projeto, apenas atendimentos concluídos possuem registros
-- de pagamento, por isso todos os resultados são classificados como "Pago".

-- ----------------------------------------------------- --
-- Consulta 30
-- Classifica os serviços em "Econômico", "Intermediário"
-- ou "Premium", de acordo com o valor do serviço.
-- ----------------------------------------------------- --
SELECT tipo, valor, CASE
 WHEN valor <= 45.00
 THEN 'Econômico'
 WHEN valor <= 70.00
 THEN 'Intermediário'
 ELSE 'Premium'
 END AS ClassificacaoServicos
 FROM tb_servicos;

-- ----------------------------------------------------- --
-- Consulta 31
-- Exibe os agendamentos e cria uma coluna indicando se o
-- atendimento foi "Finalizado", "Pendente" ou "Cancelado".
-- ----------------------------------------------------- --
SELECT id_agendamento, CASE
WHEN status_agendamento = 'Concluído'
THEN 'Finalizado'
WHEN status_agendamento = 'Agendado' OR status_agendamento = 'Não compareceu'
THEN 'Pendente'
ELSE 'Cancelado'
END AS StatusAgendamento
FROM tb_agendamentos;
-- 'Pendente' para 'Não compareceu', pois o agendamento pode ser remarcado ou cancelado.

-- ===================================================== --
--             CONSULTAS COM CÁLCULOS
--    Operações matemáticas e colunas calculadas.
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 32
-- Exibe os serviços com um reajuste de 10% no valor.
-- Crie uma coluna com o valor reajustado.
-- ----------------------------------------------------- --
SELECT tipo, round(valor + (valor * 0.1), 2) AS ValorReajuste FROM tb_servicos;
-- Caso queira 10% de desconto troque o '+' por '-'.

-- ----------------------------------------------------- --
-- Consulta 33
-- Exibe os pagamentos realizados e calcula a diferença
-- entre o valor pago e R$ 100,00.
-- ----------------------------------------------------- --
SELECT id_pagamento, (valor_pago - 100.00) AS Diferenca FROM tb_pagamentos; 

-- ----------------------------------------------------- --
-- Consulta 34
-- Exibe os serviços informando o valor por minuto de
-- atendimento.
-- ----------------------------------------------------- --
SELECT tipo, duracao_min ,round((valor/duracao_min), 2) AS Valor_Minuto FROM tb_servicos;

-- ===================================================== --
--                 SUBCONSULTAS
-- Consultas aninhadas (Subqueries).
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 35
-- Exibe o serviço (tipo e valor) com o maior valor
-- cadastrado.
-- ----------------------------------------------------- --
SELECT tipo, valor FROM tb_servicos WHERE valor = (
SELECT MAX(valor) FROM tb_servicos);

-- ----------------------------------------------------- --
-- Consulta 36
-- Exibe os clientes que possuem pelo menos um agendamento.
-- ----------------------------------------------------- --
SELECT nome FROM tb_clientes WHERE id_cliente IN (
SELECT id_cliente FROM tb_agendamentos);

-- ----------------------------------------------------- --
-- Consulta 37
-- Exibe os serviços cujo valor é superior à média dos
-- valores de todos os serviços.
-- ----------------------------------------------------- --
SELECT tipo FROM tb_servicos WHERE valor > (
SELECT AVG(valor) FROM tb_servicos);

-- ----------------------------------------------------- --
-- Consulta 38
-- Exibe os agendamentos cujo valor do serviço seja igual
-- ou superior a R$ 80,00.
-- ----------------------------------------------------- --
SELECT id_agendamento, id_servico FROM tb_agendamentos WHERE id_servico IN (
SELECT id_servico FROM tb_servicos WHERE valor >= 80.00 );

-- ===================================================== --
--              CONSULTAS COM EXISTS
--     Verificação da existência de registros.
-- ===================================================== --

-- ----------------------------------------------------- --
-- Consulta 39
-- Exibe os clientes que possuem pelo menos um
-- agendamento.
-- ----------------------------------------------------- --
SELECT nome FROM tb_clientes c WHERE EXISTS (
SELECT 1 FROM tb_agendamentos a WHERE c.id_cliente = a.id_cliente);

-- ----------------------------------------------------- --
-- Consulta 40
-- Exibe os serviços que já foram utilizados em pelo
-- menos um agendamento.
-- ----------------------------------------------------- --
SELECT tipo FROM tb_servicos s WHERE EXISTS (
SELECT 1 FROM tb_agendamentos a WHERE s.id_servico = a.id_servico);

-- ===================================================== --
--          DESAFIOS DE NEGÓCIO (PROJETO)
--    Aplicação dos conceitos em cenários reais.
-- ===================================================== --
-- ----------------------------------------------------- --
-- Consulta 41
-- Exibe o cliente que realizou a maior quantidade de
-- agendamentos.
-- ----------------------------------------------------- --
SELECT nome, COUNT(id_agendamento) AS NumAgendamentos FROM tb_agendamentos a
JOIN tb_clientes c ON a.id_cliente = c.id_cliente
GROUP BY nome ORDER BY NumAgendamentos DESC LIMIT 1;

-- ----------------------------------------------------- --
-- Consulta 42
-- Exibe o serviço mais realizado e quantas vezes ele foi
-- agendado.
-- ----------------------------------------------------- --
SELECT tipo, COUNT(a.id_servico) AS Vezes_Agendado FROM tb_agendamentos a 
JOIN tb_servicos s ON a.id_servico = s.id_servico 
GROUP BY tipo ORDER BY Vezes_Agendado DESC LIMIT 1;

-- ----------------------------------------------------- --
-- Consulta 43
-- Exibe o faturamento total obtido por cada serviço.
-- Considere apenas pagamentos com status "Pago".
-- ----------------------------------------------------- --
SELECT s.tipo AS Servico, SUM(valor_pago) AS TotalServico FROM tb_pagamentos p 
JOIN tb_agendamentos a ON p.id_agendamento = a.id_agendamento
JOIN tb_servicos s ON a.id_servico = s.id_servico
WHERE status_pagamento = 'Pago' GROUP BY s.tipo ORDER BY TotalServico DESC;

-- ----------------------------------------------------- --
-- Consulta 44
-- Exibe a forma de pagamento mais utilizada pelos
-- clientes.
-- ----------------------------------------------------- --
SELECT forma AS FormaPagamento, COUNT(forma) AS Vezes_Utilizado FROM tb_pagamentos
GROUP BY forma ORDER BY Vezes_Utilizado DESC LIMIT 1;

-- ----------------------------------------------------- --
-- Consulta 45
-- Exibe o valor médio pago por atendimento concluído.
-- Considere apenas pagamentos realizados.
-- ----------------------------------------------------- --
SELECT ROUND(AVG(valor_pago),2) AS MediaConcluido FROM tb_pagamentos p
JOIN tb_agendamentos a ON p.id_agendamento = a.id_agendamento WHERE status_agendamento = 'Concluído';

-- ----------------------------------------------------- --
-- Consulta 46
-- Exibe os clientes que gastaram mais de R$ 200,00 no
-- total em atendimentos pagos.
-- ----------------------------------------------------- --
SELECT nome, SUM(valor_pago) AS Maior200 FROM tb_clientes c
JOIN tb_agendamentos a ON c.id_cliente = a.id_cliente
JOIN tb_pagamentos p ON a.id_agendamento = p.id_agendamento
GROUP BY nome HAVING SUM(valor_pago) > 200;
-- Podendo trocar 'nome' por 'id_cliente', em bancos reais é mais seguro agrupar pelo identificador.

-- ----------------------------------------------------- --
-- Consulta 47
-- Exibe os dias com maior número de agendamentos,
-- ordenando do maior para o menor movimento.
-- ----------------------------------------------------- --
SELECT DATE(inicio) AS Datas, COUNT(DATE(inicio)) AS DatasContadas FROM tb_agendamentos
GROUP BY Datas
ORDER BY DatasContadas DESC;

-- ----------------------------------------------------- --
-- Consulta 48
-- Exibe os três clientes que mais realizaram
-- agendamentos.
-- ----------------------------------------------------- --
SELECT nome AS Cliente, COUNT(id_agendamento) AS NumAgendamentos FROM tb_agendamentos a 
JOIN tb_clientes c ON a.id_cliente = c.id_cliente
GROUP BY nome ORDER BY NumAgendamentos DESC LIMIT 3;
