USE [master]
GO
/****** Object:  Database [JacksMarvel_db]    Script Date: 07-07-2019 23:39:37 ******/
CREATE DATABASE [JacksMarvel_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JacksMarvel_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JacksMarvel_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JacksMarvel_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JacksMarvel_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JacksMarvel_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JacksMarvel_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JacksMarvel_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JacksMarvel_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JacksMarvel_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JacksMarvel_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET RECOVERY FULL 
GO
ALTER DATABASE [JacksMarvel_db] SET  MULTI_USER 
GO
ALTER DATABASE [JacksMarvel_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JacksMarvel_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JacksMarvel_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JacksMarvel_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JacksMarvel_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JacksMarvel_db', N'ON'
GO
USE [JacksMarvel_db]
GO
/****** Object:  Table [dbo].[tblAllComicCharacters]    Script Date: 07-07-2019 23:39:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAllComicCharacters](
	[Id] [int] NOT NULL,
	[CharacterName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAllComicCharacters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedbackEntries]    Script Date: 07-07-2019 23:39:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedbackEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Detail] [nvarchar](500) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Mobile] [nvarchar](15) NULL,
 CONSTRAINT [PK_tblFeedbackEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserFavouriteCharacters]    Script Date: 07-07-2019 23:39:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserFavouriteCharacters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FavCharId] [int] NOT NULL,
 CONSTRAINT [PK_tblUserFavouriteCharacters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 07-07-2019 23:39:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[AccountCreationDate] [datetime] NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[LastLoginDateTime] [datetime] NULL,
	[LoginCount] [int] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (1, N'A-Bomb
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (2, N'Abe Sapien
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (3, N'Abin Sur
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (4, N'Abomination
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (5, N'Abraxas
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (6, N'Absorbing Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (7, N'Adam Monroe
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (8, N'Adam Strange
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (9, N'Agent 13
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (10, N'Agent Bob
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (11, N'Agent Zero
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (12, N'Air-Walker
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (13, N'Ajax
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (14, N'Alan Scott
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (15, N'Alex Mercer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (16, N'Alex Woolsly
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (17, N'Alfred Pennyworth
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (18, N'Alien
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (19, N'Allan Quatermain
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (20, N'Amazo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (21, N'Ammo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (22, N'Ando Masahashi
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (23, N'Angel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (24, N'Angel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (25, N'Angel Dust
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (26, N'Angel Salvadore
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (27, N'Angela
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (28, N'Animal Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (29, N'Annihilus
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (30, N'Ant-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (31, N'Ant-Man II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (32, N'Anti-Monitor
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (33, N'Anti-Spawn
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (34, N'Anti-Venom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (35, N'Apocalypse
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (36, N'Aquababy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (37, N'Aqualad
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (38, N'Aquaman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (39, N'Arachne
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (40, N'Archangel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (41, N'Arclight
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (42, N'Ardina
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (43, N'Ares
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (44, N'Ariel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (45, N'Armor
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (46, N'Arsenal
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (47, N'Astro Boy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (48, N'Atlas
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (49, N'Atlas
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (50, N'Atom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (51, N'Atom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (52, N'Atom Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (53, N'Atom II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (54, N'Atom III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (55, N'Atom IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (56, N'Aurora
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (57, N'Azazel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (58, N'Azrael
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (59, N'Aztar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (60, N'Bane
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (61, N'Banshee
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (62, N'Bantam
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (63, N'Batgirl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (64, N'Batgirl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (65, N'Batgirl III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (66, N'Batgirl IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (67, N'Batgirl V
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (68, N'Batgirl VI
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (69, N'Batman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (70, N'Batman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (71, N'Batman II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (72, N'Battlestar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (73, N'Batwoman V
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (74, N'Beak
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (75, N'Beast
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (76, N'Beast Boy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (77, N'Beetle
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (78, N'Ben 10
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (79, N'Beta Ray Bill
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (80, N'Beyonder
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (81, N'Big Barda
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (82, N'Big Daddy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (83, N'Big Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (84, N'Bill Harken
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (85, N'Billy Kincaid
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (86, N'Binary
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (87, N'Bionic Woman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (88, N'Bird-Brain
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (89, N'Bird-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (90, N'Bird-Man II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (91, N'Birdman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (92, N'Bishop
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (93, N'Bizarro
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (94, N'Black Abbott
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (95, N'Black Adam
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (96, N'Black Bolt
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (97, N'Black Canary
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (98, N'Black Canary
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (99, N'Black Cat
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (100, N'Black Flash
')
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (101, N'Black Goliath
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (102, N'Black Knight III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (103, N'Black Lightning
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (104, N'Black Mamba
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (105, N'Black Manta
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (106, N'Black Panther
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (107, N'Black Widow
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (108, N'Black Widow II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (109, N'Blackout
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (110, N'Blackwing
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (111, N'Blackwulf
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (112, N'Blade
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (113, N'Blaquesmith
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (114, N'Bling!
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (115, N'Blink
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (116, N'Blizzard
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (117, N'Blizzard
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (118, N'Blizzard II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (119, N'Blob
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (120, N'Bloodaxe
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (121, N'Bloodhawk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (122, N'Bloodwraith
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (123, N'Blue Beetle
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (124, N'Blue Beetle
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (125, N'Blue Beetle II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (126, N'Blue Beetle III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (127, N'Boba Fett
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (128, N'Bolt
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (129, N'Bomb Queen
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (130, N'Boom-Boom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (131, N'Boomer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (132, N'Booster Gold
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (133, N'Box
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (134, N'Box III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (135, N'Box IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (136, N'Brainiac
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (137, N'Brainiac 5
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (138, N'Brother Voodoo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (139, N'Brundlefly
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (140, N'Buffy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (141, N'Bullseye
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (142, N'Bumblebee
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (143, N'Bumbleboy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (144, N'Bushido
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (145, N'Cable
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (146, N'Callisto
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (147, N'Cameron Hicks
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (148, N'Cannonball
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (149, N'Captain America
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (150, N'Captain Atom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (151, N'Captain Britain
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (152, N'Captain Cold
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (153, N'Captain Epic
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (154, N'Captain Hindsight
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (155, N'Captain Mar-vell
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (156, N'Captain Marvel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (157, N'Captain Marvel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (158, N'Captain Marvel II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (159, N'Captain Midnight
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (160, N'Captain Planet
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (161, N'Captain Universe
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (162, N'Carnage
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (163, N'Cat
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (164, N'Cat II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (165, N'Catwoman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (166, N'Cecilia Reyes
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (167, N'Century
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (168, N'Cerebra
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (169, N'Chamber
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (170, N'Chameleon
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (171, N'Changeling
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (172, N'Cheetah
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (173, N'Cheetah II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (174, N'Cheetah III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (175, N'Chromos
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (176, N'Chuck Norris
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (177, N'Citizen Steel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (178, N'Claire Bennet
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (179, N'Clea
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (180, N'Cloak
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (181, N'Clock King
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (182, N'Cogliostro
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (183, N'Colin Wagner
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (184, N'Colossal Boy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (185, N'Colossus
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (186, N'Copycat
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (187, N'Corsair
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (188, N'Cottonmouth
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (189, N'Crimson Crusader
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (190, N'Crimson Dynamo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (191, N'Crystal
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (192, N'Curse
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (193, N'Cy-Gor
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (194, N'Cyborg
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (195, N'Cyborg Superman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (196, N'Cyclops
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (197, N'Cypher
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (198, N'Dagger
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (199, N'Danny Cooper
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (200, N'Daphne Powell
')
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (201, N'Daredevil
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (202, N'Darkhawk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (203, N'Darkman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (204, N'Darkseid
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (205, N'Darkside
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (206, N'Darkstar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (207, N'Darth Maul
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (208, N'Darth Vader
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (209, N'Dash
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (210, N'Data
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (211, N'Dazzler
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (212, N'Deadman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (213, N'Deadpool
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (214, N'Deadshot
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (215, N'Deathlok
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (216, N'Deathstroke
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (217, N'Demogoblin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (218, N'Destroyer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (219, N'Diamondback
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (220, N'DL Hawkins
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (221, N'Doc Samson
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (222, N'Doctor Doom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (223, N'Doctor Doom II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (224, N'Doctor Fate
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (225, N'Doctor Octopus
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (226, N'Doctor Strange
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (227, N'Domino
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (228, N'Donatello
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (229, N'Donna Troy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (230, N'Doomsday
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (231, N'Doppelganger
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (232, N'Dormammu
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (233, N'Dr Manhattan
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (234, N'Drax the Destroyer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (235, N'Ego
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (236, N'Elastigirl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (237, N'Electro
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (238, N'Elektra
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (239, N'Elle Bishop
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (240, N'Elongated Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (241, N'Emma Frost
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (242, N'Enchantress
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (243, N'Energy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (244, N'ERG-1
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (245, N'Ethan Hunt
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (246, N'Etrigan
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (247, N'Evil Deadpool
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (248, N'Evilhawk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (249, N'Exodus
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (250, N'Fabian Cortez
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (251, N'Falcon
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (252, N'Fallen One II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (253, N'Faora
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (254, N'Feral
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (255, N'Fighting Spirit
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (256, N'Fin Fang Foom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (257, N'Firebird
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (258, N'Firelord
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (259, N'Firestar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (260, N'Firestorm
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (261, N'Firestorm
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (262, N'Fixer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (263, N'Flash
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (264, N'Flash Gordon
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (265, N'Flash II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (266, N'Flash III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (267, N'Flash IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (268, N'Forge
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (269, N'Franklin Richards
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (270, N'Franklin Storm
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (271, N'Frenzy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (272, N'Frigga
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (273, N'Galactus
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (274, N'Gambit
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (275, N'Gamora
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (276, N'Garbage Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (277, N'Gary Bell
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (278, N'General Zod
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (279, N'Genesis
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (280, N'Ghost Rider
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (281, N'Ghost Rider II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (282, N'Giant-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (283, N'Giant-Man II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (284, N'Giganta
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (285, N'Gladiator
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (286, N'Goblin Queen
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (287, N'Godzilla
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (288, N'Gog
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (289, N'Goku
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (290, N'Goliath
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (291, N'Goliath
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (292, N'Goliath
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (293, N'Goliath IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (294, N'Gorilla Grodd
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (295, N'Granny Goodness
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (296, N'Gravity
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (297, N'Greedo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (298, N'Green Arrow
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (299, N'Green Goblin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (300, N'Green Goblin II
')
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (301, N'Green Goblin III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (302, N'Green Goblin IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (303, N'Groot
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (304, N'Guardian
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (305, N'Guy Gardner
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (306, N'Hal Jordan
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (307, N'Han Solo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (308, N'Hancock
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (309, N'Harley Quinn
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (310, N'Harry Potter
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (311, N'Havok
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (312, N'Hawk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (313, N'Hawkeye
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (314, N'Hawkeye II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (315, N'Hawkgirl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (316, N'Hawkman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (317, N'Hawkwoman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (318, N'Hawkwoman II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (319, N'Hawkwoman III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (320, N'Heat Wave
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (321, N'Hela
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (322, N'Hellboy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (323, N'Hellcat
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (324, N'Hellstorm
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (325, N'Hercules
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (326, N'Hiro Nakamura
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (327, N'Hit-Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (328, N'Hobgoblin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (329, N'Hollow
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (330, N'Hope Summers
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (331, N'Howard the Duck
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (332, N'Hulk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (333, N'Human Torch
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (334, N'Huntress
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (335, N'Husk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (336, N'Hybrid
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (337, N'Hydro-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (338, N'Hyperion
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (339, N'Iceman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (340, N'Impulse
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (341, N'Indiana Jones
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (342, N'Indigo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (343, N'Ink
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (344, N'Invisible Woman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (345, N'Iron Fist
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (346, N'Iron Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (347, N'Iron Monger
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (348, N'Isis
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (349, N'Jack Bauer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (350, N'Jack of Hearts
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (351, N'Jack-Jack
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (352, N'James Bond
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (353, N'James T.Kirk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (354, N'Jar Jar Binks
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (355, N'Jason Bourne
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (356, N'Jean Grey
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (357, N'Jean-Luc Picard
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (358, N'Jennifer Kale
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (359, N'Jesse Quick
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (360, N'Jessica Cruz
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (361, N'Jessica Jones
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (362, N'Jessica Sanders
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (363, N'Jigsaw
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (364, N'Jim Powell
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (365, N'JJ Powell
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (366, N'Johann Krauss
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (367, N'John Constantine
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (368, N'John Stewart
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (369, N'John Wraith
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (370, N'Joker
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (371, N'Jolt
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (372, N'Jubilee
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (373, N'Judge Dredd
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (374, N'Juggernaut
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (375, N'Junkpile
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (376, N'Justice
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (377, N'Jyn Erso
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (378, N'K-2SO
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (379, N'Kang
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (380, N'Kathryn Janeway
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (381, N'Katniss Everdeen
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (382, N'Kevin 11
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (383, N'Kick-Ass
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (384, N'Kid Flash
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (385, N'Kid Flash II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (386, N'Killer Croc
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (387, N'Killer Frost
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (388, N'Kilowog
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (389, N'King Kong
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (390, N'King Shark
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (391, N'Kingpin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (392, N'Klaw
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (393, N'Kool-Aid Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (394, N'Kraven II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (395, N'Kraven the Hunter
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (396, N'Krypto
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (397, N'Kyle Rayner
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (398, N'Kylo Ren
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (399, N'Lady Bullseye
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (400, N'Lady Deathstrike
')
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (401, N'Leader
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (402, N'Leech
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (403, N'Legion
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (404, N'Leonardo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (405, N'Lex Luthor
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (406, N'Light Lass
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (407, N'Lightning Lad
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (408, N'Lightning Lord
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (409, N'Living Brain
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (410, N'Living Tribunal
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (411, N'Liz Sherman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (412, N'Lizard
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (413, N'Lobo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (414, N'Loki
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (415, N'Longshot
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (416, N'Luke Cage
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (417, N'Luke Campbell
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (418, N'Luke Skywalker
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (419, N'Luna
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (420, N'Lyja
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (421, N'Mach-IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (422, N'Machine Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (423, N'Magneto
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (424, N'Magog
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (425, N'Magus
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (426, N'Man of Miracles
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (427, N'Man-Bat
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (428, N'Man-Thing
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (429, N'Man-Wolf
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (430, N'Mandarin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (431, N'Mantis
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (432, N'Martian Manhunter
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (433, N'Marvel Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (434, N'Master Brood
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (435, N'Master Chief
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (436, N'Match
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (437, N'Matt Parkman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (438, N'Maverick
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (439, N'Maxima
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (440, N'Maya Herrera
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (441, N'Medusa
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (442, N'Meltdown
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (443, N'Mephisto
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (444, N'Mera
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (445, N'Metallo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (446, N'Metamorpho
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (447, N'Meteorite
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (448, N'Metron
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (449, N'Micah Sanders
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (450, N'Michelangelo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (451, N'Micro Lad
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (452, N'Mimic
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (453, N'Minna Murray
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (454, N'Misfit
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (455, N'Miss Martian
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (456, N'Mister Fantastic
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (457, N'Mister Freeze
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (458, N'Mister Knife
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (459, N'Mister Mxyzptlk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (460, N'Mister Sinister
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (461, N'Mister Zsasz
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (462, N'Mockingbird
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (463, N'MODOK
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (464, N'Mogo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (465, N'Mohinder Suresh
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (466, N'Moloch
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (467, N'Molten Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (468, N'Monarch
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (469, N'Monica Dawson
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (470, N'Moon Knight
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (471, N'Moonstone
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (472, N'Morlun
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (473, N'Morph
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (474, N'Moses Magnum
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (475, N'Mr Immortal
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (476, N'Mr Incredible
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (477, N'Ms Marvel II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (478, N'Multiple Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (479, N'Mysterio
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (480, N'Mystique
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (481, N'Namor
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (482, N'Namor
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (483, N'Namora
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (484, N'Namorita
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (485, N'Naruto Uzumaki
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (486, N'Nathan Petrelli
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (487, N'Nebula
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (488, N'Negasonic Teenage Warhead
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (489, N'Nick Fury
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (490, N'Nightcrawler
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (491, N'Nightwing
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (492, N'Niki Sanders
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (493, N'Nina Theroux
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (494, N'Nite Owl II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (495, N'Northstar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (496, N'Nova
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (497, N'Nova
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (498, N'Odin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (499, N'Offspring
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (500, N'Omega Red
')
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (501, N'Omniscient
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (502, N'One Punch Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (503, N'One-Above-All
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (504, N'Onslaught
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (505, N'Oracle
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (506, N'Osiris
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (507, N'Overtkill
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (508, N'Ozymandias
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (509, N'Parademon
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (510, N'Paul Blart
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (511, N'Penance
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (512, N'Penance I
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (513, N'Penance II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (514, N'Penguin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (515, N'Phantom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (516, N'Phantom Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (517, N'Phoenix
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (518, N'Plantman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (519, N'Plastic Lad
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (520, N'Plastic Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (521, N'Plastique
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (522, N'Poison Ivy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (523, N'Polaris
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (524, N'Power Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (525, N'Power Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (526, N'Predator
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (527, N'Professor X
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (528, N'Professor Zoom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (529, N'Psylocke
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (530, N'Punisher
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (531, N'Purple Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (532, N'Pyro
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (533, N'Q
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (534, N'Quantum
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (535, N'Question
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (536, N'Quicksilver
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (537, N'Quill
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (538, N'Ra''s Al Ghul
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (539, N'Rachel Pirzad
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (540, N'Rambo
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (541, N'Raphael
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (542, N'Raven
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (543, N'Ray
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (544, N'Razor-Fist II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (545, N'Red Arrow
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (546, N'Red Hood
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (547, N'Red Hulk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (548, N'Red Mist
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (549, N'Red Robin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (550, N'Red Skull
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (551, N'Red Tornado
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (552, N'Redeemer II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (553, N'Redeemer III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (554, N'Renata Soliz
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (555, N'Rey
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (556, N'Rhino
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (557, N'Rick Flag
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (558, N'Riddler
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (559, N'Rip Hunter
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (560, N'Ripcord
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (561, N'Robin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (562, N'Robin II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (563, N'Robin III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (564, N'Robin V
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (565, N'Robin VI
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (566, N'Rocket Raccoon
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (567, N'Rogue
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (568, N'Ronin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (569, N'Rorschach
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (570, N'Sabretooth
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (571, N'Sage
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (572, N'Sandman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (573, N'Sasquatch
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (574, N'Sauron
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (575, N'Savage Dragon
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (576, N'Scarecrow
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (577, N'Scarlet Spider
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (578, N'Scarlet Spider II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (579, N'Scarlet Witch
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (580, N'Scorpia
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (581, N'Scorpion
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (582, N'Sebastian Shaw
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (583, N'Sentry
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (584, N'Shadow King
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (585, N'Shadow Lass
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (586, N'Shadowcat
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (587, N'Shang-Chi
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (588, N'Shatterstar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (589, N'She-Hulk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (590, N'She-Thing
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (591, N'Shocker
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (592, N'Shriek
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (593, N'Shrinking Violet
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (594, N'Sif
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (595, N'Silk
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (596, N'Silk Spectre
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (597, N'Silk Spectre II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (598, N'Silver Surfer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (599, N'Silverclaw
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (600, N'Simon Baz
')
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (601, N'Sinestro
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (602, N'Siren
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (603, N'Siren II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (604, N'Siryn
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (605, N'Skaar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (606, N'Snake-Eyes
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (607, N'Snowbird
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (608, N'Sobek
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (609, N'Solomon Grundy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (610, N'Songbird
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (611, N'Space Ghost
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (612, N'Spawn
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (613, N'Spectre
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (614, N'Speedball
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (615, N'Speedy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (616, N'Speedy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (617, N'Spider-Carnage
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (618, N'Spider-Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (619, N'Spider-Gwen
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (620, N'Spider-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (621, N'Spider-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (622, N'Spider-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (623, N'Spider-Woman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (624, N'Spider-Woman II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (625, N'Spider-Woman III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (626, N'Spider-Woman IV
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (627, N'Spock
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (628, N'Spyke
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (629, N'Stacy X
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (630, N'Star-Lord
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (631, N'Stardust
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (632, N'Starfire
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (633, N'Stargirl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (634, N'Static
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (635, N'Steel
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (636, N'Stephanie Powell
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (637, N'Steppenwolf
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (638, N'Storm
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (639, N'Stormtrooper
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (640, N'Sunspot
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (641, N'Superboy
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (642, N'Superboy-Prime
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (643, N'Supergirl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (644, N'Superman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (645, N'Swamp Thing
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (646, N'Swarm
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (647, N'Sylar
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (648, N'Synch
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (649, N'T-1000
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (650, N'T-800
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (651, N'T-850
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (652, N'T-X
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (653, N'Taskmaster
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (654, N'Tempest
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (655, N'Thanos
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (656, N'The Cape
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (657, N'The Comedian
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (658, N'Thing
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (659, N'Thor
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (660, N'Thor Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (661, N'Thunderbird
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (662, N'Thunderbird II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (663, N'Thunderbird III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (664, N'Thunderstrike
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (665, N'Thundra
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (666, N'Tiger Shark
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (667, N'Tigra
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (668, N'Tinkerer
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (669, N'Titan
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (670, N'Toad
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (671, N'Toxin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (672, N'Toxin
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (673, N'Tracy Strauss
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (674, N'Trickster
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (675, N'Trigon
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (676, N'Triplicate Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (677, N'Triton
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (678, N'Two-Face
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (679, N'Ultragirl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (680, N'Ultron
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (681, N'Utgard-Loki
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (682, N'Vagabond
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (683, N'Valerie Hart
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (684, N'Valkyrie
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (685, N'Vanisher
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (686, N'Vegeta
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (687, N'Venom
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (688, N'Venom II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (689, N'Venom III
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (690, N'Venompool
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (691, N'Vertigo II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (692, N'Vibe
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (693, N'Vindicator
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (694, N'Vindicator
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (695, N'Violator
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (696, N'Violet Parr
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (697, N'Vision
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (698, N'Vision II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (699, N'Vixen
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (700, N'Vulcan
')
GO
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (701, N'Vulture
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (702, N'Walrus
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (703, N'War Machine
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (704, N'Warbird
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (705, N'Warlock
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (706, N'Warp
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (707, N'Warpath
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (708, N'Wasp
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (709, N'Watcher
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (710, N'Weapon XI
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (711, N'White Canary
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (712, N'White Queen
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (713, N'Wildfire
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (714, N'Winter Soldier
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (715, N'Wiz Kid
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (716, N'Wolfsbane
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (717, N'Wolverine
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (718, N'Wonder Girl
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (719, N'Wonder Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (720, N'Wonder Woman
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (721, N'Wondra
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (722, N'Wyatt Wingfoot
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (723, N'X-23
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (724, N'X-Man
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (725, N'Yellow Claw
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (726, N'Yellowjacket
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (727, N'Yellowjacket II
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (728, N'Ymir
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (729, N'Yoda
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (730, N'Zatanna
')
INSERT [dbo].[tblAllComicCharacters] ([Id], [CharacterName]) VALUES (731, N'Zoom')
SET IDENTITY_INSERT [dbo].[tblFeedbackEntries] ON 

INSERT [dbo].[tblFeedbackEntries] ([Id], [Username], [EmailAddress], [Reason], [Title], [Detail], [DateTime], [Mobile]) VALUES (1, N'Jack', N'jack@gmail.com', N'Liked the website', N'It''s really good website', N'
come on man. I am giving your feedback doesn''t mean you r good.
', CAST(N'2019-07-07T21:47:16.487' AS DateTime), N'8087615528')
SET IDENTITY_INSERT [dbo].[tblFeedbackEntries] OFF
SET IDENTITY_INSERT [dbo].[tblUserFavouriteCharacters] ON 

INSERT [dbo].[tblUserFavouriteCharacters] ([Id], [UserName], [FavCharId]) VALUES (5, N'Jack', 720)
INSERT [dbo].[tblUserFavouriteCharacters] ([Id], [UserName], [FavCharId]) VALUES (6, N'Jack', 659)
SET IDENTITY_INSERT [dbo].[tblUserFavouriteCharacters] OFF
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([Id], [Username], [Password], [AccountCreationDate], [EmailAddress], [LastLoginDateTime], [LoginCount]) VALUES (1, N'Jack', N'jack@123', CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'jack@gmail.com', CAST(N'2019-07-07T21:58:22.757' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
USE [master]
GO
ALTER DATABASE [JacksMarvel_db] SET  READ_WRITE 
GO
