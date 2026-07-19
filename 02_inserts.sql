use manicure_projeto;

-- =====================================================
--             Inserção de clientes
-- id_cliente e data_cadastro são preenchidos automaticamente
-- =====================================================
insert into tb_clientes (nome, telefone) values
('Beatriz Costa', '(21)9999-99999'),
('Marcia Oliveira','21988888888'),
('Ana Luiza', '(21)9777-77777'),
('Maria Clara', '219666-66666'),
('Pietra Carvalho', '021955555555'),
('Elizabete Ferreira', '(21)9444-4444'),
('Merida R.', '(11)9333-33333'),
('Paola C.', '219222-22222'),
('Eduarda Melo', '(12)9111-11111'),
('Helena Marques','(21)9000-00000');

-- ===================================================== 
--              Inserção de serviços
-- id_servico é preenchido automaticamente (PRIMARY KEY).
-- ===================================================== 

INSERT INTO tb_servicos (tipo, valor, duracao_min) VALUES
('Manicure Simples', 35.00, 40),
('Pedicure', 45.00, 45),
('Manicure + Pedicure', 70.00, 90),
('Esmaltação em Gel', 65.00, 45),
('Blindagem de Unhas', 85.00, 60),
('Banho de Gel', 90.00, 80),
('Alongamento em Gel', 100.00, 100),
('Manutenção de Alongamento', 85.00, 60);

-- ===================================================== 
--            Inserção de agendamentos
-- id_agendamento é preenchido automaticamente (PRIMARY KEY).
-- Relaciona clientes aos serviços, datas e horários.
-- ===================================================== 

-- =====================================================
--            Agendamentos - Semana 1
--         Período: 05/01/2026 a 10/01/2026
-- Segunda a sexta: 08:00 às 18:00
-- Sábado: 08:00 às 13:00
-- Domingo: Fechado
-- =====================================================

INSERT INTO tb_agendamentos (id_cliente, id_servico, inicio, fim, status_agendamento, observacao) VALUES
-- Segunda - 05/01
(1, 1, '2026-01-05 08:00:00', '2026-01-05 08:40:00', 'Concluído', 'Primeiro atendimento'),
(2, 2, '2026-01-05 08:50:00', '2026-01-05 09:35:00', 'Concluído', NULL),
(3, 4, '2026-01-05 09:45:00', '2026-01-05 10:30:00', 'Concluído', 'Cliente escolheu esmaltação vermelha'),
(4, 3, '2026-01-05 10:40:00', '2026-01-05 12:10:00', 'Concluído', NULL),
(5, 7, '2026-01-05 13:00:00', '2026-01-05 14:40:00', 'Concluído', 'Primeiro alongamento'),
(6, 1, '2026-01-05 14:50:00', '2026-01-05 15:30:00', 'Cancelado', 'Cliente avisou imprevisto'),
-- Terça - 06/01
(7, 5, '2026-01-06 08:00:00', '2026-01-06 09:00:00', 'Concluído', NULL),
(8, 2, '2026-01-06 09:10:00', '2026-01-06 09:55:00', 'Concluído', NULL),
(9, 6, '2026-01-06 10:05:00', '2026-01-06 11:25:00', 'Não compareceu', 'Não respondeu às mensagens'),
-- Sábado - 10/01
(10, 8, '2026-01-10 08:00:00', '2026-01-10 09:00:00', 'Concluído', 'Primeira manutenção'),

-- =====================================================
-- Agendamentos - Semana 2
-- Período: 12/01/2026 a 17/01/2026
-- =====================================================
-- Segunda 12/01
(1, 2, '2026-01-12 08:00:00', '2026-01-12 08:45:00', 'Concluído', NULL),
(3, 1, '2026-01-12 08:55:00', '2026-01-12 09:35:00', 'Concluído', NULL),
(5, 5, '2026-01-12 09:45:00', '2026-01-12 10:45:00', 'Concluído', 'Cliente solicitou blindagem'),
(7, 3, '2026-01-12 10:55:00', '2026-01-12 12:25:00', 'Concluído', NULL),
(2, 4, '2026-01-12 13:00:00', '2026-01-12 13:45:00', 'Concluído', NULL),
(9, 7, '2026-01-12 13:55:00', '2026-01-12 15:35:00', 'Concluído', 'Alongamento para evento'),
-- Terça 13/01
(4, 2, '2026-01-13 08:00:00', '2026-01-13 08:45:00', 'Concluído', NULL),
(6, 6, '2026-01-13 08:55:00', '2026-01-13 10:15:00', 'Cancelado', 'Remarcou para outra semana'),
(8, 1, '2026-01-13 10:25:00', '2026-01-13 11:05:00', 'Concluído', NULL),
-- Sábado 17/01
(10, 3, '2026-01-17 09:00:00', '2026-01-17 10:30:00', 'Concluído', NULL),

-- =====================================================
--            Agendamentos - Semana 3
--        Período: 19/01/2026 a 24/01/2026
-- =====================================================
-- Segunda - 19/01
(2, 1, '2026-01-19 08:00:00', '2026-01-19 08:40:00', 'Concluído', NULL),
(5, 3, '2026-01-19 08:50:00', '2026-01-19 10:20:00', 'Concluído', 'Cliente aproveitou promoção'),
(1, 5, '2026-01-19 10:30:00', '2026-01-19 11:30:00', 'Concluído', NULL),
(8, 2, '2026-01-19 13:00:00', '2026-01-19 13:45:00', 'Concluído', NULL),
(10, 4, '2026-01-19 13:55:00', '2026-01-19 14:40:00', 'Concluído', 'Escolheu esmaltação nude'),
-- Terça 20/01
(3, 8, '2026-01-20 08:00:00', '2026-01-20 09:00:00', 'Concluído', 'Retorno da manutenção'),
(6, 7, '2026-01-20 09:10:00', '2026-01-20 10:50:00', 'Não compareceu', 'Não confirmou presença'),
(9, 1, '2026-01-20 11:00:00', '2026-01-20 11:40:00', 'Concluído', NULL),
-- Sábado 24/01
(4, 2, '2026-01-24 08:00:00', '2026-01-24 08:45:00', 'Concluído', NULL),
(7, 6, '2026-01-24 08:55:00', '2026-01-24 10:15:00', 'Concluído', NULL),

-- =====================================================
--           Agendamentos - Semana 4
--       Período: 26/01/2026 a 31/01/2026
-- =====================================================
-- Segunda - 26/01
(1, 3, '2026-01-26 08:00:00', '2026-01-26 09:30:00', 'Concluído', NULL),
(5, 1, '2026-01-26 09:40:00', '2026-01-26 10:20:00', 'Concluído', NULL),
(8, 5, '2026-01-26 10:30:00', '2026-01-26 11:30:00', 'Concluído', 'Blindagem para viagem'),
(2, 2, '2026-01-26 13:00:00', '2026-01-26 13:45:00', 'Concluído', NULL),
(10, 7, '2026-01-26 13:55:00', '2026-01-26 15:35:00', DEFAULT, 'Primeiro alongamento do mês'),
-- Terça - 27/01
(6, 4, '2026-01-27 08:00:00', '2026-01-27 08:45:00', 'Concluído', NULL),
(3, 8, '2026-01-27 08:55:00', '2026-01-27 09:55:00', DEFAULT, 'Retorno agendado'),
(9, 2, '2026-01-27 10:05:00', '2026-01-27 10:50:00', 'Concluído', NULL),
-- Sábado - 31/01
(4, 6, '2026-01-31 08:00:00', '2026-01-31 09:20:00', 'Concluído', NULL),
(7, 3, '2026-01-31 09:30:00', '2026-01-31 11:00:00', DEFAULT, NULL);


-- =====================================================
--             Inserção de pagamentos
-- id_pagamento é preenchido automaticamente (PRIMARY KEY).
-- Cada pagamento está vinculado a um agendamento.
-- ===================================================== 

insert into tb_pagamentos (id_agendamento, forma, valor_pago, status_pagamento) values
-- =====================================================
--               Pagamentos - Semana 1
-- Referente aos agendamentos da semana de 05/01/2026 a 10/01/2026
-- Apenas agendamentos concluídos possuem pagamento.
-- =====================================================
(1, 'Pix', 35, 'Pago'),
(2, 'Débito', 45.00, 'Pago'),
(3, 'Crédito', 65.00, 'Pago'),
(4, 'Pix', 70.00, 'Pago'),
(5, 'Pix', 100.00, 'Pago'),
(7, 'Dinheiro', 85.00, 'Pago'),
(8, 'Pix', 45.00, 'Pago'),
(10, 'Crédito', 85.00, 'Pago'),

-- =====================================================
--                Pagamentos - Semana 2
-- Referente aos agendamentos da semana de 12/01/2026 a 17/01/2026
-- Apenas agendamentos concluídos possuem pagamento.
-- =====================================================
(11, 'Pix', 45.00, 'Pago'),
(12, 'Débito', 35.00, 'Pago'),
(13, 'Pix', 85.00, 'Pago'),
(14, 'Crédito', 70.00, 'Pago'),
(15, 'Pix', 65.00, 'Pago'),
(16, 'Crédito', 100.00, 'Pago'),
(17, 'Dinheiro', 45.00, 'Pago'),
(19, 'Pix', 35.00, 'Pago'),
(20, 'Débito', 70.00, 'Pago'),

-- =====================================================
--                 Pagamentos - Semana 3
-- Referente aos agendamentos da semana de 19/01/2026 a 24/01/2026
-- Apenas agendamentos concluídos possuem pagamento.
-- =====================================================
(21, 'Pix', 35.00, 'Pago'),
(22, 'Crédito', 70.00, 'Pago'),
(23, 'Pix', 85.00, 'Pago'),
(24, 'Débito', 45.00, 'Pago'),
(25, 'Pix', 65.00, 'Pago'),
(26, 'Crédito', 85.00, 'Pago'),
(28, 'Dinheiro', 35.00, 'Pago'),
(29, 'Pix', 45.00, 'Pago'),
(30, 'Débito', 90.00, 'Pago'),

-- =====================================================
--                Pagamentos - Semana 4
-- Referente aos agendamentos da semana de 26/01/2026 a 31/01/2026
-- Apenas agendamentos concluídos possuem pagamento.
-- =====================================================
(31, 'Pix', 70.00, 'Pago'),
(32, 'Débito', 35.00, 'Pago'),
(33, 'Pix', 85.00, 'Pago'),
(34, 'Crédito', 45.00, 'Pago'),
(36, 'Dinheiro', 65.00, 'Pago'),
(38, 'Pix', 45.00, 'Pago'),
(39, 'Crédito', 90.00, 'Pago');