
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/07/2019 20:57:45
-- Generated from EDMX file: F:\myProjects\JacksMarvel - LocalSQL\JacksMarvel\Models\JackMarvelDBDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [JacksMarvel_db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tblAllComicCharacters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblAllComicCharacters];
GO
IF OBJECT_ID(N'[dbo].[tblFeedbackEntry]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblFeedbackEntry];
GO
IF OBJECT_ID(N'[dbo].[tblUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblUser];
GO
IF OBJECT_ID(N'[dbo].[tblUserFavouriteCharacter]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblUserFavouriteCharacter];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tblUsers'
CREATE TABLE [dbo].[tblUsers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [AccountCreationDate] datetime  NULL,
    [EmailAddress] nvarchar(50)  NOT NULL,
    [LastLoginDateTime] datetime  NULL,
    [LoginCount] int  NULL
);
GO

-- Creating table 'tblAllComicCharacters'
CREATE TABLE [dbo].[tblAllComicCharacters] (
    [Id] int  NOT NULL,
    [CharacterName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'tblUserFavouriteCharacters'
CREATE TABLE [dbo].[tblUserFavouriteCharacters] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(50)  NOT NULL,
    [FavCharId] int  NOT NULL
);
GO

-- Creating table 'tblFeedbackEntries'
CREATE TABLE [dbo].[tblFeedbackEntries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(50)  NOT NULL,
    [EmailAddress] nvarchar(50)  NOT NULL,
    [Reason] nvarchar(50)  NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Detail] nvarchar(500)  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Mobile] nvarchar(15)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'tblUsers'
ALTER TABLE [dbo].[tblUsers]
ADD CONSTRAINT [PK_tblUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'tblAllComicCharacters'
ALTER TABLE [dbo].[tblAllComicCharacters]
ADD CONSTRAINT [PK_tblAllComicCharacters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'tblUserFavouriteCharacters'
ALTER TABLE [dbo].[tblUserFavouriteCharacters]
ADD CONSTRAINT [PK_tblUserFavouriteCharacters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'tblFeedbackEntries'
ALTER TABLE [dbo].[tblFeedbackEntries]
ADD CONSTRAINT [PK_tblFeedbackEntries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------