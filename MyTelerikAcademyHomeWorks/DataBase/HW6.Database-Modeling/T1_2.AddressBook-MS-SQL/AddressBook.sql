USE [master]
GO
/****** Object:  Database [AddressBook]    Script Date: 28-Sep-15 1:02:32 AM ******/
CREATE DATABASE [AddressBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ANGE\MSSQL\DATA\AddressBook.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AddressBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ANGE\MSSQL\DATA\AddressBook_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AddressBook] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AddressBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AddressBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AddressBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AddressBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AddressBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AddressBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AddressBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AddressBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AddressBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AddressBook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AddressBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AddressBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AddressBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AddressBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AddressBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AddressBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AddressBook] SET RECOVERY FULL 
GO
ALTER DATABASE [AddressBook] SET  MULTI_USER 
GO
ALTER DATABASE [AddressBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AddressBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AddressBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AddressBook] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AddressBook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AddressBook', N'ON'
GO
USE [AddressBook]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 28-Sep-15 1:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](50) NULL,
	[TownId] [int] NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 28-Sep-15 1:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
 CONSTRAINT [PK_CONTINENTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 28-Sep-15 1:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
	[ContinentId] [int] NULL,
 CONSTRAINT [PK_COUNTRY1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 28-Sep-15 1:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[AddressId] [int] NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 28-Sep-15 1:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](25) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_TOWN] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (1, N'9588 4th Street ', 12)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (2, N'6575 "Nash''ta ulitca"', 1)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (3, N'45 Bla-bla', 8)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (4, N'19 adsda', 20)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (5, N'359 Rue de Fleurs', 5)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (6, N'25 i t.n.', 16)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (7, N'23453 uyiuioy', 9)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (8, N'359 Rue de Fleurs', 5)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (9, N'Kokitsche 59', 3)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (10, N'Pesho Peshev 12', 19)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (11, N'Minka Stoeva 88', 4)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([Id], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (2, N'North America')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (3, N'South America')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (4, N'Asia')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (5, N'Australia')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (6, N'Antarctica')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (7, N'Africa')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (2, N'Germany', 1)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (3, N'Japain', 4)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (4, N'Canada', 2)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (5, N'Snowland', 6)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (6, N'China', 4)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (7, N'Australia', 5)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (8, N'Morocco', 7)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (9, N'Brazil', 3)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (10, N'Argentina', 3)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (11, N'India', 4)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (12, N'USA', 2)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (1, N'Haralambi', N'Lambov', 3)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (2, N'Paraskeva', N'Parova', 4)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (3, N'Humpty', N'Dumpty', 8)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (4, N'Maitre', N'Renard', 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (5, N'Maitre', N'Corbeau', 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (6, N'O', N'La', 9)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (8, N'Iliana', N'Raeva', 7)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (9, N'Dimitar', N'Berbatov', 5)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (1, N'Sofia                    ', 1)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (2, N'Beijing                  ', 6)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (3, N'New York                 ', 12)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (4, N'Botevgrad                ', 1)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (5, N'SnowTown                 ', 5)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (6, N'Rio De Janejro           ', 9)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (7, N'Brasilia                 ', 9)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (8, N'Rabat                    ', 8)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (9, N'Berlin                   ', 2)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (10, N'Osaka                    ', 3)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (11, N'Adelaide                 ', 7)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (12, N'Toronto                  ', 4)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (13, N'Delhi                    ', 11)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (14, N'Hamburg                  ', 2)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (15, N'Varna                    ', 1)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (16, N'Canberra                 ', 7)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (17, N'Buenos Aires             ', 10)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (18, N'Washington               ', 12)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (19, N'Changhai                 ', 6)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (20, N'Polar Lights             ', 5)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_TOWN] FOREIGN KEY([TownId])
REFERENCES [dbo].[Town] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_ADDRESS_TOWN]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CONTINENT] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continent] ([Id])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_COUNTRY_CONTINENT]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_ADDRESS] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_PERSON_ADDRESS]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_TOWN_COUNTRY] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_TOWN_COUNTRY]
GO
USE [master]
GO
ALTER DATABASE [AddressBook] SET  READ_WRITE 
GO
