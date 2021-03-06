USE [af_asp_311_14]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[TextComment] [nvarchar](150) NOT NULL,
	[NewsId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newses]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[TitleNews] [nvarchar](500) NOT NULL,
	[Subtitle] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Newses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Src] [nvarchar](max) NULL,
	[Alt] [nvarchar](max) NULL,
	[NewsId] [int] NOT NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Texts]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Texts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[TextNews] [nvarchar](max) NOT NULL,
	[NewsId] [int] NOT NULL,
 CONSTRAINT [PK_Texts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FristName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 30.8.2020. 10:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserCaseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200815203911_add_initial', N'5.0.0-preview.7.20365.15')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (2, CAST(N'2020-02-28T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-25T01:01:50.0626039' AS DateTime2), 0, NULL, 1, N'Politika')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (3, CAST(N'2020-02-28T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Ekonomija')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (4, CAST(N'2020-02-28T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Kultura')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (5, CAST(N'2020-02-28T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Sport')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (6, CAST(N'2020-08-23T18:45:27.3105080' AS DateTime2), NULL, 0, NULL, 1, N'Korona')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (7, CAST(N'2020-08-23T18:47:33.2392713' AS DateTime2), CAST(N'2020-08-23T18:53:21.3806038' AS DateTime2), 1, CAST(N'2020-08-23T18:53:21.3457896' AS DateTime2), 0, N'Nesto')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (8, CAST(N'2020-08-23T21:29:06.9616274' AS DateTime2), NULL, 0, NULL, 1, N'Drustvo')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (9, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Svet')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (10, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'IT')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (11, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-26T03:53:12.8270650' AS DateTime2), 0, NULL, 1, N'Zivot')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (12, CAST(N'2020-08-25T13:39:46.4166417' AS DateTime2), CAST(N'2020-08-25T13:59:17.4487015' AS DateTime2), 0, NULL, 1, N'Zdravlje')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (1, CAST(N'2020-08-24T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-25T01:36:01.8385951' AS DateTime2), 1, CAST(N'2020-08-25T01:36:01.7944574' AS DateTime2), 0, N'Nesto', 28, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (2, CAST(N'2020-08-24T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-25T15:49:20.2436665' AS DateTime2), 0, NULL, 1, N'Dosadno je i smaranje!', 28, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (3, CAST(N'2020-08-25T11:28:51.0394990' AS DateTime2), CAST(N'2020-08-25T13:33:44.4635795' AS DateTime2), 0, NULL, 1, N'Stvarno sad!', 30, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (4, CAST(N'2020-08-25T15:48:44.4230801' AS DateTime2), NULL, 0, NULL, 1, N'Dosadno je i smaranje!', 28, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (5, CAST(N'2020-08-26T02:10:37.6877873' AS DateTime2), NULL, 0, NULL, 1, N'Boze me sacuvaj!', 3, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (7, CAST(N'2020-08-26T02:19:55.2194166' AS DateTime2), NULL, 0, NULL, 1, N'Opet protesti', 27, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (8, CAST(N'2020-08-26T02:20:39.1963227' AS DateTime2), NULL, 0, NULL, 1, N'Lako je Soniju', 26, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (9, CAST(N'2020-08-26T02:21:28.6475876' AS DateTime2), NULL, 0, NULL, 1, N'Jos ce i pare da im daju a oparili se ovo leto!', 12, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (10, CAST(N'2020-08-26T02:21:55.5437818' AS DateTime2), NULL, 0, NULL, 1, N'Citajmo citajmo!', 9, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (11, CAST(N'2020-08-26T02:22:38.3691291' AS DateTime2), NULL, 0, NULL, 1, N'Aman vise ta Amerika!', 7, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (12, CAST(N'2020-08-26T02:23:41.6415565' AS DateTime2), CAST(N'2020-08-26T10:24:21.5682827' AS DateTime2), 0, NULL, 1, N'Cuvajmo prirodu bre!', 28, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (13, CAST(N'2020-08-26T02:25:58.0839400' AS DateTime2), NULL, 0, NULL, 1, N'Samo si nam ti jos trebao!', 23, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (14, CAST(N'2020-08-26T02:26:21.6996206' AS DateTime2), NULL, 0, NULL, 1, N'Jadan narod!', 24, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (15, CAST(N'2020-08-26T02:26:43.7685930' AS DateTime2), NULL, 0, NULL, 1, N'Slazem se!', 20, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (16, CAST(N'2020-08-26T02:27:20.3489470' AS DateTime2), NULL, 0, NULL, 1, N'Sad cemo te gledamo Milo!', 19, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (17, CAST(N'2020-08-26T02:27:45.2980914' AS DateTime2), NULL, 0, NULL, 1, N'Strasno!', 22, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (18, CAST(N'2020-08-26T02:28:21.9043201' AS DateTime2), NULL, 0, NULL, 1, N'Idemo!', 21, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (19, CAST(N'2020-08-26T02:28:47.6221829' AS DateTime2), NULL, 0, NULL, 1, N'Jos jedna gondola!', 18, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (20, CAST(N'2020-08-26T02:29:11.7446180' AS DateTime2), NULL, 0, NULL, 1, N'Jos cemo da vidimo!', 1, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (21, CAST(N'2020-08-26T02:29:24.5783931' AS DateTime2), NULL, 0, NULL, 1, N'Jadni djaci!', 1, 4)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextComment], [NewsId], [UserId]) VALUES (22, CAST(N'2020-08-26T02:29:39.6168699' AS DateTime2), NULL, 0, NULL, 1, N'Ma jadni roditelji!', 1, 4)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Newses] ON 

INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (1, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Đaci u Srbiji od 1. septembra: Komplikovano i neizvesno', N'Najlošiji model rada škole tokom pandemije je rad na daljinu – bez direktnog kontakta. Ovo je ocena oko koje su složni svi akteri obrazovnog sistema u Srbiji – učenici, nastavnici, direktori škola, roditelji kao i sam ministar prosvete Mladen Šarčević.', 7)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (2, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Mihajlović: Aleksiću, pokažite program umesto što pretite nasiljem', N'Ministarka građevinarstva, saobraćaja i infrastrukture Zorana Mihajlović izjavila je danas da deo opozicije, okupljen oko Vuka Jeremića i Dragana Đilasa, ne odustaje od toga da ih izbori ne zanimaju i da žele da na vlast dođu nasiljem, saopšteno je iz njenog kabineta.', 2)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (3, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Mali: Država će pomoći Er Srbiji da izmiri dugove', N'Er Srbija je kompanija od nacionalog interesa i država će joj pomoći da izmiri dugove, izjavio je u intervjuu za “Politiku“ ministar finansija Siniša Mali.', 3)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (4, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'ULUS završava projekat Bijenale mladih – Javne pripreme', N'U galerijskim prostorima Udruženja likovnih umetnika Srbije danas se završava projekat Bijenale mladih – Javne pripreme, koji traje od 22. jula. ', 4)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (6, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Mladost pobedila Rad, remi Voždovca', N'Fudbaleri Mladosti iz Lučana pobedili su večeras na svom terenu Rad sa 1:0, u utakmici petog kola Super lige Srbije.', 5)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (7, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Bela kuća večeras najavljuje proboj u lečenju korona virusa', N'Bela kuća je saopštila da će predsednik Donald Tramp večeras saopštiti „veliki proboj u lečenju korona virusa“, od kojeg je u SAD umrlo više od 176.000, a zaraženo skoro 5,7 miliona ljudi, preneo je Glas Amerike (Voice of America – VoA).', 6)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (8, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Bugarski ministar omladine i sporta zaražen korona virusom', N'Bugarski ministar omladine i sporta Krasen Kralev zaražen je korona virusom, saopštilo je večeras njegovo ministarstvo.', 6)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (9, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Kako naći pravu knjigu za sebe', N'Najpoznatiji roman Davida Nela, jednog od najčitanijih savremenih katalonskih pisaca za decu i odrasle, Zipolijevo pleme (La Tribu des Zippoli, 2017), prva je knjiga ovog autora prevedena na srpski jezik.', 4)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (10, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Lukašenko viđen kako u rezidenciju ulazi sa puškom i u panciru', N'Predsednik Belorusije Aleksandar Lukašenko viđen je večeras kako ulazi u svoju rezidenciju u Minsku, koja se nalazi blizu mesta gde se održavaju protesti protiv njega, sa puškom Kalašnjikov i u pancir prsluku.', 2)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (11, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Eksplodirale plinske boce u centru Kladova, nema povređenih', N'U ćevabdžinici koja se nalazi u centru Kladova večeras su eksplodirale tri plinske boce, javljaju Večernje novosti.', 8)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (12, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Hotelijeri zadovoljni dobijenim subvencijama od države', N'Uz uslov da do kraja godine ne otpuste nijednog radnika vlasnici hotela u gradovima u Srbiji dobiće pomoć države od 350 evra po ležaju i 150 evra po sobi.', 3)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (13, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Selaković (PKS): Izvoz šljive na Bliski istok je šansa za srpske proizvođače', N'Šef Кancelarije Privredne komore Srbije (PKS) u Dubaiju Marko Selaković predstavio je danas potencijale i perspektive izvoza srpske šljive na tržište Ujedinjenih Arapskih Emirata i ocenio da je potencijal srpskog tržišta šljive izuzetno veliki i da može biti konkurenan sa tom voćnom sortom na zahtevnom tržištu Bliskog istoka.', 3)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (15, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Vojvodina pobedila Napredak', N'Fudbaleri Vojvodine pobedili su danas u Kruševcu domaći Napredak sa 1:0, u utakmici petog kola Super lige Srbije.', 5)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (17, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Ne davimo Beograd: Nepotreban nacionalni stadion treba da nosi ime Aleksandra Vučića', N'Inicijativa Ne davimo Beograd ocenila je danas da najava izgradnje nacionalnog stadiona najbolje oslikava karakter rasipničke vlasti, i predložila da zbog „besmislenog“ ulaganja taj sportski objekat bude nazvan po predsedniku Srbije Aleksandru Vučiću', 8)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (18, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Bojana Božanić: Testiranje gondole narednih 45 dana', N'Nepokolebljiva istrajnost je zaslužna za završetak izgradnje gondole, jedinstvene atrakcije koja će se koristiti i leti i zimi. Izgradnja je trajala dugo i bila turbulentna, ali i svi veliki projekti su morali da se rade tako dugo i na kraju su pokazali izuzetan uspeh i mi to očekujemo od našeg projekta – ističe Bojana Božanić, direktorka JP Gold gondola Zlatibor, koje upravlja zlatiborskom žičarom-gondolom.', 8)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (19, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'SNS odbacio optužbe Dveri da je spremio lažne birače da pomogne Đukanoviću', N'Gradski odbor Srpske napredne stranke (SNS) u Čačku odbacio je danas optužbe Dveri da je SNS u Moravičkom okrugu (Čačak, Gornji Milanovac, Lučani, Ivanjica) „spremila 300 lažnih birača“ za parlamentarne izbore u Crnoj Gori koji su zakazani u nedelju 30. avgusta.', 2)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (20, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Kičić: Malo ljudi pravi filmove i govori o porodici', N'Veliko mi je zadovoljstvo što smo imali priliku da budemo na Sarajevo film festivalu, nažalost, zbog okolnosti, ne uživo nego onlajn. Fenomenalno je što se pet serija iz regiona biraju i što smo mi ušli u taj program – kaže Gordan Kičić za Danas povodom pretpremijere serije „Mama i tata se igraju rata“ na 26. SFF-u.', 4)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (21, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Boston u drugom kolu plej-ofa, 4:0 protiv Filadelfije', N'Košarkaši Bostona plasirali su se večeras u drugo kolo plej-ofa Istočne konferencije u NBA ligi, pošto su u četvrtoj utakmici pobedili Filadelfiju sa 110:106 i slavili u seriji sa 4:0.', 5)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (22, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'AFP: U svetu od korona virusa umrlo 805.470 ljudi', N'U svetu je od korona virusa umrlo 805.470 osoba, a zaraženo je 23 miliono i 263.670 ljudi, prenela je danas agencija Frans pres novi bilans prikupljen do 11.00 (GMT).', 6)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (23, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Amfilohije: Prvi put ću izaći na izbore', N'Mitropolit crnogorsko-primorski Amfilohije pozvao je danas sve građane da izađu na izbore i da 30. avgusta, kako je naveo, glasaju za svetinje, protiv bezakonika i lažnih zakona.', 2)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (24, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Sloga: Minimalac mora biti drastično uvećan, inače sledi slom', N'Udruženi sindikati Srbije „Sloga“ saopštili su danas da minimalna cena rada u Srbiji za 2021. godinu mora biti drastično uvećana, kako se ne bi desio ekonomski i demografski slom usled sve većeg siromaštva i masovnog odlaska srpske radne snage u zemlje EU.', 3)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (25, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Preminuo glumac Zoran Miljković u 73. godini žoivota', N'Glumac Zoran Miljković, najpoznatiji po ulozi Ilije iz „Otpisanih“, preminuo je u 73. godini života, prenose domaći mediji.', 4)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (26, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Soniju porastao profit od prodaje video igrica usled karantina', N'Japanska kompanija Soni saopštila je danas je njen profit od aprila do juna porastao za 53 odsto usled porasta potražnje video igrica i druge onlajn ponude dok su ljudi bili u karantinu tokom pandemije korona virusa.', 10)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (27, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Desetine hiljada građana Belorusije protestuje u Minsku protiv vlasti', N'Desetine hiljada Belorusa izašlo je danas na ulice Minska da osudi ponovni izbor predsednika Aleksandra Lukašenka koji se poslednje dve nedelje suočava sa ogromnim protestnim pokretom, prenose novinari agencija Frans pres.', 9)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (28, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Za Evropljane klimatske promene veći problem od pandemije', N'Švedska energetska kompanija Vattenfall objavila je najnovije rezultate svog istraživanja u kom su ispitanici iz sedam evropskih država odgovarali na pitanje šta vide kao najveću globalnu pretnju.', 11)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (29, CAST(N'2020-08-25T11:57:23.3228668' AS DateTime2), CAST(N'2020-08-25T11:57:23.4007402' AS DateTime2), 1, CAST(N'2020-08-25T01:06:53.6009700' AS DateTime2), 0, N'Nesto1', N'Nesto', 3)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (30, CAST(N'2020-08-25T10:37:27.4171367' AS DateTime2), NULL, 0, NULL, 1, N'Nesto', N'Nesto', 3)
INSERT [dbo].[Newses] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TitleNews], [Subtitle], [CategoryId]) VALUES (31, CAST(N'2020-08-25T13:51:40.1115719' AS DateTime2), CAST(N'2020-08-25T14:05:21.8594653' AS DateTime2), 0, NULL, 1, N'Novi talas sledi u novembru', NULL, 6)
SET IDENTITY_INSERT [dbo].[Newses] OFF
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (7, CAST(N'2020-08-25T23:43:42.9395025' AS DateTime2), CAST(N'2020-08-25T23:58:38.3453437' AS DateTime2), 1, CAST(N'2020-08-25T23:58:38.3298305' AS DateTime2), 0, N'21f3aa30-d4f6-4d41-b265-dcaf5166cb54.jpg', NULL, 23)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (8, CAST(N'2020-08-25T23:46:41.4186599' AS DateTime2), CAST(N'2020-08-25T23:59:43.3976651' AS DateTime2), 1, CAST(N'2020-08-25T23:59:43.3974869' AS DateTime2), 0, N'e389e0af-9d8b-48f1-a72a-7c9f61063a55.jpg', NULL, 15)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (9, CAST(N'2020-08-25T23:49:44.4550372' AS DateTime2), NULL, 0, NULL, 1, N'40720f40-2d29-4330-82c7-ee00f88f4135.jpg', N'40720f40-2d29-4330-82c7-ee00f88f4135.jpg', 31)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (10, CAST(N'2020-08-26T01:39:51.7583506' AS DateTime2), NULL, 0, NULL, 1, N'2852691a-f6d6-4f4c-aab4-24d32e827377.jpg', N'2852691a-f6d6-4f4c-aab4-24d32e827377.jpg', 3)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (11, CAST(N'2020-08-26T01:40:36.8382184' AS DateTime2), NULL, 0, NULL, 1, N'a271f70d-a7c8-451c-b1d8-22583c71a400.jpg', N'a271f70d-a7c8-451c-b1d8-22583c71a400.jpg', 4)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (12, CAST(N'2020-08-26T01:41:49.2779801' AS DateTime2), NULL, 0, NULL, 1, N'd578c87d-4ce5-415b-9963-37789b5e4b09.jpg', N'd578c87d-4ce5-415b-9963-37789b5e4b09.jpg', 6)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (13, CAST(N'2020-08-26T01:42:45.2917904' AS DateTime2), NULL, 0, NULL, 1, N'49457835-e515-4e60-9226-a940718a77ac.jpg', N'49457835-e515-4e60-9226-a940718a77ac.jpg', 1)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (14, CAST(N'2020-08-26T01:43:28.9390652' AS DateTime2), NULL, 0, NULL, 1, N'e6046151-5f83-47ae-9417-c2dea51eb4f8.jpg', N'e6046151-5f83-47ae-9417-c2dea51eb4f8.jpg', 8)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (15, CAST(N'2020-08-26T01:46:20.1407061' AS DateTime2), NULL, 0, NULL, 1, N'd59309f2-f6ea-4392-a81a-95a4fcfb5be1.jpg', N'd59309f2-f6ea-4392-a81a-95a4fcfb5be1.jpg', 7)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (16, CAST(N'2020-08-26T01:47:21.4840434' AS DateTime2), NULL, 0, NULL, 1, N'9c8336e4-b3bf-49cf-906d-609c0216acae.jpg', N'9c8336e4-b3bf-49cf-906d-609c0216acae.jpg', 9)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (17, CAST(N'2020-08-26T01:48:00.4921889' AS DateTime2), NULL, 0, NULL, 1, N'74b70ecf-a667-4441-b66b-cee5e6f0a7d0.jpg', N'74b70ecf-a667-4441-b66b-cee5e6f0a7d0.jpg', 10)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (18, CAST(N'2020-08-26T01:48:41.6853205' AS DateTime2), NULL, 0, NULL, 1, N'6de8f23b-da1b-4ee1-8a5e-3a937af48a05.jpg', N'6de8f23b-da1b-4ee1-8a5e-3a937af48a05.jpg', 11)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (19, CAST(N'2020-08-26T01:49:17.8702221' AS DateTime2), NULL, 0, NULL, 1, N'b272269d-3191-41db-9e0b-182acb7a77a2.jpg', N'b272269d-3191-41db-9e0b-182acb7a77a2.jpg', 12)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (20, CAST(N'2020-08-26T01:49:52.6068406' AS DateTime2), NULL, 0, NULL, 1, N'e6cfc55a-7add-417d-823f-033c59351520.jpg', N'e6cfc55a-7add-417d-823f-033c59351520.jpg', 13)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (21, CAST(N'2020-08-26T01:52:34.6273514' AS DateTime2), NULL, 0, NULL, 1, N'14b3e744-877d-40d2-af64-9fe7e57b9e47.jpg', N'14b3e744-877d-40d2-af64-9fe7e57b9e47.jpg', 18)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (22, CAST(N'2020-08-26T01:53:10.9180086' AS DateTime2), NULL, 0, NULL, 1, N'5d611b82-ddf9-4cd4-b186-016d2cbcd174.jpg', N'5d611b82-ddf9-4cd4-b186-016d2cbcd174.jpg', 19)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (23, CAST(N'2020-08-26T01:53:59.1188592' AS DateTime2), NULL, 0, NULL, 1, N'dc203e08-b608-4024-8148-c15127a698c7.jpg', N'dc203e08-b608-4024-8148-c15127a698c7.jpg', 20)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (24, CAST(N'2020-08-26T01:54:54.9591427' AS DateTime2), NULL, 0, NULL, 1, N'c56c17a8-6d18-443a-b064-8f54e9467130.jpg', N'c56c17a8-6d18-443a-b064-8f54e9467130.jpg', 21)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (25, CAST(N'2020-08-26T01:55:37.4373856' AS DateTime2), NULL, 0, NULL, 1, N'add94a33-68a6-4790-a26c-73b4f2f7917d.jpg', N'add94a33-68a6-4790-a26c-73b4f2f7917d.jpg', 22)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (26, CAST(N'2020-08-26T01:56:13.5680396' AS DateTime2), NULL, 0, NULL, 1, N'4740410c-da3e-4ae0-8820-2a459006cd06.jpg', N'4740410c-da3e-4ae0-8820-2a459006cd06.jpg', 25)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (27, CAST(N'2020-08-26T01:59:56.7989212' AS DateTime2), NULL, 0, NULL, 1, N'785db5a9-6aae-419c-96eb-20fd28e23fc1.jpg', N'785db5a9-6aae-419c-96eb-20fd28e23fc1.jpg', 26)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (28, CAST(N'2020-08-26T02:00:32.0959263' AS DateTime2), NULL, 0, NULL, 1, N'6a92df0d-8e8d-4432-ba69-07bf475f95e6.jpg', N'6a92df0d-8e8d-4432-ba69-07bf475f95e6.jpg', 27)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (29, CAST(N'2020-08-26T02:01:09.0637525' AS DateTime2), NULL, 0, NULL, 1, N'6aa58402-2fb6-47a0-ac89-568d91756845.jpg', N'6aa58402-2fb6-47a0-ac89-568d91756845.jpg', 28)
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Src], [Alt], [NewsId]) VALUES (30, CAST(N'2020-08-26T02:01:10.7585810' AS DateTime2), NULL, 0, NULL, 1, N'4c9b159b-55d9-4207-83ec-4cebae2f59d8.jpg', N'4c9b159b-55d9-4207-83ec-4cebae2f59d8.jpg', 28)
SET IDENTITY_INSERT [dbo].[Pictures] OFF
SET IDENTITY_INSERT [dbo].[Texts] ON 

INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (1, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Ministar je, predstavljajući 11. avgusta plan rada u novoj školskoj godini koja počinje 1. septembra, ocenio da će dati sve od sebe da učenici, bar delimično, odlaze u školu. Prema trenutnom planu rada Ministarstva prosvete tako će i biti sve dok, kako kaže Šarčević, epidemiološka situacija dozvoljava. Ipak, i sam ministar svestan je, kaže, da je onlajn (online) učenje, u slučaju eventualnog novog porasta broja obolelih – realna opcija.

Ostalo je manje od deset dana do početka nove školske godine. Ministarstvo prosvete, u saradnji sa Kriznim štabom za suzbijanje pandemije, izradilo je plan rada koji će, u zavisnosti od epidemiološke situacije, biti sklon promenama. Ukratko – ideja je da samo niži razredi (od prvog do četvrtog), podeljeni u manje grupe, redovno odlaze u školu dok će stariji i srednjoškolci imati kombinovanu nastavu – onlajn i časove u školama.', 1)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (2, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'I škola i zdravlje
Kako se dan povratka učenika u klupe približava, tako je sve veća i polemika o najboljem modelu nastave u uslovima pandemije. Uprkos kritikama na račun učenja na daljinu, prosvetni radnici i roditelji podvlače da je zdravlje podjednako važno koliko i povratak dece u školu.

Ministar prosvete, u izjavi za portal Nova.rs 19. avgusta, rekao je da se “svakodnevno prati broj zaraženih, te da će se i organizacija u školama tome prilagođavati bez obzira na sadašnji plan o povratku u škole.

“Danas je 19. avgust, ovde uvek kada prođe 10-15 dana mogu stvari da se promene. Zato sam ja rekao da imamo više modela. U dogovoru smo i sa Kriznim štabom”, navodi ministar. On objašnjava da postoji uvek mogućnost da se pređe na onlajn model, ako se situacija promeni i da Srbija “ima sve kompletno i za onlajn varijantu“.

Od trenutka kada je 15. marta u Srbiji uvedeno vanredno stanje u cilju sprečavanja širenja zaraze korona virusom, đaci su nastavu pohađali isključivo od kuće. Na taj način su i završili školsku godinu u junu mesecu. Uoči nove školske godine, direktori škola, nastavnici, roditelji, ali i sami đaci govore o brojnim slabostima koje su se u radu tokom proleća pokazale u onlajn nastavi.', 1)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (3, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Mihajlović, koja je i potpredsednica Vlade Srbije i članica Predsedništva Srpske napredne stranke je rekla da iza svake kritike dela opozicije „ne stoji predlog rešenja, već samo pozivi na nasilje“ i pozvala potpredsednika Narodne stranke Miroslava Aleksića da „pokaže program umesto što preti nasiljem“.

„Bilo da upadate u institucije, prizivate nerede ili pretite revolucijom i nasilnom smenom vlasti, građani vas zbog toga i ne žele, jer nemate šta da im ponudite, već vam je jedini cilj dolazak na vlast, svim sredstvima“, kazala je Mihajlović.

Ona je pitala opozicione lidere „gde im je program“, i šta bi uradili za Srbiju i njene građane, „u infrastrukturi, privredi, prosveti, zdravstvu“?

„Zašto ste protiv izgradnje novih auto-puteva i želite da oterate investitore koji ulažu u Srbiju? Кako biste danas rešavali problem Кosova, kad znamo da je Vuk Jeremić dok je bio na vlasti uradio sve da ga udalji od Srbije? Zato umesto programa, građanima Srbije nudite nasilje, a za takvu politiku građani nikad neće glasati“, kazala je Mihajlović.

Ona je reagovala na izjavu potpredsednika Narodne stranke Aleksića da ta stranka neće učestvovati ni na narednim izborima „ukoliko politički ambijent bude onakav kakav je danas“ kao i da nije pristalica ali da ne isključuje mogućnost revolucije „ako režim nastavi da se ponaša u diktatorskom maniru“.', 2)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (4, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Mali je rekao da su sve aviokompanije u svetu u veoma teškoj situaciji i podsetio da je Evropska unija donela nova pravila koja se odnose na državnu pomoć, a koja su značajno relaksirana u odnosu na postojeća i omogućavaju da država pomogne u pogledu likvidnosti privrede, kao i preduzećima kod kojih je teškoće u poslovanju izazvala pandemija.

„U toku su pregovori sa poveriocima čije detalje ne mogu da iznosim, ali ono što mogu da kažem je da ćemo sigurno pomoći Er Srbiji.   Zajedno sa partnerima iz Etihada radimo na rešavanju problema“, rekao je Mali odgovarajući na pitanje ko će platiti kredit Er Srbije od 56,5 miliona dolara koji stiže na naplatu u septembru, nakon što je kompanija obavestila kreditora da ne može da izmiri dug.

Ministar finansija je ukazao i da jednokratno povećanje deficita i javnog duga tokom ove godine ne dovodi u pitanje održivost javnih finansija, a doprinosi manjem padu BDP i ubrzanom ekonomskom oporavku. .

„Ministarstvo finansija za sada ostaje pri fiskalnom okviru za 2020. koji je utvrđen pri izradi rebalansa budžeta. Deficit opšte države projektuje se na nivou od 7,2 odsto BDP, odnosno 394,8 milijardi dinara, a za budžet republike na nivou od 6,9 odsto BDP, odnosno 381 milijadu dinara. Osim toga, javni dug neće preći granicu od 60 odsto BDP“, istakao je Mali.

Ministar finansija je rekao da je veliki paket ekonomske pomoći privredi finansiran i izdavanjem državnih obveznica u iznosu od dve milijarde evra, koje su listirane na Londonskoj berzi, a dospevaju na naplatu 2027.  Dodao je da je bilo veliko interesovanje investitora za te obveznice, a da je dobijena kuponska stopa od 3,125 odsto, što je bio dokaz poverenja investitora u našu zemlju.

Mali je upozorio da i dalje postoji problem sa neizdavanjem fiskalnih računa i naveo da je Poreska uprava u poslednjih 10 dana izvršila proveru fiskalnih kasa u više od 500 pekara u Srbiji i u više od 60 odsto je bilo neregularnosti koje se odnose na neevidentiranje prometa i neprijavljene radnike, a u Beogradu je taj procenat veći od 70 odsto.

Najavio je da će, u cilju suzbijanja sive ekonomije u narednim mesecima ponovo biti pokrenuta nagradna igra koja će podrazumevati sakupljanje fiskalnih računa, s tim što će ovog puta ceo proces biti sprovođen elektronskim putem.

Na pitanje da li će se izaći u susret zahtevima sindikata o povećanju minimalne cene rada, Mali je podsetio da je proše godine ona povećana čak 3.000 dinara, što se nije dešavalo godinama unazad.

Ukazao je da je ove godine situacija specifična zbog pandemije i da se mora biti oprezan i pametan prilikom donošenja odluke o tome, zajedno sa predstavnicima sindikata i poslodavaca.

Odgovarajujći na pitanje da li će krajem godine biti povećanja plata u javnom sketoru, Mali je rekao da za sada može da garantuje da one neće biti smanjivanja, baš kao i penzije.', 3)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (5, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'U Umetničkom paviljonu „Cvijeta Zuzorić“ i Galeriji ULUS su sinhrono organizovane brojne aktivnosti sastavljene od radionica za mlade umetnike, predavanja eminentnih stručnjaka iz polja savremene umetnosti, istraživanja kulturne scene i institucionalne infrastrukture, a sve u cilju osnaživanja grupe od čak 80 prijavljenih mladih umetnika da sledeće godine pokrenu sopstvenu manifestaciju – 1. Bijenale mladih umetnika, međunarodni projekat koji će organizovati ULUS.

Prepoznajući značaj Bijenala mladih, izložbe koja se svojevremeno održavala u Rijeci (1960-1991), a potom u Vršcu (1994-2004), a dodatno u kontekstu baštinjenja kolekcije Fonda mladih (1972-1992) koju ULUS do današnjih dana čuva u svojoj arhivi, Umetnički savet Udruženja inicirao je reanimaciju ove tradicije, a mladi umetnici imaće priliku da se više uključe u rad najstarijeg strukovnog udruženja u regionu i istovremeno kreiraju sopstveno polje delovanja koje je u potpunosti samoorganizovano i vidljivo za javnost.

Projekat Bijenale mladih – javne pripreme, volonterski je podržao veliki broj kustosa, kritičara, organizatora kulturnih događaja i umetnika poput Stevana Vukovića, Ksenije Đurović, Jelene Vesić, Nade Grozdanić, Branislava Dimitrijevića, Maje Ćirić, Mirjane Bobe Stojadinović, Maje Lalić, Marijane Cvetković, Dejana Vasića, Divne Vuksanović, Vide Knežević, Isidore Ilić, Aleksandrije Ajduković i mnogih drugih iz tima ULUS-a, a ceo proces se realizuje bez ikakve podrške resornih institucija jer Ministarstvo kulture i informisanja nije podržalo ovaj projekat, dok je konkurs Grada Beograda otkazan.

Kroz veliki broj radionica grupa mladih umetnika osposobiće se da samostalno ukovodi produkcijskim potrebama organizacije budućeg Bijenala mladih, u pogledu savladavanja koji treba da odgovore na organizacione, koncepcijske, finansijske, komunikacione i drugeaspekate razvoja projekta.

Izuzetno veliki odaziv mladih umetnika na poziv koji je ULUS vanistitucionalnim načinom dograđivanja i nedovoljnu infrastrukturnu podršku koja im je na raspolaganju.

Kroz saradnju Umetničkog saveta sa Inicijativom ULUS Mladi, nekolicini mladih umetnika iz Niša i Novog Sada je obezbeđen smeštaj u Beogradu kako bi mogli da učestvuju u ovom projektu.

Ceo projekat se sastoji od 4 segmenta/radionice:

RADIONICA: SISTEM UMETNOSTI / vodi Umetnički savet i gosti iz Međunarodnog udruženja likovnih kritičara (AICA).

Radionica podrazumeva obilaske i/ili prezentacije načina rada tri tipa izložbenih i produkcionih prostora u polju umetnosti: državnih institucija kulture za mlade (DOB, SKC, DKSG, Prodajna galerija Beograd, MSUB), privatnih instititucija i inicijativa u kulturi (U10, Bioskop Blakan, Galerija Novembar, Galerija Štab, Galerija Rima) i institucija i organizacija nezavisne kulturne scene (Magacin/Praksa, Kvaka 22, Muzej Trudbenik, Matrijaršija).

Istraživanje institucija kulture obavljaju učesnici javnih priprema samostalno, podeljeni u grupe od nekoliko umetnika koji u toku radionice predstavljaju svoja istraživanja u formi prezentacija, a potom analiziraju sopstveno mesto u postojećem proizvodnom aparatu kulture.

RADIONICA: KA ORGANIZACIJI BIJENALA  / vode kustosi i ostali istaknuti stručnjaci iz polja savremene umetnosti.

Radionica je struktuirana kao serija predavanja, razgovora i zajedničkog promišljanja mogućnosti organizacije Bijenala mladih u lokalnom kontekstu koristeći iskustva relevantnih stručnjaka iz polja savremene umetnosti, eminentnih kustosa uključenih u organizaciju bijenalnih izložbi, poznavalaca istorijata Udruženja (kontekst rada), kulturnih radnika sa iskustvom u fandrejzingu, promociji i organizaciji velikih kulturnih događaja i mnogih drugih.

U ovoj radionici mladi umetnci dobijaju uvodne smernice za moguću novu organizaciju koje će koristiti u svom narednom samoorganizovanju.

RADIONICA: UMETNIČKI RAD / vode umetnici – predstavnici ULUS-ovih radnih grupa za samostalce i fer prakse. Radionica podrazumeva jednodnevno bavljenje temom rada u umetnosti.

Od ove radionice do kraja projekta, učesnici su podeljeni u grupe: organizaciona struktura, ekonomija, koncept/tema, regionalne saradnje, komunikacija, krizna grupa (razmatra strategije za organizaciju Bijenala u slučaju pandemije).

RADIONICA: ORGANIZACIJA BIJENALA MLADIH / vodi Umetnički savet i članovi Inicijative ULUS Mladih, uz prisustvo raznih gostiju. Završna radionica u sklopu projekta Bijenale mladih – Javne pripreme biće sastavljena od analize stanja i mogućnosti i iznalaženja konkretnih koraka organizacije buduće izložbe.

U slučaju da pandemijski uslovi dozvole, u Galeriji ULUS i Umetničkom paviljonu “Cvijeta Zuzorić” završnog dana projekta, 23. avgusta biće održana prezentacija projekta na kojoj će grupa mladih umetnika, učesnika ovogodišnjeg letnjeg programa, javnosti predstaviti jedinstvenu organizaciju Bijenala mladih 2021 na kojoj su intezivno radili.

Zbog pandemijske krize svi programi u sklopu ovog projekta su zatvorenog tipa kako bi se kontrolisao broj osoba u prostorima, a učesnici zajednička predavanja i radionice prate online.

Ista se emituju uživo na zvaničnom youtube kanalu Udruženja i dostupna su svima koji žele da isprate program. Tokom perioda rada u fizičkom prostoru, učesnici su podeljeni u grupe koje broje do osam učesnika, a funkcionišu uz pridržavanje svih propisanih pandemijskih procedura (nošenje maski, držanje fizičke distance i redovna dezinfekcija).', 4)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (6, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Jedini gol postigao je Aleksandar Ješić u 80. minutu.

U 84. minutu direktan crveni karton dobio je igrač domaćih Mladen Krajišnik.

Mladost ima četiri pobede i zauzima peto mesto na tabeli sa 12 bodova, koliko imaju trećeplasirani Partizan i četvrtoplasirani Spartak.

Poslednjeplasirani Rad je pretrpeo peti poraz i jedina je ekipa bez bodova.

Fudbaleri Voždovca i Zlatibora odigrali su u Beogradu nerešeno 1:1.

Zlatibor je poveo golom Milana Djokića u 69. minutu iz jedanaesterca, a domaći su izjednačili pogotkom Nikole Vujnovića u 78. minutu.

Beogradska ekipa je 11. na tabeli sa sedam bodova, a Zlatibor je pretposlednji sa jednim bodom.

Mačva i Novi Pazar odigrali su u Šapcu 1:1.

Domaći su poveli u 11. minutu kada je strelac bio Miloš Zukanović, a izjednačio je Ševkija Resić u 62. minutu. Novi Pazar je utakmicu završio sa desetoricom, pošto je drugi žuti karton dobio Abdulaje Sise.

Novi Pazar i Mačva imaju po četiri boda, na 13. i 14. mestu na tabeli.', 6)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (7, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Portparolka Bele kuće Kejli Mekeneni je najavila da će ministar zdravlja Aleks Azar i šef Uprave za hranu i lekove Stiven Han prisustvovati Trampovom saopštenju, dan pred početak republikanske nacionalne konvencije, na kojoj će Tramp biti nominovan za drugi predsednički mandat.

Brojni američki zdravstveni stručnjaci kažu da vakcina za korona virus neće biti dostupna pre kraja godine ili prvih meseci 2021, ili tek pošto se testovi efikasnosti vakcine, koji sada počinju da se rade u nekoliko zemalja uključujući i SAD, pokažu uspešnim.

Tramp, koji je svestan da ga njegov protivkandidat na izborima, Džozef Bajden i opozicione demokrate optužuju da je vodio pogrešnu politiku u reagovanju na pandemiju koronavirusa u SAD, često ističe da je lek blizu, a govorio je i da će virus „jednostavno nestati.“

Priznao je da bi proboj u medicini pre izbornog dana povećao njegove šanse da bude ponovo izabran u novembru, dodaje VoA.', 7)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (8, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'„Kralev je dobio pozitivan rezultat na testu korona virusa koji je uradio dok je bio na godišnjem odmoru. Nije imao kontakte sa saradnicima i ima blage simptome“, navodi se u saopštenju i dodaje da je ministar u karantinu.

On je prvi član bugarske vlade zaražen korona virusom.

U Bugarskoj, zemlji sa oko sedam miliona stanovnika, zaraženo je 15.227 ljudi od kojih je 545 umrlo.', 8)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (9, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Knjigu je početkom godine objavila IK Odiseja, u prevodu Jelene Petanović i sa ilustracijama Biljane Mihajlović. Zipolijevo pleme roman je o Giljemu, dečaku koji raste u porodici ljubitelja knjiga a ne voli da čita.

Još mu teže padaju obavezni odlasci u školsku biblioteku gde svake nedelje mora da uzme knjigu za koju unapred zna da će mu biti dosadna.

Ipak, Giljem će jednog dana sasvim slučajno nabasati na roman Zipolijevo pleme i šokiraće se kad shvati da se pripovedač iz knjige obraća baš njemu, kao i da svako ko zaviri u knjigu u njoj zatiče priču koja se transformiše prema čitaočevim interesovanjima.

David Nelo ovim uzbudljivim, avanturističkim romanom o čitanju poručuje da čitalac čuči u svakom od nas – potrebno je samo da pronađemo pravu knjigu za sebe.

David Nelo je katalonski pisac, prevodilac i muzičar.

Poznat je po romanima za decu i mlade koji su prevedeni na više od deset svetskih jezika.

Za svoju prvu knjigu za decu Albert i grickači smeća dobio je nagradu Vaixell de Vapor 1994. Dok je pisao ovaj roman nije imao ambicije da postane pisac, sebe je tada video kao muzičara, ali mu je izdavač nakon osvojene nagrade tražio da napiše roman za tinejdžere.

Nelo je to učinio i 1996. objavljen je njegov drugi roman Katedrala.

Od tada je napisao više od četrdeset knjiga, većinom za decu i mlade, i dobio brojne književne nagrade. Njegova dela su prevedena na više od deset svetskih jezika.', 9)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (10, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'
Dnevni list Danas
Naslovna
NOVO
Politika
Dijalog
Društvo
Ekonomija
Svet
Sport
Kultura
Život
Auto
IT
Ljudi
Beograd
BBC
Dodatak NedeljaSpecijalni dodaci
Početna » Svet » Lukašenko viđen kako u rezidenciju ulazi sa puškom i u panciru

Svet
Lukašenko viđen kako u rezidenciju ulazi sa puškom i u panciru
Predsednik Belorusije Aleksandar Lukašenko viđen je večeras kako ulazi u svoju rezidenciju u Minsku, koja se nalazi blizu mesta gde se održavaju protesti protiv njega, sa puškom Kalašnjikov i u pancir prsluku.

0Piše: Beta23. avgusta 2020. 20.19 Izmenjeno: 21.03
  Istinomer  
Lukašenko viđen kako u rezidenciju ulazi sa puškom i u panciru 1
Foto: beta/AP

Predsedništvo Belorusije objavilo je na društvenoj mreži Telegram video snimak na kojem se vidi Lukašenko (65) kako izlazi iz helikoptera koji je sleteo u dvorište rezidencije.

Predsednička rezidencija se nalazi oko dva kilometra od mesta okupljanja građana i pristalica opozicije koji i večeras protestuju u Minsku. „Naš predsednik nosi pancir prsluk i u rukama nosi automatsko oružje“, navodi se u poruci uz video snimak.

Na snimku se čini da Lukašenko nosi kalašnjikov bez šaržera.

Nekoliko desetina hiljada ljudi danas se okupilo u Minsku protestujući zbog spornih predsedničkih izbora održanih 9. avgusta na kojima je Lukašenko, već 26 godina na vlasti, osvojio oko 80 odsto glasova.', 10)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (11, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Navodi se da taj objekat u centru grada nedeljom ne radi, a prema prvim informacijama nije bilo povređenih.

Kurir javlja da su stanari iz okolnih zgrada istrčali iz svojih domova napolje, a da je nekoliko objekata evakuisano.

Trenutno vatrogasci gase vatru, a veći deo Kladova je bez struje.', 11)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (12, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Odluka je javnosti saopštena juče nakon niza sastanaka koje su predstavnici države imali sa hotelijerima u poslednje dve nedelje. Ministar finansija Siniša Mali najavio je da će u narednih 10 dana biti objavljen i javni poziv za sve koji žele da se prijave za pomoć, koja bi mogla da stigne krajem septembra ili najkasnije početkom oktobra ove godine. U trenutku kada je popunjenost gradskih hotela tek nešto malo iznad nule, za hotelijere, kako kažu, svaka pomoć je velika.

„Ova pomoć je značajna i pomoći će hotelima da prežive i da pokušaju da se pripreme za narednu sezonu, odnosno za proleće. Ima tu dosta stvari koje treba uraditi, inovacije i investicije, ali ovo će pomoći da preživimo“, ističe predsednik HORES-a Georgi Genov za Danas.

Njegov kolega iz Udruženja i vlasnik nekoliko hotela, od kojih su neki i gradski Tomislav Momirović kaže da je ovo još jedna u nizu pomoći države, posle tri minimalca i dve uplate u visini od 60 odsto od minimalne zarade.

„Ovo je selektivna i direktna podrška ugroženim hotelima, što znači da se isključivo odnosi na one hotele u gradovima koji nikako nisu uspeli da nadomeste velike gubitke zbog nedolaska stranih gostiju. Ovo će pomoći hotelima da opstanu i da sačuvaju zaposlene“, napominje Momirović.

On ističe da je turizam trebalo da bude generator privrednog rasta, ali da to sada nije moguće zbog situacije u kojoj se ovaj sektor našao ne samo u našoj zemlji, već i u celom svetu.

Na pitanje da li su gradski hoteli u poslednja dva meseca napravili neki korak napred i pomakli se sa mrtve tačke, Momirović kaže da i dalje sve stoji.

„Popunjenost je između nula i pet odsto, prosek od 9 odsto popunjenosti imate kada računate i one koji u pojedinim hotelima žive za obično male pare. Kada pričamo o tome kakva je situacija i da li ide dobro ili loše, kada imate pad od 10 odsto onda kažete da je loše. Sada imamo pad veći od 90 odsto, tako da biznis ustvari ne postoji“, naglašava Tomislav Momirović. On podseća da je u Beogradu od 110 do 120 hotela koliko ih ima više od 50 odsto zatvoreno.

Direktor hotela Radison kolekšen u Beogradu Aleksandar Vasilijević rekao je da je „ovo velika pomoć koju će gradski hoteli moći da iskoriste za plaćanje radnika i za promociju“.

„Ova finansijska podrška je dobrodošla jer su hoteli konstantno u minusu, a država je preuzela deo rizika kako se od 1. septembra ne bi zatvorio veliki broj hotela“, rekao je Vasilijević, a prenela Beta.

Kako je dodao, pomoć od 50.000 evra do 200.000 koliko će dobiti hoteli „veliki je vetar u leđa i dobar znak za investitore“.

S druge strane, suvlasnik Industrije mesa „Matijević“, u čijem sastavu posluje nekoliko hotela, Zoran Matijević, rekao je da poslovanje hotela ima „velike padove“ i da će se vlasnici preračunati da li im je isplativije da prihvate pomoć države ili zatvore hotel i otpuste radnike.

Za hotele 1,2 milijarde dinara

Najavljujući juče mere posle sastanka u Privrednoj komori Srbije Siniša Mali je rekao da je u Srbiji trenutno kategorizovano 380 gradskih hotela i da od toga svega 112 radi, dok je u Beogradu od 115 njih, otvoreno trenutno svega 42 hotela. Mali je na Instagramu nešto kasnije objavio i da će država za ovu meru izdvojiti 1,25 milijardi dinara.', 12)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (13, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'„Srbija je među globalnim liderima u proizvodnji šljive, a vodeći regioni su Mačvanski, Кolubarski i Šumadijski okrug. U 2019. godini proizvedeno je 558.930 tona šljive“, naveo je Selaković na onlajn manifestaciji „Dani šljive“ u Blacu, a saopštila PKS.

Dodao je da se 75 odsto šljive u Srbiji, u kojoj dominiraju stare autohtone sorte, koristi za rakiju, a da je sortiment šljive na ovim prostorima znatno drugačiji nego sortiment na drugim područjima koja su orijentisana ka izvozu na Bliski istok.

Кao prednosti izvoza šljive na tržište Bliskog istoka Selaković je istakao ističe bescarinski uvoz, simbolični PDV od pet odsto i mogućnost direktnog kontakta proizvođača sa distributerima koji umnogome olakšava proces trgovine.

Ukazao je da domaći izvoznici moraju da obrate posebnu pažnju na GCC standard koji važi u svim zemljama Zaliva, a za tržište Bliskog istoka Selaković je predložio uzgoj sorti poput „aženke“, koja je tamo vrlo popularna.

Kao preduslove za saradnju sa Bliskim istokom naveo je visok kvalitet proizvoda, dobro pakovanje, preciznost u dogovorima o količini i poštovanje rokova jer je reč o „premijum tržištu“.

„Proizvođači moraju da budu udruženi da imaju što ukrupnjeniji zasad, što ukrupnjeniju proizvodnju ako hoćemo da uspešno plasiramo robu i ozbiljne količine na tržište Bliskog istoka“, dodao je Selaković.

Pozvao je domaće proizvođače da se za podršku obrate Кancelariji PKS u Emiratima, koja je na raspolaganju i za podršku u pokretanju biznisa, povezivanju sa distributerima, pružanju informacija koje se tiču tržišta.

Više od 450 učesnika pratilo je izlaganje, a pored privrednih društava, preduzetnika i proizvođača šljive, učestvovali su i predstavnici PKS Niš, Regionalne razvojne agencije Niš, Poljoprivredne stručne savetodavne službe Prokuplje kao i predstavnici kompanija za proizvodnju i preradu voća.', 13)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (14, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Jedini gol postigao je Stefan Đorđević u 58. minutu.

Napredak je utakmicu završio sa desetoricom, pošto je u 79. minutu drugi žuti karton dobio Uroš Rašković.

Vojvodina sada ima tri pobede i peta je na tabeli sa 11 bodova. Napredak je pretrpeo treći poraz i sa tri boda zauzima 16. mesto.

U sledećem kolu Vojvodina će dočekati Partizan, a Napredak će u Beogradu igrati protiv Rada.', 15)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (15, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'„Inicijativa Ne davimo Beograd se oštro protivi razbacivanju nekoliko stotina miliona evra na pokušaj vladajuće klike da se izgradnjom očigledno nepotrebnog objekta predstavi budućeg diktatora kao mesiju koji gladnom narodu na kraju daje samo hleba i igara“, navodi se u saopštenju.

Dodaje se da je predsednik Srbije „najzaslužniji za katastrofalno stanje u zemlji“ i podseća da glavnom gradu nedostaje kanalizacija, privreda umire, obrazovanje pada na teret roditelja, dok je zdravstvo na izdisaju zbog korona virusa i izostanka ulaganja u ljude, opremu i objekte.

„Da bismo jasno razumeli poteze bande koja vlada Srbijom, potrebno je ovaj projekat od starta nazvati pravim imenom i boriti se svim sredstvima da javni budžetski novac ode tamo gde je najpotrebniji, umesto u ogroman nacionalni stadion“, navodi se u saopštenju i dodaje da je dodatno  besmisleno da se više stotina miliona evra javnog novca odvaja za megalomanski sportski objekat, na kojem će se igrati nekoliko utakmica godišnje, pored postojeća dva velika stadiona (stadion ‘Rajko Mitić’ i stadion ‘JNA’), kao i nekoliko manjih (‘Omladinski stadion’) koji vape za sređivanjem“.', 17)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (16, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Ona je dodala da će se narednih 45 dana probnog rada iskoristiti za detaljna testiranja kompletnog sistema, u skladu sa zakonskim propisima i uz nadzor stručnjaka iz francuske kompanije Pomagalski, koja je, kao najbolji ponuđač na međunarodnom tenderu, isporučila kompletnu opremu.

Do kraja septembra ove godine, najavila je, odrediće se tačan datum kad će prvi putnici moći da se voze najdužom panoramskom žičarom na svetu.

„Kad smo počinjali projekat, pre više od deset godina, naš cilj je bio da donesemo Zlatiboru i čitavom zlatiborskom kraju nešto novo, da odemo korak dalje na evropskoj, pa zašto da ne i na svetskoj turističkoj mapi“, kazala je Božanić.

Ona je istakla da je strateški plan čajetinske opštine da se „u narednih sedam do deset godina na Zlatiboru ostvari deset miliona noćenja i da bude milion turista godišnje“, a potom dodala da je „sigurna u to da će se taj cilj ostvariti, uz postojeće i nove investicije i investitore koji zbog gondole dolaze na Zlatibor“.

„Za izvođače radova i nadzorne organe ima još posla, jer nismo sve radove završili, ali nadam se da ćemo zajednički uspeti da pustimo gondolu u rad za mesec i po. Uređenje i plansko korišćenje prostora duž trase gondole je posao koji nam predstoji u narednom periodu, uz izgradnju upravne zgrade na početnoj stanici i sadržaja komercijalne i turističke ponude gondole i cele destinacije“, najavila je direktorka JP Gold gondola Zlatibor.', 18)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (17, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Gradski odbor Srpske napredne stranke (SNS) u Čačku odbacio je danas optužbe Dveri da je SNS u Moravičkom okrugu (Čačak, Gornji Milanovac, Lučani, Ivanjica) „spremila 300 lažnih birača“ za parlamentarne izbore u Crnoj Gori koji su zakazani u nedelju 30. avgusta.', 19)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (18, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Dveri su juče saopštile da su tu informaciju dobile od „insajderskog izvora iz redova SNS u Čačku“.

„Virus ‘LAŽI – 20’, bolest kojoj nema leka, ali se na sreću ne širi i ne prenosi, ostaje u glavama i mišjim rupama, iz kojih se povremeno, željan pažnje i medijskog prostora, sam i ostavljen, oglasi propali samozvani ‘lider’ opozicije Boško Obradović“, saopštio je SNS.

SNS je naveo da se „persona“ koja je do skora, dok je sedela u Beogradu i igrala u kolu „Prvi do Dragana“, „blatila“ sve što urade Vlada i predsednik Srbije, vraća na stare, njemu dobro poznate staze „lidera u lažima“ i da je „najuren od gazde“, zamenjen novim poltronom, čiji se kafanski snimci i najgore uvrede upućene predsedniku Narodne stranke Vuku Jeremiću i saradnicima slušaju ovih dana.

„Šef dverjanske UDBE, OZNE, DVERILIKSA… prema izmišljenom insajderskom izvoru, obaveštava javnost o nekakvih 300 ‘spartanaca’ iz Moravičkog okruga, koji bi navodno, trebalo da odu na glasanje u Crnu Goru i podrže nekoga na izborima, a sve to protiv srpskog naroda i Srpske pravoslavne crkve (SPC). Ozbiljna bolest i potpuna laž“, poručio je SNS.

SNS ističe da se Srbija neće mešati u izborne procese ni jedne druge države, a da su prethodni izbori u Srbiji pokazali kome su građani dali podršku.

Dveri su juče saopštile da je da je samo u Moravičkom okrugu SNS pripremila 300 svojih članova koji će na dan izbora u Crnoj Gori sa lažnim dokumentima dobijenim od crnogorske tajne službe glasati za Demokratsku partiju socijalista (DPS), koju predvodi predsednik Crne Gore Milo Đukanović.

„Prema insajderskom izvoru iz redova SNS u Čačku, vlast u Srbiji priprema pomoć bratskom crnogorskom režimu Mila Đukanovića na nastupajućim izborima 30. avgusta u formi lažnih birača iz Srbije koji će za tu priliku dobiti crnogorska dokumenta“, navodi se u saopštenju Dveri.

Dveri su navele da je i u drugim okruzima u Srbiji SNS podelila kvote koje moraju da budu ispunjene „kako bi se više hiljada lažnih glasova slilo Milu Đukanovića jer je u zaostatku u odnosu na opoziciju“.

Dveri ocenjuju da je to razlog zašto je Crna Gora otvorila granice kako bi ti „lažni birači“ mogli da uđu na dan izbora.', 19)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (19, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Kičić napominje da je reč o projektu koji je pripremao poslednje tri godine, da je ovu seriju režirao, producirao i da igra u njoj, kao i da je nastala iz filma „Realna priča“.

– Ali imamo nove epizode i linije priče, koje nemaju veze sa filmom – ističe Gordan Kičić. On kaže da je u seriji fokus priče na roditeljima, na Jadranki, koju igra Nina Janković, i na Veljku, koga tumači on, na njihovim odnosima sa prijateljima, sa porodicom i da se ovaj put bavio i poslovnom stranom ovog para.

– U seriji pratimo Jadranku i Veljka kroz jedan nepopularan čin, to jest, razvod i lom porodice, ali kroz jako duhovitu i životnu prizmu, u kojoj će se danas mnogi ljudi prepoznati a to mije bilo važno.

Upitan zašto je u filmu i seriji izabrao motiv porodičnih odnosa, Kičić kaže da je prema njegovom mišljenju „porodica najvažnija tema o kojoj jako malo ljudi pravi filmove i govori“.

– Porodica je nukleus zajednice, a s druge strane ogledalo društva i svih događaja oko nas – ističe Kičić.

On priča da mu je i sam proces rada na seriji bio veoma zabavan, inspirativan, ali i zahtevan.

– Ceo projekat je bio veoma zahtevan za mene jer sam prvih pet epizoda režirao ja, a drugih pet Vlada Tagić, reditelj serije „Jutro će promeniti sve“. Nas nekoliko je bukvalno napravilo tu seriju. Bilo mi je uzbudljivo da pratim kreativni proces, od nule, do nastajanja serije, bukvalno, u svim fazama, pogotovo kod pisanja. Lepo mi je bilo da radim sa svojim kolegama i značilo mi je što su mi dali svoje poverenje i prepoznali kvalitet onoga što želim da uradim. S druge strane, kao novopečeni reditelj bio sam veoma ambiciozan. Želeo sam da bude onako kako sam zamislio ali mi je bilo važno da se glumci dobro osećaju i da zavole junake koje igraju – konstatuje Kičić.

Na pitanje Danasa ima li svoju opservaciju o tome zašto je film „Realna priča“ postigao veliki uspeh kod publike odgovara:

– Vrlo sam zadovoljan što je „Realna priča“ prošla jako dobro kod publike i verujem da će tako biti i sa serijom jer su u njoj primenjeni isti estetika i stil. Publika se povezala na tom nekom lično, emotivnom odnosu i ja sam sam želeo da što ličnije ispričam tu priču. Publika je to prepoznala, povezala se sa tim junacima i situacijama. Emocije su se prelile na nju, a mislim i da će ovaj serijski program koji smo napravili biti potpuno različit od cele ponude koja se trenutno dešava kod nas – smatra Kičić. Prema njegovim rečima, trenutno je prisutna hiperprodukcija serija, što je, kako kaže, „fenomenalno“.

– Ali ova serija nije niti triler, niti egzibicija, niti „history piece“, što bi se reklo, nego savremena serija koja je žanrovski drama – komedija. Kroz taj komični momenat publika se povezuje sa junacima. Mi stvarno pričamo o svakodnevnim stvarima ali kroz drugačiju vizuru. Publika je uspela da se veže i prepozna tu emociju, a mislim i nameru autora da čista srca napravi taj projekat – zaključuje Gordan Kičić.

Serije „Mama i tata se igraju rata“ ima deset epizoda, a gledaocima će biti dostupna od 10. oktobra na RTS-u.', 20)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (20, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Seltikse je predvodio Kemba Voker sa 32 poena, četiri skoka i četiri asistencije, a pratio ga je Džejson Tejtum sa 28 poena, 15 skokova i četiri asistencije. Džejlen Braun u pobedi je učestvovao sa 16 poena i pet skokova.

U ekipi Filadelfije najefikasniji je bio Džoel Embid sa 30 poena i 10 skokova, a Tobajas Heris postigao je 20 poena. On je u trećoj četvrtini pri skoku nezgodno pao na parket i povredio je oko. Na polovini poslednje deonice vratio se na parket sa zavojem preko levog oka.

Džoš Ričardson i Šejk Milton dodali su po 14 poena za ekipu iz Filadelfije.

Boston će u drugom kolu igrati protiv boljeg iz duela Toronta i Bruklina. Aktuelni šampion Toronto vodi sa 3:0 u seriji.', 21)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (21, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Od ukupnog broja zaraženih najmanje 14.686.200 ljudi smatra se izlečenim.

Broj zvanično zaraženih ne odražava realan broj inficiranih, pošto mnoge zemlje testiraju samo pacijente kojima je potrebno bolničko lečenje.

SAD, gde je prvi smrtni slučaj registrovan početkom februara, najviše su pogodjene virusom. U toj zemlji je umrla 176.371 osoba, zaražene su 5.668.564, a izlečene 1.985.484 osobe.

Posle SAD, zemlje sa najvećim brojem preminulih su – Brazil (114.250 umrlih i 3.582.362 zaražene osobe), Meksiko (60.254 umrle osobe i 556.216 zaraženih), Indija (56.706 umrlih i 3.044.940 inficiranih) i Velika Britanija (41.423 preminule i 324.601 inficirana osoba).

Kina, bez teritorije Hongkonga i Makaoa, gde je počela epidemija u decembru 2019. godine, zvanično ima 84.951 inficiranu osobu, 4.634 su umrle, a broj izlečenih je 79.895.

Latinska Amerika i Karibi imaju 257.469 preminulih i 6.669.915 zaraženih, Evropa 212.739 preminulih i 3.701.241 inficiranu osobu, SAD i Kanada 185.477 umrlih i 5.793.149 inficiranih, Azija 87.444 umrle i 4.487.621 zaraženu, Bliski istok 34.219 preminulih i 1.400.745 zaraženih, Afrika 27.584 umrle osobe i 1.183.662 inficirane, i Okeanija 538 preminulih i 27.342 inficirane osobe.

Frans pres svakodnevno pravi bilans na osnovu državnih podataka zemalja sveta i informacija Svetske zdravstvene organizacije.', 22)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (24, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Amfilohije je, na liturgiji u Sabornom hramu Hristovog vaskrsenja u Podgorici, rekao da, iako ima 82 godine, nikada nije bio na parlamentarnim izborima, prenela je MINA.

„Ali ovoga puta 30. avgusta ću izaći na izbore i pozivam i sve vas, sve Crnogorce da izađu na izbore i da glasaju za svetinje Božije, za svetinju ljudskoga dostojanstva itvorevine Božije, i za svetinje koje su posvećene živome Bogu na čelu sa ovom svetinjom koja je posvećena Hristovom Vaskrsenju“, poručio je Amfilohije.

On je, kako je objavljeno na sajtu Mitropolije crnogorsko-primorske, rekao da hrišćani glasaju „od pamtieka za večno i neprolazno ljudsko dostojanstvo, za svetinju ljudskoga bića, za svetinju Božije tvorevine, za jedinoga Svetoga”.

“Zato treba izaći na ove izbore, da glasamo za te svetinje, protiv bezakonika, protiv bezakonih zakona koji ovde vladaju i lažnih zakona“, istakao je Amfilohije.

Na liturgiji je pročitana i Amfilohijeva Velikogospođinsku poslanica u kojoj se navodi da predstoje i dani izbora zakonodavne i izvršne političke vlasti, „pa predizborna stranačka kampanja zaokuplja pažnju i nas hrišćana koji smo istovremeno građani ove države“.

„Кao nikada do sada, ovi politički izbori su povezani i sa životom Crkve Hristove u Crnoj Gori, jer za nama imamo više od godinu dana velike društvene polemike oko problematičnog Zakona o slobodi veroispovesti koji je izglasala dosadašnja skupštinska većina“, kaže se u poslanici.

Navodi se da su u Crkvi dovoljno svesni i pismeni pa znaju da tako loš zakonski tekst nije slučajno izglasan “nego su mu prethodila javno i uporno iskazana nastojanja predsjednika države i same vladajuće partije”. Prema njegovim rečima, optuživati Crkvu da se bavi antidržavnom i partijskom politikom pred izbore, zato što su njeni članovi ustali protiv bezakonog i diskriminatornog zakona, kojim se negira i ugrožava samo biće Crkve, predstavlja laž i obmanu i nezapamćeno nasilje sekularne partije na vlasti.

U poslanici se navodi da Crkva ne navija ni za jednu partiju i samim tim, u duhu sekularizma, ona političke procese prepušta političarima.

„Sa druge strane, ona je slobodna da pozove građane da predstojećim izborima pristupe rasterećeni bilo kakvog straha i potkupljivanja, koristeći svoja građanska prava“, dodaje se u poslanici.', 23)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (25, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Iz ovog sindikata navode da je za njih najavljeni početak pregovora predstavnika Vlade, poslodavaca i sindikata oko minimalca, nelegitiman.

„Vlada nije formirana, a Unija poslodavaca i takozvani ‘reprezentativni’ sindikati odavno nemaju kredibilitet pregovaranja, što je nastavak fingiranja socijalnog dijaloga i obesmišljavanja radničkog dostojanstva“, navodi se u saopštenju.

Sindikat „Sloga“ navodi da radnici u Srbiji „imaju tragičnu sudbinu da im o visini minimalca u poslednjih osam godina odlučuje samo jedan čovek, predsednik države, uz pomoć statista iz redova malih poslodavaca i poslušnih sindikata koji sa nezaslužene pozicije godinama unazad rade na štetu radništva“.

„Iz toga se vidi da je sve obesmišljeno, jer u pregovorima ne učestvuju veliki trgovački lanci i strane kompanije, posebno strane građevinske firme koje izvode velike infrastrukturne javne radove i koje sve više uz prećutnu saglasnost vlasti dovode svoju radnu snagu iz Kine, Bangladeša, Indije“, navodi sindikat Sloga.

Ovaj sindikat upozorava da „sa malim natalitetom, uz uništavanje domaće privrede i sistemskog obesmišljavanja poljoprivrede i stočarstva, izgradnje besmislenih jarbola, fontana i nacionalnih stadiona, danas imamo više desetina hiljada radno sposobnih građana Srbije koji napeto čekaju da se nakon korone granice ka EU otvore i da odmah odu“.', 24)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (26, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Navodi se da će Miljković biti upamćen po brojnim ulogama u pozorištu „Duško Radović“, kao i po brojnim epizodnim ulogama u domaćim serijama i filmovima.

Od njega se ovaj teatar oprostio u čitulji objavljenoj u jednim dnevnim novinama.

„Sa tugom obaveštavamo publiku i kolege da je 20. avgusta 2020. godine preminuo naš kolega, glumac Zoran Miljković. Bio je član ansambla Malog pozorišta ‘Duško Radović’ trideset i pet godina, i naš prvak tokom petnaest godina karijere“, saopštili su iz Malog pozorišta „Duško Radović“.', 25)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (27, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Japanska kompanija Soni saopštila je danas je njen profit od aprila do juna porastao za 53 odsto usled porasta potražnje video igrica i druge onlajn ponude dok su ljudi bili u karantinu tokom pandemije korona virusa.

Soni je u poslednjem kvartalu zaradio 233 milijarde jena (2,2 milijarde dolara), u odnosu na 152 milijarde jena u istom periodu prošle godine.

Najveća potražnja bila je za video igricama i muzikom jer su ljudi većinu svog vremena provodili kod kuće suočeni sa merama zatvaranja koje su imale za cilj da spreče širenje zaraze korona virusom.

Međutim, iz kompanije su upozorili da će filmski odeljak verovatno biti pogođen dve ili tri godine zbog odlaganja filmskih projekata i ograničenja broja mesta u bioskopima zbog pandemije.

Potražnja potrošača za elektronikom je takođe opala, uključujući prodaju digitalnih fotoaparata, televizora i drugih uređaja, navode iz Sonija.

Neke fabrike u Kini i Maleziji privremeno su zatvorene, a problem je i što neki zaposleni ne mogu da putuju.

Kompanija planira dobit od 510 milijardi jena (4,8 milijardi dolara) za fiskalnu godinu koja se završava u martu 2021. godine, što je pad od 12 odsto u odnosu na prethodnu fiskalnu godinu.', 26)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (28, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Mašući crveno-belim zastavama u boji protesta masa se okupila na Trgu nezavisnosti i u okolnim ulicama, uzvikujući slogane „sloboda“ i druge.

Lukašenko, koji je 26 godina na vlasti, ove nedelje je rekao da će „rešiti problem protesta“ koji je, po njemu, rezultat strane zavere, čak je i vojsku stavio u stanje pripravnosti optužujući NATO da obavlja manevre na beloruskim granicama.

Međutim, oglušujući se o zabranu i danas se okupio ogroman broj ljudi.

Preko medija i naloga Telegram povezanih sa opoziciojom navodi se da ima više od 100.000 demonstranata u glavnom gradu Belorusije, a toliki broj se dnevno okuplja drugu nedelju zaredom.

U nedelju, 16. avgusta, održano je ogromno okupljanje protivnika Lukašenka, a istog dana bio je održan i znatno manji skup pristalica vlasti.

Demonstracije su organizovane danas i u drugim gradovima Belorusije kao što su Mogilev i Grodno.

Policijske snage za razbijanje demonstracije izašle su u velikom broju ali nisu intervenisale protiv ovog nedozvoljenog okupljanja, prenose novinari agencija Frans pres.', 27)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (29, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Ministarstvo odbrane upozorilo je da će u slučaju nereda blizu memorijalnog centra Drugog svetskog rata, mesta gde su se demonstracije održavale poslednje dve nedelje, odgovorni imati posla sa vojskom.

Neki spomenici, posebno u Minsku okruženi su bodljikavom žicom i naoružanim vojnicima.

Šefica beloruske opozicije Svetlana Tihanovskaja, koja se proglasila pobednicom izbora 9. septembra, rekla je juče da je ponosna na Beloruse koji su savladali strah da bi branili svoja prava.

„Pozivam ih da nastave“, rekla je za Frans pres opozicionarka koja se sklonila u Litvaniju dan posle izbora.

Na diplomatskom frontu Evropska unija, koja je odbacila rezultate predsedničkih izbora i najavila sankcije, ocenila je da je i dalje neophodno razgovarati sa beloruskim predsednikom.', 27)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (30, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Šef evropske diplomatije Žozep Borel upozorio je danas da Evropska unija nema nameru da Belorusija postane „druga Ukrajina“ i da treba nastaviti dijalog sa beloruskim predsednikom Aleksandrom Lukašenkom.

Pre izbora beloruski predsednik optužio je ruskog predsednika Vladimira Putina da radi tajno na tome da ga sruši. Medjutim posle talasa protesta on je promenio stav računajući na podršku Kremlja u, kako tvrdi, svojoj borbi protiv zapadnih pokušaja destabilizacije.

Šef ruske diplomatije Sergej Lavrov izjasnio se danas protiv „podsticanja nemira spolja“ i protiv „novog ukrajinskog scenarija“. To su, kako navodi Frans pres, jedva prikrivene opaske upućene zapadnim protivnicima Moskve.

Uprkos brutalnom talasu represije nad demonstrantima u danima posle izbora, gradjani Belorusije nastavili su da se mobilišu u velikom broju organizujući brojne demonstracije i mirne ljudske lance.

Predsednik Lukašenko je takođe ostao čvrst navodeći samo nejasan plan revizije ustava za izlazak iz političke krize.

Do sada je mogao da računa na vernost vojske, policije i svoje tajne službe iako je bilo demonstrativnih odlazaka iz državnih medija i javnih preduzeća.

Stavio je oružane snage u stanje pripravnosti zbog, kako je rekao, velikih kretanja NATO snaga blizu granica, na poljskoj i litvanskoj granici. Alijansa je negirala bilo kakvo vojno gomilanje u regionu.

Predsednik Belorusije Aleksandar Lukašenko viđen je večeras kako ulazi u svoju rezidenciju u Minsku, koja se nalazi blizu mesta gde se održavaju protesti protiv njega, sa puškom Kalašnjikov i u pancir prsluku.

Nekoliko hiljada stanovnika baltičkih zemalja počelo je danas da formira ljudski lanac u znak solidarnosti sa demonstrantima u Belorusiji, a sličan gest su građani tih zemalja uradili pre tri decenije prkoseći tada Sovjetskom savezu', 27)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (31, CAST(N'2020-08-23T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Uprkos velikoj zdravstvenoj krizi sa kojom se svet suočava, na prvom mestu su za najveći broj ispitanika i dalje klimatske promene.

Upitnik su popunjavali građani Švedske, Nemačke, Velike Britanije, Finske, Holandije, Danske i Francuske, najpre krajem 2019, a zatim u junu ove godine, piše Jovana Nikolić za portal Klima101.rs.

Ukupno gledano, kao najveći problem oba puta su označene klimatske promene, dok su stanovnici Velike Britanije sada postavili pandemiju na prvo mesto iako su krajem prošle godine pokazali najmanju zabrinutost za ovu pretnju.

Još neki od problema koji su se našli na spisku strahova Evropljana su rat, siromaštvo, ekonomska recesija, nedostatak vode i hrane.

Nakon veoma burne prve polovine godine koja je mnogim ljudima širom sveta izmenila lične prioritete i strahove, ovo istraživanje je jedan od načina da se sagleda do kakvih je promena došlo u ocenjvanju najveće krize sa kojom se čovečanstvo suočava.

Sudeći po odgovorima ovih ispitanika, zabrinutost zbog mogućih posledica klimatskih promena i dalje je među vodećim.

Ipak, kovid-19 je uticao na to da lista najvećih strahova za čovečanstvo ne bude ista. Tako su klimatske promene u decembru prošle godine bile na vrhu liste sa 32 odsto glasova, a sada se za njih opredelilo nešto manje ispitanika, odnosno 28 odsto. Sa druge strane, pandemija je izbila na drugo mesto sa 20 odsto zabrinutih, dok je u decembru bila na samo 6 odsto.

Izvršni direktor kompanije koja je pokrenula istraživanje, Magnus Hol, ocenio je ovo kao jedan od pokazatelja da vodeća švedska energetska kompanija treba da se okrene ka čistoj energiji i napusti fosilna goriva i da „naše emocije prema klimatskim promenama ostaju nepromenjene čak i dok vlada globalna zdravstvena kriza“.', 28)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (32, CAST(N'2020-08-24T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-25T01:33:20.8912168' AS DateTime2), 1, CAST(N'2020-08-25T01:33:20.8590971' AS DateTime2), 0, N'Nesto', 28)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (33, CAST(N'2020-08-25T11:07:58.6405399' AS DateTime2), CAST(N'2020-08-26T11:38:38.3261604' AS DateTime2), 0, NULL, 1, N'Proba', 30)
INSERT [dbo].[Texts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [TextNews], [NewsId]) VALUES (34, CAST(N'2020-08-25T15:30:34.2382864' AS DateTime2), CAST(N'2020-08-26T11:08:08.8172764' AS DateTime2), 1, CAST(N'2020-08-26T11:08:08.8029941' AS DateTime2), 0, N'Nesto nesto nesto', 29)
SET IDENTITY_INSERT [dbo].[Texts] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-08-21T17:32:24.0128722' AS DateTime2), N'User Registration', N'{"FristName":null,"LastName":null,"Username":null,"Password":null,"Email":null}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-08-21T20:11:52.1668109' AS DateTime2), N'User Registration', N'{"FristName":null,"LastName":null,"Username":null,"Password":null,"Email":null}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-08-21T20:52:39.8647783' AS DateTime2), N'User Registration', N'{"FristName":null,"LastName":null,"Username":null,"Password":null,"Email":null}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-08-21T20:56:35.9128069' AS DateTime2), N'User Registration', N'{"FristName":"Alexandra","LastName":"Fridl","Username":"Alex","Password":"123456","Email":"beblak@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-08-21T21:22:29.6250863' AS DateTime2), N'User Registration', N'{"FristName":"Mladen","LastName":"Jeremic","Username":"Mladja","Password":"123456","Email":"mladja@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-08-21T21:25:20.4664751' AS DateTime2), N'User Registration', N'{"FristName":"David","LastName":"Jeremic","Username":"Da","Password":"123456","Email":"da@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-08-25T13:11:25.0883334' AS DateTime2), N'Search News', N'{"CategoryId":4,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-08-25T13:30:33.9366734' AS DateTime2), N'Create Text', N'{"Id":0,"TextNews":"Nesto nesto nesto","NewsId":29}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-08-25T13:32:12.4743966' AS DateTime2), N'Create Text', N'{"Id":0,"TextNews":"Nesto nesto nesto1111111","NewsId":0}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-08-25T13:35:37.2057707' AS DateTime2), N'Create Text', N'{"Id":0,"TextNews":"Nesto nesto nesto1111111","NewsId":0}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-08-25T13:45:07.7730624' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":null,"CreatedAt":"0001-01-01T00:00:00","NewsId":4,"UserId":4,"News":null,"Users":null}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-08-25T13:48:07.7161863' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":null,"CreatedAt":"0001-01-01T00:00:00","NewsId":28,"UserId":4,"News":null,"Users":null}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2020-08-25T13:48:44.3475682' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Dosadno je i smaranje!","CreatedAt":"0001-01-01T00:00:00","NewsId":28,"UserId":4,"News":null,"Users":null}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-08-25T13:49:20.2146369' AS DateTime2), N'Update Comment', N'{"Id":2,"TextComment":"Dosadno je i smaranje!","CreatedAt":"0001-01-01T00:00:00","NewsId":28,"UserId":4,"News":null,"Users":null}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-08-25T13:58:01.7666575' AS DateTime2), N'Search News', N'{"CategoryId":4,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-08-25T14:00:28.7674511' AS DateTime2), N'Get one Text', N'4', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-08-25T14:05:26.3403487' AS DateTime2), N'Get one comment', N'4', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-08-25T14:06:51.7018604' AS DateTime2), N'Get one comment', N'4', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-08-25T14:07:14.4789040' AS DateTime2), N'Search Comment', N'{"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-08-25T14:10:02.3000325' AS DateTime2), N'Search Comment', N'{"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-08-25T14:13:18.5155467' AS DateTime2), N'Search Comment', N'{"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2020-08-25T15:34:57.1869330' AS DateTime2), N'Search Comment', N'{"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-08-25T15:36:42.0222046' AS DateTime2), N'Search Comment', N'{"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-08-25T15:42:35.3123338' AS DateTime2), N'Search Comment', N'{"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-08-25T15:51:48.0828247' AS DateTime2), N'Category Search', N'{"Actor":"alex","UseCaseName":null,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-08-25T15:52:49.4440069' AS DateTime2), N'Category Search', N'{"Actor":"alex","UseCaseName":"Create text","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-08-25T15:53:05.5422587' AS DateTime2), N'Category Search', N'{"Actor":null,"UseCaseName":"Create text","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-08-25T15:55:23.1715784' AS DateTime2), N'Category Search', N'{"Actor":null,"UseCaseName":"Create text","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-08-25T15:58:41.7463092' AS DateTime2), N'Get one Use Case Log', N'0', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-08-25T15:59:01.2825080' AS DateTime2), N'Get one Use Case Log', N'0', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-08-25T15:59:46.0894455' AS DateTime2), N'Get one Use Case Log', N'0', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-08-25T16:01:18.2693953' AS DateTime2), N'Get one Use Case Log', N'0', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-08-25T16:03:05.9339043' AS DateTime2), N'Get one Use Case Log', N'13', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-08-25T16:04:35.8068890' AS DateTime2), N'Get one Use Case Log', N'13', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-08-25T16:05:45.0657116' AS DateTime2), N'Get one Use Case Log', N'13', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-08-25T16:12:16.9920344' AS DateTime2), N'Get one Use Case Log', N'13', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-08-25T16:21:45.0064704' AS DateTime2), N'Get one Use Case Log', N'13', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-08-25T18:02:57.9675933' AS DateTime2), N'Category Search', N'{"Name":null,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-08-25T18:03:34.5740547' AS DateTime2), N'Get one category', N'4', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-08-25T18:07:09.4470569' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-08-25T18:19:47.4142880' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-08-25T18:40:00.8304104' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-08-25T18:42:20.9492969' AS DateTime2), N'Search News', N'{"CategoryId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-08-25T18:44:57.5631364' AS DateTime2), N'Search News', N'{"CategoryId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-08-25T18:45:12.7186844' AS DateTime2), N'Search News', N'{"CategoryId":3,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-08-25T18:49:28.9765628' AS DateTime2), N'Search News', N'{"CategoryId":3,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-08-25T18:51:16.9067454' AS DateTime2), N'Search Comment', N'{"UserId":4,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-08-25T18:54:08.8969818' AS DateTime2), N'Search Text', N'{"NewsId":8,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-08-25T18:55:10.6745059' AS DateTime2), N'Search Text', N'{"NewsId":28,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-08-25T21:29:30.1312548' AS DateTime2), N'Category Search', N'{"Actor":"Alex","UseCaseName":null,"PerPage":4,"Page":2}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-08-25T21:58:38.0563939' AS DateTime2), N'Delete Picture', N'7', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-08-25T21:59:43.3819807' AS DateTime2), N'Delete Picture', N'8', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-08-25T22:13:03.8376824' AS DateTime2), N'Search Picture', N'{"NewsId":22,"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-08-25T22:13:22.4913860' AS DateTime2), N'Search Picture', N'{"NewsId":22,"UserId":0,"PerPage":5,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-08-25T22:14:58.5369581' AS DateTime2), N'Search Picture', N'{"NewsId":28,"UserId":0,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-08-25T22:19:24.9650890' AS DateTime2), N'Search Picture', N'{"NewsId":28,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-08-25T22:20:52.9673729' AS DateTime2), N'Search Picture', N'{"NewsId":28,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-08-25T22:26:32.9084858' AS DateTime2), N'Get one News', N'9', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2020-08-25T22:27:42.7114835' AS DateTime2), N'Get one News', N'9', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2020-08-25T22:30:12.1789841' AS DateTime2), N'Get one Picture', N'9', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2020-08-25T22:33:11.6730526' AS DateTime2), N'Get one Picture', N'9', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2020-08-25T22:47:16.7932311' AS DateTime2), N'Search Text', N'{"NewsId":11,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2020-08-25T22:47:50.7578966' AS DateTime2), N'Get one Text', N'1', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2020-08-25T22:54:13.2852900' AS DateTime2), N'Update Text', N'{"TextNews":"Opet nesto","NewsId":29}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2020-08-25T22:56:00.7423178' AS DateTime2), N'Update Text', N'{"Id":0,"TextNews":"Opet nesto","NewsId":29}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2020-08-25T22:57:20.2449205' AS DateTime2), N'Update Text', N'{"Id":0,"TextNews":"Opet nesto","NewsId":29}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2020-08-25T22:57:55.2485486' AS DateTime2), N'Update Text', N'{"Id":0,"TextNews":"Opet nesto","NewsId":29}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2020-08-25T22:58:33.4054436' AS DateTime2), N'Update Text', N'{"Id":0,"TextNews":"Opet nesto","NewsId":29}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2020-08-25T22:59:33.3758440' AS DateTime2), N'Update Text', N'{"Id":0,"TextNews":"Opet nesto","NewsId":29}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2020-08-25T23:03:17.4181140' AS DateTime2), N'Search Text', N'{"NewsId":27,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2020-08-26T00:10:37.3908694' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Boze me sacuvaj!","NewsId":3,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2020-08-26T00:15:37.4205902' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Aman hoce li proci korona!","NewsId":8}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2020-08-26T00:19:54.9181797' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Opet protesti","NewsId":27,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2020-08-26T00:20:39.1827274' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Lako je Soniju","NewsId":26,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2020-08-26T00:21:28.6304839' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Jos ce i pare da im daju a oparili se ovo leto!","NewsId":12,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2020-08-26T00:21:55.5295916' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Citajmo citajmo!","NewsId":9,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2020-08-26T00:22:38.3485367' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Aman vise ta Amerika!","NewsId":7,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2020-08-26T00:23:41.6212395' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Cuvajmo prirodu!","NewsId":28,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2020-08-26T00:25:57.7864698' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Samo si nam ti jos trebao!","NewsId":23,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2020-08-26T00:26:21.6834216' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Jadan narod!","NewsId":24,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2020-08-26T00:26:43.7559029' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Slazem se!","NewsId":20,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2020-08-26T00:27:20.3167566' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Sad cemo te gledamo Milo!","NewsId":19,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2020-08-26T00:27:45.2723302' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Strasno!","NewsId":22,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2020-08-26T00:28:21.8912407' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Idemo!","NewsId":21,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2020-08-26T00:28:47.6113581' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Jos jedna gondola!","NewsId":18,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2020-08-26T00:29:11.7129916' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Jos cemo da vidimo!","NewsId":1,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2020-08-26T00:29:24.5636116' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Jadni djaci!","NewsId":1,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2020-08-26T00:29:39.6071727' AS DateTime2), N'Create Comment', N'{"Id":0,"TextComment":"Ma jadni roditelji!","NewsId":1,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2020-08-26T00:31:36.8822033' AS DateTime2), N'Search Comment', N'{"UserId":4,"PerPage":10,"Page":2}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2020-08-26T00:32:00.6875778' AS DateTime2), N'Get one comment', N'12', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2020-08-26T00:32:53.0064754' AS DateTime2), N'Update Comment', N'{"Id":12,"TextComment":"Cuvajmo prirodu bre!","NewsId":28,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2020-08-26T01:41:25.7955658' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2020-08-26T01:42:16.6604672' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2020-08-26T01:44:18.0074576' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2020-08-26T01:44:29.2940260' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2020-08-26T01:53:12.4876922' AS DateTime2), N'Category Update', N'{"Id":11,"Name":"Zivot"}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2020-08-26T08:24:21.0070615' AS DateTime2), N'Update Comment', N'{"Id":12,"TextComment":"Cuvajmo prirodu bre!","NewsId":28,"UserId":4}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2020-08-26T08:29:17.6743278' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba","NewsId":30}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2020-08-26T08:33:46.5619347' AS DateTime2), N'Search Picture', N'{"NewsId":22,"PerPage":3,"Page":1}', N'Alex')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2020-08-26T08:36:00.6699823' AS DateTime2), N'Search Picture', N'{"NewsId":22,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2020-08-26T08:37:14.1560722' AS DateTime2), N'Search Picture', N'{"NewsId":22,"PerPage":10,"Page":1}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2020-08-26T08:43:45.0178039' AS DateTime2), N'User Registration', N'{"FristName":null,"LastName":"Nesto","Username":"NNeko","Password":"123456","Email":"aleksandra.fridl.311.14@ict.edu.rs"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2020-08-26T08:44:37.9527039' AS DateTime2), N'User Registration', N'{"FristName":"Neko","LastName":"Nesto","Username":"NNeko","Password":"123456","Email":"aleksandra.fridl.311.14@ict.edu.rs"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2020-08-26T08:45:24.1042064' AS DateTime2), N'User Registration', N'{"FristName":"Neko","LastName":"Nesto","Username":"NNeko","Password":"123456","Email":"bebelak@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2020-08-26T08:47:11.9752950' AS DateTime2), N'Category Search', N'{"Name":"politika","PerPage":10,"Page":1}', N'NNeko')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2020-08-26T08:49:47.8422615' AS DateTime2), N'Get one comment', N'5', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2020-08-26T08:50:19.4638985' AS DateTime2), N'Get one comment', N'5', N'NNeko')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2020-08-26T08:51:51.1790570' AS DateTime2), N'Get one News', N'29', N'NNeko')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2020-08-26T08:52:25.0191579' AS DateTime2), N'Get one News', N'29', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2020-08-26T08:53:39.6730033' AS DateTime2), N'Get one Picture', N'9', N'NNeko')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2020-08-26T08:54:07.7487435' AS DateTime2), N'Get one Picture', N'9', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2020-08-26T08:55:23.4004366' AS DateTime2), N'Get one Text', N'32', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2020-08-26T08:55:37.2430398' AS DateTime2), N'Get one Text', N'32', N'NNeko')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2020-08-26T08:56:24.5174424' AS DateTime2), N'Get one Text', N'32', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2020-08-26T09:07:22.9650846' AS DateTime2), N'Delete Text', N'34', N'Mladja')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2020-08-26T09:08:08.7302098' AS DateTime2), N'Delete Text', N'34', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2020-08-26T09:20:33.3154131' AS DateTime2), N'Update Text', N'{"Id":0,"TextNews":"Proba123456","NewsId":33}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2020-08-26T09:22:38.9535198' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba123456","NewsId":33}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2020-08-26T09:24:32.3780183' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba123456","NewsId":33}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2020-08-26T09:25:50.0926689' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba123456","NewsId":33}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2020-08-26T09:30:09.3050941' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba123456","NewsId":30}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2020-08-26T09:32:18.3232121' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba123456","NewsId":30}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2020-08-26T09:36:33.9332980' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba123456","NewsId":30}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2020-08-26T09:37:20.8223060' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba","NewsId":33}', N'Alex')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2020-08-26T09:38:38.0343008' AS DateTime2), N'Update Text', N'{"Id":33,"TextNews":"Proba","NewsId":30}', N'Alex')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FristName], [LastName], [Username], [Password], [Email]) VALUES (4, N'Alexandra', N'Fridl', N'Alex', N'123456', N'beblak@gmail.com')
INSERT [dbo].[Users] ([Id], [FristName], [LastName], [Username], [Password], [Email]) VALUES (5, N'Mladen', N'Jeremic', N'Mladja', N'123456', N'mladja@gmail.com')
INSERT [dbo].[Users] ([Id], [FristName], [LastName], [Username], [Password], [Email]) VALUES (6, N'David', N'Jeremic', N'Daca', N'123456', N'aleksandra.fridl.311.14@ict.edu.rs')
INSERT [dbo].[Users] ([Id], [FristName], [LastName], [Username], [Password], [Email]) VALUES (8, N'Neko', N'Nesto', N'NNeko', N'123456', N'bebelak@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (4, 1, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (5, 2, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (6, 3, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (7, 4, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (9, 22, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (10, 3, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (11, 22, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (12, 5, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (14, 6, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (15, 7, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (16, 8, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (17, 24, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (18, 8, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (20, 24, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (21, 13, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (22, 14, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (23, 15, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (24, 16, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (25, 26, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (27, 16, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (28, 26, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (29, 11, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (30, 9, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (31, 10, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (32, 12, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (33, 12, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (34, 23, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (35, 23, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (36, 17, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (37, 18, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (39, 19, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (40, 20, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (41, 20, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (42, 25, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (43, 27, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (44, 28, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (45, 29, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (46, 30, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (48, 31, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (49, 27, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (50, 28, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserCaseId], [UserId]) VALUES (51, 25, 4)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Newses_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[Newses] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Newses_NewsId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Newses]  WITH CHECK ADD  CONSTRAINT [FK_Newses_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Newses] CHECK CONSTRAINT [FK_Newses_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Newses_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[Newses] ([Id])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Newses_NewsId]
GO
ALTER TABLE [dbo].[Texts]  WITH CHECK ADD  CONSTRAINT [FK_Texts_Newses_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[Newses] ([Id])
GO
ALTER TABLE [dbo].[Texts] CHECK CONSTRAINT [FK_Texts_Newses_NewsId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
