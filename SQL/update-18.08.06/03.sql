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

ALTER TABLE [dbo].[Item_Price_Purchase] WITH NOCHECK ADD 
	CONSTRAINT [pk_item_price_purchase] PRIMARY KEY  CLUSTERED 
	(
		[price_purchase_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Item_Price_Purchase] WITH NOCHECK ADD 
	CONSTRAINT [DF_Item_Price_purchase_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Item_Price_Purchase] ADD 
	CONSTRAINT [FK_Item_Price_Purchase_Items] FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [dbo].[Items] (
		[item_id]
	)
GO