-- ===================================================== --
--                 VIEWS PARA O POWER BI
-- ===================================================== --
use manicure_projeto;
-- VIEW 1 - GERAL --
CREATE VIEW vw_geral AS 
SELECT a.id_agendamento,
DATE(a.inicio) AS Data,
TIME(a.inicio) AS Horario,
c.nome AS Cliente,
s.tipo AS Servico,
s.valor AS Valor_Servico,
s.duracao_min AS Duracao_Minutos,
a.status_agendamento,
p.forma AS Forma_Pagamento,
p.valor_pago,
p.status_pagamento
FROM tb_agendamentos a
JOIN tb_clientes c on a.id_cliente = c.id_cliente
JOIN tb_servicos s on a.id_servico = s.id_servico
LEFT JOIN tb_pagamentos p on a.id_agendamento = p.id_agendamento;

-- VIEW 2 - SERVIÇOS --

CREATE VIEW vw_servicos AS 
SELECT s.id_servico,
s.tipo AS Servico,
s.valor AS Valor_Servico,
s.duracao_min AS Duracao_Minutos,
COUNT(a.id_agendamento) AS Quantidade_Agendamentos,
COALESCE(SUM(p.valor_pago), 0) AS Faturamento
FROM tb_servicos s
LEFT JOIN tb_agendamentos a ON s.id_servico = a.id_servico
LEFT JOIN tb_pagamentos p ON a.id_agendamento = p.id_agendamento
GROUP BY
s.id_servico,
s.tipo,
s.valor,
s.duracao_min;

-- VIEW 3 - CLIENTES --

CREATE VIEW vw_clientes AS
SELECT c.id_cliente,
c.nome AS Cliente,
c.telefone,
COUNT(a.id_agendamento) AS Quantidade_Agendamentos,
COALESCE(SUM(p.valor_pago), 0) AS Total_Gasto,
COALESCE(ROUND(AVG(p.valor_pago), 2), 0) AS Ticket_Medio
FROM tb_clientes c
LEFT JOIN tb_agendamentos a ON c.id_cliente = a.id_cliente
LEFT JOIN tb_pagamentos p ON a.id_agendamento = p.id_agendamento
GROUP BY
c.id_cliente,
c.nome,
c.telefone; 

-- VIEW 4 - AGENDA -- 

CREATE VIEW vw_agenda AS
SELECT DATE(inicio) AS Data,
COUNT(id_agendamento) AS Quantidade_Agendamentos,
SUM(CASE WHEN status_agendamento = 'Concluído'
THEN 1
ELSE 0
END) AS Concluídos,

SUM(CASE WHEN status_agendamento = 'Agendado'
THEN 1
ELSE 0
END) AS Agendados,

SUM(CASE WHEN status_agendamento = 'Cancelado'
THEN 1
ELSE 0
END) AS Cancelados,

SUM(CASE WHEN status_agendamento = 'Não compareceu'
THEN 1
ELSE 0
END) AS Nao_Compareceram
FROM tb_agendamentos
GROUP BY DATE(inicio);