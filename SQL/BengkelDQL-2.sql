IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Bengkel')
	DROP DATABASE [Bengkel]
GO

CREATE DATABASE [Bengkel]  ON (NAME = N'Bengkel_Data', FILENAME = N'E:\!10.Bengkel\Database\Kosong\Bengkel_Data.MDF' , SIZE = 7, FILEGROWTH = 10%) LOG ON (NAME = N'Bengkel_Log', FILENAME = N'E:\!10.Bengkel\Database\Kosong\Bengkel_Log.LDF' , SIZE = 38, FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'Bengkel', N'autoclose', N'false'
GO

exec sp_dboption N'Bengkel', N'bulkcopy', N'false'
GO

exec sp_dboption N'Bengkel', N'trunc. log', N'false'
GO

exec sp_dboption N'Bengkel', N'torn page detection', N'false'
GO

exec sp_dboption N'Bengkel', N'read only', N'false'
GO

exec sp_dboption N'Bengkel', N'dbo use', N'false'
GO

exec sp_dboption N'Bengkel', N'single', N'false'
GO

exec sp_dboption N'Bengkel', N'autoshrink', N'false'
GO

exec sp_dboption N'Bengkel', N'ANSI null default', N'false'
GO

exec sp_dboption N'Bengkel', N'recursive triggers', N'false'
GO

exec sp_dboption N'Bengkel', N'ANSI nulls', N'false'
GO

exec sp_dboption N'Bengkel', N'concat null yields null', N'false'
GO

exec sp_dboption N'Bengkel', N'cursor close on commit', N'false'
GO

exec sp_dboption N'Bengkel', N'default to local cursor', N'false'
GO

exec sp_dboption N'Bengkel', N'quoted identifier', N'false'
GO

exec sp_dboption N'Bengkel', N'ANSI warnings', N'false'
GO

exec sp_dboption N'Bengkel', N'auto create statistics', N'true'
GO

exec sp_dboption N'Bengkel', N'auto update statistics', N'true'
GO

use [Bengkel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_money_transaction_Account]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[money_transaction] DROP CONSTRAINT FK_money_transaction_Account
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Item_Balance_Items]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Item_Balance] DROP CONSTRAINT FK_Item_Balance_Items
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Item_Price_Items]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Item_Price] DROP CONSTRAINT FK_Item_Price_Items
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Item_Price_Purchase_Items]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Item_Price_Purchase] DROP CONSTRAINT FK_Item_Price_Purchase_Items
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Service_Package_Items]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Service_Package] DROP CONSTRAINT FK_Service_Package_Items
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Persons_Motor]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT FK_Persons_Motor
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Item_Price_Services]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Item_Price] DROP CONSTRAINT FK_Item_Price_Services
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_service_detail_Services]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[service_detail] DROP CONSTRAINT FK_service_detail_Services
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Service_Package_Services]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Service_Package] DROP CONSTRAINT FK_Service_Package_Services
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_money_balance_money_account]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[money_balance] DROP CONSTRAINT FK_money_balance_money_account
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_money_transaction_payment]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[money_transaction] DROP CONSTRAINT FK_money_transaction_payment
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_system_access_system_menu]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[system_access] DROP CONSTRAINT FK_system_access_system_menu
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_system_access_system_users]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[system_access] DROP CONSTRAINT FK_system_access_system_users
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Warehouse_system_users]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Warehouse] DROP CONSTRAINT FK_Warehouse_system_users
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Item_Detail_Item_Balance]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Item_Detail] DROP CONSTRAINT FK_Item_Detail_Item_Balance
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Shipment_Persons]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT FK_Shipment_Persons
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Shipment_Persons1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT FK_Shipment_Persons1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Shipment_Persons2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT FK_Shipment_Persons2
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Shipment_Warehouse]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT FK_Shipment_Warehouse
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Shipment_Warehouse1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT FK_Shipment_Warehouse1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Item_Detail_Shipment]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Item_Detail] DROP CONSTRAINT FK_Item_Detail_Shipment
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_service_detail_Shipment]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[service_detail] DROP CONSTRAINT FK_service_detail_Shipment
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Shipment_Shipment]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT FK_Shipment_Shipment
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[insert_price]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[insert_price]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[update_price]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[update_price]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_stok_periode]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_stok_periode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_mekanik]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_mekanik]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_stok_onhand]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_stok_onhand]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_stokvalue_onhand_periode]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_stokvalue_onhand_periode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_warehouse]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_warehouse]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_id_motor]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_id_motor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_max_price]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_max_price]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_ship_num]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_ship_num]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[insert_to_item_detail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[insert_to_item_detail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[save_to_item_balance_out]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[save_to_item_balance_out]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[save_to_item_detail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[save_to_item_detail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[backup_data]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[backup_data]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[save_to_item_balance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[save_to_item_balance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[save_to_item_balance_dummy]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[save_to_item_balance_dummy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Item_Detail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Item_Detail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[service_detail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[service_detail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Shipment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Shipment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Item_Balance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Item_Balance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Item_Price]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Item_Price]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Item_Price_Purchase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Item_Price_Purchase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Persons]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Persons]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Service_Package]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Service_Package]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Warehouse]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Warehouse]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[money_balance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[money_balance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[money_transaction]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[money_transaction]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[system_access]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[system_access]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Account]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Account]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Dummy_item_detail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Dummy_item_detail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Items]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Items]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Motor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Motor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Services]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Services]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[company_profile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[company_profile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[data_customer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[data_customer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[data_motor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[data_motor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[money_account]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[money_account]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[payment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[payment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[system_menu]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[system_menu]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[system_users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[system_users]
GO

CREATE TABLE [dbo].[Account] (
	[acc_id] [int] IDENTITY (1, 1) NOT NULL ,
	[acc_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[acc_code] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[acc_name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[db_cr_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NOT NULL ,
	[date_edt] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Dummy_item_detail] (
	[dump_id] [int] IDENTITY (1, 1) NOT NULL ,
	[ship_id] [bigint] NOT NULL ,
	[item_id] [bigint] NULL ,
	[service_id] [int] NULL ,
	[service_parent] [int] NULL ,
	[db_cr_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[quantity] [real] NULL ,
	[price] [money] NULL ,
	[discount] [money] NULL ,
	[amount] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Items] (
	[item_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[item_code] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[item_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[item_name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[used_unit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[purchase_unit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[stok_limit] [int] NULL ,
	[price] [money] NULL ,
	[conversion] [real] NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_insert] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NOT NULL ,
	[date_edit] [datetime] NULL ,
	[subtution] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Rank] [smallint] NULL ,
	[price_purchase] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Motor] (
	[motor_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[motor_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[motor_code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[motor_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[motor_year] [int] NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NOT NULL ,
	[date_edit] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Services] (
	[service_id] [int] IDENTITY (1, 1) NOT NULL ,
	[service_code] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[service_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[service_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[price] [money] NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_insert] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NULL ,
	[date_edit] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[company_profile] (
	[company_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[telp1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[telp2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fax] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[branch] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[INFO] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[data_customer] (
	[ID_CUST] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NAMA] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ALAMAT] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ID_MOTOR] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TAHUN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NO_MESIN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NO_RANGKA] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[data_motor] (
	[ID_MOTOR] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[JENIS_MOTOR] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[money_account] (
	[money_id] [int] IDENTITY (1, 1) NOT NULL ,
	[money_code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[money_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[money_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[money_owner] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[acc_num] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bank_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_id] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[date_modify] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[payment] (
	[payment_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[payment_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[payment_date] [datetime] NOT NULL ,
	[payment_num] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[subtotal] [money] NULL ,
	[discount] [money] NULL ,
	[ppn] [money] NULL ,
	[charges] [money] NULL ,
	[total] [money] NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NOT NULL ,
	[date_edit] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[system_menu] (
	[menu_id] [int] NOT NULL ,
	[menu_group] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[menu_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[form_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[form_type] [smallint] NULL ,
	[submenu_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[image_index] [int] NULL ,
	[shortcut] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[system_users] (
	[user_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[user_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[access_level] [smallint] NULL ,
	[passwd] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[disabled_date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Item_Balance] (
	[item_balance_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[item_id] [bigint] NOT NULL ,
	[balance_date] [datetime] NOT NULL ,
	[balance] [float] NULL ,
	[db_balance] [float] NULL ,
	[cr_balance] [float] NULL ,
	[price] [real] NULL ,
	[wh_id] [int] NULL ,
	[date_edit] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Item_Price] (
	[item_id] [bigint] NULL ,
	[service_id] [int] NULL ,
	[price] [money] NULL ,
	[disable_date] [datetime] NULL ,
	[date_insert] [datetime] NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_edit] [datetime] NULL ,
	[price_id] [bigint] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Item_Price_Purchase] (
	[item_id] [bigint] NULL ,
	[price] [money] NULL ,
	[disable_date] [datetime] NULL ,
	[date_insert] [datetime] NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_edit] [datetime] NULL ,
	[price_purchase_id] [bigint] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Persons] (
	[person_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[person_code] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[person_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[person_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[motor_id] [bigint] NULL ,
	[address] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[postal_code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[birth_date] [datetime] NULL ,
	[id_num] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone1] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone2] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone3] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mtr_year] [int] NULL ,
	[mtr_rangka] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mtr_mesin] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NOT NULL ,
	[date_edit] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Service_Package] (
	[pkg_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[service_id] [int] NULL ,
	[item_id] [bigint] NULL ,
	[price] [money] NULL ,
	[quantity] [real] NULL ,
	[service_parent] [int] NULL ,
	[Notes] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Warehouse] (
	[wh_id] [int] IDENTITY (1, 1) NOT NULL ,
	[wh_code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[wh_name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[is_active] [smallint] NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NULL ,
	[date_edit] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[money_balance] (
	[money_balance_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[money_id] [int] NOT NULL ,
	[balance_date] [datetime] NOT NULL ,
	[balance] [money] NULL ,
	[db_balance] [money] NULL ,
	[cr_balance] [money] NULL ,
	[date_modify] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[money_transaction] (
	[money_trans_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[payment_id] [bigint] NOT NULL ,
	[money_balance_id] [int] NOT NULL ,
	[db_cr_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[amount] [money] NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Acc_Id] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[system_access] (
	[menu_id] [int] NOT NULL ,
	[user_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[access_list] [smallint] NULL ,
	[outlook_panel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[outlook_button] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[usage_count] [int] NULL ,
	[can_acces] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Shipment] (
	[ship_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[ship_num] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ship_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ship_date] [datetime] NOT NULL ,
	[person_id] [bigint] NULL ,
	[mekanik_id] [bigint] NULL ,
	[notes] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[subtotal] [money] NULL ,
	[discount] [money] NULL ,
	[ppn] [money] NULL ,
	[total] [money] NULL ,
	[ship_id_used] [bigint] NULL ,
	[wh_id] [int] NULL ,
	[wh_id_out] [int] NULL ,
	[expr_date] [datetime] NULL ,
	[is_post] [smallint] NULL ,
	[ship_service_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_insert] [datetime] NULL ,
	[date_edit] [datetime] NULL ,
	[down_payment] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Item_Detail] (
	[item_detail_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[item_balance_id] [bigint] NOT NULL ,
	[quantity] [real] NULL ,
	[price] [money] NULL ,
	[conversion] [real] NULL ,
	[discount] [real] NULL ,
	[amount] [money] NULL ,
	[db_cr_type] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ship_id] [bigint] NOT NULL ,
	[service_parent] [int] NULL ,
	[Item_Id] [bigint] NULL ,
	[balance_in_concerned] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[real_value] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[service_detail] (
	[service_detail_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[ship_id] [bigint] NOT NULL ,
	[service_id] [int] NOT NULL ,
	[quantity] [real] NULL ,
	[price] [money] NULL ,
	[discount] [real] NULL ,
	[amount] [money] NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[charges] [money] NULL ,
	[service_parent] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Account] WITH NOCHECK ADD 
	CONSTRAINT [PK_Account] PRIMARY KEY  CLUSTERED 
	(
		[acc_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Dummy_item_detail] WITH NOCHECK ADD 
	CONSTRAINT [PK_Dummy_item_detail] PRIMARY KEY  CLUSTERED 
	(
		[dump_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Items] WITH NOCHECK ADD 
	CONSTRAINT [PK_Items] PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Motor] WITH NOCHECK ADD 
	CONSTRAINT [PK_Motor] PRIMARY KEY  CLUSTERED 
	(
		[motor_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Services] WITH NOCHECK ADD 
	CONSTRAINT [PK_Services] PRIMARY KEY  CLUSTERED 
	(
		[service_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[money_account] WITH NOCHECK ADD 
	CONSTRAINT [PK_money_account] PRIMARY KEY  CLUSTERED 
	(
		[money_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[payment] WITH NOCHECK ADD 
	CONSTRAINT [PK_payment] PRIMARY KEY  CLUSTERED 
	(
		[payment_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[system_menu] WITH NOCHECK ADD 
	CONSTRAINT [PK_system_menu] PRIMARY KEY  CLUSTERED 
	(
		[menu_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[system_users] WITH NOCHECK ADD 
	CONSTRAINT [PK_system_users] PRIMARY KEY  CLUSTERED 
	(
		[user_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Item_Balance] WITH NOCHECK ADD 
	CONSTRAINT [PK_Item_Balance] PRIMARY KEY  CLUSTERED 
	(
		[item_balance_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Item_Price] WITH NOCHECK ADD 
	CONSTRAINT [pk_item_price] PRIMARY KEY  CLUSTERED 
	(
		[price_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Item_Price_Purchase] WITH NOCHECK ADD 
	CONSTRAINT [pk_item_price_purchase] PRIMARY KEY  CLUSTERED 
	(
		[price_purchase_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Persons] WITH NOCHECK ADD 
	CONSTRAINT [PK_Persons] PRIMARY KEY  CLUSTERED 
	(
		[person_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Service_Package] WITH NOCHECK ADD 
	CONSTRAINT [PK_Service_Package] PRIMARY KEY  CLUSTERED 
	(
		[pkg_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Warehouse] WITH NOCHECK ADD 
	CONSTRAINT [PK_Warehouse] PRIMARY KEY  CLUSTERED 
	(
		[wh_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[money_balance] WITH NOCHECK ADD 
	CONSTRAINT [PK_money_balance] PRIMARY KEY  CLUSTERED 
	(
		[money_balance_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[money_transaction] WITH NOCHECK ADD 
	CONSTRAINT [PK_money_transaction] PRIMARY KEY  CLUSTERED 
	(
		[money_trans_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[system_access] WITH NOCHECK ADD 
	CONSTRAINT [PK_system_access] PRIMARY KEY  CLUSTERED 
	(
		[menu_id],
		[user_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Shipment] WITH NOCHECK ADD 
	CONSTRAINT [PK_Shipment] PRIMARY KEY  CLUSTERED 
	(
		[ship_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Item_Detail] WITH NOCHECK ADD 
	CONSTRAINT [PK_Item_Detail] PRIMARY KEY  CLUSTERED 
	(
		[item_detail_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[service_detail] WITH NOCHECK ADD 
	CONSTRAINT [PK_service_detail] PRIMARY KEY  CLUSTERED 
	(
		[service_detail_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Account] WITH NOCHECK ADD 
	CONSTRAINT [DF_Account_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Items] WITH NOCHECK ADD 
	CONSTRAINT [DF_Items_stok_limit] DEFAULT (0) FOR [stok_limit],
	CONSTRAINT [DF_Items_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Motor] WITH NOCHECK ADD 
	CONSTRAINT [DF_Motor_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Services] WITH NOCHECK ADD 
	CONSTRAINT [DF_Services_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[payment] WITH NOCHECK ADD 
	CONSTRAINT [DF_payment_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Item_Price] WITH NOCHECK ADD 
	CONSTRAINT [DF_Item_Price_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Item_Price_Purchase] WITH NOCHECK ADD 
	CONSTRAINT [DF_Item_Price_purchase_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Persons] WITH NOCHECK ADD 
	CONSTRAINT [DF_Persons_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Warehouse] WITH NOCHECK ADD 
	CONSTRAINT [DF_Warehouse_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Shipment] WITH NOCHECK ADD 
	CONSTRAINT [DF_Shipment_is_post] DEFAULT (0) FOR [is_post],
	CONSTRAINT [DF_Shipment_date_insert] DEFAULT (getdate()) FOR [date_insert],
	CONSTRAINT [IX_Shipment] UNIQUE  NONCLUSTERED 
	(
		[ship_num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Item_Detail] WITH NOCHECK ADD 
	CONSTRAINT [DF_Item_Detail_quantity] DEFAULT (0) FOR [quantity],
	CONSTRAINT [DF_Item_Detail_price] DEFAULT (0) FOR [price],
	CONSTRAINT [DF_Item_Detail_amount] DEFAULT (0) FOR [amount]
GO

ALTER TABLE [dbo].[Item_Balance] ADD 
	CONSTRAINT [FK_Item_Balance_Items] FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [dbo].[Items] (
		[item_id]
	)
GO

ALTER TABLE [dbo].[Item_Price] ADD 
	CONSTRAINT [FK_Item_Price_Items] FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [dbo].[Items] (
		[item_id]
	),
	CONSTRAINT [FK_Item_Price_Services] FOREIGN KEY 
	(
		[service_id]
	) REFERENCES [dbo].[Services] (
		[service_id]
	)
GO

ALTER TABLE [dbo].[Item_Price_Purchase] ADD 
	CONSTRAINT [FK_Item_Price_Purchase_Items] FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [dbo].[Items] (
		[item_id]
	)
GO

ALTER TABLE [dbo].[Persons] ADD 
	CONSTRAINT [FK_Persons_Motor] FOREIGN KEY 
	(
		[motor_id]
	) REFERENCES [dbo].[Motor] (
		[motor_id]
	)
GO

ALTER TABLE [dbo].[Service_Package] ADD 
	CONSTRAINT [FK_Service_Package_Items] FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [dbo].[Items] (
		[item_id]
	) ON UPDATE CASCADE ,
	CONSTRAINT [FK_Service_Package_Services] FOREIGN KEY 
	(
		[service_id]
	) REFERENCES [dbo].[Services] (
		[service_id]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[Warehouse] ADD 
	CONSTRAINT [FK_Warehouse_system_users] FOREIGN KEY 
	(
		[user_insert]
	) REFERENCES [dbo].[system_users] (
		[user_id]
	)
GO

ALTER TABLE [dbo].[money_balance] ADD 
	CONSTRAINT [FK_money_balance_money_account] FOREIGN KEY 
	(
		[money_id]
	) REFERENCES [dbo].[money_account] (
		[money_id]
	)
GO

ALTER TABLE [dbo].[money_transaction] ADD 
	CONSTRAINT [FK_money_transaction_Account] FOREIGN KEY 
	(
		[Acc_Id]
	) REFERENCES [dbo].[Account] (
		[acc_id]
	),
	CONSTRAINT [FK_money_transaction_payment] FOREIGN KEY 
	(
		[payment_id]
	) REFERENCES [dbo].[payment] (
		[payment_id]
	)
GO

ALTER TABLE [dbo].[system_access] ADD 
	CONSTRAINT [FK_system_access_system_menu] FOREIGN KEY 
	(
		[menu_id]
	) REFERENCES [dbo].[system_menu] (
		[menu_id]
	),
	CONSTRAINT [FK_system_access_system_users] FOREIGN KEY 
	(
		[user_id]
	) REFERENCES [dbo].[system_users] (
		[user_id]
	)
GO

ALTER TABLE [dbo].[Shipment] ADD 
	CONSTRAINT [FK_Shipment_Persons] FOREIGN KEY 
	(
		[person_id]
	) REFERENCES [dbo].[Persons] (
		[person_id]
	),
	CONSTRAINT [FK_Shipment_Persons1] FOREIGN KEY 
	(
		[person_id]
	) REFERENCES [dbo].[Persons] (
		[person_id]
	),
	CONSTRAINT [FK_Shipment_Persons2] FOREIGN KEY 
	(
		[mekanik_id]
	) REFERENCES [dbo].[Persons] (
		[person_id]
	),
	CONSTRAINT [FK_Shipment_Shipment] FOREIGN KEY 
	(
		[ship_id_used]
	) REFERENCES [dbo].[Shipment] (
		[ship_id]
	),
	CONSTRAINT [FK_Shipment_Warehouse] FOREIGN KEY 
	(
		[wh_id]
	) REFERENCES [dbo].[Warehouse] (
		[wh_id]
	),
	CONSTRAINT [FK_Shipment_Warehouse1] FOREIGN KEY 
	(
		[wh_id_out]
	) REFERENCES [dbo].[Warehouse] (
		[wh_id]
	)
GO

ALTER TABLE [dbo].[Item_Detail] ADD 
	CONSTRAINT [FK_Item_Detail_Item_Balance] FOREIGN KEY 
	(
		[item_balance_id]
	) REFERENCES [dbo].[Item_Balance] (
		[item_balance_id]
	),
	CONSTRAINT [FK_Item_Detail_Shipment] FOREIGN KEY 
	(
		[ship_id]
	) REFERENCES [dbo].[Shipment] (
		[ship_id]
	)
GO

ALTER TABLE [dbo].[service_detail] ADD 
	CONSTRAINT [FK_service_detail_Services] FOREIGN KEY 
	(
		[service_id]
	) REFERENCES [dbo].[Services] (
		[service_id]
	),
	CONSTRAINT [FK_service_detail_Shipment] FOREIGN KEY 
	(
		[ship_id]
	) REFERENCES [dbo].[Shipment] (
		[ship_id]
	)
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE backup_data ( @p_file_nama VARCHAR(100) )
AS
  EXEC sp_dropdevice 'tempdbbengkel' 
  EXEC sp_addumpdevice 'disk', 'tempdbbengkel', @p_file_nama 
  BACKUP DATABASE Bengkel TO tempdbbengkel
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE save_to_item_balance 
    (@item_id  int,
    @balance_date datetime,
    @quantity  real,
    @price money,
    @db_cr_type char(1),
    @@item_balance_id bigint output)
as   
 -----------------DENGAN MODEL INVENTORY FIFO
  declare @p_balance_date datetime
  --- stok terakhir
  declare cr_get_latest_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, price
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id and price = @price
                          and balance_date <= @balance_date)  
  -- stok hari ini
  declare cr_get_item_balance_id cursor local for
     SELECT item_balance_id
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
           cast(floor(cast(balance_date as float)) as datetime) = cast(floor(cast(@balance_date as float)) as datetime)
   ---- stok ke depan
   
   declare cr_get_next_item_balance cursor local for
     SELECT balance, price, balance_date
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id and price = @price
                          and balance_date >= @p_balance_date)  
   declare @v_quantity real
   declare @v_balance real
   declare @v_db_balance real
   declare @v_cr_balance real
   declare @v_price real
   declare @v_db_quantity real
   declare @v_cr_quantity real
   declare @v_item_balance_id bigint
   declare @v_balance_date datetime
   
   
   ---------INISIALISASI
   set @v_price = @price
   if @db_cr_type = 'D' begin
     set @v_db_quantity = @quantity
     set @v_cr_quantity = 0
   end
   else if @db_cr_type = 'C' begin
      set @v_db_quantity = 0
     set @v_cr_quantity = @quantity
   end
   open cr_get_item_balance_id 
   --jika ditemukann stok pada kondisi parameter maka update item_balance
   fetch next from cr_get_item_balance_id into  @v_item_balance_id
   
   if @@fetch_status  = 0 begin
        update item_balance
         set balance = balance + @v_db_quantity - @v_cr_quantity,
          	 db_balance = db_balance + @v_db_quantity,
               cr_balance = cr_balance + @v_cr_quantity
         where item_balance_id = @v_item_balance_id
  
        --SET RESULT
         set @@item_balance_id = @v_item_balance_id
          close cr_get_item_balance_id 
          deallocate cr_get_item_balance_id 
          set @p_balance_date = @balance_date
        /*  open    cr_get_next_item_balance
          fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           while @@fetch_status = 0 begin
               update item_balance
               set balance = balance + @v_db_quantity - @v_cr_quantity,
	       db_balance = db_balance + @v_db_quantity,
	        cr_balance = cr_balance - @v_cr_quantity
               where balance_date = @v_balance_date
                      and price = @v_price and item_id = @item_id
                       		
               fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           end
          close cr_get_next_item_balance
          deallocate  cr_get_next_item_balance */
   end
   else begin  -- jka tidak ditemukan stok pada hari ini
         close cr_get_item_balance_id 
         deallocate cr_get_item_balance_id 
      
      --   open cr_get_latest_item_balance   
      --   fetch next from cr_get_latest_item_balance into  @v_balance, @v_db_balance, @v_cr_balance, @v_price  
          --jika stok terakhir tidak ditemukan = sama sekali belum ada data utk parameter
     --    if @@fetch_status <> 0 begin
            set @v_balance = 0
            set @v_db_balance = 0
            set @v_cr_balance = 0
            set @v_price = @price
--         end
        -----------INPUT ITEM_BALANCE
        insert into item_balance(balance_date, item_id, price, balance, db_balance, cr_balance)   
        values (cast(floor(cast(@balance_date as float)) as datetime), @item_id, @v_price,@v_balance+@v_db_quantity - @v_cr_quantity, @v_db_balance+@v_db_quantity, @v_cr_balance + @v_cr_quantity)
        
        --- SET RESULT 
       select @@item_balance_id=max(item_balance_id)  from item_balance 
--       close cr_get_latest_item_balance
  --     deallocate cr_get_latest_item_balance
     --  set @p_balance_date = @balance_date + 1
  /*     open    cr_get_next_item_balance
          fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           while @@fetch_status = 0 begin
               update item_balance
               set balance = balance + @v_db_quantity - @v_cr_quantity,
	       db_balance = db_balance + @v_db_quantity,
	        cr_balance = cr_balance - @v_cr_quantity
               where balance_date = @v_balance_date
                      and price = @v_price and item_id = @item_id
                       		
               fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           end
          close cr_get_next_item_balance
          deallocate  cr_get_next_item_balance */
   end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE save_to_item_balance_dummy
    (@item_id  int,
    @balance_date datetime,
    @quantity  real,
    @price money,
    @db_cr_type char(1),
    @@item_balance_id bigint output)
as   
 -----------------DENGAN MODEL INVENTORY FIFO
 -------------------pertimbangan balance_date tidak digunakan jadi validasi nya dari price saja
  declare @p_balance_date datetime
  --- stok terakhir
  declare cr_get_latest_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, price, item_balance_id
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price 
        --  balance_date = (select max(balance_date) from item_balance 
          --          where item_id = @item_id and price = @price
            --              and balance_date <= @balance_date)  
  -- stok hari ini
   declare @v_quantity real
   declare @v_balance real
   declare @v_db_balance real
   declare @v_cr_balance real
   declare @v_price real
   declare @v_db_quantity real
   declare @v_cr_quantity real
   declare @v_item_balance_id bigint
   declare @v_balance_date datetime
   
   
   ---------INISIALISASI
   set @v_price = @price
   if @db_cr_type = 'D' begin
     set @v_db_quantity = @quantity
     set @v_cr_quantity = 0
   end
   else if @db_cr_type = 'C' begin
      set @v_db_quantity = 0
     set @v_cr_quantity = @quantity
   end
--   open cr_get_item_balance_id 
   --jika ditemukann stok pada kondisi parameter maka update item_balance
  -- fetch next from cr_get_item_balance_id into  @v_item_balance_id
   open cr_get_latest_item_balance   
   fetch next from cr_get_latest_item_balance 
   into  @v_balance, @v_db_balance, @v_cr_balance, @v_price , @v_item_balance_id 
   
   if @@fetch_status  = 0 begin
        update item_balance
         set balance = balance + @v_db_quantity - @v_cr_quantity,
       	     db_balance = db_balance + @v_db_quantity,
             cr_balance = cr_balance + @v_cr_quantity
         where item_balance_id = @v_item_balance_id
  
        --SET RESULT
         set @@item_balance_id = @v_item_balance_id          
   end
   else begin  -- jka tidak ditemukan stok pada hari ini
      set @v_balance = 0
      set @v_db_balance = 0
      set @v_cr_balance = 0
      set @v_price = @price
        -----------INPUT ITEM_BALANCE
        insert into item_balance(balance_date, item_id, price, balance, db_balance, cr_balance)   
        values (cast(floor(cast(@balance_date as float)) as datetime), @item_id, @v_price,@v_balance+@v_db_quantity - @v_cr_quantity, @v_db_balance+@v_db_quantity, @v_cr_balance + @v_cr_quantity)
        
        --- SET RESULT 
       select @@item_balance_id=max(item_balance_id)  from item_balance 
     
   end
   close cr_get_item_balance_id 
   deallocate cr_get_item_balance_id

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE save_to_item_detail 
   (@ship_id bigint,
   @trans_date datetime,
   @item_id int,
   @quantity real,
   @price money,
   @db_cr_type char(1))
 AS
   declare @v_amount real
   declare @v_item_balance_id bigint
   declare @v_temp bigint
   set @v_amount = @quantity * @price
--   BEGIN DISTRIBUTED TRANSACTION
   exec save_to_item_balance @item_id, @trans_date, @quantity, @price, @db_cr_type, @v_temp output
      
   exec  insert_to_item_detail @v_temp, @ship_id, @quantity, @price, @v_amount, @db_cr_type
--   commit tran

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE PROCEDURE save_to_item_balance_out
    (@item_id  int,
    @balance_date datetime,
    @quantity  real,
    @price money,
    @db_cr_type char(1),
    @@item_balance_id bigint output ,
   @@balance_concerned varchar(50) output,
   @@real_value MONEY = 0 output )
as   
 -----------------DENGAN MODEL INVENTORY FIFO -------KHUSUS UTK PENGELUARAN
   declare @v_balance_concerned  varchar(50) 
   declare @v_tmp varchar(50) 
 declare @p_balance_date datetime
  declare @balance_price money
  declare @v_real_value money
 
  ---stok per tanggal
   declare cr_get_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, balance_Date, item_balance_id, price
     FROM item_balance
     WHERE item_id = @item_id
     order by balance_date
          
    
--- stok terakhir
  declare cr_get_latest_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, price
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id and price = @price
                          and balance_date <= @balance_date)  
  -- stok hari ini
  declare cr_get_item_balance_id cursor local for
     SELECT item_balance_id
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
           cast(floor(cast(balance_date as float)) as datetime) = cast(floor(cast(@balance_date as float)) as datetime)
   ---- stok ke depan
   
   declare cr_get_next_item_balance cursor local for
     SELECT balance, price, balance_date
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id and price = @price
                          and balance_date >= @p_balance_date)  
   declare @v_quantity real
   declare @v_balance real
   declare @v_db_balance real
   declare @v_cr_balance real
   declare @v_price real
   declare @v_db_quantity real
   declare @v_cr_quantity real
   declare @v_item_balance_id bigint
   declare @v_balance_date datetime
   declare @v_sisa real
   declare @v_selisih real
 
   --declare @v_conversion real
   
   ---------INISIALISASI

   set @v_price = @price
  set @v_balance_concerned = ''  
  set @v_tmp = ''
   set @v_selisih = 0
  set @v_real_value = 0
   set @@item_balance_id=@v_item_balance_id	
--   select @v_conversion=isnull(conversion,1) 
--   from items 
 --  where item_id = @item_id
   set @v_quantity = @quantity-- * @v_conversion
   set @v_sisa = @quantity --* @v_conversion
   if @db_cr_type = 'D' begin
     set @v_db_quantity = @quantity
     set @v_cr_quantity = 0
   end
   else if @db_cr_type = 'C' begin
      set @v_db_quantity = 0
     set @v_cr_quantity = @quantity
   end
   open cr_get_item_balance
   fetch next from cr_get_item_balance 
   into @v_balance, @v_db_balance, @v_cr_balance, @v_balance_date, @v_item_balance_id, @balance_price
   while (@@fetch_status = 0) and (@v_sisa >0) begin
     set @v_selisih = @v_balance - @v_sisa
     --jika selisihnya min alias stok tgl tersebut tidak mencukupi
     
     if @v_selisih < 0 begin
       set @v_quantity = @v_balance  
       --set @v_sisa = abs(@v_selisih)  
     end
     else begin
       set @v_quantity = @v_sisa
       --set @v_sisa = 0 
     end
     set @v_sisa = @v_sisa - @v_quantity
     update item_balance
     set balance = balance - @v_quantity,
	 cr_balance = cr_balance + @v_quantity
     where item_balance_id = @v_item_balance_id		
     set @@item_balance_id=@v_item_balance_id
     select  @v_tmp = cast(@@item_balance_id as varchar(50)) 
      if @v_quantity > 0 begin  
	set @v_balance_concerned = @v_balance_concerned + @v_tmp +'='+CAST(@v_quantity as varchar(50)) + ','
	set @v_real_value = @v_real_value + (@v_quantity * @balance_price )
     end
    
     fetch next from cr_get_item_balance 
     into @v_balance, @v_db_balance, @v_cr_balance, @v_balance_date, @v_item_balance_id, @balance_price
   end
   select @@balance_concerned =  @v_balance_concerned 
    close cr_get_item_balance
   deallocate cr_get_item_balance
  
   
    select @@balance_concerned = substring(@v_balance_concerned,1,len(@v_balance_concerned)-1)
    select @@real_value = @v_real_value
     --=============================================
/*   open cr_get_item_balance_id 
   --jika ditemukann stok pada kondisi parameter maka update item_balance
   fetch next from cr_get_item_balance_id into  @v_item_balance_id
   
   if @@fetch_status  = 0 begin
        update item_balance
         set balance = balance + @v_db_quantity - @v_cr_quantity,
          	 db_balance = db_balance + @v_db_quantity,
               cr_balance = cr_balance + @v_cr_quantity
         where item_balance_id = @v_item_balance_id
  
        --SET RESULT
         set @@item_balance_id = @v_item_balance_id
          close cr_get_item_balance_id 
          deallocate cr_get_item_balance_id 
          set @p_balance_date = @balance_date
          open    cr_get_next_item_balance
          fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           while @@fetch_status = 0 begin
               update item_balance
               set balance = balance + @v_db_quantity - @v_cr_quantity,
	       db_balance = db_balance + @v_db_quantity,
	        cr_balance = cr_balance - @v_cr_quantity
               where balance_date = @v_balance_date
                      and price = @v_price and item_id = @item_id
                       		
               fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           end
          close cr_get_next_item_balance
          deallocate  cr_get_next_item_balance
   end
   else begin  -- jka tidak ditemukan stok pada hari ini
         close cr_get_item_balance_id 
         deallocate cr_get_item_balance_id 
      
          open cr_get_latest_item_balance   
         fetch next from cr_get_latest_item_balance into  @v_balance, @v_db_balance, @v_cr_balance, @v_price  
          --jika stok terakhir tidak ditemukan = sama sekali belum ada data utk parameter
         if @@fetch_status <> 0 begin
            set @v_balance = 0
            set @v_db_balance = 0
            set @v_cr_balance = 0
            set @v_price = @price
         end
        -----------INPUT ITEM_BALANCE
        insert into item_balance(balance_date, item_id, price, balance, db_balance, cr_balance)   
        values (cast(floor(cast(@balance_date as float)) as datetime), @item_id, @v_price,@v_balance+@v_db_quantity - @v_cr_quantity, @v_db_balance+@v_db_quantity, @v_cr_balance + @v_cr_quantity)
        
        --- SET RESULT 
       select @@item_balance_id=max(item_balance_id)  from item_balance 
       close cr_get_latest_item_balance
       deallocate cr_get_latest_item_balance
       set @p_balance_date = @balance_date + 1
       open    cr_get_next_item_balance
          fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           while @@fetch_status = 0 begin
               update item_balance
               set balance = balance + @v_db_quantity - @v_cr_quantity,
	       db_balance = db_balance + @v_db_quantity,
	        cr_balance = cr_balance - @v_cr_quantity
               where balance_date = @v_balance_date
                      and price = @v_price and item_id = @item_id
                       		
               fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           end
          close cr_get_next_item_balance
          deallocate  cr_get_next_item_balance
   end */


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE insert_to_item_detail 
   (@ship_id bigint,
   @trans_date datetime,
   @item_id int,
   @quantity real,
   @price money,
   @db_cr_type char(1),
   @item_balance_id bigint,
   @conversion real,
   @ship_type char(1),
   @serv_ship_id int,  -- dipake jang service machine_id
   @amount money,
   @discount real,
   @balance_concerned varchar(50)='',
   @real_value money =0)
 AS
   declare @v_item_balance_id bigint
 -- if @ship_type = 'T'  --tipe Penerimaan Barang
  --  insert into item_detail(item_balance_id, ship_id, quantity, price, amount,db_cr_type, conversion)
  --    values (@item_balance_id, @ship_id, @quantity, @price, @amount, @db_cr_type,@conversion)
 -- else  
      insert into item_detail(item_balance_id, ship_id, quantity, price, discount, amount,db_cr_type, conversion,item_id,service_parent,balance_in_concerned,real_value)
      values (@item_balance_id, @ship_id, @quantity, @price,@discount, @amount, @db_cr_type,@conversion,@item_id,@serv_ship_id,@balance_concerned,@real_value)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION get_max_price(@item_id integer)
RETURNS money AS  

BEGIN 
  declare 
  @result money
  SELECT @result = ISNULL(MAX(price),0) FROM item_balance
  WHERE item_id = @item_id
  return  @result
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION get_ship_num(@ship_id bigint)
RETURNS varchar(50) AS  
 
BEGIN 
  declare @result varchar(50)
  SELECT @result = ship_num
  FROM shipment
  WHERE ship_id = @ship_id
  return @result
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE FUNCTION get_id_motor(@code varchar(20))
RETURNS int AS  

BEGIN 
  declare @id int
 select @id=motor_id from motor 
 where upper(motor_code) like upper(@code)
  return @id
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION get_mekanik(@ps_id int)  
RETURNS varchar(100) AS  
BEGIN 
  declare @vtmp varchar(100)
  select @vtmp=person_name
  from persons
  where person_id=@ps_id
return @vtmp
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION get_stok_onhand(@item_id  bigint)
RETURNS float AS  
 
BEGIN 
 declare @result float
  SELECT @result =  isnull(SUM(Balance) ,0)
  FROM item_balance 
  WHERE item_id = @item_id
      and balance_date <= (select max(balance_date) from item_balance where item_id = @item_id )
      and balance > 0
 return @result
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION get_stokvalue_onhand_periode(@periode datetime)
RETURNS float AS  
---FUNGSI   UTK MENGHITUNG NILAI STOK
BEGIN 
 declare  get_item cursor local  for
   select item_id from items
 
 declare @result float
 declare @value float
 declare @item_id bigint
  set @result = 0
  open get_item
  fetch next from get_item into @item_id
 while @@fetch_status = 0 begin
  SELECT @value =  isnull(SUM(Balance * price ) ,0)
  FROM item_balance 
  WHERE item_id = @item_id
      and balance_date <= (select max(balance_date) from item_balance where item_id = @item_id and balance_date <= @periode )
      and balance > 0

  set @result = @result + @value
  fetch next from get_item into @item_id
  end
  deallocate get_item
 return @result
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION get_warehouse(@wh_id int) 
RETURNS varchar(100) AS  
BEGIN 
 declare @result varchar(100)
 select @result=wh_name
 from warehouse
 where wh_id = @wh_id
 return @result
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION get_stok_periode(@item_id  bigint, @periode datetime)
RETURNS float AS  
 
BEGIN 
 declare @result float
 declare @db float
 declare @cr float 
/*  SELECT @result =  SUM(Balance) 
  FROM item_balance 
  WHERE item_id = @item_id
      and balance_date <= @periode
*/
  select @db = isnull(SUM(quantity),0)
  from item_detail d, shipment s
  where d.ship_id = s.ship_id
      and d.item_id = @item_id
      and db_cr_type = 'D'
      and s.ship_date <= @periode

 select @cr = isnull(SUM(quantity),0)
  from item_detail d, shipment s
  where d.ship_id = s.ship_id
      and d.item_id = @item_id
      and db_cr_type = 'C'
      and s.ship_date <= @periode
 set @result = @db - @cr
 return @result
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE TRIGGER insert_price ON dbo.Items 
FOR INSERT
AS

declare @item_id bigint
declare @price money
declare @price_purchase money
declare @price_id bigint
declare @price_purchase_id bigint
declare @user_insert varchar(30)

select @item_id = item_id, @price = ISNULL(price,0), @price_purchase= ISNULL(price_purchase,0),@user_insert=user_insert from inserted

--BLOK ITEM_PRICE--------------------------------------------------ATAU -HARGA JUAL
select @price_id=isnull(max(price_id),0) from item_price
where item_id = @item_id
--  insert price baru utk item bersangkutan
  insert into item_price(item_id, price,user_insert)
  values(@item_id, @price,@user_insert)

if @price_id > 0  begin  -- jika item sudah ada didalam master price maka disable yg terdahulu
 update item_price
 set disable_date = getdate(),
     user_edit = @user_insert,
     date_edit = getdate()
  where price_id = @price_id
end


--BLOK ITEM_PRICE_PURCHASE--------------------------------------------------ATAU -HARGA BELI
select @price_purchase_id=isnull(max(price_purchase_id),0) from item_price_purchase
where item_id = @item_id
--  insert price baru utk item bersangkutan
  insert into item_price_purchase(item_id, price,user_insert)
  values(@item_id, @price_purchase,@user_insert)

if @price_purchase_id > 0  begin  -- jika item sudah ada didalam master price maka disable yg terdahulu
 update item_price_purchase
 set disable_date = getdate(),
     user_edit = @user_insert,
     date_edit = getdate()
  where price_purchase_id = @price_purchase_id
end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE TRIGGER update_price ON dbo.Items 
FOR UPDATE
AS

declare @item_id bigint
declare @price money
declare @price_old money
declare @price_id bigint
declare @price_purchase money
declare @price_purchase_old money
declare @price_purchase_id bigint
declare @user_insert varchar(30)
select @item_id = item_id, @price = ISNULL(price,0), @price_purchase= ISNULL(price_purchase,0),@user_insert=user_edit from inserted

select @price_old = ISNULL(price,0),@price_purchase_old = ISNULL(price_purchase,0) from deleted

if @price = -1 begin  --jang nyirian kalo harga yg dikirim -1 maka jangan update harga
  set @price = @price_old
  
end


----------BLOK ITEM_PRICE======================ATAU HARGA JUAL
select @price_id=isnull(max(price_id),0) from item_price
where item_id = @item_id
--  insert price baru utk item bersangkutan
if @price <> @price_old begin
  insert into item_price(item_id, price,user_insert)
  values(@item_id, @price,@user_insert)
  
  if (@price_id > 0)     -- jika item sudah ada didalam master price maka disable yg terdahulu
    update item_price
    set disable_date = getdate(),
       user_edit = @user_insert,
       date_edit = getdate()
     where price_id = @price_id
end


----------BLOK ITEM_PRICE_PURCHASE======================ATAU HARGA BELI
select @price_purchase_id=isnull(max(price_purchase_id),0) from item_price_purchase
where item_id = @item_id
--  insert price baru utk item bersangkutan
if @price_purchase <> @price_purchase_old begin
  insert into item_price_purchase(item_id, price,user_insert)
  values(@item_id, @price_purchase,@user_insert)
  
  if (@price_purchase_id > 0)     -- jika item sudah ada didalam master price maka disable yg terdahulu
    update item_price_purchase
    set disable_date = getdate(),
       user_edit = @user_insert,
       date_edit = getdate()
     where price_purchase_id = @price_purchase_id
end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

