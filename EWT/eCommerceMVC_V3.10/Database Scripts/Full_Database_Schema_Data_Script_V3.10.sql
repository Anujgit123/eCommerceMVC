/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryID] [int] NULL,
	[isFeatured] [bit] NOT NULL,
	[SanitizedName] [nvarchar](max) NULL,
	[ModifiedOn] [datetime] NULL,
	[DisplaySeqNo] [int] NOT NULL DEFAULT ((0)),
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[PictureID] [int] NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryRecords]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[CategoryID] [int] NOT NULL DEFAULT ((0)),
	[LanguageID] [int] NOT NULL DEFAULT ((0)),
	[Name] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.CategoryRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Rating] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[EntityID] [int] NOT NULL,
	[RecordID] [int] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Key] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ConfigurationType] [int] NOT NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Configurations] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageResources]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageResources](
	[Key] [nvarchar](max) NULL,
	[LanguageID] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.LanguageResources] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ShortCode] [nvarchar](max) NULL,
	[IsEnabled] [bit] NOT NULL,
	[ResourceFileName] [nvarchar](max) NULL,
	[IsRTL] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[IconCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Languages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsletterSubscriptions]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsletterSubscriptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[IsVerified] [bit] NOT NULL,
	[UserID] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.NewsletterSubscriptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderHistories]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderHistories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ItemPrice] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nvarchar](max) NULL,
	[TotalAmmount] [decimal](18, 2) NOT NULL,
	[PlacedOn] [datetime] NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[CustomerEmail] [nvarchar](max) NULL,
	[CustomerCountry] [nvarchar](max) NULL,
	[CustomerCity] [nvarchar](max) NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[CustomerZipCode] [nvarchar](max) NULL,
	[ModifiedOn] [datetime] NULL,
	[CustomerPhone] [nvarchar](max) NULL,
	[PaymentMethod] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[DeliveryCharges] [decimal](18, 2) NOT NULL,
	[FinalAmmount] [decimal](18, 2) NOT NULL,
	[CustomerID] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[PromoID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsGuestOrder] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](max) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.Pictures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductPictures]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPictures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PictureID] [int] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.ProductPictures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductRecords]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.ProductRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[isFeatured] [bit] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[ThumbnailPictureID] [int] NOT NULL DEFAULT ((0)),
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[Discount] [decimal](18, 2) NULL,
	[Cost] [decimal](18, 2) NULL,
	[SKU] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[Barcode] [nvarchar](max) NULL,
	[Supplier] [nvarchar](max) NULL,
	[StockQuantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductSpecifications]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSpecifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[ModifiedOn] [datetime] NULL,
	[ProductRecordID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ProductSpecifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promoes]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promoes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Code] [nvarchar](50) NULL,
	[PromoType] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[ValidTill] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Promoes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/02/2021 9:01:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PictureID] [int] NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[ZipCode] [nvarchar](max) NULL,
	[RegisteredOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (1, NULL, 0, N'uncategorized', CAST(N'2020-08-06 08:05:19.473' AS DateTime), 0, 0, 0, NULL)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (2, NULL, 1, N'headphones', CAST(N'2020-05-16 23:57:01.480' AS DateTime), 0, 0, 0, 173)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (3, 4, 1, N'stands', CAST(N'2020-08-06 08:07:55.630' AS DateTime), 0, 0, 0, 172)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (4, NULL, 1, N'chargers', CAST(N'2020-08-06 08:08:16.297' AS DateTime), 0, 0, 0, 175)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (5, NULL, 1, N'cables', CAST(N'2020-08-06 08:09:10.083' AS DateTime), 0, 0, 0, NULL)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (6, NULL, 1, N'adapters', CAST(N'2020-08-06 08:09:18.553' AS DateTime), 0, 0, 0, NULL)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (7, 4, 1, N'car-chargers', CAST(N'2020-08-06 08:08:30.440' AS DateTime), 0, 0, 0, NULL)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (8, NULL, 1, N'powerbanks', CAST(N'2020-08-06 08:09:26.257' AS DateTime), 0, 0, 0, NULL)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (9, NULL, 1, N'cases', CAST(N'2020-08-06 08:09:49.383' AS DateTime), 0, 0, 0, NULL)
GO
INSERT [dbo].[Categories] ([ID], [ParentCategoryID], [isFeatured], [SanitizedName], [ModifiedOn], [DisplaySeqNo], [IsActive], [IsDeleted], [PictureID]) VALUES (10, 9, 1, N'grips', CAST(N'2020-08-06 08:09:57.630' AS DateTime), 0, 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryRecords] ON 

GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (1, CAST(N'2020-08-06 08:05:19.477' AS DateTime), 1, 1, N'Uncategorized', NULL, N'Products that are not categorized. uncategorised, unclassified - not arranged in any specific grouping.', 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (2, CAST(N'2020-08-06 08:05:19.477' AS DateTime), 1, 2, N'غير مصنف', NULL, N'المنتجات غير المصنفة. غير مصنفة ، غير مصنفة - غير مرتبة في أي مجموعة محددة.', 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (3, NULL, 2, 1, N'Headphones ', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (4, CAST(N'2020-08-06 08:07:55.647' AS DateTime), 3, 1, N'Stands', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (5, CAST(N'2020-08-06 08:08:16.300' AS DateTime), 4, 1, N'Chargers', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (6, CAST(N'2020-08-06 08:09:10.087' AS DateTime), 5, 1, N'Cables', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (7, CAST(N'2020-08-06 08:09:18.557' AS DateTime), 6, 1, N'Adapters', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (8, CAST(N'2020-08-06 08:08:30.447' AS DateTime), 7, 1, N'Car Chargers', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (9, CAST(N'2020-08-06 08:09:26.260' AS DateTime), 8, 1, N'Powerbanks', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (10, CAST(N'2020-08-06 08:09:49.383' AS DateTime), 9, 1, N'Cases', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (11, CAST(N'2020-08-06 08:09:57.637' AS DateTime), 10, 1, N'Grips', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (12, NULL, 2, 2, N'سماعات الرأس', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (14, NULL, 3, 2, N'شاحن متنقل', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (15, NULL, 4, 2, N'شاحن', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (16, NULL, 5, 2, N'برقية', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (17, NULL, 6, 2, N'محول', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (18, NULL, 7, 2, N'شاحن السيارة', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (19, NULL, 8, 2, N'أداة للشحن', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (20, NULL, 9, 2, N'غلاف', NULL, NULL, 0, 0)
GO
INSERT [dbo].[CategoryRecords] ([ID], [ModifiedOn], [CategoryID], [LanguageID], [Name], [Summary], [Description], [IsActive], [IsDeleted]) VALUES (21, NULL, 10, 2, N'السيطرة', NULL, NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[CategoryRecords] OFF
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'AddressLine1', N'Your Store, Your Address, Your Block,', N'Add Address Line 1 of your company.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'AddressLine2', N'Your City, Your Country Your P.O. Box', N'Add Address Line 2 of your company.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'AdminEmailAddress', N'contact@email.com', N'Add email address on which you want to receive notifications related to your store.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'ApplicationIntro', N'eCommerce MVC is an extendable, adaptable eCommerce project developed with C# ASP .Net MVC framework. It has all the features a fully functional online shopping website requires.', N'Add description about application. This will be displayed in the footer of website.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'ApplicationName', N'Your Store', N'This is the application name that will be used accross the site.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'AuthorizeNet_ApiLoginID', N'', N'This is ApiLoginID which is used for logging in to Authorize .Net API.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'AuthorizeNet_ApiTransactionKey', N'', N'This is ApiTransactionKey which is used in Authorize .Net API Calls.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'AuthorizeNet_SandBox', N'true', N'Set value to true to enable AuthorizeNet in SandBox or set value to false to disable AuthorizeNet in SandBox.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'CurrencySymbol', N'$', N'This currency symbol is shown with prices on website and invoices.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'DigitsAfterDecimalPoint', N'2', N'Set the value to any number to display number of digits after decimal points in amounts accross the site.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'Email', N'contact@email.com', N'Add email address of your company.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'EnableCashOnDeliveryMethod', N'true', N'Set value to true to enable Cash on Delivery Method or set value to false to disable Cash on Delivery Method.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'EnableCreditCardPayment', N'true', N'Set value to true to enable Credit card payments or set value to false to disable credit card payments.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'EnableMultilingual', N'true', N'Set value to true to enable Multi Language Features or set value to false to disable Multi Language.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'EnablePayPalPaymentMethod', N'false', N'Set value to true to enable PayPal Payment Method or set value to false to disable PayPal Method. You should also supply PayPal client id in order for paypal payment gateway to work.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'FacebookMessengerScript', N'', N'Add Facebook Messenger script code for messenger chat.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'FacebookURL', N'https://www.facebook.com/SajjadArifGul', N'Add Facebook Page URL of your company.', 4, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'FlatDeliveryCharges', N'0', N'Set the value for Delivery Charges. This is flat delivery charges rate.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'GoogleAnalyticsScript', N'', N'Add Google Analytics script code for site traffic analysis.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'InstagramURL', N'https://www.linkedin.com/in/sajjadarifgul', N'Add Instagram Page URL of your company.', 4, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'LinkedInURL', N'https://www.linkedin.com/in/sajjadarifgul', N'Add LinkedIn Page URL of your company.', 4, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'MobileNumber', N'+923320307817', N'Add Mobile Number of your company.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'PayPalClientID', N'', N'Add your PayPal client ID to use PayPal Payment Method. You should also enable PayPal Payment Method in order for paypal payment gateway to work.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'PhoneNumber', N'0123456789', N'Add Phone Number of your company.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'PriceCurrencyPosition', N'{price}{currency}', N'This configuration will set price and currency relation accross the website. {price} will be replaced with the price value and {currency} will be replaced by configured currency symbol.', 5, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'SendGrid_APIKey', N'', N'Send Grid API Key used to connect to SendGrid services to send emails.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'SendGrid_FromEmailAddress', N'info@ecommercemvc.com', N'This is the email address that is displayed in email header to users when they recive Email via SendGrid Email.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'SendGrid_FromEmailAddressName', N'eCommerce Team', N'This name is displayed on Email sent via SendGrid Email.', 1, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'Slider1', N'#IMG#site/sliders/slider1.jpg#TH#Welcome to eCommerce MVC#PG#eCommerce MVC is an extendable, adaptable eCommerce project developed with C# ASP .Net MVC framework. It has all the features a fully functional online shopping website requires.#LK#/en/search', N'This is the first slider that will be displayed on the home page.', 2, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'Slider2', N'#IMG#site/sliders/slider2.jpg#TH#Welcome to eCommerce MVC#PG#eCommerce MVC is an extendable, adaptable eCommerce project developed with C# ASP .Net MVC framework. It has all the features a fully functional online shopping website requires.#LK#/en/search', N'This is the second slider that will be displayed on the home page.', 2, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'Slider3', N'#IMG#site/sliders/slider3.jpg#TH#Welcome to eCommerce MVC#PG#eCommerce MVC is an extendable, adaptable eCommerce project developed with C# ASP .Net MVC framework. It has all the features a fully functional online shopping website requires.#LK#/en/search', N'This is the third slider that will be displayed on the home page.', 2, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'TwitterURL', N'https://twitter.com/SajjadArifGul', N'Add Twitter Page URL of your company.', 4, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'TwitterUsername', N'SajjadArifGul', N'Add Twitter Username of your company.', 4, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'WhatsAppNumber', N'923320307817', N'Add WhatsApp number of your company.', 4, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
INSERT [dbo].[Configurations] ([Key], [Value], [Description], [ConfigurationType], [ModifiedOn]) VALUES (N'YouTubeURL', N'https://www.youtube.com/SajjadArifGul', N'Add YouTube Page URL of your company.', 4, CAST(N'2020-08-06 08:05:19.503' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LanguageResources] ON 

GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Menu', 1, N'Menu', 1, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Message.Success', 1, N'Success!', 2, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Message.Warning', 1, N'Warning!', 3, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Message.Error', 1, N'Error!', 4, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Message.Thanks', 1, N'Thanks', 5, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Message.GenericErrorMessage', 1, N'An error has occurred.', 6, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Message.OK', 1, N'OK', 7, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.SearchPlaceholder', 1, N'What are you looking for?', 8, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.HiUser', 1, N'Hi {user}!', 9, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Account', 1, N'Account', 10, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Categories', 1, N'Categories', 11, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Home', 1, N'Home', 12, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Products', 1, N'Products', 13, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Tracking', 1, N'Tracking', 14, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Checkout', 1, N'Checkout', 15, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.ShoppingCart', 1, N'Cart', 16, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Dashboard', 1, N'Dashboard', 17, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Profile', 1, N'Profile', 18, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.LogOff', 1, N'LogOff', 19, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Header.Menu.Login', 1, N'Login', 20, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Information', 1, N'Information', 21, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Information.AboutUs', 1, N'About Us', 22, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Information.ContactUs', 1, N'Contact Us', 23, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Information.PrivacyPolicy', 1, N'Privacy Policy', 24, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Information.RefundPolicy', 1, N'Refund Policy', 25, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Information.TermsAndConditions', 1, N'Terms and Conditions', 26, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Account', 1, N'Account', 27, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Account.MyProfile', 1, N'My Profile', 28, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Account.MyOrders', 1, N'My Orders', 29, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Account.TrackOrder', 1, N'Track Order', 30, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Account.MyCart', 1, N'My Cart', 31, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.Account.Checkout', 1, N'Checkout', 32, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.NewsLetter', 1, N'Join our News Letter', 33, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.NewsLetter.GetOurEmailUpdates', 1, N'Get email updates about our special offers.', 34, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.NewsLetter.EnterYourEmailPlaceholder', 1, N'Enter your email address.', 35, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.NewsLetter.Subscribe', 1, N'Subscribe', 36, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Footer.CopyrightsMessage', 1, N'{application} {date}. All rights reserved.', 37, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.AddToCart', 1, N'Add to cart', 38, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.ViewProduct', 1, N'View', 39, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.NoProductsInCart', 1, N'No Products in cart.', 40, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.CartTotal', 1, N'Cart Total', 41, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.CartDetails', 1, N'Cart Details', 42, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.Checkout', 1, N'Checkout', 43, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.ItemAddingToCart', 1, N'Adding product to cart', 44, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.ItemAddedToCart', 1, N'Product added to cart.', 45, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.CartItemQuantityUpdated', 1, N'Product quantity updated.', 46, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Shopping.ItemNotFound', 1, N'Product not found.', 47, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Title', 1, N'eCommerce Website in ASP .Net MVC', 48, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Description', 1, N'This demo ecommerce website is developed with ASP .Net MVC and C# as server side programming language. Check all the eCommerce features here.', 49, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.FeaturedCategories.BrowseCategoryProducts', 1, N'Browse {category} products.', 50, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.FeaturedCategories.DiscoverMoreProducts', 1, N'Discover More', 51, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.FeaturedCategories.Products.Featured', 1, N'Featured', 52, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.SearchMoreProducts', 1, N'Search More Products', 53, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Showcase.FastDelivery', 1, N'Fast Delivery', 54, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Showcase.OnTimeDelivery', 1, N'100% Delivery on Time', 55, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Showcase.247Support', 1, N'24/7 Support', 56, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Showcase.AlwaysReadyToHelp', 1, N'Always Ready to Help', 57, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Showcase.SecurePayments', 1, N'Secure Payments', 58, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Showcase.SecurePaymentOptions', 1, N'Secure Payment Options', 59, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Home.Showcase.OurPartners', 1, N'Our Partners', 60, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.Title', 1, N'Search Products on {application}', 61, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.TitleWithCategory', 1, N'Search {category} Products on {application}', 62, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.Description', 1, N'This demo ecommerce website is developed with ASP .Net MVC and C# as server side programming language. Check all the eCommerce features here.', 63, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.SearchProducts', 1, N'Search Products', 64, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.SearchProductsPlaceholder', 1, N'Search Products', 65, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.Categories', 1, N'Categories', 66, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.Categories.AllCategories', 1, N'All Categories', 67, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.PriceRange', 1, N'Price Range', 68, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.Filter', 1, N'Filter', 69, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.Reset', 1, N'Reset', 70, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.SortBy', 1, N'Sort By: {sortby}', 71, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.SortBy.LatestProducts', 1, N'Latest Products', 72, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.SortBy.PriceLowToHigh', 1, N'Price - Low to High', 73, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.SortBy.PriceHighToLow', 1, N'Price - High to Low', 74, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.ShowNoOfProduct', 1, N'Show {number} Products', 75, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.ShowingProductRange', 1, N'Showing {startingIndex} to {endingIndex} of {total}', 76, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.Products.Featured', 1, N'Featured', 77, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Search.ProductsNotFound', 1, N'Sorry! No products found.', 78, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.AverageRatingCount', 1, N'Average Rating: {averageRating} Stars from {totalComments} comments', 79, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Description', 1, N'Description', 80, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.ProductSpecifications', 1, N'Product Specifications', 81, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Reviews', 1, N'Reviews', 82, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comment', 1, N'Comment', 83, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments', 1, N'Comments', 84, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.UserRating', 1, N'User Rating: {commentRating}', 85, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.NoCommentsOnProduct', 1, N'There are no comments on this products. Be the first to comment on it.', 86, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.LeaveComment', 1, N'Leave a Comment', 87, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.YourRating', 1, N'Your Rating', 88, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Star', 1, N'Star', 89, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.CommentPlaceholder', 1, N'Write your comment.', 90, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.LeaveYourComment', 1, N'Leave Comment', 91, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.LoginToComment', 1, N'You need to login to leave comments.', 92, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments.Validations.TextRequired', 1, N'Please add a valid comment.', 93, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments.Validations.TextMinLength', 1, N'Minimum Length is {min}.', 94, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments.Validations.TextMaxLength', 1, N'Maximum Length is {max}.', 95, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments.Validations.EntityRequired', 1, N'Comment type not identified.', 96, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments.Validations.RecordIDRequired', 1, N'Comment Record not identified.', 97, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.CommentDeleteWarning', 1, N'Are you sure you want to delete this comment?', 98, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.CommentDeleteConfirm', 1, N'Yes, delete it!', 99, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.CommentDeleteCancel', 1, N'No, Dont delete.', 100, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments.Validations.NotAuthorizedToDeleteComment', 1, N'You are not authorzed to delete this comment.', 101, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.Comments.Validations.UnableToDeleteComment', 1, N'Unable to delete comment.', 102, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.FeaturedProducts', 1, N'Featured Products', 103, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.RelatedProducts', 1, N'Related Products', 104, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ProductDetails.RelatedProductsFeatured', 1, N'Featured', 105, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Title', 1, N'Track Order', 106, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Description', 1, N'You can check the status of your order. Please enter the order ID and you will get information related to your order.', 107, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderID', 1, N'Order ID', 108, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderIDPlaceholder', 1, N'Enter Order ID to track', 109, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.TrackOrder', 1, N'Track Order', 110, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderPlacedSuccessMessage', 1, N'Thank You. Your order has been placed. You can access your order details anytime in your orders section in profile.', 111, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.PrintInvoice', 1, N'Print Invoice', 112, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus', 1, N'Order Status', 113, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.Placed', 1, N'Placed', 114, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.Processing', 1, N'Processing', 115, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.Delivered', 1, N'Delivered', 116, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.Failed', 1, N'Failed', 117, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.Cancelled', 1, N'Cancelled', 118, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.OnHold', 1, N'OnHold', 119, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.WaitingForPayment', 1, N'Waiting For Payment', 120, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderStatus.Refunded', 1, N'Refunded', 121, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.PaymentMethod', 1, N'Payment Method', 122, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.PaymentMethods.CreditCard', 1, N'Credit Card', 123, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.PaymentMethods.PayPal', 1, N'PayPal', 124, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.PaymentMethods.CashOnDelivery', 1, N'Cash On Delivery', 125, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Date', 1, N'Date', 126, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.UpdatedOn', 1, N'Updated On', 127, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderUniqueCode', 1, N'Order Unique Code', 128, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderDetails', 1, N'Order Details', 129, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Item', 1, N'Item', 130, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Price', 1, N'Price', 131, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Quantity', 1, N'Quantity', 132, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Total', 1, N'Total', 133, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.SubTotal', 1, N'Sub Total', 134, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.Discount', 1, N'Discount', 135, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.ShippingCharges', 1, N'Shipping Charges', 136, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.DeliveryCharges', 1, N'Delivery Charges', 137, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.FinalTotal', 1, N'Final Total', 138, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.PromoApplied', 1, N'Promo Applied {promocode}.', 139, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.ContactDetails', 1, N'Contact Details', 140, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.CustomerName', 1, N'Customer Name', 141, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.CustomerEmail', 1, N'Customer Email', 142, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.CustomerPhone', 1, N'Customer Phone', 143, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.GuestOrder', 1, N'Guest Order', 144, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.ShippingDetails', 1, N'Shipping Details', 145, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.ShippingCountry', 1, N'Country', 146, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.ShippingCity', 1, N'City', 147, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.ShippingAddress', 1, N'Address', 148, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.ShippingZipCode', 1, N'Zip Code', 149, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderHistory', 1, N'Order History', 150, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderTrackingNotAccessible', 1, N'Sorry! you can not check this order details.', 151, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Tracking.OrderCantBeTracked', 1, N'Sorry! We can not track your order details.', 152, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.Title', 1, N'Your Shopping Cart', 153, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.Description', 1, N'Details of your shopping cart.', 154, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ItemImage', 1, N'Image', 155, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ItemName', 1, N'Item', 156, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ItemPrice', 1, N'Price', 157, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ItemQuantity', 1, N'Quantity', 158, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ItemTotal', 1, N'Total', 159, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.RemoveItem', 1, N'Remove Item', 160, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.EnterPromoCode', 1, N'Enter Voucher/Promo Code', 161, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ApplyPromo', 1, N'Apply', 162, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.PromoAppliedSuccessfully', 1, N'Success. Enjoy discount of {discount}.', 163, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.PromoExpired', 1, N'Sorry. This promo/voucher has expired.', 164, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.InvalidPromo', 1, N'Invalid promo/voucher.', 165, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.UpdateCart', 1, N'Update Cart', 166, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ContinueShopping', 1, N'Continue Shopping', 167, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.SubTotal', 1, N'Sub Total', 168, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.Discount', 1, N'Discount', 169, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ShippingCharges', 1, N'Shipping Charges', 170, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.Total', 1, N'Final Total', 171, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Cart.ProceedToCheckout', 1, N'Process to Checkout', 172, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Title', 1, N'Checkout', 173, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Description', 1, N'Checkout with your shopping cart products.', 174, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.ContactDetails', 1, N'Contact Details', 175, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.ShippingDetails', 1, N'Shipping Details', 176, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Payment', 1, N'Payment', 177, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.YourOrder', 1, N'Your Order', 178, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Product', 1, N'Product', 179, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Total', 1, N'Total', 180, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.ItemQuantity', 1, N'Quantity', 181, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.SubTotal', 1, N'Sub Total', 182, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Discount', 1, N'Discount', 183, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PromoApplied', 1, N'Promo Applied: {promocode}', 184, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.HavePromoApplyHere', 1, N'Have a promo? Apply here.', 185, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.ShippingCharges', 1, N'Shipping Charges', 186, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Total', 1, N'Total', 187, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.ModifyCartItemsHere', 1, N'Modify cart items here.', 188, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.NoProductsInCart', 1, N'No products in the cart. Please add some products in cart.', 189, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.FullName', 1, N'Full Name', 190, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Email', 1, N'Email', 191, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PhoneNumber', 1, N'Phone Number', 192, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreateAccount', 1, N'Create an account?', 193, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.AlreadyHaveAccount', 1, N'Already have an account? Login.', 194, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreateAccount.Validations.FullNameRequired', 1, N'Full Name is required.', 195, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreateAccount.Validations.FullNameMinimumLength', 1, N'Minimum Length is {min}.', 196, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreateAccount.Validations.FullNameMaximumLength', 1, N'Maximum Length is {max}.', 197, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreateAccount.Validations.ProvideValidEmail', 1, N'Provide a valid email address.', 198, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreateAccount.Validations.EmailRequired', 1, N'Email is required', 199, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Country', 1, N'Country', 200, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.City', 1, N'City', 201, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Address', 1, N'Address', 202, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.ZipCode', 1, N'Zip Code', 203, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Shipping.Validations.CountryRequired', 1, N'Country is required.', 204, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Shipping.Validations.CityRequired', 1, N'City is required.', 205, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Shipping.Validations.AddressRequired', 1, N'Address is required.', 206, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Shipping.Validations.ZipCodeRequired', 1, N'Zip Code is required.', 207, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PayViaCreditCard', 1, N'Pay via Credit Card', 208, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardHolderName', 1, N'Card Holders Name', 209, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardNumber', 1, N'Card Number', 210, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardExpiryDate', 1, N'Card Expiry Date', 211, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardExpiryMonth', 1, N'Card Expiry Month', 212, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardExpiryYear', 1, N'Card Expiry Year', 213, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardCVC', 1, N'CVC', 214, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardInfoNotSaved', 1, N'Rest assured that we do not store your credit card details on our servers.', 215, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CardPayNow', 1, N'Pay Now', 216, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreditCard.Validations.CardHolderNameRequired', 1, N'Card Holders Name is required.', 217, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreditCard.Validations.CardNumberRequired', 1, N'Card Number is required.', 218, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreditCard.Validations.CardNumberMustBeValid', 1, N'Card Number must be valid.', 219, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreditCard.Validations.CardExpiryMonthRequired', 1, N'Card Expiry Month is required.', 220, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreditCard.Validations.CardExpiryYearRequired', 1, N'Card Expiry Year is required.', 221, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreditCard.Validations.CVCRequired', 1, N'CVC number is required.', 222, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.CreditCard.Validations.CVCMustBeValid', 1, N'CVC must be numeric.', 223, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PayViaCashOnDelivery', 1, N'Pay via Cash on Delivery', 224, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PlaceOrder', 1, N'Place Order', 225, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PayViaPayPal', 1, N'Pay via PayPal', 226, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PayPalAmountNote', 1, N'You will pay ''{amount}'' in {currency} via PayPal.', 227, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.PayPal.ConfirmOrderAgain', 1, N'Confirm Order', 228, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Validations.PayPalOrderIssue', 1, N'PayPal order details not found.', 229, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.Validations.PleaseCompleteRequiredFields', 1, N'Please complete the required fields.', 230, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Checkout.OrderPlacedSuccessfully', 1, N'Your order has been placed successfuly.', 231, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Title', 1, N'Register Account', 232, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Description', 1, N'Register your account on {application}.', 233, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.FullName', 1, N'Full Name', 234, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.FullNamePlaceholder', 1, N'Full Name', 235, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Email', 1, N'Email', 236, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.EmailPlaceholder', 1, N'Email', 237, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Username', 1, N'Username', 238, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.UsernamePlaceholder', 1, N'Username', 239, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Password', 1, N'Password', 240, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.PasswordPlaceholder', 1, N'Password', 241, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.ConfirmPassword', 1, N'Confirm Password', 242, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.ConfirmPasswordPlaceholder', 1, N'Confirm Password', 243, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.RegisterAccount', 1, N'Register', 244, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.LoginAccount', 1, N'Or Login With Existing Account', 245, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Validation.FullNameRequired', 1, N'Full Name is required.', 246, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Validation.UsernameRequired', 1, N'Username is required.', 247, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Validation.EmailRequired', 1, N'Email is required.', 248, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Validation.EmailFormat', 1, N'Please provide a valid email.', 249, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Validation.PasswordRequired', 1, N'Password is required.', 250, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Validation.ConfirmPasswordRequired', 1, N'Confirm Password is required.', 251, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Register.Validation.PasswordNotMatched', 1, N'Password and Confirm Password not matched.', 252, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Title', 1, N'Account Login', 253, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Description', 1, N'Login to your account on {application}.', 254, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Username', 1, N'Username', 255, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.UsernamePlaceholder', 1, N'Username', 256, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Password', 1, N'Password', 257, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.PasswordPlaceholder', 1, N'Password', 258, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.RememberMe', 1, N'Remember Me', 259, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.ForgotPassword', 1, N'Forgot Your Password?', 260, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.LoginAccount', 1, N'Login', 261, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.RegisterAccount', 1, N'Or Register New Account', 262, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Validation.UsernameRequired', 1, N'Please enter your accout username.', 263, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Validation.PasswordRequired', 1, N'Please enter your accout password.', 264, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Validation.InvalidLoginAttempt', 1, N'Invalid login attempt.', 265, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.Login.Validation.LockedOut', 1, N'You are locked out.', 266, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ForgotPassword.Title', 1, N'Forgot Password', 267, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ForgotPassword.Description', 1, N'Recover your {application} account.', 268, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ForgotPassword.Username', 1, N'Username', 269, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ForgotPassword.UsernamePlaceholder', 1, N'Username', 270, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ForgotPassword.Validation.UsernameRequired', 1, N'Username is required.', 271, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ForgotPassword.RecoverAccount', 1, N'Recover Account', 272, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ForgotPassword.PasswordResetEmailSuccess', 1, N'Please check your email. A password reset link has been sent to your accounts email.', 273, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.Title', 1, N'Reset Password', 274, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.Description', 1, N'Reset password for your account on {application}.', 275, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.Password', 1, N'Password', 276, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.PasswordPlaceholder', 1, N'Password', 277, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.ConfirmPassword', 1, N'Confirm Password', 278, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.ConfirmPasswordPlaceholder', 1, N'Confirm Password', 279, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.ResetPassword', 1, N'Reset Password', 280, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.LoginAccount', 1, N'Login to Account', 281, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.Validation.PasswordRequired', 1, N'Password is required.', 282, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.Validation.ConfirmPasswordRequired', 1, N'Confirm Password is required.', 283, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.ResetPassword.Validation.PasswordNotMatched', 1, N'Password and Confirm Password not matched.', 284, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Title', 1, N'User Profile', 285, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Description', 1, N'Review your profile and related data on {application}.', 286, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Username', 1, N'Username', 287, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info', 1, N'Info', 288, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword', 1, N'Change Password', 289, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangeAvatar', 1, N'Change Avatar', 290, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Orders', 1, N'Orders', 291, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Comments', 1, N'Comments', 292, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.FullName', 1, N'Full Name', 293, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Email', 1, N'Email', 294, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Username', 1, N'Username', 295, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.PhoneNumber', 1, N'Phone Number', 296, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Country', 1, N'Country', 297, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.City', 1, N'City', 298, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Address', 1, N'Address', 299, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.ZipCode', 1, N'Zip Code', 300, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.UpdateInfo', 1, N'Update Info', 301, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.UserInfoUpdated', 1, N'User info updated.', 302, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.FullNameRequired', 1, N'Full Name is required.', 303, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.FullNameMin', 1, N'Minimum Length is {min}.', 304, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.FullNameMax', 1, N'Maximum Length is {max}.', 305, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.EmailFormat', 1, N'Please provide a valid email.', 306, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.EmailRequired', 1, N'Email address is required.', 307, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.UsernameRequired', 1, N'Username is required.', 308, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.CountryRequired', 1, N'Country is required.', 309, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.CityRequired', 1, N'City is required.', 310, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.AddressRequired', 1, N'Address is required.', 311, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.Info.Validations.ZipCodeRequired', 1, N'Zip Code is required.', 312, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.CurrentPassword', 1, N'Current Password', 313, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.NewPassword', 1, N'New Password', 314, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.ConfirmPassword', 1, N'Confirm Password', 315, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.UpdatePassword', 1, N'Update Password', 316, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.Validations.OldPasswordRequired', 1, N'Old Password is required.', 317, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.Validations.NewPasswordRequired', 1, N'New Password is required.', 318, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.Validations.ConfirmPasswordRequired', 1, N'Confirm Password is required.', 319, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.Validations.PasswordsNotMatched', 1, N'New Password and Confirm Password are not matched.', 320, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangePassword.PasswordsUpdated', 1, N'Password updated successfully.', 321, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangeAvatar.Avatar', 1, N'Avatar', 322, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangeAvatar.SelectAvatar', 1, N'Select Avatar', 323, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangeAvatar.UpdateAvatar', 1, N'Update Avatar', 324, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangeAvatar.AvatarUpdated', 1, N'Avatar updated successfully.', 325, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.ChangeAvatar.Validations.SelectAvatar', 1, N'Please select a picture.', 326, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderIDPlaceholder', 1, N'Search by Order ID', 327, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.SelectByOrderStatus', 1, N'Select by Order Status…', 328, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.Placed', 1, N'Placed', 329, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.Processing', 1, N'Processing', 330, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.Delivered', 1, N'Delivered', 331, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.Failed', 1, N'Failed', 332, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.Cancelled', 1, N'Cancelled', 333, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.OnHold', 1, N'OnHold', 334, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.WaitingForPayment', 1, N'Waiting For Payment', 335, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderStatus.Refunded', 1, N'Refunded', 336, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.SearchOrders', 1, N'Search', 337, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.Reset', 1, N'Reset', 338, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderID', 1, N'Order ID', 339, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.PlacedOnDate', 1, N'Placed On Date', 340, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.OrderAmount', 1, N'Order Amount', 341, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.Status', 1, N'Status', 342, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.Actions', 1, N'Actions', 343, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.UpdatedOn', 1, N'Updated On', 344, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.Track', 1, N'Track', 345, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.Previous', 1, N'Previous', 346, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.Next', 1, N'Next', 347, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserOrders.NoOrdersFound', 1, N'No Orders found.', 348, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.SearchCommentsPlaceholder', 1, N'Search in Comments', 349, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.SearchComments', 1, N'Search', 350, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.Reset', 1, N'Reset', 351, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.CommentUserName', 1, N'{user}', 352, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.CommentTimestamp', 1, N'{datetime}', 353, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.DeleteComment', 1, N'Delete Comment', 354, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.CommentDeleteWarning', 1, N'Are you sure you want to delete this comment?', 355, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.CommentDeleteConfirm', 1, N'Yes, delete it!', 356, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.CommentDeleteCancel', 1, N'No, Dont delete.', 357, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.Previous', 1, N'Previous', 358, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.Next', 1, N'Next', 359, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.UserProfile.UserComments.NoCommentsFound', 1, N'No comments found.', 360, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Title', 1, N'Print Invoice Order : {orderid}', 361, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Description', 1, N'Print invoice for your order.', 362, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.OrderID', 1, N'Order ID', 363, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Dated', 1, N'Dated', 364, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Status', 1, N'Status', 365, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.CustomerInformation', 1, N'Customer Information', 366, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.PaymentDetails', 1, N'Payment Details', 367, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.PaymentMethod', 1, N'Payment Method', 368, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.TransactionID', 1, N'Transaction ID', 369, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.OrderID', 1, N'Order ID', 370, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Code', 1, N'Code', 371, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Product', 1, N'Product', 372, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Price', 1, N'Price', 373, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Quantity', 1, N'Quantity', 374, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Total', 1, N'Total', 375, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.PromoApplied', 1, N'Promo Applied: {promo}', 376, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.TotalAmount', 1, N'Total Amount', 377, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.Discount', 1, N'Discount', 378, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.ShippingCharges', 1, N'Shipping', 379, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.FinalAmount', 1, N'Final Amount', 380, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.GuestOrder', 1, N'Guest Order', 381, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_PP.PrintInvoice.NotAccessible', 1, N'Sorry! you can not check this order details.', 382, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard', 1, N'Dashboard', 383, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Commons.RecordNotSpecifiedInCurrentLanguage', 1, N'This record is not specified in current language.', 384, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Commons.ParentCategoryRecordNotSpecifiedInCurrentLanguage', 1, N'Parent Category not specified in the current language.', 385, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Commons.CategoryRecordNotSpecifiedInCurrentLanguage', 1, N'This category name is not specified in the current language.', 386, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.Success', 1, N'Success!', 387, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.Warning', 1, N'Warning!', 388, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.Error', 1, N'Error!', 389, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.Thanks', 1, N'Thanks', 390, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.GenericErrorMessage', 1, N'An error has occurred.', 391, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.ConfirmDeleteWarning', 1, N'Are you sure you want to delete this record?', 392, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.ConfirmDelete', 1, N'Confirm', 393, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.CancelDelete', 1, N'Cancel', 394, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Message.OK', 1, N'OK', 395, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Pagination.Previous', 1, N'Previous', 396, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Pagination.Next', 1, N'Next', 397, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Home', 1, N'Home', 398, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Dashboard', 1, N'Dashboard', 399, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Categories', 1, N'Categories', 400, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Products', 1, N'Products', 401, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Promos', 1, N'Promos', 402, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Orders', 1, N'Orders', 403, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Comments', 1, N'Comments', 404, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Users', 1, N'Users', 405, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Roles', 1, N'Roles', 406, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Languages', 1, N'Languages', 407, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.Configurations', 1, N'Configurations', 408, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.AllConfigurations', 1, N'All Configurations', 409, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Menu.LanguageConfigurations', 1, N'Language Configurations', 410, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.TopMenu.Profile', 1, N'Profile', 411, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.TopMenu.LogOff', 1, N'Log off', 412, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.Hello', 1, N'Hello {user}!', 413, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.WelcomeToDashboard', 1, N'Welcome to {application} Dashboard. Below are a few demographics.', 414, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.TotalProducts', 1, N'Total Products', 415, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.TotalCategories', 1, N'Total Categories', 416, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.TotalOrders', 1, N'Total Orders', 417, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.TotalComments', 1, N'Total Comments', 418, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.NoOfUsers', 1, N'No. Of Users', 419, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Dashboard.NoOfRoles', 1, N'No. of Roles', 420, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Title', 1, N'Categories', 421, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Description', 1, N'Categories Listing', 422, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.SearchPlaceholder', 1, N'Search by Category Name', 423, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.SelectParentCategory', 1, N'Select Categories by Parent Category', 424, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Search', 1, N'Search', 425, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Reset', 1, N'Reset', 426, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.CreateCategory', 1, N'Create Category', 427, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.Name', 1, N'Name', 428, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.ParentCategory', 1, N'Parent Category', 429, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.Description', 1, N'Description', 430, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.Products', 1, N'Products', 431, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.Actions', 1, N'Actions', 432, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.FeaturedCategory', 1, N'Featured Category', 433, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.Edit', 1, N'Edit', 434, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.Delete', 1, N'Delete', 435, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.List.NoRecordFound', 1, N'No Categories found.', 436, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.EditCategoryTitle', 1, N'Edit Category', 437, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.EditCategoryDescription', 1, N'Edit category.', 438, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.CreateCategoryTitle', 1, N'Create Category', 439, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.CreateCategoryDescription', 1, N'Create new category.', 440, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Name', 1, N'Name', 441, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.NamePlaceholder', 1, N'Category Name', 442, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Summary', 1, N'Summary', 443, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.SummaryPlaceholder', 1, N'Add category summary.', 444, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Description', 1, N'Description', 445, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.DescriptionPlaceholder', 1, N'Add category description.', 446, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.ParentCategory', 1, N'Parent Category', 447, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.ParentCategoryNone', 1, N'None', 448, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.URL', 1, N'URL', 449, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.SelectPicture', 1, N'Select Picture', 450, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Featured', 1, N'Featured Category', 451, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Update', 1, N'Update', 452, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Delete', 1, N'Delete', 453, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Save', 1, N'Save', 454, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Cancel', 1, N'Cancel', 455, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.NameRequired', 1, N'Category Name is required.', 456, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.NameMinimumLength', 1, N'Minimum Length is {min}.', 457, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.NameMaximumLength', 1, N'Maximum Length is {length}.', 458, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.DescriptionMinimumLength', 1, N'Minimum Length is {min}.', 459, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.CategoryNotFound', 1, N'Category not found.', 460, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.UnableToUpdateCategory', 1, N'Unable to update Category.', 461, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.UnableToUpdateCategoryRecord', 1, N'Unable to update Category Record.', 462, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.UnableToCreateCategory', 1, N'Unable to create Category.', 463, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Categories.Action.Validation.UnableToDeleteCategory', 1, N'Unable to delete Category.', 464, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Title', 1, N'Products', 465, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Description', 1, N'Products Listing', 466, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.SearchPlaceholder', 1, N'Search Products by Name', 467, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.SelectByCategory', 1, N'Select By Category', 468, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Search', 1, N'Search', 469, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Reset', 1, N'Reset', 470, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.CreateProduct', 1, N'Create', 471, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.List.Name', 1, N'Name', 472, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.List.Category', 1, N'Category', 473, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.List.Summary', 1, N'Summary', 474, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.List.Price', 1, N'Price', 475, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.List.Actions', 1, N'Actions', 476, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.List.FeaturedProduct', 1, N'Featured Product', 477, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Edit', 1, N'Edit', 478, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Delete', 1, N'Delete', 479, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.List.NoRecordFound', 1, N'No Products found.', 480, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.EditProductTitle', 1, N'Edit Product', 481, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.EditProductDescription', 1, N'Edit Product.', 482, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.CreateProductTitle', 1, N'Create Product', 483, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.CreateProductDescription', 1, N'Create new product.', 484, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Name', 1, N'Name', 485, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.NamePlaceholder', 1, N'Product Name', 486, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Summary', 1, N'Summary', 487, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.SummaryPlaceholder', 1, N'Add Product Summary', 488, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Description', 1, N'Description', 489, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.DescriptionPlaceholder', 1, N'Add Product Description', 490, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.ProductSpecifications', 1, N'Product Specifications', 491, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.SpecificationTitle', 1, N'Specification Title', 492, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.SpecificationValue', 1, N'Specification Value', 493, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.AddSpecification', 1, N'Add Specification', 494, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.SpecificationAction', 1, N'Actions', 495, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.SpecificationDelete', 1, N'Delete', 496, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.NoSpecifications', 1, N'No Specifications.', 497, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Category', 1, N'Category', 498, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Price', 1, N'Price', 499, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.PricePlaceholder', 1, N'Product Price', 500, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.SelectPictures', 1, N'Select Pictures', 501, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.SetThumbnailImage', 1, N'Set as Thumbnail Image', 502, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.RemovePicture', 1, N'Remove Picture', 503, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.FeaturedProduct', 1, N'Featured Product', 504, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Update', 1, N'Update', 505, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Delete', 1, N'Delete', 506, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Save', 1, N'Save', 507, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Cancel', 1, N'Cancel', 508, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.NameRequired', 1, N'Product Name is required.', 509, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.NameMinimumLength', 1, N'Minimum Length is {min}.', 510, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.NameMaximumLength', 1, N'Maximum Length is {max}.', 511, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.CategoryRequired', 1, N'Select a Product Category.', 512, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.SummaryRequired', 1, N'Product Summary is required.', 513, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.SummaryMinimumLength', 1, N'Minimum Length is {min}.', 514, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.SummaryMaximumLength', 1, N'Maximum Length is {max}.', 515, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.DescriptionRequired', 1, N'Description is required.', 516, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.DescriptionMinimumLength', 1, N'Minimum Length is {min}.', 517, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.PriceRequired', 1, N'Price is required.', 518, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.PriceRange', 1, N'Price must be between {min} to {max}.', 519, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.ProductPicturesRequired', 1, N'Please upload atleast one product picture.', 520, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.ProductNotFound', 1, N'Product not Found.', 521, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.UnableToUpdateProduct', 1, N'Unable to update Product.', 522, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.UnableToUpdateProductRecord', 1, N'Unable to update Product Record.', 523, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.UnableToCreateProduct', 1, N'Unable to create Product.', 524, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.UnableToCreateProductRecord', 1, N'Unable to create Product Record.', 525, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Products.Action.Validation.UnableToDeleteProduct', 1, N'Unable to delete Product.', 526, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Title', 1, N'Promos', 527, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Description', 1, N'Promos Listing Page.', 528, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.SearchPlaceholder', 1, N'Search Promo', 529, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Search', 1, N'Search', 530, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Reset', 1, N'Reset', 531, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.CreatePromo', 1, N'Create Promo', 532, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.List.Name', 1, N'Name', 533, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.List.Code', 1, N'Promo Code', 534, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.List.PromoType', 1, N'Promo Type', 535, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.List.Value', 1, N'Value', 536, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.List.ValidTill', 1, N'Valid Till', 537, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.List.Actions', 1, N'Actions', 538, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.List.NoRecordFound', 1, N'No promos found.', 539, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.PromoTypes', 1, N'Promo Types', 540, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.PromoTypes.Percentage', 1, N'Percentage', 541, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.PromoTypes.Amount', 1, N'Amount', 542, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Edit', 1, N'Edit', 543, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Delete', 1, N'Delete', 544, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.EditPromoTitle', 1, N'Edit Promo', 545, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.EditPromoDescription', 1, N'Edit Promo.', 546, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.CreatePromoTitle', 1, N'Create Promo', 547, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.CreatePromoDescription', 1, N'Create new promo.', 548, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Name', 1, N'Name', 549, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.NamePlaceholder', 1, N'Add Promo Name', 550, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Description', 1, N'Description', 551, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.DescriptionPlaceholder', 1, N'Add description about promo.', 552, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Code', 1, N'Code', 553, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.CodePlaceholder', 1, N'Add Promo Code', 554, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.PromoType', 1, N'Promo Type', 555, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.AmountPromoDescription', 1, N'Amount Promo Type will give discount of specified value as amount from total amount of order.', 556, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.PercentagePromoDescription', 1, N'Percentage Promo Type will give discount of specified value in percentage of total amount of order.', 557, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Value', 1, N'Value', 558, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.ValidTill', 1, N'Valid Till', 559, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Update', 1, N'Update', 560, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Delete', 1, N'Delete', 561, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Save', 1, N'Save', 562, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Cancel', 1, N'Cancel', 563, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.NameRequired', 1, N'Name is required.', 564, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.NameMinimumLength', 1, N'Minimum Length is {min}.', 565, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.NameMaximumLength', 1, N'Maximum Length is {max}.', 566, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.PromoTypeRequired', 1, N'Please select Promo Type.', 567, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.DescriptionMinimumLength', 1, N'Minimum Length is {min}.', 568, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.CodeRequired', 1, N'Promo Code is required.', 569, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.CodeMinimumLength', 1, N'Minimum Length is {min}.', 570, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.CodeMaximumLength', 1, N'Maximum Length is {max}.', 571, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.ValueRequired', 1, N'Promo Value is required.', 572, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.ValueRange', 1, N'Value must be between {min} to {max}.', 573, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.PromoNotFound', 1, N'Promo not found.', 574, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.UnableToUpdatePromo', 1, N'Unable to update Promo.', 575, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.UnableToCreatePromo', 1, N'Unable to create Promo.', 576, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Promos.Action.Validation.UnableToDeletePromo', 1, N'Unable to delete Promo.', 577, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.Title', 1, N'Orders', 578, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.Description', 1, N'Orders Listing', 579, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.SearchByUserIDPlaceholder', 1, N'Search by User ID', 580, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.SearchByOrderIDPlaceholder', 1, N'Search by Order ID', 581, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.SearchByOrderStatus', 1, N'Search by Order Status', 582, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus', 1, N'Order Status', 583, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.Placed', 1, N'Placed', 584, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.Processing', 1, N'Processing', 585, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.Delivered', 1, N'Delivered', 586, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.Failed', 1, N'Failed', 587, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.Cancelled', 1, N'Cancelled', 588, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.OnHold', 1, N'OnHold', 589, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.WaitingForPayment', 1, N'WaitingForPayment', 590, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.OrderStatus.Refunded', 1, N'Refunded', 591, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.Search', 1, N'Search', 592, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.Reset', 1, N'Reset', 593, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.OrderID', 1, N'Order ID', 594, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.PlacedOn', 1, N'Placed On Date', 595, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.OrderAmount', 1, N'Order Amount', 596, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.PaymentMethod', 1, N'Payment Method', 597, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.Status', 1, N'Status', 598, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.Actions', 1, N'Actions', 599, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.UpdatedOn', 1, N'Updated On', 600, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.Details', 1, N'Details', 601, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.Track', 1, N'Track', 602, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.List.Invoice', 1, N'Invoice', 603, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Orders.NoOrdersFound', 1, N'No Orders found.', 604, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Title', 1, N'Orders', 605, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Description', 1, N'Orders Listing', 606, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PrintInvoice', 1, N'Print Invoice', 607, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderStatus', 1, N'Order Status', 608, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PaymentMethod', 1, N'Payment Method', 609, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PaymentMethods.CreditCard', 1, N'Credit Card', 610, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PaymentMethods.PayPal', 1, N'PayPal', 611, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PaymentMethods.CashOnDelivery', 1, N'Cash On Delivery', 612, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderTransactionID', 1, N'Transaction ID', 613, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderProcessor.AuthorizeNet', 1, N'Authorize.Net', 614, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderProcessor.PayPal', 1, N'PayPal', 615, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PlacedOn', 1, N'Placed On Date', 616, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.UpdatedOn', 1, N'Updated On', 617, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderID', 1, N'Order ID', 618, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderUniqueCode', 1, N'Order Unique Code', 619, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderDetails', 1, N'Order Details', 620, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Name', 1, N'Name', 621, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Price', 1, N'Price', 622, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Quantity', 1, N'Quantity', 623, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Total', 1, N'Total', 624, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.TotalAmount', 1, N'Total Amount', 625, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Discount', 1, N'Discount', 626, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PromoApplied', 1, N'Promo Applied: {promo}', 627, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.DeliveryCharges', 1, N'Delivery Charges', 628, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.CustomerDetails', 1, N'Customer Details', 629, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.FullName', 1, N'Full Name', 630, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Email', 1, N'Email', 631, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.PhoneNumber', 1, N'Phone Number', 632, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.ShippingDetails', 1, N'Shipping Details', 633, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Country', 1, N'Country', 634, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.City', 1, N'City', 635, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Address', 1, N'Address', 636, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.ZipCode', 1, N'Zip Code', 637, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.OrderHistory', 1, N'Order History', 638, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.Note', 1, N'Note', 639, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.UpdateStatus', 1, N'Update Status', 640, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.UpdateStatus.Validation.NoteRequired', 1, N'Note is required.', 641, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.UpdateStatus.Validation.NoteMinimumLength', 1, N'Minimum Length is {min}.', 642, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.UpdateStatus.Validation.NoteMaximumLength', 1, N'Maximum Length is {max}.', 643, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.UpdateStatus.Validation.UnableToUpdateOrderStatus', 1, N'Invalid Data. Unable to update order status.', 644, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.GuestOrder', 1, N'Guest Order', 645, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.OrderDetails.SeeAllOrdersFromCustomer', 1, N'See all orders from this customer.', 646, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.Title', 1, N'Comments', 647, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.Description', 1, N'Comments listing page.', 648, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.SearchPlaceholder', 1, N'Search in Comments', 649, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.Search', 1, N'Search', 650, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.Reset', 1, N'Reset', 651, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.CommentUserName', 1, N'{user}', 652, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.CommentTimestamp', 1, N'{datetime}', 653, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.DeleteComment', 1, N'Delete Comment', 654, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.Action.Validation.NotAuthorizedToDeleteComment', 1, N'You are not authorzed to delete this comment.', 655, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.Action.Validation.UnableToDeleteComment', 1, N'Unable to delete comment.', 656, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Comments.List.NoRecordFound', 1, N'No comments found.', 657, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.Title', 1, N'Users', 658, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.Description', 1, N'Users listing page.', 659, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.SearchPlaceholder', 1, N'Search by Username or Email', 660, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.SelectByRole', 1, N'Select by Role', 661, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.Search', 1, N'Search', 662, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.Reset', 1, N'Reset', 663, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.RegisteredOn', 1, N'Registered On', 664, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.Name', 1, N'Name', 665, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.Username', 1, N'Username', 666, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.Email', 1, N'Email', 667, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.Roles', 1, N'Roles', 668, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.Actions', 1, N'Actions', 669, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.MoreDetails', 1, N'More Details', 670, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Users.List.NoRecordFound', 1, N'No users found.', 671, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Title', 1, N'User Details', 672, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Description', 1, N'User details.', 673, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Username', 1, N'Username', 674, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Location', 1, N'Location', 675, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info', 1, N'Info', 676, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles', 1, N'Roles', 677, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders', 1, N'Orders', 678, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments', 1, N'Comments', 679, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.NoUserFound', 1, N'No User found.', 680, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.FullName', 1, N'Full Name', 681, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.PhoneNumber', 1, N'Phone Number', 682, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Country', 1, N'Country', 683, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.City', 1, N'City', 684, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Address', 1, N'Address', 685, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.ZipCode', 1, N'Zip Code', 686, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Email', 1, N'Email', 687, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Username', 1, N'Username', 688, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Update', 1, N'Update', 689, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Delete', 1, N'Delete', 690, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.FullNameRequired', 1, N'Full Name is required.', 691, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.FullNameMinimumLength', 1, N'Minimum Length is {min}.', 692, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.FullNameMaximumLength', 1, N'Maximum Length is {max}.', 693, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.CountryRequired', 1, N'Country is required.', 694, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.CityRequired', 1, N'City is required.', 695, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.AddressRequired', 1, N'Address is required.', 696, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.DataNotFormatted', 1, N'Data not formatted.', 697, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.UserNotFound', 1, N'User not found.', 698, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.UnabletoUpdateInfo', 1, N'Unable to update info.', 699, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.InfoUpdated', 1, N'Info Updated successfully.', 700, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.UnabletoDeleteUser', 1, N'Unable to delete user.', 701, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Info.Action.Validation.UserDeleted', 1, N'User Deleted successfully.', 702, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles.CurrentUserRoles', 1, N'Current User Roles', 703, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles.RemoveUserRole', 1, N'Remove Role', 704, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles.UserDoesntHaveRoles', 1, N'User doesn’t have any roles.', 705, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles.AssignNewRoles', 1, N'Assign New Role', 706, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles.SelectRole', 1, N'Select Role', 707, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles.AssignUserRole', 1, N'Assign Role', 708, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Roles.Action.Validation.SelectValidRole', 1, N'Please select a Role.', 709, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.SearchByOrderIDPlaceholder', 1, N'Search by Order ID', 710, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.SelectByOrderStatus', 1, N'Select by Order Status…', 711, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.Placed', 1, N'Placed', 712, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.Processing', 1, N'Processing', 713, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.Delivered', 1, N'Delivered', 714, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.Failed', 1, N'Failed', 715, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.Cancelled', 1, N'Cancelled', 716, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.OnHold', 1, N'On Hold', 717, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.WaitingForPayment', 1, N'Waiting For Payment', 718, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderStatus.Refunded', 1, N'Refunded', 719, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.Search', 1, N'Search', 720, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.Reset', 1, N'Reset', 721, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.PlacedOnDate', 1, N'Placed On Date', 722, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.OrderAmount', 1, N'Order Amount', 723, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.PaymentMethod', 1, N'Payment Method', 724, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.Status', 1, N'Status', 725, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.Actions', 1, N'Actions', 726, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.PaymentMethods.CreditCard', 1, N'Credit Card', 727, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.PaymentMethods.PayPal', 1, N'PayPal', 728, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.PaymentMethods.CashOnDelivery', 1, N'Cash On Delivery', 729, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.UpdatedOn', 1, N'Updated On', 730, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.Details', 1, N'Details', 731, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.Track', 1, N'Track', 732, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Orders.NoOrdersFound', 1, N'No Orders found.', 733, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments.SearchCommentsPlaceholder', 1, N'Search in Comments', 734, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments.SearchComments', 1, N'Search', 735, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments.Reset', 1, N'Reset', 736, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments.CommentUserName', 1, N'{user}', 737, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments.CommentTimestamp', 1, N'{datetime}', 738, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments.DeleteComment', 1, N'Delete Comment', 739, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.UserDetails.Comments.NoComments', 1, N'No comments found.', 740, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Title', 1, N'Roles', 741, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Description', 1, N'Roles Listing.', 742, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.SearchPlaceholder', 1, N'Search Role', 743, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Search', 1, N'Search', 744, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Reset', 1, N'Reset', 745, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.CreateRole', 1, N'Create Role', 746, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.CreateNewRole', 1, N'Create New Role', 747, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Create.Name', 1, N'Role Name', 748, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Create.NamePlaceholder', 1, N'Add Role Name', 749, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Close', 1, N'Close', 750, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Save', 1, N'Save', 751, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Save.Validations.NameRequired', 1, N'Role Name is required.', 752, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Save.Validations.NameMinimumLength', 1, N'Minimum Length is {min}.', 753, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Save.Validations.NameMaximumLength', 1, N'Maximum Length is {max}.', 754, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Role', 1, N'Role', 755, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Users', 1, N'Users', 756, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.Actions', 1, N'Actions', 757, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.MoreDetails', 1, N'More Details', 758, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Roles.NoRolesFound', 1, N'No Roles found.', 759, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Title', 1, N'Role Details', 760, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Description', 1, N'Role Details', 761, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Info', 1, N'Info', 762, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Users', 1, N'Users', 763, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Info.Name', 1, N'Name', 764, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Info.Update', 1, N'Update', 765, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Info.Delete', 1, N'Delete', 766, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Info.AdministratorRoleNotification', 1, N'This role is not allowed to be updated or deleted because it is being used for authorization.', 767, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Info.RoleInfoUpdated', 1, N'Role info updated.', 768, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Users.UsersWithRole', 1, N'Users with this Role', 769, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Users.MoreDetails', 1, N'More Details', 770, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.RoleDetails.Users.NoUsersWithRole', 1, N'This role doesnt have any users.', 771, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Title', 1, N'Configurations', 772, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Description', 1, N'Configurations listing.', 773, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.SearchPlaceholder', 1, N'Search Configurations', 774, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.SelectByConfigurationType', 1, N'Select by Configuration Type', 775, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.ConfigurationTypes.Site', 1, N'Site', 776, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.ConfigurationTypes.Sliders', 1, N'Slider', 777, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.ConfigurationTypes.Promotions', 1, N'Promotions', 778, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.ConfigurationTypes.SocialLinks', 1, N'Social Links', 779, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.ConfigurationTypes.Other', 1, N'Other', 780, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Search', 1, N'Search', 781, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Reset', 1, N'Reset', 782, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.List.Key', 1, N'Key', 783, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.List.Value', 1, N'Value', 784, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.List.ConfigurationType', 1, N'Configuration Type', 785, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.List.Actions', 1, N'Actions', 786, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.List.Edit', 1, N'Edit', 787, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.NoConfigurationFound', 1, N'No Configuration found', 788, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.EditConfiguration', 1, N'Edit Configuration', 789, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.UnableToUpdateConfigurations', 1, N'Unable to update configurations.', 790, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.Value', 1, N'Value', 791, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.SliderPicture', 1, N'Slider Picture', 792, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.Heading', 1, N'Heading', 793, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.Paragraph', 1, N'Paragraph', 794, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.LinkURL', 1, N'Link URL', 795, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.Close', 1, N'Close', 796, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.Save', 1, N'Save', 797, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.Edit.Validation.ConfigurationValueRequited', 1, N'Configuration Value is required.', 798, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Configurations.ConfigurationNotFound', 1, N'Configuration not found.', 799, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Title', 1, N'Languages', 800, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Description', 1, N'Languages listing', 801, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.SearchPlaceholder', 1, N'Search Languages', 802, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Search', 1, N'Search', 803, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Reset', 1, N'Reset', 804, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.AddLanguage', 1, N'Add Language', 805, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Icon', 1, N'Icon', 806, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Name', 1, N'Name', 807, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.ShortCode', 1, N'Short Code', 808, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Status', 1, N'Status', 809, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Actions', 1, N'Actions', 810, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.DefaultSiteLanguage', 1, N'Default Site Language', 811, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Enabled', 1, N'Enabled', 812, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Disabled', 1, N'Disabled', 813, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Edit', 1, N'Edit', 814, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Disable', 1, N'Disable', 815, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.Enable', 1, N'Enable', 816, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.ConfirmDisableWarning', 1, N'Are you sure you want to disable this language?', 817, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.ConfirmDisable', 1, N'Yes, disable it!', 818, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.ConfirmDisableCancel', 1, N'No, Dont disable.', 819, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.List.NoLanguagesFound', 1, N'No Languages found.', 820, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.EditLangaugeTitle', 1, N'Edit Language', 821, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.EditLanguageDescription', 1, N'Edit Language', 822, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.CreateLanguageTitle', 1, N'Create Language', 823, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.CreateLanguageDescription', 1, N'Create New Language', 824, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Name', 1, N'Name', 825, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ShortCode', 1, N'Short Code', 826, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Enabled', 1, N'Enabled', 827, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.MakeDefault', 1, N'Make Default Language', 828, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.IsRTL', 1, N'Is RTL', 829, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Icon', 1, N'Icon', 830, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.SelectLanguageIcon', 1, N'Select Language Icon', 831, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.SearchForIcon', 1, N'Search for Icon', 832, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.SearchIconPlaceholder', 1, N'Search with Country Short Name i.e US or GB', 833, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Update', 1, N'Update', 834, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Disable', 1, N'Disable', 835, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Enable', 1, N'Enable', 836, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Save', 1, N'Save', 837, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Cancel', 1, N'Cancel', 838, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.NameRequired', 1, N'Name is required.', 839, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.NameMinimumLength', 1, N'Minimum Length is {min}.', 840, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.NameMaximumLength', 1, N'Maximum Length is {max}.', 841, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.ShortCodeRequired', 1, N'Short Code is required.', 842, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.ShortCodeMinimumLength', 1, N'Minimum Length is {min}.', 843, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.ShortCodeMaximumLength', 1, N'Maximum Length is {max}.', 844, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ImportResources', 1, N'Import Resources', 845, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ChooseFile', 1, N'Choose File', 846, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Import', 1, N'Import', 847, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ExportResources', 1, N'Export Resources', 848, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ExportLanguageResources', 1, N'Export Language Resources', 849, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Export', 1, N'Export', 850, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ExportNoResourcesWarning', 1, N'This language doesn''t have any resources. Please import the language pack.', 851, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ResourcesImportedSuccess', 1, N'Resources have been imported successfully.', 852, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.ResourcesExportingWarning', 1, N'Preparing resource file can take some time. Please wait while the system generate the download file.', 853, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.SelectFileToUpload', 1, N'Please select a file to upload.', 854, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.SelectValidFileToUpload', 1, N'Please upload a file with correct format.', 855, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.LanguageNotFound', 1, N'Language not found.', 856, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.DefaultLanguageIsMust', 1, N'There must be a default language. Please set another language as Default and then update this language.', 857, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.UnableToUpdateLanguage', 1, N'Unable to update Language.', 858, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.UnableToCreateLanguage', 1, N'Unable to create Language.', 859, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.DefaultLanguageCantBeDisabled', 1, N'The default language can not be made disabled.', 860, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.NoResourcesInFile', 1, N'No Resources found in the file.', 861, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'1_Dashboard.Languages.Action.Validation.UnableToImportResources', 1, N'Unable to import resources.', 862, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Menu', 2, N'القائمة', 863, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Message.Success', 2, N'نجاح!', 864, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Message.Warning', 2, N'تحذير!', 865, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Message.Error', 2, N'خطأ!', 866, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Message.Thanks', 2, N'شكر', 867, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Message.GenericErrorMessage', 2, N'حدث خطأ.', 868, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Message.OK', 2, N'حسنا', 869, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.SearchPlaceholder', 2, N'عما تبحث؟', 870, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.HiUser', 2, N'مرحبا {user}!', 871, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Account', 2, N'الحساب', 872, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Categories', 2, N'التصنيفات', 873, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Home', 2, N'الصفحة الرئيسية', 874, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Products', 2, N'منتجات', 875, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Tracking', 2, N'تتبع', 876, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Checkout', 2, N'الدفع', 877, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.ShoppingCart', 2, N'عربة التسوق', 878, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Dashboard', 2, N'لوحة القيادة', 879, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Profile', 2, N'الملف الشخصي', 880, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.LogOff', 2, N'إطفاء', 881, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Header.Menu.Login', 2, N'تسجيل الدخول', 882, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Information', 2, N'معلومات', 883, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Information.AboutUs', 2, N'معلومات عنا', 884, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Information.ContactUs', 2, N'اتصل بنا', 885, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Information.PrivacyPolicy', 2, N'سياسة الخصوصية', 886, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Information.RefundPolicy', 2, N'سياسة الاسترجاع', 887, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Information.TermsAndConditions', 2, N'الأحكام والشروط', 888, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Account', 2, N'الحساب', 889, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Account.MyProfile', 2, N'ملفي', 890, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Account.MyOrders', 2, N'طلباتي', 891, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Account.TrackOrder', 2, N'ترتيب المسار', 892, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Account.MyCart', 2, N'سلتي', 893, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.Account.Checkout', 2, N'الدفع', 894, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.NewsLetter', 2, N'اشترك في صحيفتنا الإخبارية', 895, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.NewsLetter.GetOurEmailUpdates', 2, N'الحصول على تحديثات البريد الإلكتروني حول العروض الخاصة.', 896, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.NewsLetter.EnterYourEmailPlaceholder', 2, N'أدخل عنوان بريدك الالكتروني.', 897, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.NewsLetter.Subscribe', 2, N'الإشتراك', 898, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Footer.CopyrightsMessage', 2, N'{application} {date}. كل الحقوق محفوظة.', 899, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.AddToCart', 2, N'أضف إلى السلة', 900, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.ViewProduct', 2, N'رأي', 901, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.NoProductsInCart', 2, N'لا توجد منتجات في العربة.', 902, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.CartTotal', 2, N'العربة إجمالي', 903, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.CartDetails', 2, N'تفاصيل العربة', 904, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.Checkout', 2, N'الدفع', 905, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.ItemAddingToCart', 2, N'إضافة المنتج إلى سلة التسوق', 906, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.ItemAddedToCart', 2, N'وأضاف المنتج إلى سلة التسوق.', 907, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.CartItemQuantityUpdated', 2, N'كمية المنتج تجديد.', 908, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Shopping.ItemNotFound', 2, N'الصنف غير موجود.', 909, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Title', 2, N'موقع للتجارة الإلكترونية في ASP صافي MVC', 910, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Description', 2, N'تم تطوير هذا موقع للتجارة الإلكترونية تجريبي مع ASP صافي MVC وC # كلغة برمجة جانب الملقم. تحقق من كل ميزات التجارة الإلكترونية هنا.', 911, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.FeaturedCategories.BrowseCategoryProducts', 2, N'تصفح {category} المنتجات.', 912, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.FeaturedCategories.DiscoverMoreProducts', 2, N'إكتشف أكثر', 913, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.FeaturedCategories.Products.Featured', 2, N'متميز', 914, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.SearchMoreProducts', 2, N'ابحث عن المزيد من المنتجات', 915, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Showcase.FastDelivery', 2, N'توصيل سريع', 916, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Showcase.OnTimeDelivery', 2, N'100٪ التسليم في الوقت المحدد', 917, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Showcase.247Support', 2, N'دعم 24/7', 918, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Showcase.AlwaysReadyToHelp', 2, N'دائما على استعداد للمساعدة', 919, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Showcase.SecurePayments', 2, N'المدفوعات الآمنة', 920, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Showcase.SecurePaymentOptions', 2, N'خيارات الدفع الآمنة', 921, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Home.Showcase.OurPartners', 2, N'شركاؤنا', 922, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.Title', 2, N'البحث المنتجات على {application}', 923, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.TitleWithCategory', 2, N'بحث {category} المنتجات على {application}', 924, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.Description', 2, N'تم تطوير هذا موقع للتجارة الإلكترونية تجريبي مع ASP صافي MVC وC # كلغة برمجة جانب الملقم. تحقق من كل ميزات التجارة الإلكترونية هنا.', 925, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.SearchProducts', 2, N'البحث عن المنتجات', 926, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.SearchProductsPlaceholder', 2, N'البحث عن المنتجات', 927, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.Categories', 2, N'التصنيفات', 928, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.Categories.AllCategories', 2, N'جميع الفئات', 929, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.PriceRange', 2, N'نطاق السعر', 930, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.Filter', 2, N'منقي', 931, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.Reset', 2, N'إعادة تعيين', 932, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.SortBy', 2, N'الترتيب حسب: {sortby}', 933, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.SortBy.LatestProducts', 2, N'أحدث المنتجات', 934, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.SortBy.PriceLowToHigh', 2, N'السعر من الارخص للاعلى', 935, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.SortBy.PriceHighToLow', 2, N'السعر الاعلى الى الادنى', 936, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.ShowNoOfProduct', 2, N'عرض {number} المنتجات', 937, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.ShowingProductRange', 2, N'عرض {startingIndex} إلى {endingIndex} من {total}', 938, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.Products.Featured', 2, N'متميز', 939, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Search.ProductsNotFound', 2, N'آسف! لم يتم العثور على المنتجات.', 940, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.AverageRatingCount', 2, N'متوسط ​​التقييم: {averageRating} نجوم من {totalComments} تعليقات', 941, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Description', 2, N'وصف', 942, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.ProductSpecifications', 2, N'مواصفات المنتج', 943, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Reviews', 2, N'التعليقات', 944, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comment', 2, N'تعليق', 945, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments', 2, N'تعليقات', 946, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.UserRating', 2, N'التقييم: {commentRating}', 947, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.NoCommentsOnProduct', 2, N'لا توجد تعليقات على هذه المنتجات. كن أول من يعلق عليها.', 948, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.LeaveComment', 2, N'اترك تعليقا', 949, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.YourRating', 2, N'تقييمك', 950, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Star', 2, N'نجمة', 951, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.CommentPlaceholder', 2, N'حسابك على إكبس للتعليق.', 952, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.LeaveYourComment', 2, N'اترك تعليقا', 953, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.LoginToComment', 2, N'تحتاج إلى تسجيل الدخول لترك تعليق.', 954, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments.Validations.TextRequired', 2, N'الرجاء إضافة تعليق صالح.', 955, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments.Validations.TextMinLength', 2, N'الحد الأدنى طول هو {min}.', 956, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments.Validations.TextMaxLength', 2, N'الحد الأقصى للطول هو {max}.', 957, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments.Validations.EntityRequired', 2, N'نوع تعليق لم تحدد.', 958, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments.Validations.RecordIDRequired', 2, N'تعليق سجل لم تحدد.', 959, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.CommentDeleteWarning', 2, N'هل أنت متأكد أنك تريد حذف هذا التعليق؟', 960, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.CommentDeleteConfirm', 2, N'نعم، حذفه!', 961, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.CommentDeleteCancel', 2, N'لا، لا أميل حذف.', 962, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments.Validations.NotAuthorizedToDeleteComment', 2, N'انك لم authorzed حذف هذا التعليق.', 963, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.Comments.Validations.UnableToDeleteComment', 2, N'غير قادر على حذف تعليق.', 964, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.FeaturedProducts', 2, N'منتجات مميزة', 965, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.RelatedProducts', 2, N'منتجات ذات صله', 966, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ProductDetails.RelatedProductsFeatured', 2, N'متميز', 967, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Title', 2, N'ترتيب المسار', 968, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Description', 2, N'يمكنك التحقق من حالة طلبك. الرجاء إدخال معرف النظام وستحصل على معلومات تتعلق طلبك.', 969, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderID', 2, N'رقم التعريف الخاص بالطلب', 970, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderIDPlaceholder', 2, N'أدخل معرف طلب إلى المسار', 971, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.TrackOrder', 2, N'ترتيب المسار', 972, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderPlacedSuccessMessage', 2, N'شكرا جزيلا. وقد وضعت طلبك. يمكنك الوصول إلى تفاصيل طلبك في أي وقت في قسم الطلبات الخاصة بك في الملف الشخصي.', 973, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.PrintInvoice', 2, N'فاتورة طباعة', 974, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus', 2, N'حالة الطلب', 975, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.Placed', 2, N'وضعت', 976, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.Processing', 2, N'معالجة', 977, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.Delivered', 2, N'تم التوصيل', 978, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.Failed', 2, N'فشل', 979, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.Cancelled', 2, N'ألغيت', 980, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.OnHold', 2, N'في الانتظار', 981, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.WaitingForPayment', 2, N'في انتظار الدفع', 982, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderStatus.Refunded', 2, N'ردها', 983, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.PaymentMethod', 2, N'طريقة الدفع او السداد', 984, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.PaymentMethods.CreditCard', 2, N'بطاقة الائتمان', 985, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.PaymentMethods.PayPal', 2, N'باي بال', 986, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.PaymentMethods.CashOnDelivery', 2, N'الدفع عند الاستلام', 987, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Date', 2, N'تاريخ', 988, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.UpdatedOn', 2, N'تحديث في', 989, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderUniqueCode', 2, N'ترتيب مدونة فريدة من نوعها', 990, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderDetails', 2, N'تفاصيل الطلب', 991, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Item', 2, N'بند', 992, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Price', 2, N'السعر', 993, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Quantity', 2, N'كمية', 994, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Total', 2, N'مجموع', 995, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.SubTotal', 2, N'المجموع الفرعي', 996, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.Discount', 2, N'خصم', 997, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.ShippingCharges', 2, N'رسوم الشحن', 998, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.DeliveryCharges', 2, N'رسوم التوصيل', 999, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.FinalTotal', 2, N'المجموع النهائي', 1000, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.PromoApplied', 2, N'الترويجي التطبيقية {promocode}.', 1001, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.ContactDetails', 2, N'بيانات المتصل', 1002, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.CustomerName', 2, N'اسم الزبون', 1003, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.CustomerEmail', 2, N'العملاء البريد الإلكتروني', 1004, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.CustomerPhone', 2, N'الهاتف العملاء', 1005, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.GuestOrder', 2, N'ترتيب الضيوف', 1006, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.ShippingDetails', 2, N'تفاصيل الشحن', 1007, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.ShippingCountry', 2, N'بلد', 1008, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.ShippingCity', 2, N'مدينة', 1009, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.ShippingAddress', 2, N'عنوان', 1010, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.ShippingZipCode', 2, N'الرمز البريدي', 1011, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderHistory', 2, N'تاريخ الطلب', 1012, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderTrackingNotAccessible', 2, N'آسف! لا يمكنك التحقق من ذلك تفاصيل النظام.', 1013, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Tracking.OrderCantBeTracked', 2, N'آسف! لا يمكننا تتبع تفاصيل طلبك.', 1014, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.Title', 2, N'سلة التسوق الخاصة بك', 1015, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.Description', 2, N'تفاصيل سلة التسوق الخاصة بك.', 1016, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ItemImage', 2, N'صورة', 1017, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ItemName', 2, N'بند', 1018, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ItemPrice', 2, N'السعر', 1019, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ItemQuantity', 2, N'كمية', 1020, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ItemTotal', 2, N'مجموع', 1021, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.RemoveItem', 2, N'إزالة بند', 1022, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.EnterPromoCode', 2, N'أدخل قسيمة / الرمز الترويجي', 1023, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ApplyPromo', 2, N'تطبيق', 1024, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.PromoAppliedSuccessfully', 2, N'نجاح. تمتع بخصم من {discount}.', 1025, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.PromoExpired', 2, N'آسف. انتهت صلاحية هذا الترويجي / قسيمة.', 1026, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.InvalidPromo', 2, N'الترويجي صالح / قسيمة.', 1027, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.UpdateCart', 2, N'تحديث العربة', 1028, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ContinueShopping', 2, N'مواصلة التسوق', 1029, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.SubTotal', 2, N'المجموع الفرعي', 1030, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.Discount', 2, N'خصم', 1031, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ShippingCharges', 2, N'رسوم الشحن', 1032, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.Total', 2, N'المجموع النهائي', 1033, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Cart.ProceedToCheckout', 2, N'عملية الخروج', 1034, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Title', 2, N'الدفع', 1035, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Description', 2, N'الخروج مع المنتجات سلة التسوق الخاصة بك.', 1036, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.ContactDetails', 2, N'بيانات المتصل', 1037, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.ShippingDetails', 2, N'تفاصيل الشحن', 1038, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Payment', 2, N'دفع', 1039, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.YourOrder', 2, N'طلبك', 1040, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Product', 2, N'المنتج', 1041, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Total', 2, N'مجموع', 1042, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.ItemQuantity', 2, N'كمية', 1043, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.SubTotal', 2, N'المجموع الفرعي', 1044, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Discount', 2, N'خصم', 1045, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PromoApplied', 2, N'الترويجي التطبيقية: {promocode}', 1046, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.HavePromoApplyHere', 2, N'هل لديك الترويجي؟ قدم هنا.', 1047, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.ShippingCharges', 2, N'رسوم الشحن', 1048, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Total', 2, N'مجموع', 1049, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.ModifyCartItemsHere', 2, N'تعديل البنود عربة هنا.', 1050, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.NoProductsInCart', 2, N'لا توجد منتجات في العربة. الرجاء إضافة بعض المنتجات في العربة.', 1051, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.FullName', 2, N'الاسم الكامل', 1052, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Email', 2, N'البريد الإلكتروني', 1053, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PhoneNumber', 2, N'رقم الهاتف', 1054, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreateAccount', 2, N'انشئ حساب؟', 1055, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.AlreadyHaveAccount', 2, N'هل لديك حساب؟ تسجيل الدخول.', 1056, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreateAccount.Validations.FullNameRequired', 2, N'الإسم الكامل ضروري.', 1057, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreateAccount.Validations.FullNameMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1058, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreateAccount.Validations.FullNameMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1059, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreateAccount.Validations.ProvideValidEmail', 2, N'تقديم عنوان بريد إلكتروني صحيح.', 1060, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreateAccount.Validations.EmailRequired', 2, N'البريد الالكتروني مطلوب', 1061, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Country', 2, N'بلد', 1062, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.City', 2, N'مدينة', 1063, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Address', 2, N'عنوان', 1064, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.ZipCode', 2, N'الرمز البريدي', 1065, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Shipping.Validations.CountryRequired', 2, N'الدولة مطلوبة.', 1066, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Shipping.Validations.CityRequired', 2, N'مطلوب المدينة.', 1067, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Shipping.Validations.AddressRequired', 2, N'العنوان مطلوب.', 1068, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Shipping.Validations.ZipCodeRequired', 2, N'الرمز البريدي هو مطلوب.', 1069, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PayViaCreditCard', 2, N'الدفع عن طريق بطاقة الائتمان', 1070, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardHolderName', 2, N'اسم حامل البطاقة', 1071, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardNumber', 2, N'رقم البطاقة', 1072, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardExpiryDate', 2, N'تاريخ انتهاء صلاحية البطاقة', 1073, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardExpiryMonth', 2, N'بطاقة انتهاء شهر', 1074, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardExpiryYear', 2, N'بطاقة انتهاء السنة', 1075, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardCVC', 2, N'CVC', 1076, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardInfoNotSaved', 2, N'وتأكدوا أننا لا تخزين تفاصيل بطاقة الائتمان الخاصة بك على خوادمنا.', 1077, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CardPayNow', 2, N'ادفع الآن', 1078, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreditCard.Validations.CardHolderNameRequired', 2, N'حاملي بطاقات مطلوب اسم.', 1079, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreditCard.Validations.CardNumberRequired', 2, N'مطلوب رقم البطاقة.', 1080, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreditCard.Validations.CardNumberMustBeValid', 2, N'يجب أن يكون رقم بطاقة صالح.', 1081, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreditCard.Validations.CardExpiryMonthRequired', 2, N'مطلوب بطاقة انتهاء شهر.', 1082, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreditCard.Validations.CardExpiryYearRequired', 2, N'مطلوب بطاقة انتهاء السنة.', 1083, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreditCard.Validations.CVCRequired', 2, N'مطلوب CVC العدد.', 1084, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.CreditCard.Validations.CVCMustBeValid', 2, N'يجب أن يكون CVC الرقمية.', 1085, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PayViaCashOnDelivery', 2, N'الدفع عن طريق الدفع النقدي عند التسليم', 1086, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PlaceOrder', 2, N'مكان الامر', 1087, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PayViaPayPal', 2, N'الدفع عن طريق PayPal', 1088, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PayPalAmountNote', 2, N'سوف تدفع ''{amount}'' في {currency} عبر PayPal.', 1089, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.PayPal.ConfirmOrderAgain', 2, N'أكد الطلب', 1090, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Validations.PayPalOrderIssue', 2, N'لم يتم العثور على تفاصيل طلب PayPal.', 1091, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.Validations.PleaseCompleteRequiredFields', 2, N'يرجى تعبئة الحقول المطلوبة.', 1092, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Checkout.OrderPlacedSuccessfully', 2, N'وقد وضعت طلبك بنجاح.', 1093, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Title', 2, N'تسجيل حساب', 1094, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Description', 2, N'تسجيل حسابك في {application}.', 1095, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.FullName', 2, N'الاسم الكامل', 1096, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.FullNamePlaceholder', 2, N'الاسم الكامل', 1097, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Email', 2, N'البريد الإلكتروني', 1098, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.EmailPlaceholder', 2, N'البريد الإلكتروني', 1099, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Username', 2, N'اسم المستخدم', 1100, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.UsernamePlaceholder', 2, N'اسم المستخدم', 1101, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Password', 2, N'كلمه السر', 1102, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.PasswordPlaceholder', 2, N'كلمه السر', 1103, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.ConfirmPassword', 2, N'تأكيد كلمة المرور', 1104, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.ConfirmPasswordPlaceholder', 2, N'تأكيد كلمة المرور', 1105, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.RegisterAccount', 2, N'تسجيل', 1106, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.LoginAccount', 2, N'أو الدخول مع حساب موجود', 1107, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Validation.FullNameRequired', 2, N'الإسم الكامل ضروري.', 1108, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Validation.UsernameRequired', 2, N'اسم المستخدم مطلوب.', 1109, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Validation.EmailRequired', 2, N'البريد الالكتروني مطلوب.', 1110, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Validation.EmailFormat', 2, N'يرجى تقديم عنوان بريد إلكتروني صالح.', 1111, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Validation.PasswordRequired', 2, N'كلمة المرور مطلوبة.', 1112, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Validation.ConfirmPasswordRequired', 2, N'تأكيد كلمة المرور مطلوب.', 1113, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Register.Validation.PasswordNotMatched', 2, N'كلمة المرور وتأكيد كلمة المرور لا تتطابق.', 1114, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Title', 2, N'تسجل الدخول', 1115, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Description', 2, N'تسجيل الدخول إلى حسابك على {application}.', 1116, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Username', 2, N'اسم المستخدم', 1117, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.UsernamePlaceholder', 2, N'اسم المستخدم', 1118, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Password', 2, N'كلمه السر', 1119, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.PasswordPlaceholder', 2, N'كلمه السر', 1120, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.RememberMe', 2, N'تذكرنى', 1121, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.ForgotPassword', 2, N'نسيت رقمك السري؟', 1122, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.LoginAccount', 2, N'تسجيل الدخول', 1123, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.RegisterAccount', 2, N'أو تسجيل حساب جديد', 1124, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Validation.UsernameRequired', 2, N'الرجاء إدخال اسم المستخدم الخاص بك تعاطيه.', 1125, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Validation.PasswordRequired', 2, N'الرجاء إدخال كلمة المرور الخاصة بك تعاطيه.', 1126, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Validation.InvalidLoginAttempt', 2, N'محاولة تسجيل الدخول غير صالحة.', 1127, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.Login.Validation.LockedOut', 2, N'كنت تأمين.', 1128, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ForgotPassword.Title', 2, N'هل نسيت كلمة المرور', 1129, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ForgotPassword.Description', 2, N'استعادة حساب {application} الخاص بك.', 1130, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ForgotPassword.Username', 2, N'اسم المستخدم', 1131, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ForgotPassword.UsernamePlaceholder', 2, N'اسم المستخدم', 1132, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ForgotPassword.Validation.UsernameRequired', 2, N'اسم المستخدم مطلوب.', 1133, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ForgotPassword.RecoverAccount', 2, N'استعادة حساب', 1134, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ForgotPassword.PasswordResetEmailSuccess', 2, N'تفقد بريدك الالكتروني من فضلك. تم إرسال رابط إعادة تعيين كلمة المرور إلى البريد الإلكتروني حساباتك.', 1135, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.Title', 2, N'إعادة تعيين كلمة المرور', 1136, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.Description', 2, N'إعادة تعيين كلمة المرور لحسابك على {application}.', 1137, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.Password', 2, N'كلمه السر', 1138, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.PasswordPlaceholder', 2, N'كلمه السر', 1139, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.ConfirmPassword', 2, N'تأكيد كلمة المرور', 1140, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.ConfirmPasswordPlaceholder', 2, N'تأكيد كلمة المرور', 1141, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.ResetPassword', 2, N'إعادة تعيين كلمة المرور', 1142, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.LoginAccount', 2, N'تسجيل الدخول إلى حسابك', 1143, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.Validation.PasswordRequired', 2, N'كلمة المرور مطلوبة.', 1144, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.Validation.ConfirmPasswordRequired', 2, N'تأكيد كلمة المرور مطلوب.', 1145, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.ResetPassword.Validation.PasswordNotMatched', 2, N'كلمة المرور وتأكيد كلمة المرور لا تتطابق.', 1146, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Title', 2, N'ملف تعريفي للمستخدم', 1147, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Description', 2, N'مراجعة ملف التعريف الخاص بك والبيانات ذات الصلة {application}.', 1148, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Username', 2, N'اسم المستخدم', 1149, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info', 2, N'معلومات', 1150, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword', 2, N'تغيير كلمة المرور', 1151, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangeAvatar', 2, N'تغيير الصورة الرمزية', 1152, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Orders', 2, N'الطلبات', 1153, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Comments', 2, N'تعليقات', 1154, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.FullName', 2, N'الاسم الكامل', 1155, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Email', 2, N'البريد الإلكتروني', 1156, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Username', 2, N'اسم المستخدم', 1157, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.PhoneNumber', 2, N'رقم الهاتف', 1158, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Country', 2, N'بلد', 1159, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.City', 2, N'مدينة', 1160, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Address', 2, N'عنوان', 1161, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.ZipCode', 2, N'الرمز البريدي', 1162, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.UpdateInfo', 2, N'تحديث المعلومات', 1163, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.UserInfoUpdated', 2, N'معلومات المستخدم تجديد.', 1164, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.FullNameRequired', 2, N'الإسم الكامل ضروري.', 1165, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.FullNameMin', 2, N'الحد الأدنى طول هو {min}.', 1166, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.FullNameMax', 2, N'الحد الأقصى للطول هو {max}.', 1167, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.EmailFormat', 2, N'يرجى تقديم عنوان بريد إلكتروني صالح.', 1168, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.EmailRequired', 2, N'مطلوب عنوان البريد الإلكتروني.', 1169, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.UsernameRequired', 2, N'اسم المستخدم مطلوب.', 1170, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.CountryRequired', 2, N'الدولة مطلوبة.', 1171, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.CityRequired', 2, N'مطلوب المدينة.', 1172, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.AddressRequired', 2, N'العنوان مطلوب.', 1173, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.Info.Validations.ZipCodeRequired', 2, N'الرمز البريدي هو مطلوب.', 1174, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.CurrentPassword', 2, N'كلمة المرور الحالي', 1175, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.NewPassword', 2, N'كلمة السر الجديدة', 1176, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.ConfirmPassword', 2, N'تأكيد كلمة المرور', 1177, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.UpdatePassword', 2, N'تطوير كلمة السر', 1178, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.Validations.OldPasswordRequired', 2, N'مطلوب كلمة السر القديمة.', 1179, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.Validations.NewPasswordRequired', 2, N'مطلوب كلمة المرور الجديدة.', 1180, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.Validations.ConfirmPasswordRequired', 2, N'تأكيد كلمة المرور مطلوب.', 1181, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.Validations.PasswordsNotMatched', 2, N'لا تتم مطابقة كلمة المرور الجديدة وتأكيد كلمة المرور.', 1182, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangePassword.PasswordsUpdated', 2, N'تم تحديث كلمة السر بنجاح.', 1183, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangeAvatar.Avatar', 2, N'الصورة الرمزية', 1184, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangeAvatar.SelectAvatar', 2, N'اختر الرمزية', 1185, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangeAvatar.UpdateAvatar', 2, N'تحديث الرمزية', 1186, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangeAvatar.AvatarUpdated', 2, N'الصورة الرمزية تحديثها بنجاح.', 1187, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.ChangeAvatar.Validations.SelectAvatar', 2, N'يرجى تحديد صورة.', 1188, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderIDPlaceholder', 2, N'البحث عن طريق ترتيب ID', 1189, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.SelectByOrderStatus', 2, N'الاختيار عن طريق ترتيب أوضاع ...', 1190, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.Placed', 2, N'وضعت', 1191, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.Processing', 2, N'معالجة', 1192, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.Delivered', 2, N'تم التوصيل', 1193, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.Failed', 2, N'فشل', 1194, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.Cancelled', 2, N'ألغيت', 1195, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.OnHold', 2, N'في الانتظار', 1196, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.WaitingForPayment', 2, N'في انتظار الدفع', 1197, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderStatus.Refunded', 2, N'ردها', 1198, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.SearchOrders', 2, N'بحث', 1199, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.Reset', 2, N'إعادة تعيين', 1200, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderID', 2, N'رقم التعريف الخاص بالطلب', 1201, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.PlacedOnDate', 2, N'وضعت على تاريخ', 1202, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.OrderAmount', 2, N'كمية الطلب', 1203, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.Status', 2, N'الحالة', 1204, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.Actions', 2, N'أجراءات', 1205, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.UpdatedOn', 2, N'تحديث في', 1206, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.Track', 2, N'مسار', 1207, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.Previous', 2, N'السابق', 1208, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.Next', 2, N'التالى', 1209, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserOrders.NoOrdersFound', 2, N'لم يتم العثور على أية طلبات.', 1210, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.SearchCommentsPlaceholder', 2, N'بحث في تعليقات', 1211, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.SearchComments', 2, N'بحث', 1212, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.Reset', 2, N'إعادة تعيين', 1213, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.CommentUserName', 2, N'{user}', 1214, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.CommentTimestamp', 2, N'{datetime}', 1215, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.DeleteComment', 2, N'حذف تعليق', 1216, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.CommentDeleteWarning', 2, N'هل أنت متأكد أنك تريد حذف هذا التعليق؟', 1217, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.CommentDeleteConfirm', 2, N'نعم، حذفه!', 1218, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.CommentDeleteCancel', 2, N'لا، لا أميل حذف.', 1219, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.Previous', 2, N'السابق', 1220, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.Next', 2, N'التالى', 1221, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.UserProfile.UserComments.NoCommentsFound', 2, N'لا توجد تعليقات.', 1222, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Title', 2, N'طباعة أمر فاتورة: {orderid}', 1223, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Description', 2, N'طباعة فاتورة لطلبك.', 1224, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.OrderID', 2, N'رقم الأمر', 1225, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Dated', 2, N'بتاريخ', 1226, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Status', 2, N'الحالة', 1227, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.CustomerInformation', 2, N'معلومات العميل', 1228, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.PaymentDetails', 2, N'بيانات الدفع', 1229, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.PaymentMethod', 2, N'طريقة الدفع او السداد', 1230, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.TransactionID', 2, N'رقم المعاملة', 1231, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Code', 2, N'كود فريد', 1232, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Product', 2, N'المنتج', 1233, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Price', 2, N'السعر', 1234, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Quantity', 2, N'كمية', 1235, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Total', 2, N'مجموع', 1236, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.PromoApplied', 2, N'الترويجي التطبيقية: {promo}', 1237, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.TotalAmount', 2, N'المبلغ الإجمالي', 1238, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.Discount', 2, N'خصم', 1239, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.ShippingCharges', 2, N'الشحن', 1240, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.FinalAmount', 2, N'القيمة النهائية', 1241, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.GuestOrder', 2, N'ترتيب الضيف', 1242, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_PP.PrintInvoice.NotAccessible', 2, N'آسف! لا يمكنك التحقق من ذلك تفاصيل النظام.', 1243, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard', 2, N'لوحة القيادة', 1244, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Commons.RecordNotSpecifiedInCurrentLanguage', 2, N'لم يتم تحديد هذا السجل في اللغة الحالية.', 1245, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Commons.ParentCategoryRecordNotSpecifiedInCurrentLanguage', 2, N'الأم الفئة غير محددة في اللغة الحالية.', 1246, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Commons.CategoryRecordNotSpecifiedInCurrentLanguage', 2, N'لم يتم تحديد هذا الاسم الفئة في اللغة الحالية.', 1247, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.Success', 2, N'نجاح!', 1248, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.Warning', 2, N'تحذير!', 1249, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.Error', 2, N'خطأ!', 1250, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.Thanks', 2, N'شكر', 1251, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.GenericErrorMessage', 2, N'حدث خطأ.', 1252, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.ConfirmDeleteWarning', 2, N'هل أنت متأكد أنك تريد حذف هذا السجل؟', 1253, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.ConfirmDelete', 2, N'تؤكد', 1254, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.CancelDelete', 2, N'إلغاء', 1255, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Message.OK', 2, N'حسنا', 1256, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Pagination.Previous', 2, N'السابق', 1257, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Pagination.Next', 2, N'التالى', 1258, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Home', 2, N'الصفحة الرئيسية', 1259, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Dashboard', 2, N'لوحة القيادة', 1260, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Categories', 2, N'التصنيفات', 1261, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Products', 2, N'منتجات', 1262, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Promos', 2, N'الملل', 1263, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Orders', 2, N'الطلبات', 1264, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Comments', 2, N'تعليقات', 1265, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Users', 2, N'المستخدمين', 1266, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Roles', 2, N'الأدوار', 1267, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Languages', 2, N'اللغات', 1268, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.Configurations', 2, N'تكوينات', 1269, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.AllConfigurations', 2, N'جميع تكوينات', 1270, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Menu.LanguageConfigurations', 2, N'اللغة تكوينات', 1271, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.TopMenu.Profile', 2, N'الملف الشخصي', 1272, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.TopMenu.LogOff', 2, N'إطفاء', 1273, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.Hello', 2, N'مرحبا {user}!', 1274, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.WelcomeToDashboard', 2, N'مرحبا بكم في {application} لوحة التحكم. وفيما يلي بعض العوامل الديموغرافية.', 1275, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.TotalProducts', 2, N'عدد المنتجات', 1276, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.TotalCategories', 2, N'عدد الأقسام', 1277, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.TotalOrders', 2, N'مجموع الطلبات', 1278, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.TotalComments', 2, N'مجموع التعليقات', 1279, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.NoOfUsers', 2, N'عدد المستخدمين', 1280, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Dashboard.NoOfRoles', 2, N'عدد الأدوار', 1281, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Title', 2, N'التصنيفات', 1282, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Description', 2, N'فئات قائمة', 1283, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.SearchPlaceholder', 2, N'البحث عن طريق اسم التصنيف', 1284, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.SelectParentCategory', 2, N'حدد فئات من المنتدى الرئيسي', 1285, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Search', 2, N'بحث', 1286, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Reset', 2, N'إعادة تعيين', 1287, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.CreateCategory', 2, N'إنشاء الفئة', 1288, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.Name', 2, N'اسم', 1289, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.ParentCategory', 2, N'القسم الرئيسي', 1290, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.Description', 2, N'وصف', 1291, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.Products', 2, N'منتجات', 1292, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.Actions', 2, N'أجراءات', 1293, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.FeaturedCategory', 2, N'الفئة المميز', 1294, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.Edit', 2, N'تعديل', 1295, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.Delete', 2, N'حذف', 1296, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.List.NoRecordFound', 2, N'لا توجد فئات.', 1297, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.EditCategoryTitle', 2, N'تحرير الفئة', 1298, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.EditCategoryDescription', 2, N'فئة تحرير.', 1299, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.CreateCategoryTitle', 2, N'إنشاء الفئة', 1300, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.CreateCategoryDescription', 2, N'إنشاء فئة جديدة.', 1301, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Name', 2, N'اسم', 1302, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.NamePlaceholder', 2, N'اسم التصنيف', 1303, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Summary', 2, N'ملخص', 1304, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.SummaryPlaceholder', 2, N'إضافة موجز الفئة.', 1305, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Description', 2, N'وصف', 1306, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.DescriptionPlaceholder', 2, N'إضافة فئة الوصف.', 1307, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.ParentCategory', 2, N'القسم الرئيسي', 1308, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.ParentCategoryNone', 2, N'لا شيء', 1309, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.URL', 2, N'URL', 1310, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.SelectPicture', 2, N'تحديد صورة', 1311, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Featured', 2, N'الفئة المميز', 1312, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Update', 2, N'تحديث', 1313, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Delete', 2, N'حذف', 1314, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Save', 2, N'حفظ', 1315, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Cancel', 2, N'إلغاء', 1316, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.NameRequired', 2, N'مطلوب اسم الفئة.', 1317, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.NameMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1318, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.NameMaximumLength', 2, N'أقصى طول هو {max}.', 1319, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.DescriptionMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1320, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.CategoryNotFound', 2, N'فئة غير موجود.', 1321, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.UnableToUpdateCategory', 2, N'غير قادر على تحديث الفئة.', 1322, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.UnableToUpdateCategoryRecord', 2, N'غير قادر على تحديث الفئة السجل.', 1323, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.UnableToCreateCategory', 2, N'غير قادر على إنشاء الفئة.', 1324, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Categories.Action.Validation.UnableToDeleteCategory', 2, N'غير قادر على حذف الفئة.', 1325, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Title', 2, N'منتجات', 1326, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Description', 2, N'قائمة المنتجات', 1327, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.SearchPlaceholder', 2, N'ابحث عن منتجات حسب الاسم', 1328, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.SelectByCategory', 2, N'الاختيار عن طريق القطاع', 1329, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Search', 2, N'بحث', 1330, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Reset', 2, N'إعادة تعيين', 1331, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.CreateProduct', 2, N'خلق', 1332, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.List.Name', 2, N'اسم', 1333, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.List.Category', 2, N'الفئة', 1334, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.List.Summary', 2, N'ملخص', 1335, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.List.Price', 2, N'السعر', 1336, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.List.Actions', 2, N'أجراءات', 1337, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.List.FeaturedProduct', 2, N'المنتج المميز', 1338, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Edit', 2, N'تعديل', 1339, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Delete', 2, N'حذف', 1340, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.List.NoRecordFound', 2, N'لا توجد منتجات.', 1341, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.EditProductTitle', 2, N'تحرير المنتج', 1342, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.EditProductDescription', 2, N'تحرير المنتج.', 1343, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.CreateProductTitle', 2, N'إنشاء المنتج', 1344, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.CreateProductDescription', 2, N'خلق منتج جديد.', 1345, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Name', 2, N'اسم', 1346, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.NamePlaceholder', 2, N'اسم المنتج', 1347, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Summary', 2, N'ملخص', 1348, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.SummaryPlaceholder', 2, N'إضافة ملخص المنتج', 1349, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Description', 2, N'وصف', 1350, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.DescriptionPlaceholder', 2, N'إضافة وصف المنتج', 1351, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.ProductSpecifications', 2, N'مواصفات المنتج', 1352, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.SpecificationTitle', 2, N'مواصفات عنوان', 1353, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.SpecificationValue', 2, N'مواصفات القيمة', 1354, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.AddSpecification', 2, N'إضافة مواصفات', 1355, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.SpecificationAction', 2, N'أجراءات', 1356, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.SpecificationDelete', 2, N'حذف', 1357, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.NoSpecifications', 2, N'لا المواصفات.', 1358, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Category', 2, N'الفئة', 1359, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Price', 2, N'السعر', 1360, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.PricePlaceholder', 2, N'سعر المنتج', 1361, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.SelectPictures', 2, N'اختر صور', 1362, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.SetThumbnailImage', 2, N'إضافة إلى صورة مصغرة', 1363, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.RemovePicture', 2, N'إزالة صورة', 1364, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.FeaturedProduct', 2, N'المنتج المميز', 1365, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Update', 2, N'تحديث', 1366, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Delete', 2, N'حذف', 1367, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Save', 2, N'حفظ', 1368, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Cancel', 2, N'إلغاء', 1369, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.NameRequired', 2, N'مطلوب اسم المنتج.', 1370, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.NameMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1371, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.NameMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1372, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.CategoryRequired', 2, N'إختر فئة المنتج.', 1373, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.SummaryRequired', 2, N'مطلوب ملخص المنتج.', 1374, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.SummaryMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1375, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.SummaryMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1376, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.DescriptionRequired', 2, N'مطلوب الوصف.', 1377, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.DescriptionMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1378, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.PriceRequired', 2, N'مطلوب السعر.', 1379, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.PriceRange', 2, N'يجب أن يكون السعر بين {min} إلى {max}.', 1380, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.ProductPicturesRequired', 2, N'يرجى تحميل أتلست الصورة منتج واحد.', 1381, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.ProductNotFound', 2, N'الصنف غير موجود.', 1382, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.UnableToUpdateProduct', 2, N'غير قادر على تحديث المنتج.', 1383, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.UnableToUpdateProductRecord', 2, N'غير قادر على تحديث سجل المنتج.', 1384, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.UnableToCreateProduct', 2, N'غير قادر على إنشاء المنتج.', 1385, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.UnableToCreateProductRecord', 2, N'غير قادر على إنشاء سجل المنتج.', 1386, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Products.Action.Validation.UnableToDeleteProduct', 2, N'غير قادر على حذف المنتج.', 1387, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Title', 2, N'الملل', 1388, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Description', 2, N'الملل قائمة الصفحة.', 1389, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.SearchPlaceholder', 2, N'البحث الترويجي', 1390, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Search', 2, N'بحث', 1391, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Reset', 2, N'إعادة تعيين', 1392, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.CreatePromo', 2, N'إنشاء الترويجي', 1393, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.List.Name', 2, N'اسم', 1394, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.List.Code', 2, N'رمز ترويجي', 1395, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.List.PromoType', 2, N'الترويجي نوع', 1396, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.List.Value', 2, N'القيمة', 1397, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.List.ValidTill', 2, N'صالح لغاية', 1398, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.List.Actions', 2, N'أجراءات', 1399, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.List.NoRecordFound', 2, N'لم يتم العثور على شفرات ترويجية.', 1400, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.PromoTypes', 2, N'أنواع الترويجي', 1401, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.PromoTypes.Percentage', 2, N'النسبة المئوية', 1402, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.PromoTypes.Amount', 2, N'كمية', 1403, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Edit', 2, N'تعديل', 1404, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Delete', 2, N'حذف', 1405, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.EditPromoTitle', 2, N'تحرير الترويجي', 1406, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.EditPromoDescription', 2, N'تحرير الترويجي.', 1407, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.CreatePromoTitle', 2, N'إنشاء الترويجي', 1408, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.CreatePromoDescription', 2, N'إنشاء الترويجي الجديد.', 1409, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Name', 2, N'اسم', 1410, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.NamePlaceholder', 2, N'إضافة اسم الترويجي', 1411, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Description', 2, N'وصف', 1412, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.DescriptionPlaceholder', 2, N'إضافة وصف حول الترويجي.', 1413, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Code', 2, N'الشفرة', 1414, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.CodePlaceholder', 2, N'إضافة الرمز الترويجي', 1415, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.PromoType', 2, N'الترويجي نوع', 1416, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.AmountPromoDescription', 2, N'والمبلغ الترويجي نوع اعطاء خصم من القيمة المحددة كما المبلغ من المبلغ الإجمالي للنظام.', 1417, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.PercentagePromoDescription', 2, N'ونسبة الترويجي نوع اعطاء خصم من القيمة المحددة في النسبة المئوية للمبلغ الكلي للنظام.', 1418, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Value', 2, N'القيمة', 1419, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.ValidTill', 2, N'صالح لغاية', 1420, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Update', 2, N'تحديث', 1421, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Delete', 2, N'حذف', 1422, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Save', 2, N'حفظ', 1423, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Cancel', 2, N'إلغاء', 1424, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.NameRequired', 2, N'مطلوب اسم.', 1425, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.NameMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1426, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.NameMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1427, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.PromoTypeRequired', 2, N'يرجى تحديد نوع الترويجي.', 1428, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.DescriptionMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1429, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.CodeRequired', 2, N'مطلوب الرمز الترويجي.', 1430, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.CodeMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1431, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.CodeMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1432, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.ValueRequired', 2, N'مطلوب قيمة الترويجي.', 1433, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.ValueRange', 2, N'يجب أن تكون قيمة بين {min} إلى {max}.', 1434, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.PromoNotFound', 2, N'الترويجي غير موجود.', 1435, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.UnableToUpdatePromo', 2, N'غير قادر على تحديث الترويجي.', 1436, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.UnableToCreatePromo', 2, N'غير قادر على إنشاء الترويجي.', 1437, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Promos.Action.Validation.UnableToDeletePromo', 2, N'غير قادر على حذف الترويجي.', 1438, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.Title', 2, N'الطلبات', 1439, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.Description', 2, N'أوامر قائمة', 1440, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.SearchByUserIDPlaceholder', 2, N'البحث عن طريق اسم العضو', 1441, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.SearchByOrderIDPlaceholder', 2, N'البحث عن طريق ترتيب ID', 1442, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.SearchByOrderStatus', 2, N'البحث عن طريق ترتيب أوضاع', 1443, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus', 2, N'حالة الطلب', 1444, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.Placed', 2, N'وضعت', 1445, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.Processing', 2, N'معالجة', 1446, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.Delivered', 2, N'تم التوصيل', 1447, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.Failed', 2, N'فشل', 1448, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.Cancelled', 2, N'ألغيت', 1449, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.OnHold', 2, N'في الانتظار', 1450, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.WaitingForPayment', 2, N'في انتظار الدفع', 1451, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.OrderStatus.Refunded', 2, N'ردها', 1452, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.Search', 2, N'بحث', 1453, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.Reset', 2, N'إعادة تعيين', 1454, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.OrderID', 2, N'رقم التعريف الخاص بالطلب', 1455, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.PlacedOn', 2, N'وضعت على تاريخ', 1456, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.OrderAmount', 2, N'كمية الطلب', 1457, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.PaymentMethod', 2, N'طريقة الدفع او السداد', 1458, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.Status', 2, N'الحالة', 1459, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.Actions', 2, N'أجراءات', 1460, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.UpdatedOn', 2, N'تحديث في', 1461, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.Details', 2, N'تفاصيل', 1462, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.Track', 2, N'مسار', 1463, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.List.Invoice', 2, N'فاتورة', 1464, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Orders.NoOrdersFound', 2, N'لم يتم العثور على أية طلبات.', 1465, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Title', 2, N'الطلبات', 1466, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Description', 2, N'أوامر قائمة', 1467, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PrintInvoice', 2, N'فاتورة طباعة', 1468, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderStatus', 2, N'حالة الطلب', 1469, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PaymentMethod', 2, N'طريقة الدفع او السداد', 1470, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PaymentMethods.CreditCard', 2, N'بطاقة الائتمان', 1471, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PaymentMethods.PayPal', 2, N'باي بال', 1472, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PaymentMethods.CashOnDelivery', 2, N'الدفع عند الاستلام', 1473, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderTransactionID', 2, N'رقم التحويل', 1474, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderProcessor.AuthorizeNet', 2, N'Authorize.Net', 1475, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderProcessor.PayPal', 2, N'PayPal', 1476, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PlacedOn', 2, N'وضعت على تاريخ', 1477, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.UpdatedOn', 2, N'تحديث في', 1478, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderID', 2, N'رقم التعريف الخاص بالطلب', 1479, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderUniqueCode', 2, N'ترتيب مدونة فريدة من نوعها', 1480, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderDetails', 2, N'تفاصيل الطلب', 1481, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Name', 2, N'اسم', 1482, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Price', 2, N'السعر', 1483, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Quantity', 2, N'كمية', 1484, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Total', 2, N'مجموع', 1485, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.TotalAmount', 2, N'المبلغ الإجمالي', 1486, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Discount', 2, N'خصم', 1487, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PromoApplied', 2, N'الترويجي التطبيقية: {promo}', 1488, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.DeliveryCharges', 2, N'رسوم التوصيل', 1489, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.CustomerDetails', 2, N'تفاصيل العميل', 1490, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.FullName', 2, N'الاسم الكامل', 1491, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Email', 2, N'البريد الإلكتروني', 1492, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.PhoneNumber', 2, N'رقم الهاتف', 1493, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.ShippingDetails', 2, N'تفاصيل الشحن', 1494, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Country', 2, N'بلد', 1495, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.City', 2, N'مدينة', 1496, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Address', 2, N'عنوان', 1497, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.ZipCode', 2, N'الرمز البريدي', 1498, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.OrderHistory', 2, N'تاريخ الطلب', 1499, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.Note', 2, N'ملحوظة', 1500, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.UpdateStatus', 2, N'تحديث الحالة', 1501, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.UpdateStatus.Validation.NoteRequired', 2, N'مطلوب المذكرة.', 1502, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.UpdateStatus.Validation.NoteMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1503, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.UpdateStatus.Validation.NoteMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1504, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.UpdateStatus.Validation.UnableToUpdateOrderStatus', 2, N'بيانات غير صالحة. غير قادر على تحديث حالة الطلب.', 1505, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.GuestOrder', 2, N'ترتيب الضيوف', 1506, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.OrderDetails.SeeAllOrdersFromCustomer', 2, N'شاهد جميع أوامر من هذا العميل.', 1507, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.Title', 2, N'تعليقات', 1508, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.Description', 2, N'تعليقات صفحة البيانات.', 1509, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.SearchPlaceholder', 2, N'بحث في تعليقات', 1510, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.Search', 2, N'بحث', 1511, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.Reset', 2, N'إعادة تعيين', 1512, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.CommentUserName', 2, N'{user}', 1513, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.CommentTimestamp', 2, N'{datetime}', 1514, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.DeleteComment', 2, N'حذف تعليق', 1515, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.Action.Validation.NotAuthorizedToDeleteComment', 2, N'انك لم authorzed حذف هذا التعليق.', 1516, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.Action.Validation.UnableToDeleteComment', 2, N'غير قادر على حذف تعليق.', 1517, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Comments.List.NoRecordFound', 2, N'لا توجد تعليقات.', 1518, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.Title', 2, N'المستخدمين', 1519, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.Description', 2, N'المستخدمين سرد الصفحة.', 1520, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.SearchPlaceholder', 2, N'البحث عن طريق اسم المستخدم أو البريد الالكتروني', 1521, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.SelectByRole', 2, N'الاختيار عن طريق دور', 1522, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.Search', 2, N'بحث', 1523, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.Reset', 2, N'إعادة تعيين', 1524, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.RegisteredOn', 2, N'مسجلة على', 1525, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.Name', 2, N'اسم', 1526, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.Username', 2, N'اسم المستخدم', 1527, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.Email', 2, N'البريد الإلكتروني', 1528, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.Roles', 2, N'الأدوار', 1529, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.Actions', 2, N'أجراءات', 1530, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.MoreDetails', 2, N'المزيد من التفاصيل', 1531, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Users.List.NoRecordFound', 2, N'لم يتم العثور على المستخدمين.', 1532, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Title', 2, N'بيانات المستخدم', 1533, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Description', 2, N'بيانات المستخدم.', 1534, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Username', 2, N'اسم المستخدم', 1535, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Location', 2, N'موقعك', 1536, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info', 2, N'معلومات', 1537, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles', 2, N'الأدوار', 1538, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders', 2, N'الطلبات', 1539, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments', 2, N'تعليقات', 1540, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.NoUserFound', 2, N'لم يتم العثور على المستخدم.', 1541, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.FullName', 2, N'الاسم الكامل', 1542, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.PhoneNumber', 2, N'رقم الهاتف', 1543, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Country', 2, N'بلد', 1544, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.City', 2, N'مدينة', 1545, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Address', 2, N'عنوان', 1546, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.ZipCode', 2, N'الرمز البريدي', 1547, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Email', 2, N'البريد الإلكتروني', 1548, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Username', 2, N'اسم المستخدم', 1549, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Update', 2, N'تحديث', 1550, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Delete', 2, N'حذف', 1551, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.FullNameRequired', 2, N'الإسم الكامل ضروري.', 1552, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.FullNameMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1553, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.FullNameMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1554, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.CountryRequired', 2, N'الدولة مطلوبة.', 1555, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.CityRequired', 2, N'مطلوب المدينة.', 1556, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.AddressRequired', 2, N'العنوان مطلوب.', 1557, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.DataNotFormatted', 2, N'البيانات غير مهيأ.', 1558, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.UserNotFound', 2, N'المستخدم ليس موجود.', 1559, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.UnabletoUpdateInfo', 2, N'غير قادر على تحديث المعلومات.', 1560, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.InfoUpdated', 2, N'معلومات التحديث بنجاح.', 1561, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.UnabletoDeleteUser', 2, N'غير قادر على حذف المستخدم.', 1562, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Info.Action.Validation.UserDeleted', 2, N'العضو المحذوفة بنجاح.', 1563, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles.CurrentUserRoles', 2, N'أدوار المستخدمين الحالية', 1564, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles.RemoveUserRole', 2, N'إزالة دور', 1565, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles.UserDoesntHaveRoles', 2, N'لم يقم المستخدم أية أدوار.', 1566, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles.AssignNewRoles', 2, N'دور تعيين جديد', 1567, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles.SelectRole', 2, N'حدد دور', 1568, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles.AssignUserRole', 2, N'دور تعيين', 1569, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Roles.Action.Validation.SelectValidRole', 2, N'يرجى تحديد دور.', 1570, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.SearchByOrderIDPlaceholder', 2, N'البحث عن طريق ترتيب ID', 1571, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.SelectByOrderStatus', 2, N'الاختيار عن طريق ترتيب أوضاع ...', 1572, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.Placed', 2, N'وضعت', 1573, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.Processing', 2, N'معالجة', 1574, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.Delivered', 2, N'تم التوصيل', 1575, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.Failed', 2, N'فشل', 1576, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.Cancelled', 2, N'ألغيت', 1577, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.OnHold', 2, N'في الانتظار', 1578, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.WaitingForPayment', 2, N'في انتظار الدفع', 1579, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderStatus.Refunded', 2, N'ردها', 1580, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.Search', 2, N'بحث', 1581, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.Reset', 2, N'إعادة تعيين', 1582, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.PlacedOnDate', 2, N'وضعت على تاريخ', 1583, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.OrderAmount', 2, N'كمية الطلب', 1584, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.PaymentMethod', 2, N'طريقة الدفع او السداد', 1585, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.Status', 2, N'الحالة', 1586, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.Actions', 2, N'أجراءات', 1587, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.PaymentMethods.CreditCard', 2, N'بطاقة الائتمان', 1588, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.PaymentMethods.PayPal', 2, N'باي بال', 1589, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.PaymentMethods.CashOnDelivery', 2, N'الدفع عند الاستلام', 1590, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.UpdatedOn', 2, N'تحديث في', 1591, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.Details', 2, N'تفاصيل', 1592, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.Track', 2, N'مسار', 1593, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Orders.NoOrdersFound', 2, N'لم يتم العثور على أية طلبات.', 1594, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments.SearchCommentsPlaceholder', 2, N'بحث في تعليقات', 1595, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments.SearchComments', 2, N'بحث', 1596, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments.Reset', 2, N'إعادة تعيين', 1597, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments.CommentUserName', 2, N'{user}', 1598, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments.CommentTimestamp', 2, N'{datetime}', 1599, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments.DeleteComment', 2, N'حذف تعليق', 1600, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.UserDetails.Comments.NoComments', 2, N'لا توجد تعليقات.', 1601, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Title', 2, N'الأدوار', 1602, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Description', 2, N'الأدوار قائمة.', 1603, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.SearchPlaceholder', 2, N'بحث دور', 1604, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Search', 2, N'بحث', 1605, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Reset', 2, N'إعادة تعيين', 1606, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.CreateRole', 2, N'إنشاء دور', 1607, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.CreateNewRole', 2, N'إنشاء دور جديد', 1608, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Create.Name', 2, N'اسم الدور', 1609, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Create.NamePlaceholder', 2, N'إضافة اسم الدور', 1610, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Close', 2, N'قريب', 1611, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Save', 2, N'حفظ', 1612, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Save.Validations.NameRequired', 2, N'مطلوب اسم الدور.', 1613, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Save.Validations.NameMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1614, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Save.Validations.NameMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1615, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Role', 2, N'وظيفة', 1616, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Users', 2, N'المستخدمين', 1617, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.Actions', 2, N'أجراءات', 1618, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.MoreDetails', 2, N'المزيد من التفاصيل', 1619, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Roles.NoRolesFound', 2, N'لا توجد أدوار.', 1620, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Title', 2, N'تفاصيل الدور', 1621, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Description', 2, N'تفاصيل الدور', 1622, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Info', 2, N'معلومات', 1623, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Users', 2, N'المستخدمين', 1624, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Info.Name', 2, N'اسم', 1625, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Info.Update', 2, N'تحديث', 1626, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Info.Delete', 2, N'حذف', 1627, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Info.AdministratorRoleNotification', 2, N'لا يسمح هذا الدور إلى تحديث أو حذف لأنه يتم استخدامه للحصول على إذن.', 1628, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Info.RoleInfoUpdated', 2, N'المعلومات دور تجديد.', 1629, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Users.UsersWithRole', 2, N'المستخدمين مع هذا دور', 1630, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Users.MoreDetails', 2, N'المزيد من التفاصيل', 1631, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.RoleDetails.Users.NoUsersWithRole', 2, N'هذا الدور لا يتلقى أي المستخدمين.', 1632, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Title', 2, N'تكوينات', 1633, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Description', 2, N'تكوينات القيد.', 1634, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.SearchPlaceholder', 2, N'البحث تكوينات', 1635, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.SelectByConfigurationType', 2, N'الاختيار عن طريق نوع التكوين', 1636, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.ConfigurationTypes.Site', 2, N'موقع', 1637, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.ConfigurationTypes.Sliders', 2, N'المنزلق', 1638, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.ConfigurationTypes.Promotions', 2, N'الترقيات', 1639, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.ConfigurationTypes.SocialLinks', 2, N'روابط اجتماعية', 1640, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.ConfigurationTypes.Other', 2, N'آخر', 1641, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Search', 2, N'بحث', 1642, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Reset', 2, N'إعادة تعيين', 1643, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.List.Key', 2, N'مفتاح', 1644, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.List.Value', 2, N'القيمة', 1645, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.List.ConfigurationType', 2, N'نوع التكوين', 1646, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.List.Actions', 2, N'أجراءات', 1647, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.List.Edit', 2, N'تعديل', 1648, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.NoConfigurationFound', 2, N'لا توجد تكوين', 1649, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.EditConfiguration', 2, N'تحرير التكوين', 1650, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.UnableToUpdateConfigurations', 2, N'غير قادر على تحديث التشكيلات.', 1651, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.Value', 2, N'القيمة', 1652, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.SliderPicture', 2, N'صورة المنزلق', 1653, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.Heading', 2, N'عنوان', 1654, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.Paragraph', 2, N'فقرة', 1655, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.LinkURL', 2, N'URL رابط', 1656, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.Close', 2, N'قريب', 1657, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.Save', 2, N'حفظ', 1658, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.Edit.Validation.ConfigurationValueRequited', 2, N'مطلوب قيمة التكوين.', 1659, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Configurations.ConfigurationNotFound', 2, N'التكوين غير موجود.', 1660, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Title', 2, N'اللغات', 1661, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Description', 2, N'اللغات الإدراج', 1662, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.SearchPlaceholder', 2, N'البحث اللغات', 1663, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Search', 2, N'بحث', 1664, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Reset', 2, N'إعادة تعيين', 1665, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.AddLanguage', 2, N'إضافة لغة', 1666, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Icon', 2, N'أيقونة', 1667, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Name', 2, N'اسم', 1668, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.ShortCode', 2, N'رمز قصير', 1669, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Status', 2, N'الحالة', 1670, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Actions', 2, N'أجراءات', 1671, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.DefaultSiteLanguage', 2, N'افتراضي لغة الموقع', 1672, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Enabled', 2, N'تمكين', 1673, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Disabled', 2, N'معاق', 1674, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Edit', 2, N'تعديل', 1675, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Disable', 2, N'تعطيل', 1676, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.Enable', 2, N'ممكن', 1677, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.ConfirmDisableWarning', 2, N'هل أنت متأكد أنك تريد تعطيل هذه اللغة؟', 1678, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.ConfirmDisable', 2, N'نعم، تعطيله!', 1679, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.ConfirmDisableCancel', 2, N'لا، لا أميل تعطيل.', 1680, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.List.NoLanguagesFound', 2, N'لا توجد لغات.', 1681, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.EditLangaugeTitle', 2, N'تحرير اللغة', 1682, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.EditLanguageDescription', 2, N'تحرير اللغة', 1683, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.CreateLanguageTitle', 2, N'خلق لغة', 1684, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.CreateLanguageDescription', 2, N'خلق لغة جديدة', 1685, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Name', 2, N'اسم', 1686, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ShortCode', 2, N'رمز قصير', 1687, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Enabled', 2, N'تمكين', 1688, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.MakeDefault', 2, N'جعل اللغة الافتراضية', 1689, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.IsRTL', 2, N'غير RTL', 1690, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Icon', 2, N'أيقونة', 1691, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.SelectLanguageIcon', 2, N'اختر اللغة أيقونة', 1692, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.SearchForIcon', 2, N'البحث عن أيقونة', 1693, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.SearchIconPlaceholder', 2, N'بحث مع البلد قصيرة اسم أي بمعنى الولايات المتحدة أو GB', 1694, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Update', 2, N'تحديث', 1695, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Disable', 2, N'تعطيل', 1696, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Enable', 2, N'ممكن', 1697, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Save', 2, N'حفظ', 1698, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Cancel', 2, N'إلغاء', 1699, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.NameRequired', 2, N'مطلوب اسم.', 1700, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.NameMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1701, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.NameMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1702, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.ShortCodeRequired', 2, N'مطلوب كود قصيرة.', 1703, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.ShortCodeMinimumLength', 2, N'الحد الأدنى طول هو {min}.', 1704, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.ShortCodeMaximumLength', 2, N'الحد الأقصى للطول هو {max}.', 1705, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ImportResources', 2, N'مصادر استيراد', 1706, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ChooseFile', 2, N'اختر ملف', 1707, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Import', 2, N'استيراد', 1708, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ExportResources', 2, N'الموارد تصدير', 1709, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ExportLanguageResources', 2, N'الموارد اللغة التصدير', 1710, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Export', 2, N'تصدير', 1711, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ExportNoResourcesWarning', 2, N'لم يكن لديك هذه اللغة أي موارد. يرجى استيراد حزمة اللغة.', 1712, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ResourcesImportedSuccess', 2, N'تم استيرادها الموارد بنجاح.', 1713, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.ResourcesExportingWarning', 2, N'يمكن إعداد ملف المورد يستغرق بعض الوقت. الرجاء الانتظار بينما يقوم النظام بتوليد ملف التحميل.', 1714, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.SelectFileToUpload', 2, N'الرجاء اختيار الملف المراد تحميله.', 1715, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.SelectValidFileToUpload', 2, N'يرجى تحميل الملف مع الشكل الصحيح.', 1716, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.LanguageNotFound', 2, N'لغة غير موجود.', 1717, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.DefaultLanguageIsMust', 2, N'يجب أن تكون هناك لغة افتراضية. يرجى تحديد لغة أخرى كما الافتراضي ثم قم بتحديث هذه اللغة.', 1718, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.UnableToUpdateLanguage', 2, N'غير قادر على تحديث اللغة.', 1719, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.UnableToCreateLanguage', 2, N'غير قادر على خلق لغة.', 1720, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.DefaultLanguageCantBeDisabled', 2, N'لا يمكن أن تكون اللغة الافتراضية المعوقين.', 1721, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.NoResourcesInFile', 2, N'لا توجد موارد في الملف.', 1722, 0, 0, NULL)
GO
INSERT [dbo].[LanguageResources] ([Key], [LanguageID], [Value], [ID], [IsActive], [IsDeleted], [ModifiedOn]) VALUES (N'2_Dashboard.Languages.Action.Validation.UnableToImportResources', 2, N'غير قادر على الموارد الاستيراد.', 1723, 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[LanguageResources] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 

GO
INSERT [dbo].[Languages] ([ID], [Name], [ShortCode], [IsEnabled], [ResourceFileName], [IsRTL], [IsDefault], [ModifiedOn], [IsActive], [IsDeleted], [IconCode]) VALUES (1, N'English', N'en', 1, NULL, 0, 1, NULL, 0, 0, N'GB.png')
GO
INSERT [dbo].[Languages] ([ID], [Name], [ShortCode], [IsEnabled], [ResourceFileName], [IsRTL], [IsDefault], [ModifiedOn], [IsActive], [IsDeleted], [IconCode]) VALUES (2, N'عربى', N'ar', 1, NULL, 1, 0, NULL, 0, 0, N'SA.png')
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[Pictures] ON 

GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (1, N'demo/2.png', CAST(N'2020-05-17 00:01:21.643' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (2, N'demo/3.png', CAST(N'2020-05-17 00:01:21.643' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (3, N'demo/4.png', CAST(N'2020-05-17 00:01:21.643' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (4, N'demo/5.png', CAST(N'2020-05-17 00:01:21.660' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (5, N'demo/6.png', CAST(N'2020-05-17 00:01:21.660' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (6, N'demo/7.png', CAST(N'2020-05-17 00:01:21.660' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (7, N'demo/8.png', CAST(N'2020-05-17 00:01:21.660' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (8, N'demo/9.png', CAST(N'2020-05-17 00:01:21.677' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (9, N'demo/10.png', CAST(N'2020-05-17 00:01:21.677' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (10, N'demo/11.png', CAST(N'2020-05-17 00:01:21.677' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (11, N'demo/12.png', CAST(N'2020-05-17 00:01:21.677' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (12, N'demo/13.png', CAST(N'2020-05-17 00:01:21.690' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (13, N'demo/14.png', CAST(N'2020-05-17 00:01:21.690' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (14, N'demo/15.png', CAST(N'2020-05-17 00:01:21.690' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (15, N'demo/16.png', CAST(N'2020-05-17 00:01:21.690' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (16, N'demo/17.png', CAST(N'2020-05-17 00:01:21.707' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (17, N'demo/18.png', CAST(N'2020-05-17 00:01:21.707' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (18, N'demo/19.png', CAST(N'2020-05-17 00:01:21.707' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (19, N'demo/20.png', CAST(N'2020-05-17 00:01:21.723' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (20, N'demo/21.png', CAST(N'2020-05-17 00:01:21.723' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (21, N'demo/22.png', CAST(N'2020-05-17 00:01:21.723' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (22, N'demo/23.png', CAST(N'2020-05-17 00:01:21.723' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (23, N'demo/24.png', CAST(N'2020-05-17 00:01:21.740' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (24, N'demo/25.png', CAST(N'2020-05-17 00:01:21.740' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (25, N'demo/26.png', CAST(N'2020-05-17 00:01:21.740' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (26, N'demo/27.png', CAST(N'2020-05-17 00:01:21.740' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (27, N'demo/28.png', CAST(N'2020-05-17 00:01:21.753' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (28, N'demo/29.png', CAST(N'2020-05-17 00:01:21.753' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (29, N'demo/30.png', CAST(N'2020-05-17 00:01:21.753' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (30, N'demo/31.png', CAST(N'2020-05-17 00:01:21.753' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (31, N'demo/32.png', CAST(N'2020-05-17 00:01:21.770' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (32, N'demo/33.png', CAST(N'2020-05-17 00:01:21.770' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (33, N'demo/34.png', CAST(N'2020-05-17 00:01:21.770' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (34, N'demo/35.png', CAST(N'2020-05-17 00:01:21.787' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (35, N'demo/36.png', CAST(N'2020-05-17 00:01:21.787' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (36, N'demo/37.png', CAST(N'2020-05-17 00:01:21.787' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (37, N'demo/38.png', CAST(N'2020-05-17 00:01:21.787' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (38, N'demo/39.png', CAST(N'2020-05-17 00:01:21.787' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (39, N'demo/40.png', CAST(N'2020-05-17 00:01:21.800' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (40, N'demo/41.png', CAST(N'2020-05-17 00:01:21.800' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (41, N'demo/42.png', CAST(N'2020-05-17 00:01:21.800' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (42, N'demo/43.png', CAST(N'2020-05-17 00:01:21.817' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (43, N'demo/44.png', CAST(N'2020-05-17 00:01:21.817' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (44, N'demo/45.png', CAST(N'2020-05-17 00:01:21.817' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (45, N'demo/46.png', CAST(N'2020-05-17 00:01:21.817' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (46, N'demo/47.png', CAST(N'2020-05-17 00:01:21.833' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (47, N'demo/48.png', CAST(N'2020-05-17 00:01:21.833' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (48, N'demo/49.png', CAST(N'2020-05-17 00:01:21.833' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (49, N'demo/50.png', CAST(N'2020-05-17 00:01:21.833' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (50, N'demo/51.png', CAST(N'2020-05-17 00:01:21.847' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (51, N'demo/52.png', CAST(N'2020-05-17 00:01:21.847' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (52, N'demo/53.png', CAST(N'2020-05-17 00:01:21.847' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (53, N'demo/54.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (54, N'demo/55.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (55, N'demo/56.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (56, N'demo/57.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (57, N'demo/58.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (58, N'demo/59.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (59, N'demo/60.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (60, N'demo/61.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (61, N'demo/62.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (62, N'demo/63.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (63, N'demo/64.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (64, N'demo/65.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (65, N'demo/66.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (66, N'demo/67.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (67, N'demo/68.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (68, N'demo/69.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (69, N'demo/70.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (70, N'demo/71.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (71, N'demo/72.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (72, N'demo/73.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (73, N'demo/74.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (74, N'demo/75.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (75, N'demo/76.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (76, N'demo/77.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (77, N'demo/78.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (78, N'demo/79.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (79, N'demo/80.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (80, N'demo/81.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (81, N'demo/82.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (82, N'demo/83.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (83, N'demo/84.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (84, N'demo/85.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (85, N'demo/86.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (86, N'demo/87.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (87, N'demo/88.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (88, N'demo/89.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (89, N'demo/90.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (90, N'demo/91.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (91, N'demo/92.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (92, N'demo/93.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (93, N'demo/94.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (94, N'demo/95.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (95, N'demo/96.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (96, N'demo/97.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (97, N'demo/98.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (98, N'demo/99.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (99, N'demo/100.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (100, N'demo/101.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (101, N'demo/102.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (102, N'demo/103.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (103, N'demo/104.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (104, N'demo/105.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (105, N'demo/106.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (106, N'demo/107.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (107, N'demo/108.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (108, N'demo/109.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (109, N'demo/110.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (110, N'demo/111.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (111, N'demo/112.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (112, N'demo/113.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (113, N'demo/114.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (114, N'demo/115.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (115, N'demo/116.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (116, N'demo/117.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (117, N'demo/118.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (118, N'demo/119.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (119, N'demo/120.png', CAST(N'2020-05-17 00:01:21.863' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (120, N'demo/121.png', CAST(N'2020-05-17 00:01:21.880' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (121, N'demo/122.png', CAST(N'2020-05-17 00:01:21.880' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (122, N'demo/123.png', CAST(N'2020-05-17 00:01:21.880' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (123, N'demo/124.png', CAST(N'2020-05-17 00:01:21.893' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (124, N'demo/125.png', CAST(N'2020-05-17 00:01:21.893' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (125, N'demo/126.png', CAST(N'2020-05-17 00:01:21.893' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (126, N'demo/127.png', CAST(N'2020-05-17 00:01:21.893' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (127, N'demo/128.png', CAST(N'2020-05-17 00:01:21.893' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (128, N'demo/129.png', CAST(N'2020-05-17 00:01:21.910' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (129, N'demo/130.png', CAST(N'2020-05-17 00:01:21.910' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (130, N'demo/131.png', CAST(N'2020-05-17 00:01:21.910' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (131, N'demo/132.png', CAST(N'2020-05-17 00:01:21.910' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (132, N'demo/133.png', CAST(N'2020-05-17 00:01:21.927' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (133, N'demo/134.png', CAST(N'2020-05-17 00:01:21.927' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (134, N'demo/135.png', CAST(N'2020-05-17 00:01:21.927' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (135, N'demo/136.png', CAST(N'2020-05-17 00:01:21.940' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (136, N'demo/137.png', CAST(N'2020-05-17 00:01:21.940' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (137, N'demo/138.png', CAST(N'2020-05-17 00:01:21.940' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (138, N'demo/139.png', CAST(N'2020-05-17 00:01:21.940' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (139, N'demo/140.png', CAST(N'2020-05-17 00:01:21.957' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (140, N'demo/141.png', CAST(N'2020-05-17 00:01:21.957' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (141, N'demo/142.png', CAST(N'2020-05-17 00:01:21.957' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (142, N'demo/143.png', CAST(N'2020-05-17 00:01:21.957' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (143, N'demo/144.png', CAST(N'2020-05-17 00:01:21.973' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (144, N'demo/145.png', CAST(N'2020-05-17 00:01:21.973' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (145, N'demo/146.png', CAST(N'2020-05-17 00:01:21.973' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (146, N'demo/147.png', CAST(N'2020-05-17 00:01:21.973' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (147, N'demo/148.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (148, N'demo/149.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (149, N'demo/150.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (150, N'demo/151.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (151, N'demo/152.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (152, N'demo/153.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (153, N'demo/154.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (154, N'demo/155.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (155, N'demo/156.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (156, N'demo/157.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (157, N'demo/158.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (158, N'demo/159.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (159, N'demo/160.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (160, N'demo/161.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (161, N'demo/162.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (162, N'demo/163.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (163, N'demo/164.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (164, N'demo/165.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (165, N'demo/166.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (166, N'demo/167.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (167, N'demo/168.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (168, N'demo/169.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (169, N'demo/170.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (170, N'demo/171.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (171, N'demo/172.png', CAST(N'2020-05-17 00:01:21.990' AS DateTime), 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (172, N'demo/7ecffd94-2365-452a-95be-cbb69b9c59cc.png', NULL, 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (173, N'demo/c0ed2af7-6eb6-4b8a-bb73-45c4b4d410f1.png', NULL, 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (174, N'demo/76572ecd-2b3c-4dec-b600-e8b3da64160d.png', NULL, 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (175, N'demo/8c273651-6ae0-4cfd-ba5f-9514b78a99e9.png', NULL, 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (176, N'demo/8a90c65c-dd7c-4be9-9efe-9d9ab62481ea.jpg', NULL, 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (177, N'demo/6ba0a398-8285-4f4e-9144-eb3a57098388.jpeg', NULL, 0, 0)
GO
INSERT [dbo].[Pictures] ([ID], [URL], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (178, N'demo/a9b67549-4ef7-409b-92e2-8655aec21f4a.png', NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPictures] ON 

GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (1, 1, 1, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (2, 2, 2, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (3, 3, 3, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (4, 4, 4, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (5, 5, 5, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (6, 6, 6, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (7, 7, 7, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (8, 8, 8, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (9, 9, 9, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (10, 10, 10, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (11, 11, 11, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (12, 12, 12, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (13, 13, 13, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (14, 14, 14, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (15, 15, 15, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (16, 16, 16, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (17, 17, 17, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (18, 18, 18, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (19, 19, 19, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (20, 20, 20, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (21, 21, 21, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (22, 22, 22, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (23, 23, 23, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (24, 24, 24, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (25, 25, 25, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (26, 26, 26, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (27, 27, 27, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (28, 28, 28, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (29, 29, 29, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (30, 30, 30, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (31, 31, 31, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (32, 32, 32, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (33, 33, 33, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (34, 34, 34, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (35, 35, 35, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (36, 36, 36, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (37, 37, 37, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (38, 38, 38, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (39, 39, 39, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (40, 40, 40, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (41, 41, 41, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (42, 42, 42, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (43, 43, 43, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (44, 44, 44, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (45, 45, 45, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (46, 46, 46, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (47, 47, 47, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (48, 48, 48, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (49, 49, 49, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (50, 50, 50, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (51, 51, 51, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (52, 52, 52, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (53, 53, 53, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (54, 54, 54, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (55, 55, 55, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (56, 56, 56, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (57, 57, 57, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (58, 58, 58, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (59, 59, 59, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (60, 60, 60, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (61, 61, 61, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (62, 62, 62, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (63, 63, 63, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (64, 64, 64, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (65, 65, 65, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (66, 66, 66, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (67, 67, 67, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (68, 68, 68, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (69, 69, 69, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (70, 70, 70, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (71, 71, 71, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (72, 72, 72, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (73, 73, 73, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (74, 74, 74, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (75, 75, 75, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (76, 76, 76, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (77, 77, 77, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (78, 78, 78, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (79, 79, 79, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (80, 80, 80, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (81, 81, 81, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (82, 82, 82, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (83, 83, 83, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (84, 84, 84, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (85, 85, 85, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (86, 86, 86, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (87, 87, 87, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (88, 88, 88, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (89, 89, 89, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (90, 90, 90, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (91, 91, 91, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (92, 92, 92, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (93, 93, 93, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (94, 94, 94, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (95, 95, 95, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (96, 96, 96, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (97, 97, 97, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (98, 98, 98, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (99, 99, 99, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (100, 100, 100, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (101, 101, 101, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (102, 102, 102, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (103, 103, 103, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (104, 104, 104, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (105, 105, 105, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (106, 106, 106, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (107, 107, 107, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (108, 108, 108, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (109, 109, 109, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (110, 110, 110, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (111, 111, 111, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (112, 112, 112, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (113, 113, 113, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (114, 114, 114, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (115, 115, 115, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (116, 116, 116, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (117, 117, 117, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (118, 118, 118, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (119, 119, 119, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (120, 120, 120, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (121, 121, 121, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (122, 122, 122, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (123, 123, 123, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (124, 124, 124, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (125, 125, 125, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (126, 126, 126, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (127, 127, 127, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (128, 128, 128, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (129, 129, 129, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (130, 130, 130, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (131, 131, 131, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (132, 132, 132, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (133, 133, 133, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (134, 134, 134, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (135, 135, 135, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (136, 136, 136, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (137, 137, 137, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (138, 138, 138, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (139, 139, 139, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (140, 140, 140, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (142, 142, 142, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (143, 143, 143, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (145, 145, 145, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (146, 146, 146, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (148, 148, 148, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (150, 150, 150, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (151, 151, 151, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (152, 152, 152, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (153, 153, 153, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (154, 154, 154, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (155, 155, 155, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (156, 156, 156, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (157, 157, 157, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (158, 158, 158, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (159, 159, 159, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (160, 160, 160, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (161, 161, 161, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (162, 162, 162, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (163, 163, 163, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (164, 164, 164, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (165, 165, 165, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (166, 166, 166, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (167, 167, 167, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (168, 168, 168, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (169, 169, 169, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (170, 170, 170, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (171, 171, 171, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (174, 141, 141, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (175, 144, 144, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (176, 147, 147, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (178, 149, 149, NULL, 0, 0)
GO
INSERT [dbo].[ProductPictures] ([ID], [ProductID], [PictureID], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (179, 149, 178, NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[ProductPictures] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductRecords] ON 

GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (1, 1, 1, N'Anker Powerport II PD with 1 PD and 1 PIQ 2.0', N'Forget about taking multiple wall adapters everywhere you go. With one dedicated USB-C Power Delivery port and one port equipped with Anker’s world-famous PowerIQ 2.0 technology, you can charge nearly any device you own—all from a single charger.', NULL, CAST(N'2020-05-17 00:00:41.927' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (2, 2, 1, N'Anker power port 5 black BD', N'60W high power charger with the latest electronic technology. Temperature control technology with high voltage and fast charging technology.', NULL, CAST(N'2020-05-17 00:00:41.927' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (3, 3, 1, N'Anker power port Speed 5 ( QC 3.0) -Black', N'Fast shipping distributor has 5 ports for shipping Qualcomm Fast Shipping 3.0 is compatible with all IQ system devices guarantee a year and a half', NULL, CAST(N'2020-05-17 00:00:41.927' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (4, 4, 1, N'Anker power port travel black 4 USB', N'You can charge your phone while you are traveling to all countries around the world. Contains the latest technology. Smart Security. Security and safety techniques.', NULL, CAST(N'2020-05-17 00:00:41.940' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (5, 5, 1, N'Anker Wall Charger port 4 white', N'Durable, high-quality design with 4-port smart 27-watt express charging features', NULL, CAST(N'2020-05-17 00:00:41.940' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (6, 6, 1, N'Anker Wall Charger 1 with QC3.0 -Black', N'Quick Charger Single Port Qualcomm 3.0 Fast Compatible with all versions of the IQ provider with a one and a half year warranty', NULL, CAST(N'2020-05-17 00:00:41.940' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (7, 7, 1, N'Anker Wall Charger 24W 2-Port USB -white', N'Distinctive design with high quality and excellent with intelligent charging and security ports Charging speed up to 2.4 Amp IQ system a year and a half warranty', NULL, CAST(N'2020-05-17 00:00:41.957' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (8, 8, 1, N'Anker Wall Charger 24W 2-Port USB -Black', N'Distinctive design with high quality and excellent with intelligent charging and security ports Charging speed up to 2.4 Amp IQ system a year and a half warranty', NULL, CAST(N'2020-05-17 00:00:41.957' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (9, 9, 1, N'Apple Adapter', N'Black Apple iPhone home certified by Apple 5W Warranty Year', NULL, CAST(N'2020-05-17 00:00:41.957' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (10, 10, 1, N'Belkin USB surge protector 4 ports +2 USB', N'Powerful 4-socket power connector and 2 2-watt (12-watt) USB port (2.4) Maintaining data integrity with surge protection 2 meter wire length', NULL, CAST(N'2020-05-17 00:00:41.973' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (11, 11, 1, N'Stand Magentic Charger for Apple Watch', N'All-in-one and all-round navigation support Magnets for charging Apple watches All versions Series 1.2.3.4 Fast charging Smart Security', NULL, CAST(N'2020-05-17 00:00:41.973' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (12, 12, 1, N'Magnetic Charging Module', N'Charger charger for the Apple charger is a smart charger that can be connected to the home charger directly or on Power Bank ships all versions Series 1.2.3.4', NULL, CAST(N'2020-05-17 00:00:41.973' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (13, 13, 1, N'Magnetic Charging Cable 1M', N'Magnet charger for charging Apple watch Features a quick charger Smart Security Charges Series 1.2.3 features a 1 meter length', NULL, CAST(N'2020-05-17 00:00:41.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (14, 14, 1, N'Magnetic Charging Cable 1.5 M', N'Magnet charger for charging Apple watch features a fast charger Smart Security Charges Series 1.2.3 features a 2 meter long', NULL, CAST(N'2020-05-17 00:00:41.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (15, 15, 1, N'Anker Car Charger BD', N'Made of high quality plastic reinforced with the best modern electronic technology for security and safety by the technology of the rack of the power of the Albor rapid delivery and the smart IQ2 port guarantee a year and a half', NULL, CAST(N'2020-05-17 00:00:41.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (16, 16, 1, N'Anker car charger Qualcomm 3', N'Fast shipping with great carbon design with modern security and intelligent charging technologies with Qualcomm 3.0 Watt 3.0 W /', NULL, CAST(N'2020-05-17 00:00:41.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (17, 17, 1, N'Anker Car Charger IQ', N'Powerful charger Small size Modern design with modern charging technology with full protection Speed ??up to 2.4 mps for each port with two 24-watt ports with IQ system Warranty of one and a half years', NULL, CAST(N'2020-05-17 00:00:42.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (18, 18, 1, N'Roav smartcharge car kit', N'SOUND Bluetooth and FM connectionBUILT-IN CAR LOCATOR:2 USB ports equipped with advanced technology deliver high-speed charging. Bluetooth 4.2 enables any car stereo to make and receive phone calls.', NULL, CAST(N'2020-05-17 00:00:42.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (19, 19, 1, N'Stand Wizgear Magnetic With Long Arm', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad with a long tractor moving in all directions 360 degrees can be placed on the dashboard or windshield', NULL, CAST(N'2020-05-17 00:00:42.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (20, 20, 1, N'Stand Wizgear Magnetic C.D', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad installed with CD open moving in all directions 360 degrees easy to use and installation', NULL, CAST(N'2020-05-17 00:00:42.020' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (21, 21, 1, N'Stand Wizgear big', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad with a short arm moving in all directions 360 degrees can be placed on the dashboard or windshield', NULL, CAST(N'2020-05-17 00:00:42.020' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (22, 22, 1, N'Stand Wizgear Magnetic medium', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad moving in all directions 360 degrees Can be placed on the decor in the car Strong adhesive', NULL, CAST(N'2020-05-17 00:00:42.020' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (23, 23, 1, N'Stand Wizgear Magnetic small', N'Wizger car is considered one of the strongest brands of magnets in the world strong bear even the weight of the iPad fixed can be placed on the decor in the car strong adhesiv', NULL, CAST(N'2020-05-17 00:00:42.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (24, 24, 1, N'RAVPOWER Ultra Compact Phone Holder', N'This magnetic two-piece ball mount kit allows you to effortlessly attach your phone to your dashboard so you can keep your hands on the wheel.', NULL, CAST(N'2020-05-17 00:00:42.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (25, 25, 1, N'UGREEN MAGNETIC CAR HOLDER', N'Your phone can be firmly installed in the car. Never worry about falling even while driving on a bumpy road. It can hold your mobile phone securely even on rough road, protect your phone while driving.This dashboard phone holder lets you adjust and choo', NULL, CAST(N'2020-05-17 00:00:42.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (26, 26, 1, N'Dausen tube 360 Universal Windshield Mount', N'DAUSEN UNIVERSAL WINDSHIELD MOUNT TUBE 360 DEGREESimple interface, heavy duty design. Our sliding lock lever design lets you attach and remove the mount easily on any windshield. Once attached the mount will securely hold your mobile phone in place', NULL, CAST(N'2020-05-17 00:00:42.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (27, 27, 1, N'Dausen Magnetic stand', N'360 degree rotary head design Easily stick to the dashboard of the car Strong can be placed on the dashboard or windscreen Magnet strength Not affected by heat or cold', NULL, CAST(N'2020-05-17 00:00:42.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (28, 28, 1, N'UGREEN DESKTOP CHARGER STAND', N'This Apple Watch charger holder is made to protect your Apple Watch and prevent it from falling. This stand can support Apples original magnetic charging unit as well as the UGREEN magnetic charging unit.It is suitable for all Apple Watch watches (1, 2,', NULL, CAST(N'2020-05-17 00:00:42.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (29, 29, 1, N'ROCK SHOOTING GAME CONTROLLER', N'Enjoy Playing Games Anywhere. The Joystick offers you a real physical object of high precision and sensitive, making you enjoy the game and operating it, helping you win the game easily.', NULL, CAST(N'2020-05-17 00:00:42.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (30, 30, 1, N'GameSir-F2- Grip puBG hand Controller', N'Enjoy Playing Games Anywhere. The Joystick offers you a real physical object of high precision and sensitive, making you enjoy the game and operating it, helping you win the game easily.', NULL, CAST(N'2020-05-17 00:00:42.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (31, 31, 1, N'Elegant Wood case for Apple Airpods - Nude', N'Apple Airpods case hand made by natural wood and leather for more stronger casing for your airpods. Color available for this item ( Nude / Pink / Blue / Off White / Yellow )', NULL, CAST(N'2020-05-17 00:00:42.067' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (32, 32, 1, N'UGREEN CASE FOR APPLE AIRPODS??', N'Ugreen Cover designed specifically for Apple AirPods.?Protect your AirPods from falling and scratches Available in white, blue and black color', NULL, CAST(N'2020-05-17 00:00:42.067' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (33, 33, 1, N'UGREEN TRAVEL STORAGE CASE', N'Reasonable design and ideal for traveling by maintaining all cables, electronic gadgets and cosmeticsIn the same place making it easier to find. A great way to end the mess in your travel bagAnd keep all the small tools well organized.', NULL, CAST(N'2020-05-17 00:00:42.067' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (34, 34, 1, N'MONET WALLET KICKSTANT', N'MONET has 2 pockets that can securely hold credit cards, IDs, metro cards, business cards, cash and more.', NULL, CAST(N'2020-05-17 00:00:42.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (35, 35, 1, N'EGO 10000mAh 4 in 1 Powerbank', N'Exclusive in kuwait Powerbank 4 in 1 Charge your phone your apple watch your airpods at the same time. 10W wireless charging and 18W PD charging is faster than Apple’s charger! 10000 Capacity.4 USB OUTPUT 1 USB input PD5Led Charging Status LightTYPE', NULL, CAST(N'2020-05-17 00:00:42.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (36, 36, 1, N'DAUSEN 6000mAh Pavonine Power Bank', N'High capacity of 6000mAh . Built-in LED flashlight . Built-in LCD battery status indicator. Warranty 1 year.', NULL, CAST(N'2020-05-17 00:00:42.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (37, 37, 1, N'10000mAh Slim-X Pro Wireless Charge, QC3.0, PD Power Bank', N'Dosen 10,000 mAh Wireless Charger - Black ???Wirelessly charge your devices along with an external capacity battery. Optional 10000 able to charge smartphones at the same time.', NULL, CAST(N'2020-05-17 00:00:42.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (38, 38, 1, N'Anker power bank 26800 Pd black', N'PowerCore+ 26800 PD with 30W Power Delivery Charger Designed with high quality aluminum made of the best modern technology for security shipping with two ports of the IQ2 system and the PowerDelivery Express port is recharged during 5.30 hours warranty on', NULL, CAST(N'2020-05-17 00:00:42.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (39, 39, 1, N'ANKER POWERCODE 10000 PD+', N'Charge your mobile devices at an optimized speed via the USB-A port. Your USB-C phones, tablets, and more get a full-speed charge from the Power Delivery.', NULL, CAST(N'2020-05-17 00:00:42.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (40, 40, 1, N'RAVPower / Car Jump Starter / Element 14000mAh 1000A Peak QC3.0-Black', N'Ravpower Power Bank and Battery Operation 14000 mAh Battery with 3 ports for charging phones and (1 Qualcomm 3.0) with Ismart car operating system up to 12 cylinder. Easy and simple operation mode Warranty one and a half years.', NULL, CAST(N'2020-05-17 00:00:42.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (41, 41, 1, N'Anker power bank 20000 core ll black', N'Durable, strong and excellent specifications with modern smart charging and security technologies with two charging ports and a recharging port equipped with a one and a half year IQ warranty system', NULL, CAST(N'2020-05-17 00:00:42.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (42, 42, 1, N'Anker power bank 13400 Q 3.0', N'High quality, high quality aluminum specifications Modern intelligent charging technology with IQ and Qualcomm 3 with recharging port Warranty 1 and a half years warranty', NULL, CAST(N'2020-05-17 00:00:42.113' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (43, 43, 1, N'Anker power bank 10000 slim', N'Slim light Small size with modern charging technology with one smart charging port Smart security and recharging port equipped with IQ system a year and a half warranty', NULL, CAST(N'2020-05-17 00:00:42.113' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (44, 44, 1, N'Anker power bank 10000 X 2.5 fast', N'Designed with excellent specifications Small size Attractive design with one smart charging port Smart security with IQ system and a recharging port Warranty 1 year and a half', NULL, CAST(N'2020-05-17 00:00:42.113' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (45, 45, 1, N'Anker power bank 6700', N'Durable with high quality and excellent specifications with modern smart charging and security technology with a security charging port and a recharging port with IQ system Warranty of one and a half years', NULL, CAST(N'2020-05-17 00:00:42.113' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (46, 46, 1, N'Anker power bank 5200', N'Durable with high quality and excellent specifications with modern smart charging and security technology with a security charging port and a recharging port with IQ system Warranty of one and a half years', NULL, CAST(N'2020-05-17 00:00:42.130' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (47, 47, 1, N'UGREEN 10000mAh External Phone Battery with Type USB Lightning Csble', N'Charge Apple and Android devices Simultaneously: With built-in MFi Certified Lightning Cable and external micro USB Port.Warranty: 18 Months', NULL, CAST(N'2020-05-17 00:00:42.130' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (48, 48, 1, N'belkin lightning Audio + charge + Aux', N'Can listen music or connect the device to the car to play music and charging simultaneously The link depends on the fast shipping security supported by Apple', NULL, CAST(N'2020-05-17 00:00:42.130' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (49, 49, 1, N'belkin lightning Audio + charge 2 outlet', N'Music listening and charging can be simultaneously connected based on fast charging security supported by Apple', NULL, CAST(N'2020-05-17 00:00:42.130' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (50, 50, 1, N'Lighting to USB Cable 1.5m Silver', N'Wi-Fi U green is a fast-cut aluminum alloy that features a smart, fast and smart charging with a 1.5-meter color Silver color', NULL, CAST(N'2020-05-17 00:00:42.143' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (51, 51, 1, N'Lighting to USB Cable 1.5m Black', N'Wire iphone is a fast, aluminum-resistant fast-cutting aluminum alloy featuring fast, safe and smart charging', NULL, CAST(N'2020-05-17 00:00:42.143' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (52, 52, 1, N'cable Ugreen 3 in 1 black 1m', N'Wi-Fi U green is a fast, aluminum-resistant, fast-cut aluminum alloy featuring fast and smart charging. You can charge all versions of USB Micro _ Type C _ lightening with 1 meter black', NULL, CAST(N'2020-05-17 00:00:42.143' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (53, 53, 1, N'cable Ugreen 3 in 1 black 1.5 m', N'WIRELESS U Green A fast, aluminum-resistant, fast-cut aluminum alloy featuring fast, secure and smart charging You can charge all versions of USB Micro _ Type C _ lightening with 1.50 m long black', NULL, CAST(N'2020-05-17 00:00:42.143' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (54, 54, 1, N'UGREEN Cable Lightning to USB Red power line 1m', N'Wi-Fi U green is a fast-cutting, aluminum-made, fast-charging, smart-charging, 1-meter-long red color', NULL, CAST(N'2020-05-17 00:00:42.143' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (55, 55, 1, N'Type C Multifultional Converter 8 in 1', N'Perform USB-C Multifunction 8-in-1: Expand your USB-C port to 4KHz HDMI video output, Gigabit Ethernet port, Micro SD (TF) card reader, SD, 3 USB 3.0 ports and port Charging of type C PD (max 20V 5A). Ideal choice for laptops', NULL, CAST(N'2020-05-17 00:00:42.160' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (56, 56, 1, N'UGREEN HDMI 2.0 VERSION CABLE 1 METER', N'HDMI 2.0 CABLE: Enable you to directly connect your laptop to an HDMI-equipped display with maximum 4K at 60Hz. Warranty: 18 Months', NULL, CAST(N'2020-05-17 00:00:42.160' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (57, 57, 1, N'UGREEN HDMI 2.0 VERSION CABLE 5 METER', N'HDMI 2.0 CABLE: Enable you to directly connect your laptop to an HDMI-equipped display with maximum 4K at 60Hz. Warranty: 18 Months', NULL, CAST(N'2020-05-17 00:00:42.160' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (58, 58, 1, N'cable USB - lightning 1 m Apple', N'Apple iPhone Charging Cable USB 2.0 Charging and Synchronization Length 1 m Warranty Year', NULL, CAST(N'2020-05-17 00:00:42.160' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (59, 59, 1, N'cable USB - lightning 2 m Apple', N'Apple iPhone 3G Cable Supported by Apple USB 2.0 Charging and Sync Length 2 m Warranty Year', NULL, CAST(N'2020-05-17 00:00:42.177' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (60, 60, 1, N'cable lightning - type c 1 m Apple', N'Apple iPhone Iphone C-Class Apple Certified You can take advantage of the fast shipping feature and you can also use the BlackBerry 29/30/61 / 87W for synchronization and high-speed shipping Warranty Year', NULL, CAST(N'2020-05-17 00:00:42.177' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (61, 61, 1, N'Iphone 7 connector', N'The iPhone 7 connection is a Lightning to AUX conversion certified by Apple Year Warranty', NULL, CAST(N'2020-05-17 00:00:42.177' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (62, 62, 1, N'lightning Digital apple HDMI', N'Apple TV connection and therefore to pair the phone with the screen and mirroring what is displayed on the screen of your device brings out the content of the video to your large screen up to 1080P certified by Apple year warranty', NULL, CAST(N'2020-05-17 00:00:42.177' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (63, 63, 1, N'Anker cable AUX', N'Strongly designed with a high quality that exceeds all the cables is more durable and works perfectly to connect the audio devices to the speakers to get the sound of the director excellent warranty one and a half years', NULL, CAST(N'2020-05-17 00:00:42.190' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (64, 64, 1, N'Anker cable lightning power line 180 cm black', N'Made with high quality long-lasting Apple devices are safely shipped Designed 1.8m / 6ft length Color Black Warranty One and a half years', NULL, CAST(N'2020-05-17 00:00:42.190' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (65, 65, 1, N'Anker cable lighting power line 90 cm Black', N'Made with high quality long-lasting Apple devices are safely shipped Designed with a length of 0.9m / 3ft Warranty black color a year and a half', NULL, CAST(N'2020-05-17 00:00:42.190' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (66, 66, 1, N'Anker cable lightning power line 180 cm Red', N'Made with high quality long-lasting Apple devices are safely shipped Designed 1.8m / 6ft length Color Black Warranty One and a half years', NULL, CAST(N'2020-05-17 00:00:42.190' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (67, 67, 1, N'Anker cable lightning power line 90 cm Red', N'Made with high quality long-lasting Apple devices are safely shipped Designed with a length of 0.9m / 3ft Warranty black color a year and a half', NULL, CAST(N'2020-05-17 00:00:42.207' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (68, 68, 1, N'Anker cable lightning power line 30 cm Black', N'Made with high quality Long-lasting Apple devices are safely shipped Designed with a length of 0.3m / 1ft Warranty black color a year and a half', NULL, CAST(N'2020-05-17 00:00:42.207' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (69, 69, 1, N'Anker cable lightning 90 c.m black', N'Quick Cable Denied Apple devices are safely shipped in high quality long lasting designed 0.9m / 3ft length black warranty for a year and a half', NULL, CAST(N'2020-05-17 00:00:42.207' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (70, 70, 1, N'Anker cable micro 180 CM Red', N'Fastest and strongest cable made of high quality Kevlar fiber Micro charger for Samsung and Android devices Version Old 1.8m / 6ft Length Red Warranty 1 year and a half', NULL, CAST(N'2020-05-17 00:00:42.207' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (71, 71, 1, N'Anker cable micro 90 CM RED', N'Fastest and strongest cable made of Kevlar fiber Micro quality for charging Samsung and Android devices Version Old 0.9m / 3ft length Red color Warranty one and a half years', NULL, CAST(N'2020-05-17 00:00:42.223' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (72, 72, 1, N'Anker cable USB -Type C 90 cm Red', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to charge Samsung devices starting from Note8, Note9, S8, S9 and the modern Android 0.9m / 3ft length Red Warranty one and a half years', NULL, CAST(N'2020-05-17 00:00:42.240' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (73, 73, 1, N'Anker PowerLine+ USB-C to USB 3.0 (1.8m/6ft) -Red', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to charge Samsung devices starting from Note8, Note9, S8, S9 and the modern Android 1.8m/6ft length Red Warranty one and a half years', NULL, CAST(N'2020-05-17 00:00:42.240' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (74, 74, 1, N'Anker PowerLine + II USB-C to Lightning (0.9m/3ft) -Black', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to Lightning. Support Apple devices with 0.9m/3ft length Red Warranty one and a half years.', NULL, CAST(N'2020-05-17 00:00:42.253' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (75, 75, 1, N'Anker PowerLine + II USB-C to Lightning (1.8m/6ft) -Black', N'The fastest and strongest cable is made of high quality Kevlar fiber T-C to Lightning. Support Apple devices with 1.8m/6ft length Red Warranty one and a half years.', NULL, CAST(N'2020-05-17 00:00:42.270' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (76, 76, 1, N'Dausen lightning Adapter 2 in 1', N'Supports audio playback, simultaneous charging and synchronization Supports fast charging Maintains sound quality Supports IOS10 / 11 operating system on top Supports Iphone 7 / 7plus 8 / 8plus _X / Xs / XsMax _ ipad pro / air Warranty Year', NULL, CAST(N'2020-05-17 00:00:42.300' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (77, 77, 1, N'Cable otter box USB - lightning 1m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable high-capacity charging and synchronicity Provides flexibility in connection ports Traction strength greater than 100 lbs Dedicated for iPhone 1 meter', NULL, CAST(N'2020-05-17 00:00:42.317' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (78, 78, 1, N'Cable otter box USB - lightning 2m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable capabilities Supercharging and sync Availability of flexibility in the ports of communication Pull power more than 100 pounds for iPhone 2 meters', NULL, CAST(N'2020-05-17 00:00:42.317' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (79, 79, 1, N'Cable otter box USB - lightning 3m', N'Cable Iphone Braided design Metallic casing and connectors to ensure durability Durable capabilities Supercharging and sync Availability of flexibility in the ports of communication Pull power more than 100 pounds for iPhone 3 meters', NULL, CAST(N'2020-05-17 00:00:42.333' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (80, 80, 1, N'Cable otter box USB - micro 1m', N'Cable Galaxy Braided design Metallic casing and connectors to ensure durability Durability High capacity for charging and synchronization Availability of flexibility in the ports of communication Over 100 lbs.', NULL, CAST(N'2020-05-17 00:00:42.333' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (81, 81, 1, N'Cable otter box USB - micro 2m', N'Cable Galaxy Braided design Metallic casing and connectors to ensure durability Durability High-capacity charging and syncing Availability of flexible connection ports Over 100 lbs.', NULL, CAST(N'2020-05-17 00:00:42.347' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (82, 82, 1, N'Cable otter box USB - micro 3m', N'CableGalaxy Enclosed design Metallic casing and connectors to ensure durability Durability Superior charging and syncing capabilities Provide flexibility in connection ports Traction strength greater than 100 lbs Dedicated to phones Microphone input 3 m', NULL, CAST(N'2020-05-17 00:00:42.347' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (83, 83, 1, N'Cable otter box USB - type c 1m', N'Cable Iphone Braided design Metallic casing and connectors to ensure durability Durable high-capacity charging and synchronicity Availability of flexible connection ports Traction strength greater than 100 lbs Dedicated to phones Tee-c-1 meter', NULL, CAST(N'2020-05-17 00:00:42.347' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (84, 84, 1, N'Cable otter box USB - type c 2m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable high-capacity charging and sync capabilities Flexible connectivity at up to 100 lb', NULL, CAST(N'2020-05-17 00:00:42.363' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (85, 85, 1, N'Cable otter box USB - type c 3m', N'Cable Iphone Curved design Metallic casing and connectors to ensure durability Durable high-capacity charging and synchronicity Provides flexibility in connection ports Traction strength greater than 100 lbs Dedicated to phones High-speed 3 c', NULL, CAST(N'2020-05-17 00:00:42.363' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (86, 86, 1, N'Cable otter box type c - type c 3m', N'Cable Iphone Braided design Metallic casing and connectors to ensure durability Durability High capacity for charging and synchronization Availability of flexibility in the ports of communication Over 100 lbs.', NULL, CAST(N'2020-05-17 00:00:42.363' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (87, 87, 1, N'BELKIN RockStar Headphones With Lighting Connector White', N'With high quality sound, supreme comfort and fit, and exceptional durability, ROCKSTAR Headphones with Lightning Connector are the headphones you, and your iPhone, have been waiting for.', NULL, CAST(N'2020-05-17 00:00:42.380' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (88, 88, 1, N'BELKIN RockStar Headphones With Lighting Connector BLACK', N'With high quality sound, supreme comfort and fit, and exceptional durability, ROCKSTAR Headphones with Lightning Connector are the headphones you, and your iPhone, have been waiting for.', NULL, CAST(N'2020-05-17 00:00:42.380' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (89, 89, 1, N'Apple Headset AUX', N'Apple iPhone AUX certified AUX wired headset with microphone and noise isolator Supports iPhone 4/5 / 5s / 6s / 6sPlus and all Android devices with AUX', NULL, CAST(N'2020-05-17 00:00:42.380' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (90, 90, 1, N'Apple Headset for 7/8 7/8PLUS _ X/XS XsMax _XR', N'Apple iPhones Lightning Wired certified by Apple Includes microphone and noise isolator Supports iPhone 7 / 7Plus_8 / 8Plus_X / Xs / XsMax / XR_Ipad Pro / Air Warranty Year', NULL, CAST(N'2020-05-17 00:00:42.393' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (91, 91, 1, N'Bluetooth XL Sport Headset anker', N'Powerful sound, pure sand, dust and water resistant. Powerful battery lasts more than 15 hours, can be connected to Bluetooth, including charging port, recharging port and audio cable port Can use 5000mAh battery', NULL, CAST(N'2020-05-17 00:00:42.393' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (92, 92, 1, N'Soundcore Spirit X Wireless Bluetooth Earphone', N'From a single charge, listen to 12 hours of sublime, bass-driven sound. That’s well over a week of workouts from a single charge.', NULL, CAST(N'2020-05-17 00:00:42.393' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (93, 93, 1, N'Anker Spirit Pro Wireless Earphones Black-Gray', N'SweatGuard technology is specially designed to resist the corrosive properties of sweat. Thanks to SweatGuards extreme waterproof protection, Spirit Pro does not require a cover for its charging portAdjust the intensity of your musicA single charge wil', NULL, CAST(N'2020-05-17 00:00:42.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (94, 94, 1, N'JBL Tune205 Earphone-aux', N'12.5mm Drivers with JBL Pure Bass Sound3-Button Inline Remote with MicrophoneTangle-Free Flat CableSoft, Comfort-Fit Earbuds', NULL, CAST(N'2020-05-17 00:00:42.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (95, 95, 1, N'EGO 10000mAh 4 in 1 Powerbank - White', N'Exclusive in kuwait Powerbank 4 in 1 Charge your phone your apple watch your airpods at the same time. 10W wireless charging and 18W PD charging is faster than Apple’s charger! 10000 Capacity.4 USB OUTPUT 1 USB input PD5Led Charging Status LightTYPE', NULL, CAST(N'2020-05-17 00:00:42.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (96, 96, 1, N'EGO TRAVEL SMART CHARGER WITH 4 USB PORTS', N'Fast Charging Support 4 devices at the same time You can also use it for travelWarranty: 1year', NULL, CAST(N'2020-05-17 00:00:42.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (97, 97, 1, N'EGO THUNDER CUBE QC3 + PD CHARGER', N'USB USB-C PD + QC Dual Port Travel Charger Supported PD + QC3 fast charging technology Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.427' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (98, 98, 1, N'EGO 3 IN 1 CHANGEABLE CHARGER', N'3-in-1 Powerful Charger - Use one device for all your charging needs .. E-Fusion 3 Charger with 6700 powerbank, E-Fusion can charge up to five devices simultaneouslyWarranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.427' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (99, 99, 1, N'EGO LIGHTNING CABLE 100CM- BLUE', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Red, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.427' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (100, 100, 1, N'EGO LIGHTNING CABLE 100CM- GREY', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Red, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.440' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (101, 101, 1, N'EGO LIGHTNING CABLE 100CM- RED', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Red, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.440' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (102, 102, 1, N'EGO LIGHTNING CABLE 200CM- BLUE', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.440' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (103, 103, 1, N'EGO LIGHTNING CABLE 200CM- GOLD', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.440' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (104, 104, 1, N'EGO LIGHTNING CABLE 200CM- GREY', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.457' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (105, 105, 1, N'EGO LIGHTNING CABLE 200CM- RED', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.457' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (106, 106, 1, N'EGO LIGHTNING CABLE 30CM- BLUE', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.457' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (107, 107, 1, N'EGO LIGHTNING CABLE 30CM- GOLD', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.457' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (108, 108, 1, N'EGO LIGHTNING CABLE 30CM- GREY', N'High Tensile Strength and Durable MFI Certified IC3A Fast Charging Super Tough and Durable (Available Colors: Gray, Gold, Blue) Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.473' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (109, 109, 1, N'EGO USB TO TYPE-C 200CM - BLUE', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.473' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (110, 110, 1, N'EGO USB TO TYPE-C 200CM - GOLD', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.473' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (111, 111, 1, N'EGO USB TO TYPE-C 30CM - GOLD', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.473' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (112, 112, 1, N'EGO USB TO TYPE-C 200CM - GRAY', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.473' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (113, 113, 1, N'EGO USB TO TYPE-C 100CM - GRAY', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.490' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (114, 114, 1, N'EGO TYPE-C to LIGNTNING CABLE PD 20CM - BLACK', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.490' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (115, 115, 1, N'EGO TYPE-C to LIGNTNING CABLE PD 100CM -BLACK', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.490' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (116, 116, 1, N'EGO TYPE-C to LIGNTNING CABLE PD 200CM - BLACK', N'FAST Charging PD TYPE- C to Lightning. MFI Certified ConnectorDurable Cable - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.503' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (117, 117, 1, N'EGO 120W 5USB Extreme Charger', N'120W Extreme Charger Max Output 24AQC+PD Fast Charge 2 TYPE C FAST CHARGE3 USB QC 3Support All Type C DevicesLed Status light - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.503' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (118, 118, 1, N'EGO 72W Mighty Charger', N'Support fast charging system1 PORT PD1 PORT QC3 3 PORTS 2.8A Intelligent distribution fast charging module Small and Portable yet powerful adapter - Warranty: 1 year', NULL, CAST(N'2020-05-17 00:00:42.503' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (119, 119, 1, N'EGO AirAlly Stand - Black', N'EGO AirAlly Stand - Black', NULL, CAST(N'2020-05-17 00:00:42.503' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (120, 120, 1, N'EGO AirAlly Stand - White', N'EGO AirAlly Stand - White', NULL, CAST(N'2020-05-17 00:00:42.520' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (121, 121, 1, N'RAVPOWER TYPE-C to TYPE -C Cable 1M', N'Charge and transfer data at high speedCable Type C to Type CBend over 12,000 timesQuick charge 2.4ABraided Nylon, Kevlar fiber core - Warranty 18 Months.', NULL, CAST(N'2020-05-17 00:00:42.520' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (122, 122, 1, N'RAVPOWER USB to TYPE -C Cable 1M', N'Charge and transfer data at high speedCable USB to Type C Bend over 12,000 timesQuick charge 2.4ABraided Nylon, Kevlar fiber core - Warranty 18 Months.', NULL, CAST(N'2020-05-17 00:00:42.520' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (123, 123, 1, N'Anker PowerCore Metro 10000 PD Black', N'Portable power: PowerCore Metro 10000 PD is one of our Slimmest power delivery power banks yet, with enough capacity to provide more than two charges for iPhone XS or Google Pixel, and almost one full charge for an 11" IPad Pro. And the 18W USB-C power de', NULL, CAST(N'2020-05-17 00:00:42.537' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (124, 124, 1, N'Anker PowerCore Metro Essential 20000 PD', N'The Anker Advantage: Join the 50 million+ powered by our leading technology.Ultra-high capacity: The massive 20, 000mAh capacity provides more than 5 and a half charges for iPhone XS, more than 4 full charges for Samsung Galaxy S10, and over 2 and a half', NULL, CAST(N'2020-05-17 00:00:42.537' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (125, 125, 1, N'UGREEN Micro USB 2.0 Data Cable 1M', N'Ugreen Micro USB Cable 3A Nylon Fast Charge USB Data Cable for android phone & tablet, Supports Quick Charge 3, Fast data transmission cable with wide compatibilty and supports most of andriod & windows with micro port.', NULL, CAST(N'2020-05-17 00:00:42.537' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (126, 126, 1, N'UGREEN USB to USB-C Data Cable 1M', N'Ugreen USB Type C Cable for Samsung Galaxy S10 S9 Mobile Phone Cable Fast USB C Charge Data Cable . 3A Nylon Type- C Cable, Reversible Support Fast Charge.', NULL, CAST(N'2020-05-17 00:00:42.537' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (127, 127, 1, N'UGREEN 3M HDMI cable 2.0 Version', N'HDMI 2.0 CABLE: Enable you to directly connect your laptop to an HDMI-equipped display with maximum 4K at 60Hz. Warranty: 18 Months', NULL, CAST(N'2020-05-17 00:00:42.537' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (128, 128, 1, N'UGREEN TYPE-C to TYPE-C', N'Faster and Safer Charging Up to 60W of PowerUGREEN USB C-C cable offers you an output of maximum 20V 3A current, charging your Type C smartphone, tablet or laptop rapidly.', NULL, CAST(N'2020-05-17 00:00:42.550' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (129, 129, 1, N'UGREEN Lightning to TYPE-C', N'Ugreen MFi USB Type C to Lightning Cable for iPhone 11 Pro X XS 8 XR PD18W Fast USB C Charging Data Cable for Macbook PD Cable, MFI CERTIFIED.', NULL, CAST(N'2020-05-17 00:00:42.550' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (130, 130, 1, N'UGREEN 10000mAh mini PD - QC3.0 POWERBANK', N'Ugreen Power Bank 10000mAh Quick Charge 4.0 3.0 QC3.0 External Mobile Battery Fast PD Charger for iPhone 11 8 Xs Mini Powerbank, 18W TYPE- C OUT PUT.', NULL, CAST(N'2020-05-17 00:00:42.550' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (131, 131, 1, N'UGREEN 10000mAh Wireless PD POWERBANK', N'UGREEN 1000mAh Powerbank with 38W. Charge 0% to 50% in 30mins for iPhone 8 / X3Hours full charge power bank. Qi Wireless Charger output: 10W', NULL, CAST(N'2020-05-17 00:00:42.550' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (132, 132, 1, N'UGREEN PD Power Bank 20000mAh', N'?Large Capacity PD Power Bank? The UGREEN PD Power bank packed with 20000mAh high capacity battery inside, offers multiple charges for your devices to save the day, the 20000mah power bank supports 5 recharge for iPhone XR, 4.5 recharge for S10, 8 recharg', NULL, CAST(N'2020-05-17 00:00:42.567' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (133, 133, 1, N'UGREEN Type C to HDMI Cable', N'UGREEN USB type C to HDMI cable can easily connect a USB-C enabled smartphone / Laptop to a HDTV, monitor or projector with HDMI port. It is ideal for conference, presentation, gaming, or expanding workspace by connecting your USB-C devices to a large scr', NULL, CAST(N'2020-05-17 00:00:42.567' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (134, 134, 1, N'UGREEN 5 in 1 Converter', N'UGREEN 5-in-1 USB-C data hub features a 4K HDMI output port, TYPE-C PD, and 3 USB 3.0 ports. And all hub ports can work simultaneously, small yet mighty.', NULL, CAST(N'2020-05-17 00:00:42.567' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (135, 135, 1, N'UGREEN Magnetic Car Phone HolderColor:Black', N'RELIABLE ADHESIVE: With strong adhesive, UGREEN car phone mount can firmly stick to your car dash for a longer lifespan. Never worry about falling off even driving on a bumpy road.', NULL, CAST(N'2020-05-17 00:00:42.583' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (136, 136, 1, N'UGREEN Car Phone Holder', N'The holder locks the phone automatically by gravity linkage. So it only supports vertical mode', NULL, CAST(N'2020-05-17 00:00:42.583' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (137, 137, 1, N'UGREEN Mini Car Charger 5V4.8A', N'Ugreen Mini USB Car Charger For Mobile Phone Tablet GPS 4.8A Fast Charger Car-Charger Dual USB Car Phone Charger Adapter in Car', NULL, CAST(N'2020-05-17 00:00:42.583' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (138, 138, 1, N'UGREEN Quick Charge 3.0 Dual Port USB Car Charger (Black)', N'QUICK CHARGE QC 3.0 4X FASTER: The Quick Charge QC3.0 USB port charges 4X faster than standard chargers with Max 3A current output, compatible with Quick Charge 3.0 / 2.0 devices and non Quick Charge devices such as Samsung Galaxy S10/S9/S8/S8 Plus/S7/S6/', NULL, CAST(N'2020-05-17 00:00:42.583' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (139, 139, 1, N'UGREEN PD+QC 3.0 Fast Car Charger', N'Charging 50% in 30 min (iPhone 11 / 8 / X) - only in PD port: Perfect for charging your iPhone 11 / XS / iPhone XS Max / iPhone XR / iPhone X / iPhone 8 / iPhone 8 Plus at full speed. For example, the iPhone X can be charged from 0% to 50% in just 30 minu', NULL, CAST(N'2020-05-17 00:00:42.597' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (140, 140, 1, N'UGREEN Electronics Gadgets Organizer Bag', N'UGREEN accessory bag case is specially designed for your complete Nintendo Switch devices and other accessories. It is convenient to carry,when you go out for visiting or vocation and well stored when it is not in use. Everything will be well organized an', NULL, CAST(N'2020-05-17 00:00:42.597' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (141, 141, 1, N'UGREEN Nintendo Switch Storage BagEnvironmental protection', N'UGREEN Electronics Travel organizer is designed to keeps your essential gadgets in order and in reach without searching all over the place, which is a must-have for daily life / school.', N'', CAST(N'2020-05-17 00:00:42.597' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (142, 142, 1, N'UGREEN Nintendo SWITCH Protect Case', N'Easy to Put on and Take off With unique split design for the joy cons, this case protector allows you to take out joy controllers without removing the whole case. Easy to put on and take off whenever you want to dock the switch, especially for playing han', NULL, CAST(N'2020-05-17 00:00:42.613' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (143, 143, 1, N'Anker power port 5 white BD', N'60W high power charger with the latest electronic technology. Temperature control technology with high voltage and fast charging technology.', NULL, CAST(N'2020-05-17 00:00:42.613' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (144, 144, 1, N'Apple HDMI To HDMI Cable', N'Apple HDMI To HDMI CableThe Apple HDMI to HDMI cable lets you connect an Apple TV, Mac mini, or other HDMI device to an HDTV or A/V receiver.', N'', CAST(N'2020-05-17 00:00:42.613' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (145, 145, 1, N'Apple USB-C to 3.5mm Headphone Jack Adapter', N'Combination Of Great TechnologyThe USB-C to 3.5mm Headphone Jack Adapter lets you connect devices that use a standard 3.5mm audio plug like headphones or speakers to your USB-C devices.', NULL, CAST(N'2020-05-17 00:00:42.613' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (146, 146, 1, N'Apple Type-C to Type-C Charge Cable 1Meter', N'Reversible designUSB-C (1m)Syncing and chargingConnects your latest iPad Pro models with USB-C', NULL, CAST(N'2020-05-17 00:00:42.630' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (147, 147, 1, N'Apple Type-C to Type-C Charge Cable 2Meters', N'Reversible designUSB-C (2m)Syncing and chargingConnects your latest iPad Pro models with USB-C', N'', CAST(N'2020-05-17 00:00:42.630' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (148, 148, 1, N'Apple 12W Usb Power Adapter - White', N'The Apple Power Adapter is the perfect charger for all your Apple devices whether iPad, iPhone, iPod, MacBook, and the 13-inch MacBook Pro. It offers fast and quick charging for any of your devices.', NULL, CAST(N'2020-05-17 00:00:42.630' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (149, 149, 1, N'Apple 18W USB-C Power Adapter', N'Compact design18W powerApple USB Power AdaptorCompatibility : iPhone/iPad Mini/iPod models', N'', CAST(N'2020-05-17 00:00:42.630' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (150, 150, 1, N'Anker Ccar Charge PowerDrive PD+ 2', N'Equipped with 1 18W USB-C Power Delivery port, and 1 15W legacy USB port with PowerIQ2.0, to simultaneously charge 2 devices up to 1-and-a-half hours faster than other chargers.', NULL, CAST(N'2020-05-17 00:00:42.643' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (151, 151, 1, N'ANKER POWERBANK POWERCORE SLIM 10000mAH PD', N'Triple Charging Modes: 18W Power Delivery USB-C port, PowerIQ-enabled USB-A port, and trickle-charging mode for low-power devices. Use the dual USB ports to charge two devices simultaneously.', NULL, CAST(N'2020-05-17 00:00:42.643' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (152, 152, 1, N'ELEMENT CASE IPHONE 11 PRO SHADOW - BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.643' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (153, 153, 1, N'ELEMENT CASE IPHONE 11 PRO SHADOW - OXBLOOD', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.643' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (154, 154, 1, N'ELEMENT CASE IPHONE 11 PRO MAX SHADOW - BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.660' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (155, 155, 1, N'ELEMENT CASE IPHONE 11 PRO SHADOW MAX - BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.660' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (156, 156, 1, N'ELEMENT CASE IPHONE 11 RAIL- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.660' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (157, 157, 1, N'ELEMENT CASE IPHONE 11 RAIL- CLEAR/ SOLID BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.677' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (158, 158, 1, N'ELEMENT CASE IPHONE 11 PRO RAIL- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.677' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (159, 159, 1, N'ELEMENT CASE IPHONE 11 PRO MAX- CLEAR/SOLID RED', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.677' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (160, 160, 1, N'ELEMENT CASE IPHONE 11 PRO MAX- CLEAR/SOLID BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.677' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (161, 161, 1, N'ELEMENT CASE IPHONE 11 PRO - CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.690' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (162, 162, 1, N'ELEMENT CASE IPHONE 11 PRO - CLEAR/FALAMINGO PINK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.690' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (163, 163, 1, N'ELEMENT CASE IPHONE 11 PRO - CLEAR/SOLID RED', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.690' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (164, 164, 1, N'ELEMENT CASE IPHONE 11 PRO RAIL- CLEAR/SOLID BLACK', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.690' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (165, 165, 1, N'ELEMENT CASE IPHONE 11 RALLY- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.707' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (166, 166, 1, N'ELEMENT CASE IPHONE 11 PRO MAX RALLY- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.707' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (167, 167, 1, N'ELEMENT GLASS IPHONE 11 PRO GLASS SCREEN PROTECTOR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.707' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (168, 168, 1, N'ELEMENT GLASS IPHONE 11 GLASS SCREEN PROTECTOR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.707' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (169, 169, 1, N'ELEMENT GLASS IPHONE 11 PRO MAX - CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.723' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (170, 170, 1, N'ELEMENT CASE IPHONE 11 PRO MAX RAIL- CLEAR/FLAMINGO', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.723' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (171, 171, 1, N'ELEMENT CASE IPHONE 11 RALLY- CLEAR', N'Sure grip - top, bottom, and sides features ergonomic design for a more comfortable and secure graspFast tap buttons - independent buttons allow the phone controls to work as seamlessly as they would without a casePerforated Back plate - provides a soft', NULL, CAST(N'2020-05-17 00:00:42.723' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (172, 1, 2, N'	شاحن منزل انكر2 مخرج ابيض بي دي	', N'	شاحن منزل انكر. مع منفذ USB-C مخصص لتوصيل الطاقة بي دي ومنفذ واحد مزود بتقنية PowerIQ 2.0 المشهورة عالميًا في Anker ، يمكنك شحن أي جهاز تقريبًا - كل ذلك من شاحن واحد.	', NULL, CAST(N'2020-05-17 00:00:42.723' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (173, 2, 2, N'	شاحن منزل 5 مخرج بي دي اسود انكر	', N'	موزع شحن قوي بقوة 60 وات يحتوي علي افضل التقنيات الالكترونية الحديثة تقنية التحكم بدرجة الحرارة به نقنية رفع الجهد والشحن السريع الامن به منفذ باور دليفري و4 منافذ بنظام IQ2 كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.740' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (174, 3, 2, N'	شاحن منزل 5 مخرج كوالكوم 3 انكر	', N'	موزع شحن سريع به 5 منافذ للشحن ويدعم كوالكوم الشحن السريع 3.0 متوافق مع جميع الأجهزة بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.740' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (175, 4, 2, N'	شاحن سفري 4 مخرج إسود انكر	', N'	يمكنك شحن هاتفك اثناء سفرك الي جميع دول انحاء العالم يحتوي علي احدث التقنيات المميزة به خاصية الشحن الذكي الأمن به تقنيات الأمن والسلامة ضد الالتماس والانفجار يحتوي علي 4 منافذ USB بنظام IQ 	', NULL, CAST(N'2020-05-17 00:00:42.740' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (176, 5, 2, N'	شاحن منزل 4 مخرج لايت أبيض انكر	', N'	متين صمم بجوده عالية وبمواصفات ممتازة به 4 منافذ للشحن السريع الذكي بقوة 27 وات به تقنيات حديثة الشحن السريع بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.740' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (177, 6, 2, N'	شاحن منزل 1 مخرج كوالكم 3 انكر	', N'	الشاحن السريع منفذ واحد كوالكوم 3.0 السريع متوافق مع جميع اصدارات مزود بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.740' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (178, 7, 2, N'	شاحن منزل 2 مخرج أبيض انكر	', N'	مميز صمم بجودة عالية وممتازة به منفذين للشحن الذكي والأمن سرعة الشحن تصل الي 2.4 أمبير بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.753' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (179, 8, 2, N'	شاحن منزل 2 مخرج اسود انكر	', N'	مميز صمم بجودة عالية وممتازة به منفذين للشحن الذكي والأمن سرعة الشحن تصل الي 2.4 أمبير بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.753' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (180, 9, 2, N'	شاحن منزل ابل	', N'	بلاك منزل ابل أيفون معتمد من شركة أبل بقوة 5W كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:42.753' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (181, 10, 2, N'	مشترك منزل بيلكن صغير 4 سوكت باور 2 USB 	', N'	مشترك منزل قوي يتكون من 4 سوكت باور و2 مخرجUSB بقوه 12 وات (2.4) الحفاظ علي تكامل البيانات مزود بجهاز الحماية من تقلبات التيار طول السلك 2 متر	', NULL, CAST(N'2020-05-17 00:00:42.753' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (182, 11, 2, N'	إستاند مغناطيس متحرك ساعة أبل 	', N'	استاند متحرك علي جميع الزوايا المستقيمة والقائمة مغناطيس لشحن ساعة ابل يمتاز بشحن جميع الإصدارات Series 1.2.3.4 يمتاز بالشحن السريع الأمن الذكي 	', NULL, CAST(N'2020-05-17 00:00:42.770' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (183, 12, 2, N'	شاحن مغناطيس ساعة موديل 	', N'	شاحن مغناطيس لشحن ساعة أبل يمتاز بالشاحن السريع الأمن الذكي حيث يمكنك توصيله علي اشاحن المنزل مباشرة او علي باور بانك يقوم بشحن جميع الاصدارات Series 1.2.3.4	', NULL, CAST(N'2020-05-17 00:00:42.770' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (184, 13, 2, N'	(1متر ) FT3.3 كيبل مغناطيس ساعة أبل 	', N'	شاحن مغناطيس لشحن ساعة أبل يمتاز بالشاحن السريع الأمن الذكي يقوم بشحن الاصدارات Series 1.2.3 يمتاز بطول 1 متر 	', NULL, CAST(N'2020-05-17 00:00:42.770' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (185, 14, 2, N'	(2متر ) FT6.6 كيبل مغناطيس ساعة أبل	', N'	شاحن مغناطيس لشحن ساعة أبل يمتاز بالشاحن السريع الأمن الذكي يقوم بشحن الاصدارات Series 1.2.3 يمتاز بطول 2 متر 	', NULL, CAST(N'2020-05-17 00:00:42.770' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (186, 15, 2, N'	شاحن سيارة بي دي انكر	', N'	صنع بجودة عالية من البلاستيك المقوي يحتوي علي افضل التقنيات الالكترونية الحديثة للامن والسلامة به تقنية رف الجهد مذود بخاصية الباور دليفري السريع ومنفذ بنظام IQ2 الذكي كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.787' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (187, 16, 2, N'	شاحن سيارة كوالكوم 3 انكر	', N'	سريع الشحن ذو تصمم رائع من الكاربون به تقنيات حديثة للشحن الأمن والذكي به منفذين للشحن كوالكوم 3.0 بقوة 39 وات مزود بنظام IQ كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.787' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (188, 17, 2, N'	شاحن سيارة أي كيو انكر	', N'	شاحن قوي صغير الحجم تصميم حديث به تقنيات حديثة للشحن مع وجود كامل الحماية سرعة تصل الي 2.4 امبير لكل منفذ به منفذين للشحن بقوة 24 وات مزود بنظام IQ كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.787' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (189, 18, 2, N'	شاحن سياره 2 مخرج روفا	', N'	اتصال بلوتوث و FM الصوتبالسيارة يوفر منفذان USB مزودان بتقنية متقدمة شحنًا عالي السرعة. يعمل Bluetooth 4.2 على تمكين أي استريو للسيارة من إجراء واستقبال المكالمات الهاتفية	', NULL, CAST(N'2020-05-17 00:00:42.787' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (190, 19, 2, N'	إستاند ويزجير لونج أنكر	', N'	استاند سيارة ويزجير يعتبر من أقوي ماركات المغناطيس بالعالم قوي يتحمل حتي وزن الإيباد ذو زراع طويل يتحرك في جميع الأتجاهات 360 درجة يمكن وضعه علي التابلوه او الزجاج الأمامي 	', NULL, CAST(N'2020-05-17 00:00:42.800' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (191, 20, 2, N'	إستاند ويزجير سي دي 	', N'	استاند سيارة ويزجير يعتبر من أقوي ماركات المغناطيس بالعالم قوي يتحمل حتي وزن الإيباد يركب بفتحت السي دي يتحرك في جميع الأتجاهات 360 درجة سهل الاستخدام والتركيب 	', NULL, CAST(N'2020-05-17 00:00:42.800' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (192, 21, 2, N'	إستاند ويزجير كبير	', N'	استاند سيارة ويزجير يعتبر من أقوي ماركات المغناطيس بالعالم قوي يتحمل حتي وزن الإيباد ذو زراع قصير يتحرك في جميع الأتجاهات 360 درجة يمكن وضعه علي التابلوه او الزجاج الأمامي 	', NULL, CAST(N'2020-05-17 00:00:42.800' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (193, 22, 2, N'	إستاند ويزجير وسط	', N'	استاند سيارة ويزجير يعتبر من أقوي ماركات المغناطيس بالعالم قوي يتحمل حتي وزن الإيباد يتحرك في جميع الأتجاهات 360 درجة يمكن وضعه علي الديكور في السيارة لاصق قوي	', NULL, CAST(N'2020-05-17 00:00:42.800' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (194, 23, 2, N'	إستاند ويزجير صغير	', N'	استاند سيارة ويزجير يعتبر من أقوي ماركات المغناطيس بالعالم قوي يتحمل حتي وزن الإيباد ثابث يمكن وضعه علي الديكور في السيارة لاصق قوي	', NULL, CAST(N'2020-05-17 00:00:42.817' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (195, 24, 2, N'	استاند راف باور صغير 	', N'	استاند سياره من شركه راف باور الامريكيه العالميه يمكنك وضع تلفونك فى اى اتجاه يناسبك عن طريف المغناطيس يمكن التحكم فى وضع التلفون 360 درجه	', NULL, CAST(N'2020-05-17 00:00:42.817' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (196, 25, 2, N'	استاند معناطيس يوجرين صغير	', N'	يمكن تثبيت هاتفك في السيارة بقوة . لا تقلق أبدًا من السقوط حتى أثناء القيادة على طريق وعر. يمكن أن تعقد هاتفك المحمول بشكل آمن حتى على الطريق الوعرة ، وحماية هاتفك أثناء القيادة.يسمح لك حامل هاتف لوحة القيادة هذا بضبط واختيار أفضل زاوية مشاهدة أثناء الت	', NULL, CAST(N'2020-05-17 00:00:42.817' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (197, 26, 2, N'	ستاند 360 من دوزن	', N'	دوسن استاند 360 درجةواجهة بسيطة ، وتصميم مرن. يتيح لك تصميم ذراع القفل المنزلق إرفاق وإزالة الحامل بسهولة على الزجاج الأمامي. بمجرد إرفاق الجهاز ، سيثبت هاتفك المحمول في مكانه بأمان	', NULL, CAST(N'2020-05-17 00:00:42.817' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (198, 27, 2, N'	استاند دوزن مغناطيس	', N'	تصميم رأس دوارة 360 درجة التمسك بسهولة لوحة القيادة للسيارة قوي يمكن وضعة علي التابلوه او الزجاج الامامي قوة المغناطيس لايتأثر بالحرارة او البرودة 	', NULL, CAST(N'2020-05-17 00:00:42.833' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (199, 28, 2, N'	استاند لساعه ابل 	', N'	هذا حامل لشاحن Apple Watch مصنوع من هلام السيليكا لحماية أفضل لل Apple Watch ومنع سقوطه. يمكن لهذا الحامل أن يدعم وحدة الشحن المغناطيسي الأصلية من Apple بالإضافة إلى وحدة الشحن المغناطيسي UGREEN.إنها مناسبة لجميع ساعات Apple Watch (1 و 2 و 3 و 4). بزاوية	', NULL, CAST(N'2020-05-17 00:00:42.833' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (200, 29, 2, N'	يد بابجي روك	', N'	استمتع بلعب الألعاب في أي مكان. يوفر لك عصا التحكم كائنًا ماديًا حقيقيًا بدقة عالية وحساسة ، مما يجعلك تستمتع باللعبة وتشغيلها ، مما يساعدك على الفوز باللعبة بسهولة.	', NULL, CAST(N'2020-05-17 00:00:42.833' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (201, 30, 2, N'	يد بابجي جيم سير	', N'	استمتع بلعب الألعاب في أي مكان. يوفر لك عصا التحكم كائنًا ماديًا حقيقيًا بدقة عالية وحساسة ، مما يجعلك تستمتع باللعبة وتشغيلها ، مما يساعدك على الفوز باللعبة بسهولة.	', NULL, CAST(N'2020-05-17 00:00:42.833' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (202, 31, 2, N'	كفر خشب لجراب الأيربودذ- روز	', N'	كفر أيربودذ مصنوع من الخشب الطبيعي صناعه يدويه داخل الكويت 	', NULL, CAST(N'2020-05-17 00:00:42.847' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (203, 32, 2, N'	كفر لجراب الأيربودز يوجرين	', N'	⁣⁣كفر مصمم خصيصا لأبل AirPods.⁣⁣لحماية أيربودس الخاص بك من السقوط والخدوش متوفر منه اللون الابيض والاسود⁣	', NULL, CAST(N'2020-05-17 00:00:42.847' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (204, 33, 2, N'	شنطه صغيره يوجرين	', N'	تصميم معقول ومثالي للسفر عن طريق الحفاظ على جميع الكابلات والأدوات الإلكترونية ومستحضرات التجميلفي نفس المكان مما يسهل العثور عليها. طريقة رائعة لإنهاء الفوضى في حقيبة السفر الخاصة بكوالحفاظ على جميع الأدوات الصغيرة منظمة بشكل جيد.	', NULL, CAST(N'2020-05-17 00:00:42.847' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (205, 34, 2, N'	حافظه مونت 	', N'	لدى MONET جيوبان يمكنهما أن يحملا بأمان بطاقات الائتمان والهويات وبطاقات المترو وبطاقات العمل والنقد وأكثر من ذلك.	', NULL, CAST(N'2020-05-17 00:00:42.847' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (206, 35, 2, N'	باور بانك 10000 أيجو 4*1 	', N'	حصريا في الكويت باور بانك ٤*١ اشحن الفون والساعه والايربود في نفس الوقتالشحن اللاسلكي 10 وات والشحن 18 وات PD أسرع من شاحن أبل! 10000 القدرات.4 USB الإخراج 1 USB إدخال PD5Led شحن حالة الضوءنوع C PD المدخلات والمخرجات ضمان لمدة سنة.يدعم كل ساعة أبل ا	', NULL, CAST(N'2020-05-17 00:00:42.863' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (207, 36, 2, N'	باور بانك دوزان 6000	', N'	قدرة عالية من 6000. المدمج في مصباح يدوي. المدمج في مؤشر حالة البطارية. الضمان 1 سنة	', NULL, CAST(N'2020-05-17 00:00:42.863' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (208, 37, 2, N'	باور بنك 10000 امبير وابرلس	', N'	DAUSEN POWERBANK 10000MAh Wireless⁣⁣⁣⁣⁣شاحن متنقل لاسلكى دوزن سعة 10،000 ملى أمبير فى الساعة - أسود ⁣⁣⁣⁣⁣⁣⁣⁣⁣⁣✅ شحن ألاجهزة الخاصة بك لاسلكيًا جنبًا إلى جنب مع بطارية ذات سعة خارجية⁣اختيارية 10000 قادرة على شحن الهواتف الذكية	', NULL, CAST(N'2020-05-17 00:00:42.863' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (209, 38, 2, N'	باور بانك أنكر 26800 بي دي إسود	', N'	صمم بجودة عالية مصنوع من الألمونيوم من افضل التقنيات الحديثة للشحن الأمن به منفذين بنظام IQ2 ومنفذ باور دليفري السريع يعاد للشحن خلال 5.30 ساعات كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.863' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (210, 39, 2, N'	باور بانك انكر 10000 pd بلس	', N'	شاحن محمول هجين عالي السعة ومحور بياناتتم تحسين منفذ شحن USB-C عالي السرعة لتزويد الشحن بأقصى سرعة لأجهزة MacBooks. سوف تتساءل كيف قضيت وقتًا طويلاً مرتبطًا بالجدار.	', NULL, CAST(N'2020-05-17 00:00:42.880' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (211, 40, 2, N'	باور بانك راف باور 14000 كار جمب 	', N'	باوربانك تشغيل السيارات البطارية 14000 ملي امبير بها 3 منافذ لشحن الهواتف (1 كوالكوم 3.0 ) بنظام Ismart تشغيل السيارات حتي 12 سلندر طريقة التشغيل سهلة وبسيطة كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.880' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (212, 41, 2, N'	باور بانك أنكر 20000 كور2 إسود	', N'	متين وقوي وبمواصفات ممتازة به تقنيات حديثة للشحن الذكي والأمن به منفذين للشحن ومنفذ لاعاده الشحن مزود بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.880' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (213, 42, 2, N'	باور بانك انكر 13400 Q 3.0	', N'	متين صمم بجودة عالية ومواصفات ممتازة مصنوع من الألمونيوم تقنيات حديثة للشحن الذكي مزود بنظام IQ وخاصية كوالكوم 3 به منفذ لاعاده الشحن كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.880' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (214, 43, 2, N'	باور بانك أنكر 10000 سليم	', N'	سليم خفيف صغير الحجم به تقنيات حديثة للشحن به منفذ واحد للشحن السريع الذكي الأمن ومنفذ لاعادة الشحن مزود بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.893' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (215, 44, 2, N'	باور بانك أنكر 10000 اكس 2.5 سريع	', N'	صمم بمواصفات ممتازة صغير الحجم تصميم جذاب به منفذ واحد للشحن السريع الذكي الأمن مزود بنظام IQ ومنفذ لاعاده الشحن كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.893' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (216, 45, 2, N'	باور بانك أنكر 6700	', N'	متين صمم بجودة عالية وبمواصفات ممتازه به تقنيات حديثة للشحن الذكي والأمن به منفذ للشحن الأمن ومنفذ لاعادة الشحن مزود بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.893' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (217, 46, 2, N'	باور بانك أنكر 5200	', N'	متين صمم بجودة عالية وبمواصفات ممتازه به تقنيات حديثة للشحن الذكي والأمن به منفذ للشحن الأمن ومنفذ لاعادة الشحن مزود بنظام IQ كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:42.893' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (218, 47, 2, N'	باور بانك 10000 يوجرين مزود بالكابلات	', N'	باور بانك يوجرين ذات الكابلات الإضافية مريحة وفعالة من حيث التكلفة.⁣⁣- بسعة 10000 مللي أمبير في الساعة ، يمكن له شحن هاتفك أو جهازك اللوحي بشكل متكرر دون مأخذ طاقة ، مما يجعله مثاليًا للأنشطة الخارجية.⁣	', NULL, CAST(N'2020-05-17 00:00:42.910' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (219, 48, 2, N'	AUX وصلة بيلكن شاحن مع	', N'	يمكن استماع الموسيقي أو ربط الجهاز بالسيارة لتشغيل الموسيقي والشحن في وقت واحد الوصلة تعتمد علي الشحن السريع الأمن معتمدة من قبل شركة أبل	', NULL, CAST(N'2020-05-17 00:00:42.910' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (220, 49, 2, N'	Lightning وصلة بيلكن شاحن مع	', N'	يمكن استماع الموسيقي والشحن في وقت واحد الوصلة تعتمد علي الشحن السريع الأمن معتمدة من قبل شركة أبل	', NULL, CAST(N'2020-05-17 00:00:42.910' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (221, 50, 2, N'	وايرUgreen أيفون سيلفر مقاوم 1.50 متر	', N'	واير أيفون ماركة يوجرين مقاوم للقطع سريع مصنوع من الألومنيوم يتميز بالشحن الأمن والسريع الذكي يتميز بطول 1.5 متر اللون سيلفر 	', NULL, CAST(N'2020-05-17 00:00:42.910' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (222, 51, 2, N'	واير Ugreen أيفون إسود مقاوم 1.50 متر	', N'	واير أيفون ماركة يوجرين مقاوم للقطع سريع مصنوع من الألومنيوم يتميز بالشحن الأمن والسريع الذكي يتميز بطول 1.5 متر اللون إسود 	', NULL, CAST(N'2020-05-17 00:00:42.927' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (223, 52, 2, N'	وايرUgreen أيفون 3×1 أسود 1 متر	', N'	واير أيفون ماركة يوجرين مقاوم للقطع سريع مصنوع من الألومنيوم يتميز بالشحن الأمن والسريع الذكي يمكنك شحن جميع اصدارات USB Micro _ Type C _ lightening يتميز بطول 1 متر اللون إسود 	', NULL, CAST(N'2020-05-17 00:00:42.927' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (224, 53, 2, N'	وايرUgreen أيفون 3×1 أسود 1.5 متر	', N'	واير أيفون ماركة يوجرين مقاوم للقطع سريع مصنوع من الألومنيوم يتميز بالشحن الأمن والسريع الذكي يمكنك شحن جميع اصدارات USB Micro _ Type C _ lightening يتميز بطول 1.50 متر اللون إسود 	', NULL, CAST(N'2020-05-17 00:00:42.927' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (225, 54, 2, N'	واير Ugreen أيفون أحمر مقاوم 1 متر	', N'	واير أيفون ماركة يوجرين مقاوم للقطع سريع مصنوع من الألومنيوم يتميز بالشحن الأمن والسريع الذكي يتميز بطول 1 متر اللون الأحمر 	', NULL, CAST(N'2020-05-17 00:00:42.927' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (226, 55, 2, N'	وصلة Ugreen متعددة الوظائف 8×1 	', N'	منافذ USB-C متعددة الوظائف 8 في 1: قم بتوسيع منفذ USB-C الخاص بك إلى مخرج فيديو HDMI بسرعة 4 كيلو هرتز ومنفذ جيجابت إيثرنت وقارئ بطاقة Micro SD (TF) و SD و 3 منافذ USB 3.0 ومنفذ شحن من النوع C PD (بحد أقصى 20V 5A). الاختيار المثالي لأجهزة الكمبيوتر المحم	', NULL, CAST(N'2020-05-17 00:00:42.940' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (227, 56, 2, N'	كابل يوجرين hdmi - m1.5 	', N'	كابل ايتش دى من شركه يوجرين استمتع بمشاهده التلفزيون او الالعاب بصوره وننقاء عالى بخاصيه الفور كى وهى نقاء الصوره العالى طوال اليكابل 1.5 متر	', NULL, CAST(N'2020-05-17 00:00:42.940' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (228, 57, 2, N'	كابل يوجرين hdmi - ٥ متر 	', N'	كابل ايتش دى من شركه يوجرين استمتع بمشاهده التلفزيون او الالعاب بصوره وننقاء عالى بخاصيه الفور كى وهى نقاء الصوره العالى طوال اليكابل 5 متر	', NULL, CAST(N'2020-05-17 00:00:42.940' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (229, 58, 2, N'	كابل ايفون 1 متر ابل	', N'	كيبل ابل ايفون معتمد من شركة أبل USB 2.0 يقوم بالشحن والمزامنة الطول 1 متر كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:42.940' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (230, 59, 2, N'	كابل ايفون 2 متر ابل	', N'	كيبل ابل ايفون معتمد من شركة أبل USB 2.0 يقوم بالشحن والمزامنة الطول 2 متر كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:42.957' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (231, 60, 2, N'	كابل ايفون تايب سي 1 متر ابل	', N'	كيبل ابل ايفون تايب سي معتمد من شركة أبل يمكنك الأستفاده من ميزة الشحن السريع وايضا يمكنك استخدام بلاك 29/30/61/87W للمزامنة والشحن فائق السرعة كفالة سنة	', NULL, CAST(N'2020-05-17 00:00:42.957' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (232, 61, 2, N'	وصلة إيفون 7	', N'	وصلة ايفون 7 وهي تحويل السماعة Lightning الي AUX معتمدة من شركة ابل كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:42.957' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (233, 62, 2, N'	HDMI _ TV وصلة أيفون أبل	', N'	وصلة ابل TV ولذلك لاقتران الهاتف بالشاشة والنسخ المتطابق لما يتم عرضه علي شاشة جهازك يخرج محتوي الفيديو الي شاشتك الكبيرة بدقة تصل 1080P معتمد من شركة أبل كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:42.973' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (234, 63, 2, N'	كابل انكر AUX 	', N'	قوي صمم بجودة عالية يفوق كل الكوابل اكثر متانة يعمل بشكل مثالي لربط اجهزة الصوت بالسماعات للوصول بالصوت المخرجي الممتاز كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.973' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (235, 64, 2, N'	كابل انكر ايفون 180سم إسود باور لاين	', N'	صنع بجودة عالية طويل الأمد يتم شحن اجهزة أبل بأمان صمم بطول 1.8m/6ft اللون أسود كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.973' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (236, 65, 2, N'	كابل انكر ايفون 90سم إسود باور لاين	', N'	صنع بجودة عالية طويل الأمد يتم شحن اجهزة أبل بأمان صمم بطول 0.9m/3ft اللون الأسود كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.973' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (237, 66, 2, N'	كابل انكر ايفون 180سم أحمر باور لاين	', N'	صنع بجودة عالية طويل الأمد يتم شحن اجهزة أبل بأمان صمم بطول 1.8m/6ft اللون أسود كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (238, 67, 2, N'	كابل انكر ايفون 90سم أحمر باور لاين	', N'	صنع بجودة عالية طويل الأمد يتم شحن اجهزة أبل بأمان صمم بطول 0.9m/3ft اللون الأسود كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (239, 68, 2, N'	كابل انكر ايفون 30سم إسود باور لاين	', N'	صنع بجودة عالية طويل الأمد يتم شحن اجهزة أبل بأمان صمم بطول 0.3m/1ft اللون الأسود كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (240, 69, 2, N'	كابل انكر ايفون 90سم إسود رابل	', N'	كيبل سريع من أنكر يتم شحن اجهزة أبل بأمان ذو جودة عالية طويل الأمد صمم بطول 0.9m/3ft اللون الأسود كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:42.990' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (241, 70, 2, N'	كابل انكر سامسونج 180سم أحمر	', N'	اسرع واقوي كيبل مصنوع من ألياف الكيفلار عالي الجودة مايكرو لشحن أجهزة سامسونج والأندرويد الإصدارالقديم طول 1.8m/6ft اللون الأحمر كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:43.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (242, 71, 2, N'	كابل انكر سامسونج 90سم أحمر	', N'	اسرع واقوي كيبل مصنوع من ألياف الكيفلار عالي الجودة مايكرو لشحن أجهزة سامسونج والأندرويد الإصدارالقديم طول 0.9m/3ft اللون الأحمر كفالة سنة ونصف 	', NULL, CAST(N'2020-05-17 00:00:43.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (243, 72, 2, N'	كابل انكر تايب سي 90سم أحمر	', N'	يتكون أسرع وأقوى كابل من ألياف كيفلر T-C عالية الجودة لشحن أجهزة سامسونج بدءًا من Note8 و Note9 و S8 و S9 و Android الحديث بطول 0.9 مترًا /كفاله لمدة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:43.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (244, 73, 2, N'	كابل انكر تايب سي 1.8 سم أحمر	', N'	يتكون أسرع وأقوى كابل من ألياف كيفلر T-C عالية الجودة لشحن أجهزة سامسونج بدءًا من Note8 و Note9 و S8 و S9 و Android الحديث بطول 1.8 مترًا /كفاله لمدة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:43.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (245, 74, 2, N'	كابل انكر تايب سي - أيفون 90 سم باور لأين اسود	', N'	يتكون أسرع وأقوى كابل من ألياف كيفلر T-C عالية الجودة إلى Lightning. دعم أجهزة ابل من جهت لأيتننج وتأيب سي من جهت الشاحن السريع او الباوربانك اpd بضمان طوله 90 سم / الكفاله سنة ونصف.	', NULL, CAST(N'2020-05-17 00:00:43.003' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (246, 75, 2, N'	كابل انكر تايب سي - أيفون 180 سم باور لأين اسود	', N'	يتكون أسرع وأقوى كابل من ألياف كيفلر T-C عالية الجودة إلى Lightning. دعم أجهزة ابل من جهت لأيتننج وتأيب سي من جهت الشاحن السريع او الباوربانك اpd بضمان طوله 180 سم / الكفاله سنة ونصف.	', NULL, CAST(N'2020-05-17 00:00:43.020' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (247, 76, 2, N'	وصلة شاحن ايفون وسماعة 7 دوزن	', N'	يدعم الإستماع الي الصوت وشحن في نفس الوقت والمزامنة يدعم الشحن السريع الحفاظ علي جودة الصوت يدعم نظام التشغيل IOS10/11 فيما اعلي يدعم Iphone 7/7plus 8/8plus _X/Xs/XsMax _ ipad pro/air كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:43.020' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (248, 77, 2, N'	كابل ايفون أوتربوكس 1 متر USB - lightning	', N'	كيبل ايفون تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف الأيفون الطول 1 متر	', NULL, CAST(N'2020-05-17 00:00:43.020' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (249, 78, 2, N'	كابل ايفون أوتربوكس 2 متر USB - lightning	', N'	كيبل ايفون تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف الأيفون الطول 2متر	', NULL, CAST(N'2020-05-17 00:00:43.020' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (250, 79, 2, N'	كابل ايفون أوتربوكس 3 متر USB - lightning	', N'	كيبل ايفون تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف الايفون الطول 3 متر	', NULL, CAST(N'2020-05-17 00:00:43.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (251, 80, 2, N'	كابل جلاكسي أوتربوكس 1 متر USB - micro	', N'	كيبل جلاكسي تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف مدخل مايكرو الطول 1 متر	', NULL, CAST(N'2020-05-17 00:00:43.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (252, 81, 2, N'	كابل جلاكسي أوتربوكس 2 متر USB - micro 	', N'	كيبل جلاكسي تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف مدخل مايكرو الطول 2 متر	', NULL, CAST(N'2020-05-17 00:00:43.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (253, 82, 2, N'	كابل جلاكسي أوتربوكس 3 متر USB - micro	', N'	كيبل جلاكسي تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف مدخل مايكرو الطول 3 متر	', NULL, CAST(N'2020-05-17 00:00:43.037' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (254, 83, 2, N'	كابل تايب سي أوتربوكس 1 متر USB - type C	', N'	كيبل ايفون تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف مدخل تايب سي الطول 1 متر	', NULL, CAST(N'2020-05-17 00:00:43.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (255, 84, 2, N'	كابل تايب سي أوتربوكس 2 متر USB - type C 	', N'	كيبل ايفون تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف مدخل تايب سي الطول 2 متر	', NULL, CAST(N'2020-05-17 00:00:43.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (256, 85, 2, N'	كابل تايب سي أوتربوكس 3 متر USB - type C	', N'	كيبل ايفون تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف مدخل تايب سي الطول 3 متر	', NULL, CAST(N'2020-05-17 00:00:43.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (257, 86, 2, N'	كابل تايب سي أوتربوكس 3 متر type C - type C	', N'	كيبل ايفون تصميم مضفر غلاف معدني وموصلات لضمان المتانة الدائمة قدرات فائقة للشحن والمزامنة توفر المرونة في منافذ الاتصال قوة سحب تزيد عن 100 رطل مخصص للهواتف مدخل تايب سي الي تايب سي الطول 3 متر	', NULL, CAST(N'2020-05-17 00:00:43.050' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (258, 87, 2, N'	سماعة بيلكن للايفون7/8 7/8PLUS _ X/XS XsMax _XR	', N'	بفضل جودة الصوت العالية والراحة الفائقة والملاءمة والمتانة الاستثنائية ، فإن سماعات ROCKSTAR مع Lightning Connector هي سماعات الرأس التي تنتظرها أنت و iPhone.including the iPhone 7, iPhone 8, iPhone X,Xs Max, 11Pro, 11Pro Max, iPad Air, Air 2, & iPad Pro	', NULL, CAST(N'2020-05-17 00:00:43.067' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (259, 88, 2, N'	سماعة بيلكن للايفون7/8 7/8PLUS _ X/XS XsMax _XR	', N'	بفضل جودة الصوت العالية والراحة الفائقة والملاءمة والمتانة الاستثنائية ، فإن سماعات ROCKSTAR مع Lightning Connector هي سماعات الرأس التي تنتظرها أنت و iPhone.including the iPhone 7, iPhone 8, iPhone X,Xs Max, 11Pro, 11Pro Max, iPad Air, Air 2, & iPad Pro	', NULL, CAST(N'2020-05-17 00:00:43.067' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (260, 89, 2, N'	سماعة أبل إيفون 6 AUX 	', N'	سماعة أبل ايفون AUX سلكية معتمدة من شركة أبل تشمل ميكروفون وعازل للضجيج تدعم هواتف ايفون 4/5/5s/6s/6sPlus وجميع أجهزة الأندرويد المزودة بفتحت AUX كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:43.067' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (261, 90, 2, N'	سماعة أبل للايفون7/8 7/8PLUS _ X/XS XsMax _XR	', N'	سماعة أبل ايفون Lightning سلكية معتمدة من شركة أبل تشمل ميكروفون وعازل للضجيج تدعم هواتف ايفون 7/7Plus_8/8Plus_X/Xs/XsMax/XR_Ipad Pro/Air كفالة سنة 	', NULL, CAST(N'2020-05-17 00:00:43.067' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (262, 91, 2, N'	سماعة بلوتوث اكس ال سبورت انكر	', N'	صوت قوي عالي ونقي مقاومة للرمال والغبار والماء بطارية قوية تدوم اكثر من 15 ساعة يمكن توصيلها بالبلوتوث بما منفذ شحن ومنفذ لاعادة الشحن ومنفذ لكابل الصوت يمكن ان تستخدم بطارية 5000 أمبير 	', NULL, CAST(N'2020-05-17 00:00:43.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (263, 92, 2, N'	سماعة الأذن اللاسلكية ساوندكور سبيرت إكس بتقنية البلوتوث	', N'	من شحنة واحدة ، استمع إلى 12 ساعة من الصوت الرفيع الذي يحركه الباس. هذا هو أكثر من أسبوع من التدريبات من شحنة واحدة.	', NULL, CAST(N'2020-05-17 00:00:43.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (264, 93, 2, N'	سماعة بلوتوث من شركة انكر سبيريت برو اللون : الأسود 	', N'	سماعة بلوتوث من شركة انكر سبيريت برو اللون : الأسود / الرمادييمكن إستخدامها أثناء الرياضة والتمرينعالية الدقة لأصوات الموسيقى النقية والمكالمات الواضحةمقاومة للماء والتعرق والمطر بفضل الحماية الشديدة وغطاء لمنفذ الشحن الخاص بهتعمل حتى 10 ساعات متواصلة	', NULL, CAST(N'2020-05-17 00:00:43.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (265, 94, 2, N'	سماعة الأذن توون٢٠٥ من جاي بي إل aux	', N'	سماعة الأذن توون٢٠٥ من جاي بي إل Pure Bass Sound خالية من الكابلات المسطحةسماعات أذن ناعمة مريحة 	', NULL, CAST(N'2020-05-17 00:00:43.083' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (266, 95, 2, N'	باور بانك 10000 أيجو 4*1 -أبيض	', N'	حصريا في الكويت باور بانك ٤*١ اشحن الفون والساعه والايربود في نفس الوقتالشحن اللاسلكي 10 وات والشحن 18 وات PD أسرع من شاحن أبل! 10000 القدرات.4 USB الإخراج 1 USB إدخال PD5Led شحن حالة الضوءنوع C PD المدخلات والمخرجات ضمان لمدة سنة.يدعم كل ساعة أبل ا	', NULL, CAST(N'2020-05-17 00:00:43.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (267, 96, 2, N'	شاحن سفر رباعي المنافذ ايجو	', N'	⁣شحن سريع⁣⁣دعم 4 أجهزة في نفس الوقت.⁣⁣يمكن ان تستعمله في السفر ايضا⁣ 	', NULL, CAST(N'2020-05-17 00:00:43.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (268, 97, 2, N'	شاحن سفر ثنائي المنافذ ايجو	', N'	⁣شاحن السفر ثنائي المنافذ USB-C PD + QC مزود ⁣⁣بتقنية الشحن السريع PD + QC3 ⁣⁣⁣⁣الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (269, 98, 2, N'	شاحن سفر ثلاثي المنافذ ايجو	', N'	استخدم جهازًا واحدًا لجميع احتياجات الشحن الخاصة بك.. شحن ما يصل إلى خمسة أجهزة في وقت واحد.بأكثر من أربعة أضعاف أجهزة الشحن الأخرى.⁣⁣الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.097' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (270, 99, 2, N'	كابل ايجو 100 سم للايفون - أزرق	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، أحمر ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.113' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (271, 100, 2, N'	كابل ايجو 100 سم للايفون - رمادي	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، أحمر ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.113' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (272, 101, 2, N'	كابل ايجو 100 سم للايفون - أحمر	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، أحمر ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.113' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (273, 102, 2, N'	كابل ايجو 200 سم للايفون - أزرق	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، ذهبي ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.130' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (274, 103, 2, N'	كابل ايجو 200 سم للايفون -ذهبي	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، ذهبي ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.130' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (275, 104, 2, N'	كابل ايجو 200 سم للايفون - رمادي	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، ذهبي ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.130' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (276, 105, 2, N'	كابل ايجو 200 سم للايفون -أحمر	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، ذهبي ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.143' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (277, 106, 2, N'	كابل ايجو 30 سم للايفون - أزرق	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، ذهبي ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.143' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (278, 107, 2, N'	كابل ايجو 30 سم للايفون - ذهبي	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، ذهبي ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.160' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (279, 108, 2, N'	كابل ايجو 30 سم للايفون - رمادي	', N'	كابل ايجو 30 سم للايفون / يدعم الجهاز * iPhone 6S/6S Plus* iPhone 8/8 Plus* iPhone XS/XS Max* iPhone XR* iPhone 11* iPhone 11 Pro/11 Pro Max⁣الكفاله : سنه. (الألوان المتاحة: رمادي ، ذهبي ، أزرق)	', NULL, CAST(N'2020-05-17 00:00:43.160' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (280, 109, 2, N'	كابل ايجو 200سم تايب سي - أزرق	', N'	كابل ايجو 30سم تايب سي / يدعم الجهاز * Samsung Galaxy S10Lg G8 ThinqXiaomi Redmi 8Samsung Galaxy M30sRealme 6 ProSamsung Galaxy A71Asus ROG Phone 2⁣الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.160' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (281, 110, 2, N'	كابل ايجو 200سم تايب سي - ذهبي	', N'	كابل ايجو 30سم تايب سي / يدعم الجهاز * Samsung Galaxy S10Lg G8 ThinqXiaomi Redmi 8Samsung Galaxy M30sRealme 6 ProSamsung Galaxy A71Asus ROG Phone 2⁣الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.177' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (282, 111, 2, N'	كابل ايجو 30سم تايب سي - ذهبي	', N'	كابل ايجو 30سم تايب سي / يدعم الجهاز * Samsung Galaxy S10Lg G8 ThinqXiaomi Redmi 8Samsung Galaxy M30sRealme 6 ProSamsung Galaxy A71Asus ROG Phone 2⁣الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.177' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (283, 112, 2, N'	كابل ايجو 200سم تايب سي - رمادي	', N'	كابل ايجو 30سم تايب سي / يدعم الجهاز * Samsung Galaxy S10Lg G8 ThinqXiaomi Redmi 8Samsung Galaxy M30sRealme 6 ProSamsung Galaxy A71Asus ROG Phone 2⁣الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.177' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (284, 113, 2, N'	كابل ايجو 100سم تايب سي - رمادي	', N'	كابل ايجو 30سم تايب سي / يدعم الجهاز * Samsung Galaxy S10Lg G8 ThinqXiaomi Redmi 8Samsung Galaxy M30sRealme 6 ProSamsung Galaxy A71Asus ROG Phone 2⁣الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.190' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (285, 114, 2, N'	كابل ايجو 20سم تايب سي - ايفون - اسود	', N'	قم بتوصيل جهاز iPhone أو iPad أو iPod الخاص بك باستخدام موصل Lightning إلى USB-C للمزامنة والشحن. الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.190' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (286, 115, 2, N'	كابل ايجو 100سم تايب سي - ايفون - اسود	', N'	قم بتوصيل جهاز iPhone أو iPad أو iPod الخاص بك باستخدام موصل Lightning إلى USB-C للمزامنة والشحن. الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.190' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (287, 116, 2, N'	كابل ايجو 200سم تايب سي - ايفون - اسود	', N'	قم بتوصيل جهاز iPhone أو iPad أو iPod الخاص بك باستخدام موصل Lightning إلى USB-C للمزامنة والشحن. الكفاله : سنه	', NULL, CAST(N'2020-05-17 00:00:43.207' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (288, 117, 2, N'	شاحن منزل ايجو 120 وات 5 يواس بي اكستريم	', N'	120 واط شاحن ماكس الناتج 24AQC + PD الشحن السريع سريع CHARGE3 USB QC 3 الكفاله : سنه : يدعم جميع الأجهزة	', NULL, CAST(N'2020-05-17 00:00:43.207' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (289, 118, 2, N'	شاحن منزل ايجو72 وات 5 يو اس بي ميوتي تشارجر	', N'	دعم نظام الشحن السريع1 PORT PD1 PORT QC33 PORTS 2.8A توزيع ذكي وحدة شحن سريع الكفاله : سنه : محول صغير وقوي 	', NULL, CAST(N'2020-05-17 00:00:43.207' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (290, 119, 2, N'	ايجو استاند للباوربانك والساعه والموبايل اسود	', N'	ايجو استاند للباوربانك والساعه والموبايل اسود	', NULL, CAST(N'2020-05-17 00:00:43.223' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (291, 120, 2, N'	ايجو استاند للباوربانك والساعه والموبايل ابيض	', N'	ايجو استاند للباوربانك والساعه والموبايل ابيض	', NULL, CAST(N'2020-05-17 00:00:43.223' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (292, 121, 2, N'	كابل راف باور تايب سي الي تايب سي ١ متر 	', N'	"شحن ونقل البيانات بسرعة عاليةنوع الكبل C إلى النوع Cينحني أكثر من 12000 مرةشحن سريع 2.4Aمضفر نايلون ، ألياف كيفلر الأساسية - الكفاله 18 شهرًا.	', NULL, CAST(N'2020-05-17 00:00:43.223' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (293, 122, 2, N'	كابل راف باور يو اس بي الي تايب سي ١ متر	', N'	"شحن ونقل البيانات بسرعة عاليةكبل USB إلى النوع Cينحني أكثر من 12000 مرةشحن سريع 2.4Aمضفر نايلون ، ألياف كيفلر الأساسية - الكفاله 18 شهرًا. "	', NULL, CAST(N'2020-05-17 00:00:43.223' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (294, 123, 2, N'	بطارية متنقلة بقوة ١٠٠٠٠ من شركة أنكر باور كور ميترو إسينشيال اللون : الأسود	', N'	بطارية متنقلة بقوة ١٠٠٠٠ من شركة أنكر باور كور ميترو إسينشيال اللون : الأسودبه عدد ٢ مخارج يو أس بي للشحن>الأول : يو أس بي سيالثاني : يو أس بي>نحيفة وخفيفة الوزنمصنوعة من النسيج الناعم الأنيق مع البلاستيك المقاوم للصدمات والخدوش	', NULL, CAST(N'2020-05-17 00:00:43.240' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (295, 124, 2, N'	بطارية متنقلة بقوة ٢٠٠٠٠ من شركة أنكر باور كور ميترو إسينشيال اللون : الأسود	', N'	بطارية متنقلة بقوة ٢٠٠٠٠ من شركة أنكر باور كور ميترو إسينشيال اللون : الأسودبه عدد ٢ مخارج يو أس بي للشحنالأول : يو أس بي سيالثاني : يو أس بي نحيفة و خفيفة الوزن	', NULL, CAST(N'2020-05-17 00:00:43.240' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (296, 125, 2, N'	كابل يوجرين ا متر ميكرو 	', N'	الشحن السريع إلى Samsung Galaxy Note 6/5/4/3 / J3 / J5 / J7 / A3 / A5 / A7 التوافق 2: كابل شحن الهاتف لـ 1/2/3/4 	', NULL, CAST(N'2020-05-17 00:00:43.240' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (297, 126, 2, N'	كابل يوجرين ١ متر تايب سي 	', N'	يوجرين يو اس بي كيبل الي تايب سي لاجهزة سامسونج جالاكسي S10 S9 كبل تليفون سريع يو اس بي سي تشارج داتا 3A واي جهاز يدعم تايب سي 	', NULL, CAST(N'2020-05-17 00:00:43.253' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (298, 127, 2, N'	كابل يوجرين HDMI ٣ متر 	', N'	HDMI 2.0 CABLE: يمكنك من توصيل الكمبيوتر المحمول مباشرة بشاشة عرض مجهزة بـ HDMI وبحد أقصى 4K عند 60Hz. الضمان: 18 شهر	', NULL, CAST(N'2020-05-17 00:00:43.253' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (299, 128, 2, N'	كابل يوجرين تايب سي الي تايب سي 	', N'	"أسرع وأكثر أمانًا في شحن ما يصل إلى 60 واط من الطاقةيوفر لك كابل UGREEN USB C-C خرجًا يبلغ 20 فولتًا كحد أقصى ، حيث يشحن الهاتف الذكي أو الكمبيوتر اللوحي أو الكمبيوتر المحمول من النوع C بسرعة. "	', NULL, CAST(N'2020-05-17 00:00:43.253' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (300, 129, 2, N'	كابل يوجرين تايب سي الي ايفون 	', N'	Ugreen MFi USB Type C to Lightning Cable for iPhone 11 Pro X XS 8 XR PD18W Fast USB C Charging Data Cable for Macbook PD Cable, MFI CERTIFIED. 	', NULL, CAST(N'2020-05-17 00:00:43.253' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (301, 130, 2, N'	باور بانك يوجرين 10000 mah ميني PD + QC3 	', N'	Ugreen قوة البنك 10000mAh كويك تشارج 4.0 3.0 QC3.0 شاحن بطارية خارجية سريعة PD PD ل iPhone 11 - Xs ميني باور بانك ، 18W TYPE- C OUT.	', NULL, CAST(N'2020-05-17 00:00:43.270' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (302, 131, 2, N'	باور بانك يوجرين 10000 mah وايرلس سريع PD	', N'	"UGREEN 1000mAh Powerbank مع 38W. قم بشحن 0 ٪ إلى 50 ٪ في 30mins ل iPhone 8 / X3 ساعات كاملة قوة البنك المسؤول. إخراج شاحن لاسلكي Qi: 10W "	', NULL, CAST(N'2020-05-17 00:00:43.270' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (303, 132, 2, N'	باور بانك يوجرين 20000 mah سريع PD	', N'	"Power بنك الطاقة PD ذو السعة الكبيرة】 بنك الطاقة UGREEN PD المزود ببطارية عالية السعة 20000mAh في الداخل ، ويقدم رسومًا متعددة على أجهزتك لتوفير الوقت ، يدعم بنك الطاقة 20000mah 5 إعادة شحن لـ iPhone XR ، إعادة شحن 4.5 لـ S10 ، إعادة شحن 8 بالنسبة إلى iP	', NULL, CAST(N'2020-05-17 00:00:43.270' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (304, 133, 2, N'	كابل يوجرين تايب سي الي hdmi	', N'	يمكن لـ UGREEN USB من النوع C إلى كابل HDMI توصيل الهاتف الذكي / الكمبيوتر المحمول الذي يدعم USB-C بجهاز HDTV أو الشاشة أو جهاز العرض باستخدام منفذ HDMI. إنه مثالي للمؤتمرات أو العروض التقديمية أو الألعاب أو توسيع مساحة العمل عن طريق توصيل أجهزة USB-C الخ	', NULL, CAST(N'2020-05-17 00:00:43.270' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (305, 134, 2, N'	يوجرين كابل 5*1 	', N'	يتميز مركز بيانات UGREEN 5 في 1 USB-C بمنفذ إخراج 4K HDMI و TYPE-C PD و 3 منافذ USB 3.0. ويمكن لجميع منافذ المحور العمل في وقت واحد ، صغيرة لكنها قوية.	', NULL, CAST(N'2020-05-17 00:00:43.287' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (306, 135, 2, N'	يوجرين استاند مغناطيس للسياره 	', N'	مادة لاصقة يمكن الاعتماد عليها: مع لاصق قوي ، يمكن تثبيت الهاتف في السيارة بقوة على اندفاعة سيارتك لفترة أطول. لا تقلق أبدًا من السقوط حتى أثناء القيادة على طريق وعر.	', NULL, CAST(N'2020-05-17 00:00:43.287' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (307, 136, 2, N'	يوجرين استاند للسياره 	', N'	يوجرين استاند للسياره يقوم الحامل بإغلاق الهاتف تلقائيًا بواسطة رابط الجاذبية. لذلك فهو يدعم فقط الوضع الرأسي	', NULL, CAST(N'2020-05-17 00:00:43.287' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (308, 137, 2, N'	يوجرين شاحن سياره ٢ مخرج 5V4.8A	', N'	Ugreen شاحن سيارة ميني USB للهاتف المحمول اللوحي GPS 4.8A شاحن سريع USB المزدوج الهاتف شاحن سيارة 	', NULL, CAST(N'2020-05-17 00:00:43.287' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (309, 138, 2, N'	يوجرين شاحن سياره ٢ مخرج QC3	', N'	4X أسرع: يشحن منفذ USB للشحن السريع QC3.0 4X أسرع من أجهزة الشحن القياسية مع الإخراج الحالي Max 3A ، ومتوافق مع الأجهزة Quick Charge 3.0 / 2.0 والأجهزة غير ذات الشحن السريع مثل Samsung Galaxy S10 / S9 / S8 / S8 Plus / S7 / S6 / Note 8 / NOTE 5 و iPhone X 	', NULL, CAST(N'2020-05-17 00:00:43.300' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (310, 139, 2, N'	يوجرين شاحن سياره ٢ مخرج QC3 + PD	', N'	شحن 50 ٪ في 30 دقيقة (iPhone 11/8 / X) - فقط في منفذ PD: مثالي لشحن جهاز iPhone 11 / XS / iPhone XS Max / iPhone XR / iPhone X / iPhone 8 / iPhone 8 Plus بأقصى سرعة. على سبيل المثال ، يمكن شحن iPhone X من 0٪ إلى 50٪ في 30 دقيقة فقط ، وهو أسرع بكثير من شاح	', NULL, CAST(N'2020-05-17 00:00:43.300' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (311, 140, 2, N'	شنطه يوجرين 2	', N'	حقيبة حقائب UGREEN مصممة خصيصًا لأجهزة Nintendo Switch الكاملة وغيرها من الملحقات. من السهل حملها ، عند الخروج للزيارة أو الدعوة وتخزينها جيدًا عندما لا تكون قيد الاستخدام. كل شيء سيكون منظم جيدًا ومحميًا.	', NULL, CAST(N'2020-05-17 00:00:43.300' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (312, 141, 2, N'	شنطه يوجرين 3	', N'	تصميم منظم سفر UGREEN Electronics Travel للحفاظ على الأدوات الأساسية الخاصة بك في متناول اليد ودون بحث في جميع أنحاء المكان ، وهو أمر لا بد منه للحياة اليومية / المدرسة / المكتب / رحلة عمل / الإجازات ، إلخ	', NULL, CAST(N'2020-05-17 00:00:43.300' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (313, 142, 2, N'	يوجرين نينتندو سويتش غطاء حماية شفاف أسود	', N'	سهلة التركيب والإقلاع بفضل التصميم المقسم الفريد ، تتيح لك واقي الغطاء هذا إخراج العيوب من كونترول دون إزالة العلبة بأكملها. من السهل تشغيله وإقلاعه متى أردت تثبيت المفتاح ، خاصةً للعب الوضع باليد.	', NULL, CAST(N'2020-05-17 00:00:43.300' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (314, 143, 2, N'	شاحن منزل 5 مخرج بي دي أبيض انكر	', N'	موزع شحن قوي بقوة 60 وات يحتوي علي افضل التقنيات الالكترونية الحديثة تقنية التحكم بدرجة الحرارة به نقنية رفع الجهد والشحن السريع الامن به منفذ باور دليفري و4 منافذ بنظام IQ2 كفالة سنة ونصف	', NULL, CAST(N'2020-05-17 00:00:43.317' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (315, 144, 2, N'	كابل أتش دي ام آي من أبل -اسود	', N'	أبل HDMI إلى كابل HDMIيتيح لك كابل HDMI إلى HDMI توصيل Apple TV أو Mac mini أو أي جهاز HDMI آخر بجهاز استقبال HDTV أو A / V.	', NULL, CAST(N'2020-05-17 00:00:43.317' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (316, 145, 2, N'	محول قابس السماعة يو إس بي من نوع - سي إلى ٣,٥ ملم من أبل - أبيض 	', N'	محول قابس السماعة يو إس بي من نوع - سي إلى ٣,٥ ملمتوصيل أي جهاز فيديو مع منفذ يو إس بي من نوع - سي إلى شاشة عرض بسهولةطبقة الحماية الخارجية المتقدمة تقلل من التداخل	', NULL, CAST(N'2020-05-17 00:00:43.317' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (317, 146, 2, N'	كابل شحن يو إس بي من نوع - سي من أبل - ١ متر - أبيض 	', N'	تصميم قابل للتوصيل من الجهتينيو إس بي من نوع - سي (١ متر)الشحن والمزامنةتوصيل أجهزة الآيباد برو الحديثة الخاصة بك	', NULL, CAST(N'2020-05-17 00:00:43.317' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (318, 147, 2, N'	كابل شحن يو إس بي من نوع - سي من أبل - ٢ متر - أبيض 	', N'	تصميم قابل للتوصيل من الجهتينيو إس بي من نوع - سي (٢ متر)الشحن والمزامنةتوصيل أجهزة الآيباد برو الحديثة الخاصة بك	', NULL, CAST(N'2020-05-17 00:00:43.333' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (319, 148, 2, N'	محول يو أس بي من أبل-١٢ واط - اللون الأبيض	', N'	إشحن كافة أجهزة الأبل بسهولة و راحة تامة مع محول يو أس بي الذي يتوافق مع الآي بود و الآي فون و الماك بوك و الماك بوك برو ١٣ بوصة. إنه حقا الشاحن الآمثل لك لتحظى بإستخدام أسهل و أسرع.	', NULL, CAST(N'2020-05-17 00:00:43.333' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (320, 149, 2, N'	محول يو إس بي - سي بقوة ١٨ واط من أبل	', N'	تصميم مدمجقوة ١٨ واطمحول الطاقة يو إس بي من أبلالتوافق: طرازات آيفون / آيباد ميني / آيبود	', NULL, CAST(N'2020-05-17 00:00:43.333' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (321, 150, 2, N'	شاحن سياره انكر سريع PD + IQ2	', N'	مزود بمنفذ توصيل USB-C بقوة 18 واط ومنفذ USB قديم بقوة 15 واط مع PowerIQ2.0 ، لشحن جهازين في وقت واحد حتى ساعة ونصف أسرع من أجهزة الشحن الأخرى.	', NULL, CAST(N'2020-05-17 00:00:43.333' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (322, 151, 2, N'	باور بانك انكر 10000 pd / اخضر	', N'	أوضاع الشحن الثلاثية: منفذ USB-C للتوصيل بقدرة 18 وات ، ومنفذ USB-A مزود بخاصية PowerIQ ، . استخدم منافذ USB المزدوجة لشحن جهازين في وقت واحد.	', NULL, CAST(N'2020-05-17 00:00:43.347' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (323, 152, 2, N'	كفر اليمنت كيس ايفون - 11 PRO SHADOW - BLACK	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.347' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (324, 153, 2, N'	كفر اليمنت كيس ايفون - 11 PRO SHADOW - OXBLOOD	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.347' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (325, 154, 2, N'	كفر اليمنت كيس ايفون -11 PRO MAX SHADOW - BLACK	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.347' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (326, 155, 2, N'	كفر اليمنت كيس ايفون -11 PRO SHADOW MAX - BLACK	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.363' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (327, 156, 2, N'	كفر اليمنت كيس ايفون - 11 RAIL- CLEAR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.363' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (328, 157, 2, N'	كفر اليمنت كيس ايفون - SOLID BLACK - RAIL 11	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.363' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (329, 158, 2, N'	كفر اليمنت كيس ايفون - 11 PRO RAIL- CLEAR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.363' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (330, 159, 2, N'	كفر اليمنت كيس ايفون - 11 PRO MAX- CLEAR/SOLID RED	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.380' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (331, 160, 2, N'	كفر اليمنت كيس ايفون -11 PRO MAX- CLEAR/SOLID BLACK	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.380' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (332, 161, 2, N'	كفر اليمنت كيس ايفون -11 PRO - CLEAR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.380' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (333, 162, 2, N'	كفر اليمنت كيس ايفون - 11 PRO - CLEAR/FALAMINGO PINK	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.380' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (334, 163, 2, N'	كفر اليمنت كيس ايفون -11 PRO - CLEAR/SOLID RED	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.393' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (335, 164, 2, N'	كفر اليمنت كيس ايفون -11 PRO RAIL- CLEAR/SOLID BLACK	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.393' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (336, 165, 2, N'	كفر اليمنت كيس ايفون -11 RALLY- CLEAR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.393' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (337, 166, 2, N'	كفر اليمنت كيس ايفون - 11 PRO MAX RALLY- CLEAR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.393' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (338, 167, 2, N'	كفر اليمنت كيس ايفون -11 PRO GLASS SCREEN PROTECTOR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (339, 168, 2, N'	كفر اليمنت كيس ايفون - 11 GLASS SCREEN PROTECTOR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (340, 169, 2, N'	كفر اليمنت كيس ايفون - 11 PRO MAX - CLEAR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (341, 170, 2, N'	كفر اليمنت كيس ايفون -11 PRO MAX RAIL- CLEAR/FLAMINGO	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.427' AS DateTime), 1, 0)
GO
INSERT [dbo].[ProductRecords] ([ID], [ProductID], [LanguageID], [Name], [Summary], [Description], [ModifiedOn], [IsActive], [IsDeleted]) VALUES (342, 171, 2, N'	كفر اليمنت كيس ايفون - 11 RALLY- CLEAR	', N'	تأكد من أن المقبض العلوي والسفلي والجانبي يتميز بتصميم مريح لمزيد من الراحة والأمانأزرار النقر السريع - تسمح الأزرار المستقلة لعناصر التحكم في الهاتف بالعمل بسلاسة كما كان الحال دون أي حالةاللوحة الخلفية المثقبة - توفر ملمسًا ناعمًا "في اليد" لتجربة مست	', NULL, CAST(N'2020-05-17 00:00:43.427' AS DateTime), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[ProductRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (1, 4, 0, CAST(15.00 AS Decimal(18, 2)), 105, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(11.00 AS Decimal(18, 2)), NULL, N'9180', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (2, 4, 0, CAST(17.50 AS Decimal(18, 2)), 106, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(13.50 AS Decimal(18, 2)), NULL, N'9554', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (3, 4, 0, CAST(13.50 AS Decimal(18, 2)), 107, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(9.50 AS Decimal(18, 2)), NULL, N'8722', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (4, 4, 0, CAST(12.50 AS Decimal(18, 2)), 108, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(8.50 AS Decimal(18, 2)), NULL, N'8902', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (5, 4, 0, CAST(8.50 AS Decimal(18, 2)), 109, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8738', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (6, 4, 0, CAST(6.50 AS Decimal(18, 2)), 110, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8396', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (7, 4, 0, CAST(6.50 AS Decimal(18, 2)), 111, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8608', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (8, 4, 0, CAST(6.50 AS Decimal(18, 2)), 112, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8548', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (9, 4, 0, CAST(6.00 AS Decimal(18, 2)), 113, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'7048', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (10, 4, 0, CAST(9.90 AS Decimal(18, 2)), 114, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'9187', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (11, 4, 0, CAST(16.00 AS Decimal(18, 2)), 115, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(12.00 AS Decimal(18, 2)), NULL, N'9257', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (12, 4, 0, CAST(13.50 AS Decimal(18, 2)), 116, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(9.50 AS Decimal(18, 2)), NULL, N'9258', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (13, 4, 0, CAST(13.50 AS Decimal(18, 2)), 117, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(9.50 AS Decimal(18, 2)), NULL, N'9256', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (14, 4, 0, CAST(14.50 AS Decimal(18, 2)), 118, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(10.50 AS Decimal(18, 2)), NULL, N'9272', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (15, 7, 0, CAST(11.50 AS Decimal(18, 2)), 119, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(7.50 AS Decimal(18, 2)), NULL, N'8808', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (16, 7, 0, CAST(7.50 AS Decimal(18, 2)), 120, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8535', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (17, 7, 0, CAST(4.00 AS Decimal(18, 2)), 121, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8612', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (18, 7, 0, CAST(14.00 AS Decimal(18, 2)), 122, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, CAST(10.00 AS Decimal(18, 2)), NULL, N'8670', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (19, 3, 0, CAST(7.50 AS Decimal(18, 2)), 123, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8674', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (20, 3, 0, CAST(7.00 AS Decimal(18, 2)), 124, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8391', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (21, 3, 0, CAST(6.00 AS Decimal(18, 2)), 125, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8392', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (22, 3, 0, CAST(5.00 AS Decimal(18, 2)), 126, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8444', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (23, 3, 0, CAST(4.00 AS Decimal(18, 2)), 127, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8393', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (24, 3, 0, CAST(5.75 AS Decimal(18, 2)), 128, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8933', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (25, 3, 0, CAST(5.00 AS Decimal(18, 2)), 129, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'9578', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (26, 3, 0, CAST(4.50 AS Decimal(18, 2)), 130, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8302', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (27, 3, 0, CAST(5.50 AS Decimal(18, 2)), 131, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8540', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (28, 3, 0, CAST(3.00 AS Decimal(18, 2)), 132, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'9579', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (29, 3, 0, CAST(5.00 AS Decimal(18, 2)), 133, CAST(N'2020-05-17 00:00:41.847' AS DateTime), 1, 0, NULL, NULL, N'8979', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (30, 3, 0, CAST(7.50 AS Decimal(18, 2)), 134, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8905', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (31, 9, 0, CAST(11.00 AS Decimal(18, 2)), 135, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(7.00 AS Decimal(18, 2)), NULL, N'600', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (32, 9, 0, CAST(4.00 AS Decimal(18, 2)), 136, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9571', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (33, 9, 0, CAST(6.00 AS Decimal(18, 2)), 137, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9601', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (34, 10, 0, CAST(8.00 AS Decimal(18, 2)), 138, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9078', N'Accessories;GRIP', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (35, 8, 0, CAST(28.00 AS Decimal(18, 2)), 139, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(24.00 AS Decimal(18, 2)), NULL, N'9985', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (36, 8, 0, CAST(9.50 AS Decimal(18, 2)), 140, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9412', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (37, 8, 0, CAST(16.00 AS Decimal(18, 2)), 141, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(12.00 AS Decimal(18, 2)), NULL, N'9411', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (38, 8, 0, CAST(34.00 AS Decimal(18, 2)), 142, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(30.00 AS Decimal(18, 2)), NULL, N'8857', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (39, 8, 0, CAST(17.00 AS Decimal(18, 2)), 143, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(13.00 AS Decimal(18, 2)), NULL, N'9406', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (40, 8, 0, CAST(36.00 AS Decimal(18, 2)), 144, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(32.00 AS Decimal(18, 2)), NULL, N'8926', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (41, 8, 0, CAST(20.00 AS Decimal(18, 2)), 145, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(16.00 AS Decimal(18, 2)), NULL, N'8708', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (42, 8, 0, CAST(15.75 AS Decimal(18, 2)), 146, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(11.75 AS Decimal(18, 2)), NULL, N'8475', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (43, 8, 0, CAST(14.00 AS Decimal(18, 2)), 147, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(10.00 AS Decimal(18, 2)), NULL, N'8605', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (44, 8, 0, CAST(14.50 AS Decimal(18, 2)), 148, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(10.50 AS Decimal(18, 2)), NULL, N'8858', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (45, 8, 0, CAST(9.50 AS Decimal(18, 2)), 149, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8723', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (46, 8, 0, CAST(7.00 AS Decimal(18, 2)), 150, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8562', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (47, 8, 0, CAST(17.50 AS Decimal(18, 2)), 151, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(13.50 AS Decimal(18, 2)), NULL, N'9651', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (48, 5, 0, CAST(16.00 AS Decimal(18, 2)), 152, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(12.00 AS Decimal(18, 2)), NULL, N'8573', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (49, 5, 0, CAST(16.00 AS Decimal(18, 2)), 153, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(12.00 AS Decimal(18, 2)), NULL, N'7049', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (50, 5, 0, CAST(5.00 AS Decimal(18, 2)), 154, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9254', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (51, 5, 0, CAST(5.00 AS Decimal(18, 2)), 155, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9253', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (52, 5, 0, CAST(7.00 AS Decimal(18, 2)), 156, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9264', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (53, 5, 0, CAST(7.00 AS Decimal(18, 2)), 157, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9260', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (54, 5, 0, CAST(7.00 AS Decimal(18, 2)), 158, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9262', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (55, 5, 0, CAST(26.00 AS Decimal(18, 2)), 159, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(22.00 AS Decimal(18, 2)), NULL, N'9255', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (56, 5, 0, CAST(5.00 AS Decimal(18, 2)), 160, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9649', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (57, 5, 0, CAST(6.50 AS Decimal(18, 2)), 161, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9650', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (58, 5, 0, CAST(7.00 AS Decimal(18, 2)), 162, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'7050', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (59, 5, 0, CAST(8.00 AS Decimal(18, 2)), 163, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9051', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (60, 5, 0, CAST(8.00 AS Decimal(18, 2)), 164, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'9052', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (61, 5, 0, CAST(5.50 AS Decimal(18, 2)), 165, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'7039', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (62, 5, 0, CAST(19.50 AS Decimal(18, 2)), 166, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, CAST(15.50 AS Decimal(18, 2)), NULL, N'8682', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (63, 5, 0, CAST(3.00 AS Decimal(18, 2)), 167, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8485', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (64, 5, 0, CAST(8.50 AS Decimal(18, 2)), 168, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8724', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (65, 5, 0, CAST(7.50 AS Decimal(18, 2)), 169, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8725', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (66, 5, 0, CAST(8.50 AS Decimal(18, 2)), 170, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8742', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (67, 5, 0, CAST(7.50 AS Decimal(18, 2)), 171, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8743', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (68, 5, 0, CAST(6.50 AS Decimal(18, 2)), 172, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8801', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (69, 5, 0, CAST(5.00 AS Decimal(18, 2)), 173, CAST(N'2020-05-17 00:00:41.863' AS DateTime), 1, 0, NULL, NULL, N'8676', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (70, 5, 0, CAST(5.00 AS Decimal(18, 2)), 174, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8398', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (71, 5, 0, CAST(4.00 AS Decimal(18, 2)), 175, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8681', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (72, 5, 0, CAST(5.00 AS Decimal(18, 2)), 176, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8802', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (73, 5, 0, CAST(7.00 AS Decimal(18, 2)), 177, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'9142', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (74, 5, 0, CAST(8.50 AS Decimal(18, 2)), 178, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'9764', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (75, 5, 0, CAST(9.50 AS Decimal(18, 2)), 179, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'9855', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (76, 5, 0, CAST(5.00 AS Decimal(18, 2)), 180, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8997', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (77, 5, 0, CAST(7.50 AS Decimal(18, 2)), 181, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8643', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (78, 5, 0, CAST(9.00 AS Decimal(18, 2)), 182, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8601', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (79, 5, 0, CAST(10.50 AS Decimal(18, 2)), 183, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(6.50 AS Decimal(18, 2)), NULL, N'8640', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (80, 5, 0, CAST(7.00 AS Decimal(18, 2)), 184, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8871', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (81, 5, 0, CAST(8.50 AS Decimal(18, 2)), 185, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8872', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (82, 5, 0, CAST(10.00 AS Decimal(18, 2)), 186, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8873', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (83, 5, 0, CAST(8.00 AS Decimal(18, 2)), 187, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8874', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (84, 5, 0, CAST(9.00 AS Decimal(18, 2)), 188, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8875', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (85, 5, 0, CAST(12.00 AS Decimal(18, 2)), 189, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(8.00 AS Decimal(18, 2)), NULL, N'8876', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (86, 5, 0, CAST(10.00 AS Decimal(18, 2)), 190, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8904', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (87, 2, 0, CAST(15.00 AS Decimal(18, 2)), 191, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(11.00 AS Decimal(18, 2)), NULL, N'9777', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (88, 2, 0, CAST(15.00 AS Decimal(18, 2)), 192, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(11.00 AS Decimal(18, 2)), NULL, N'9776', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (89, 2, 0, CAST(9.00 AS Decimal(18, 2)), 193, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'8436', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (90, 2, 0, CAST(13.00 AS Decimal(18, 2)), 194, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(9.00 AS Decimal(18, 2)), NULL, N'7040', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (91, 2, 0, CAST(23.00 AS Decimal(18, 2)), 195, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(19.00 AS Decimal(18, 2)), NULL, N'8883', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (92, 2, 0, CAST(15.00 AS Decimal(18, 2)), 196, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(11.00 AS Decimal(18, 2)), NULL, N'9400', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (93, 2, 0, CAST(18.50 AS Decimal(18, 2)), 197, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(14.50 AS Decimal(18, 2)), NULL, N'9204', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (94, 2, 0, CAST(13.00 AS Decimal(18, 2)), 198, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(9.00 AS Decimal(18, 2)), NULL, N'8616', N'Accessories;HEADPHONES', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (95, 8, 0, CAST(28.50 AS Decimal(18, 2)), 199, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(24.50 AS Decimal(18, 2)), NULL, N'9985', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (96, 4, 0, CAST(8.00 AS Decimal(18, 2)), 200, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'10197', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (97, 6, 0, CAST(8.50 AS Decimal(18, 2)), 201, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'9987', N'Accessories;ADAPTER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (98, 8, 0, CAST(19.00 AS Decimal(18, 2)), 202, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, CAST(15.00 AS Decimal(18, 2)), NULL, N'9986', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (99, 5, 0, CAST(6.00 AS Decimal(18, 2)), 203, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'10182', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (100, 5, 0, CAST(6.00 AS Decimal(18, 2)), 204, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'10181', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (101, 5, 0, CAST(6.00 AS Decimal(18, 2)), 205, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'10183', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (102, 5, 0, CAST(7.00 AS Decimal(18, 2)), 206, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'10186', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (103, 5, 0, CAST(7.00 AS Decimal(18, 2)), 207, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'10184', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (104, 5, 0, CAST(7.00 AS Decimal(18, 2)), 208, CAST(N'2020-05-17 00:00:41.880' AS DateTime), 1, 0, NULL, NULL, N'10185', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (105, 5, 0, CAST(7.00 AS Decimal(18, 2)), 209, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10187', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (106, 5, 0, CAST(5.00 AS Decimal(18, 2)), 210, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10179', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (107, 5, 0, CAST(5.00 AS Decimal(18, 2)), 211, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10177', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (108, 5, 0, CAST(5.00 AS Decimal(18, 2)), 212, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10178', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (109, 5, 0, CAST(5.50 AS Decimal(18, 2)), 213, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10193', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (110, 5, 0, CAST(5.50 AS Decimal(18, 2)), 214, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10191', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (111, 5, 0, CAST(4.00 AS Decimal(18, 2)), 215, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10188', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (112, 5, 0, CAST(5.50 AS Decimal(18, 2)), 216, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10192', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (113, 5, 0, CAST(4.50 AS Decimal(18, 2)), 217, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10190', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (114, 5, 0, CAST(6.00 AS Decimal(18, 2)), 218, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10194', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (115, 5, 0, CAST(7.00 AS Decimal(18, 2)), 219, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10195', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (116, 5, 0, CAST(8.00 AS Decimal(18, 2)), 220, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10196', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (117, 4, 0, CAST(20.00 AS Decimal(18, 2)), 221, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(16.00 AS Decimal(18, 2)), NULL, N'9988', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (118, 4, 0, CAST(12.00 AS Decimal(18, 2)), 222, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(8.00 AS Decimal(18, 2)), NULL, N'10198', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (119, 3, 0, CAST(1.00 AS Decimal(18, 2)), 223, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10201', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (120, 3, 0, CAST(1.00 AS Decimal(18, 2)), 224, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10200', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (121, 5, 0, CAST(3.50 AS Decimal(18, 2)), 225, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10206', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (122, 5, 0, CAST(3.50 AS Decimal(18, 2)), 226, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10205', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (123, 8, 0, CAST(14.90 AS Decimal(18, 2)), 227, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(10.90 AS Decimal(18, 2)), NULL, N'10225', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (124, 8, 0, CAST(19.00 AS Decimal(18, 2)), 228, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(15.00 AS Decimal(18, 2)), NULL, N'10226', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (125, 5, 0, CAST(3.50 AS Decimal(18, 2)), 229, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10243', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (126, 5, 0, CAST(4.00 AS Decimal(18, 2)), 230, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10244', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (127, 5, 0, CAST(5.50 AS Decimal(18, 2)), 231, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10250', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (128, 5, 0, CAST(5.50 AS Decimal(18, 2)), 232, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10256', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (129, 5, 0, CAST(6.00 AS Decimal(18, 2)), 233, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'9570', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (130, 8, 0, CAST(11.50 AS Decimal(18, 2)), 234, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(7.50 AS Decimal(18, 2)), NULL, N'10247', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (131, 8, 0, CAST(14.50 AS Decimal(18, 2)), 235, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(10.50 AS Decimal(18, 2)), NULL, N'10248', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (132, 8, 0, CAST(16.50 AS Decimal(18, 2)), 236, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(12.50 AS Decimal(18, 2)), NULL, N'10249', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (133, 5, 0, CAST(11.50 AS Decimal(18, 2)), 237, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(7.50 AS Decimal(18, 2)), NULL, N'9576', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (134, 5, 0, CAST(17.50 AS Decimal(18, 2)), 238, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, CAST(13.50 AS Decimal(18, 2)), NULL, N'10257', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (135, 3, 0, CAST(5.00 AS Decimal(18, 2)), 239, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'9578', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (136, 3, 0, CAST(5.00 AS Decimal(18, 2)), 240, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10255', N'Accessories;STAND', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (137, 7, 0, CAST(4.00 AS Decimal(18, 2)), 241, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10241', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (138, 7, 0, CAST(4.50 AS Decimal(18, 2)), 242, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10245', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (139, 7, 0, CAST(6.50 AS Decimal(18, 2)), 243, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10246', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (140, 9, 0, CAST(7.00 AS Decimal(18, 2)), 244, CAST(N'2020-05-17 00:00:41.893' AS DateTime), 1, 0, NULL, NULL, N'10254', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (141, 9, 0, CAST(7.23 AS Decimal(18, 2)), 141, CAST(N'2020-05-20 11:47:39.037' AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'10252', N'Accessories;CASE', N'', N'', 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (142, 9, 0, CAST(5.00 AS Decimal(18, 2)), 246, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10251', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (143, 4, 0, CAST(17.50 AS Decimal(18, 2)), 247, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(13.50 AS Decimal(18, 2)), NULL, N'8807', N'Accessories;CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (144, 5, 0, CAST(6.00 AS Decimal(18, 2)), 144, CAST(N'2020-05-20 14:17:23.277' AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'10230', N'Accessories;CABLE', N'', N'', 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (145, 5, 0, CAST(5.50 AS Decimal(18, 2)), 249, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10229', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (146, 5, 0, CAST(7.50 AS Decimal(18, 2)), 250, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10227', N'Accessories;CABLE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (147, 5, 0, CAST(8.50 AS Decimal(18, 2)), 147, CAST(N'2020-05-20 14:19:45.513' AS DateTime), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'10228', N'Accessories;CABLE', N'', N'', 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (148, 6, 0, CAST(9.00 AS Decimal(18, 2)), 252, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10233', N'Accessories;ADAPTER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (149, 6, 0, CAST(12.50 AS Decimal(18, 2)), 149, CAST(N'2020-05-27 07:28:39.850' AS DateTime), 1, 0, CAST(8.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'10231', N'Accessories;ADAPTER', N'', N'', 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (150, 7, 0, CAST(7.90 AS Decimal(18, 2)), 254, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10286', N'Accessories;CAR-CHARGER', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (151, 8, 0, CAST(12.90 AS Decimal(18, 2)), 255, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(8.90 AS Decimal(18, 2)), NULL, N'10285', N'Accessories;POWERBANK', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (152, 9, 0, CAST(12.50 AS Decimal(18, 2)), 256, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(8.50 AS Decimal(18, 2)), NULL, N'10264', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (153, 9, 0, CAST(12.50 AS Decimal(18, 2)), 257, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(8.50 AS Decimal(18, 2)), NULL, N'10265', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (154, 9, 0, CAST(12.50 AS Decimal(18, 2)), 258, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(8.50 AS Decimal(18, 2)), NULL, N'10266', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (155, 9, 0, CAST(12.50 AS Decimal(18, 2)), 259, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(8.50 AS Decimal(18, 2)), NULL, N'10267', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (156, 9, 0, CAST(10.90 AS Decimal(18, 2)), 260, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10268', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (157, 9, 0, CAST(10.90 AS Decimal(18, 2)), 261, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10269', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (158, 9, 0, CAST(10.90 AS Decimal(18, 2)), 262, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10270', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (159, 9, 0, CAST(10.90 AS Decimal(18, 2)), 263, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10272', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (160, 9, 0, CAST(10.90 AS Decimal(18, 2)), 264, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10273', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (161, 9, 0, CAST(10.90 AS Decimal(18, 2)), 265, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10274', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (162, 9, 0, CAST(10.90 AS Decimal(18, 2)), 266, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10275', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (163, 9, 0, CAST(10.90 AS Decimal(18, 2)), 267, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10276', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (164, 9, 0, CAST(10.90 AS Decimal(18, 2)), 268, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10277', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (165, 9, 0, CAST(11.90 AS Decimal(18, 2)), 269, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(7.90 AS Decimal(18, 2)), NULL, N'10278', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (166, 9, 0, CAST(11.90 AS Decimal(18, 2)), 270, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(7.90 AS Decimal(18, 2)), NULL, N'10279', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (167, 9, 0, CAST(9.50 AS Decimal(18, 2)), 271, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10280', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (168, 9, 0, CAST(9.50 AS Decimal(18, 2)), 272, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10281', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (169, 9, 0, CAST(9.50 AS Decimal(18, 2)), 273, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, NULL, NULL, N'10282', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (170, 9, 0, CAST(10.90 AS Decimal(18, 2)), 274, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(6.90 AS Decimal(18, 2)), NULL, N'10283', N'Accessories;CASE', NULL, NULL, 10)
GO
INSERT [dbo].[Products] ([ID], [CategoryID], [isFeatured], [Price], [ThumbnailPictureID], [ModifiedOn], [IsActive], [IsDeleted], [Discount], [Cost], [SKU], [Tags], [Barcode], [Supplier], [StockQuantity]) VALUES (171, 9, 0, CAST(11.90 AS Decimal(18, 2)), 275, CAST(N'2020-05-17 00:00:41.910' AS DateTime), 1, 0, CAST(7.90 AS Decimal(18, 2)), NULL, N'10284', N'Accessories;CASE', NULL, NULL, 10)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'a4a10803-aad4-4813-a9a3-c689103d2d6b', N'Administrator')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'bb8120bb-88df-4ca5-81a9-383ab82aa852', N'User')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'fd152968-a99c-4fbb-9da6-cb99b6755b52', N'Moderator')
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'3cbb5965-4722-404c-a9b0-8ebe17f75888', N'a4a10803-aad4-4813-a9a3-c689103d2d6b')
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'3cbb5965-4722-404c-a9b0-8ebe17f75888', N'bb8120bb-88df-4ca5-81a9-383ab82aa852')
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'3cbb5965-4722-404c-a9b0-8ebe17f75888', N'fd152968-a99c-4fbb-9da6-cb99b6755b52')
GO
INSERT [dbo].[Users] ([Id], [FullName], [Country], [City], [Address], [PictureID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [ZipCode], [RegisteredOn]) VALUES (N'3cbb5965-4722-404c-a9b0-8ebe17f75888', N'Admin', N'Adminsburg', N'Adminstria', N'404 Block D, Adm Street', NULL, N'adm_use@domain.com', 0, N'AJF17LSCe5gQJ3LU71eUlElz9zRJflG3pVU+DPoyjZAH/h4oe4urmolrMoBKpYEdQw==', N'03b4d97e-c9ed-41ed-a739-8a7ce71a6805', N'(312)555-0690', 0, 0, NULL, 0, 0, N'adm_use', N'123456', CAST(N'2020-08-06 08:05:19.087' AS DateTime))
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [LanguageID]
GO
ALTER TABLE [dbo].[OrderHistories] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrderHistories] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [ItemPrice]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [PaymentMethod]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [DeliveryCharges]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [FinalAmmount]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductSpecifications] ADD  DEFAULT ((0)) FOR [ProductRecordID]
GO
ALTER TABLE [dbo].[ProductSpecifications] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductSpecifications] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Promoes] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Promoes] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Categories_dbo.Categories_ParentCategoryID] FOREIGN KEY([ParentCategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_dbo.Categories_dbo.Categories_ParentCategoryID]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Categories_dbo.Pictures_PictureID] FOREIGN KEY([PictureID])
REFERENCES [dbo].[Pictures] ([ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_dbo.Categories_dbo.Pictures_PictureID]
GO
ALTER TABLE [dbo].[CategoryRecords]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CategoryRecords_dbo.Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryRecords] CHECK CONSTRAINT [FK_dbo.CategoryRecords_dbo.Categories_CategoryID]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[OrderHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderHistories_dbo.Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHistories] CHECK CONSTRAINT [FK_dbo.OrderHistories_dbo.Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderItems_dbo.Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_dbo.OrderItems_dbo.Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderItems_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_dbo.OrderItems_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Promoes_PromoID] FOREIGN KEY([PromoID])
REFERENCES [dbo].[Promoes] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Promoes_PromoID]
GO
ALTER TABLE [dbo].[ProductPictures]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductPictures_dbo.Pictures_PictureID] FOREIGN KEY([PictureID])
REFERENCES [dbo].[Pictures] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductPictures] CHECK CONSTRAINT [FK_dbo.ProductPictures_dbo.Pictures_PictureID]
GO
ALTER TABLE [dbo].[ProductPictures]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductPictures_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductPictures] CHECK CONSTRAINT [FK_dbo.ProductPictures_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[ProductRecords]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductRecords_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductRecords] CHECK CONSTRAINT [FK_dbo.ProductRecords_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID]
GO
ALTER TABLE [dbo].[ProductSpecifications]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductSpecifications_dbo.ProductRecords_ProductRecordID] FOREIGN KEY([ProductRecordID])
REFERENCES [dbo].[ProductRecords] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSpecifications] CHECK CONSTRAINT [FK_dbo.ProductSpecifications_dbo.ProductRecords_ProductRecordID]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUsers_dbo.Pictures_PictureID] FOREIGN KEY([PictureID])
REFERENCES [dbo].[Pictures] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.AspNetUsers_dbo.Pictures_PictureID]
GO
