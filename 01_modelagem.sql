-- ========================================================== --
-- Projeto: Sistema de Agendamento para Manicure Autônoma
-- Versão: 1.0 (Modelagem)
-- Objetivo: Praticar modelagem de banco de dados relacional
-- Tecnologias: MySQL + Excel (futuramente)
-- Autor: Caio Oliveira Diniz
-- ========================================================== --
create database manicure_projeto;
use manicure_projeto;
-- ===================================================== --
--                TABELA: CLIENTES
--     Armazena os dados dos clientes cadastrados.
-- ===================================================== --
create table tb_clientes (
	id_cliente int auto_increment primary key,
    nome varchar(100) not null,
    
-- Armazenado como varchar por não ser utilizado em cálculos, pode conter caracteres de formatação.
    telefone varchar(15) not null,
    
-- Registra automaticamente a data e hora em que o cliente foi cadastrado.
    data_cadastro datetime default current_timestamp not null
	);
-- ===================================================== --
--                 TABELA: SERVIÇOS
--     Define os tipos de serviço, valor e duração.
-- ===================================================== --
create table tb_servicos(
	id_servico int auto_increment primary key,
    tipo varchar(100) not null,
    valor decimal(10,2) not null,
    
-- Duracao do serviço em minutos, utilizada para cálculos de horário e duração de atendimentos.
    duracao_min int not null
    );
-- ===================================================== --
--               TABELA: AGENDAMENTOS
--      Relaciona clientes, serviços e horários.
-- ===================================================== --
create table tb_agendamentos(
	id_agendamento int auto_increment primary key,
    id_cliente int not null,
    id_servico int not null,
    
-- DATETIME em vez de separar DATA e HORA. Isso facilita consultas e cálculos de duração.
    inicio datetime not null,
    fim datetime not null,
    
-- Utiliza ENUM para restringir o status aos valores definidos pelo sistema.
    status_agendamento enum('Agendado', 'Concluído', 'Cancelado', 'Não compareceu') not null default 'Agendado',
    observacao varchar(255),
    criado_em datetime default current_timestamp,
    
-- Garante que somente clientes cadastrados possuem agendamentos.
-- ON DELETE RESTRICT impede excluir um cliente que possua agendamentos.
-- ON UPDATE CASCADE atualiza automaticamente a referência caso a chave seja alterada.
foreign key (id_cliente)
	references tb_clientes(id_cliente)
    on delete restrict
    on update cascade,
    
-- Garante que apenas serviços cadastrados possam ser agendados.
-- ON DELETE RESTRICT impede excluir um serviço que esteja sendo utilizado.
-- ON UPDATE CASCADE atualiza automaticamente a referência caso a chave seja alterada.
foreign key (id_servico)
	references tb_servicos(id_servico)
    on delete restrict
    on update cascade
    );
-- ===================================================== --
--               TABELA: PAGAMENTOS
-- Define forma de pagamento, valor pago, datas e situação.
-- ===================================================== --
create table tb_pagamentos(
	id_pagamento int auto_increment primary key,
    
-- Cada agendamento pode ter apenas um pagamento.
-- Unique impede registros duplicados para o mesmo atendimento.
    id_agendamento int not null unique,
    
-- Forma de pagamento do cliente    
    forma enum('Dinheiro','Pix','Débito','Crédito') not null,
    
-- Decimal para armazenar valores monetários com precisão.
    valor_pago decimal(10,2) not null,
    data_pagamento datetime default current_timestamp,
    
-- Situação do pagamento, todo novo registro criado iniciará como "Pendente".
    status_pagamento enum('Pago', 'Pendente', 'Cancelado') not null default 'Pendente',
    
-- Relaciona o pagamento ao agendamento correspondente.
-- ON DELETE RESTRICT impede excluir um agendamento que possua pagamento.
-- ON UPDATE CASCADE mantém a integridade da referência.   
foreign key(id_agendamento)
	references tb_agendamentos(id_agendamento)
    on delete restrict
    on update cascade
    );
    