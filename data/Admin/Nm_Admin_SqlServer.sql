USE [master]
GO
/****** Object:  Database [Nm_Admin]    Script Date: 2019/4/8 10:19:03 ******/
CREATE DATABASE [Nm_Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_Admin', FILENAME = N'D:\Database\SqlServer\Nm_Admin.mdf' , SIZE = 19456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Nm_Admin_log', FILENAME = N'D:\Database\SqlServer\Nm_Admin_log.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Nm_Admin] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_Admin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_Admin] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_Admin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Nm_Admin] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_Admin', N'ON'
GO
ALTER DATABASE [Nm_Admin] SET QUERY_STORE = OFF
GO
USE [Nm_Admin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2019/4/8 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LoginIP] [nvarchar](50) NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[ClosedTime] [datetime] NOT NULL,
	[ClosedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Account_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditInfo]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[Parameters] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
	[ExecutionTime] [datetime] NOT NULL,
	[ExecutionDuration] [bigint] NOT NULL,
	[BrowserInfo] [nvarchar](500) NULL,
	[Platform] [smallint] NOT NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_AuditInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button](
	[Id] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Button] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button_Permission]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Button_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Remarks] [nvarchar](255) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[ModuleCode] [varchar](50) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RouteName] [nvarchar](100) NOT NULL,
	[RouteParams] [nvarchar](500) NULL,
	[RouteQuery] [nvarchar](500) NULL,
	[Icon] [nvarchar](20) NOT NULL,
	[IconColor] [nvarchar](10) NULL,
	[Url] [nvarchar](255) NOT NULL,
	[Level] [int] NOT NULL,
	[Show] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[Target] [tinyint] NOT NULL,
	[DialogWidth] [nvarchar](20) NULL,
	[DialogHeight] [nvarchar](20) NULL,
	[DialogFullscreen] [bit] NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__menu__3214EC0736145F4E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Permission]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__menu_per__3214EC07810AB101] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleInfo]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__modulein__3214EC07FE6866D0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__permissi__3214EC0749519E5A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK__role__3214EC073DA7FC47] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__role_men__3214EC0772E9B7E0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu_Button]    Script Date: 2019/4/8 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu_Button](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RoleMenuButton] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [ClosedTime], [ClosedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'15e9e294-81d8-404e-96a6-a9ac011640d6', N'admin', N'E739279CB28CDAFD7373618313803524', N'管理员', N'', N'wenju1991@163.com', CAST(N'2019-04-08T10:17:32.157' AS DateTime), N'0.0.0.1', 1, CAST(N'2018-12-05T21:39:54.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-03-25T11:59:16.273' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2018-12-05T21:39:54.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-02-25T19:48:11.197' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Account_Role] ON 

INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (1, N'15e9e294-81d8-404e-96a6-a9ac011640d6', N'82ef1b85-c767-40d9-af6c-aa1400f25779')
INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (13, N'e8308c6b-7f4a-4b1f-94ab-aa1f00ab9025', N'1f84a3f3-1aa5-4914-acda-aa1f00a91287')
SET IDENTITY_INSERT [dbo].[Account_Role] OFF
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'21af0402-d0fe-49f1-bf09-aa1c00fc4899', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'添加', N'add', N'admin_moduleinfo_add', CAST(N'2019-03-26T15:18:32.187' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:50:12.283' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2526bfc7-0610-4133-9c8f-aa1c01036ab0', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'删除', N'close', N'admin_moduleinfo_del', CAST(N'2019-03-26T15:44:30.450' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:50:16.127' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c26bd80e-b8fa-4113-a68a-aa1c0105c52e', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'编辑', N'edit', N'admin_moduleinfo_edit', CAST(N'2019-03-26T15:53:04.573' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:50:19.237' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5279a702-9d7f-49e5-892c-aa1c012b32cf', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'添加', N'', N'admin_menu_add', CAST(N'2019-03-26T18:09:20.897' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T16:22:11.820' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ca56f057-09aa-4faa-b647-aa1c012b5931', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'编辑', N'', N'admin_menu_edit', CAST(N'2019-03-26T18:09:53.650' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T16:22:15.477' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a26b7098-140e-4f24-8f07-aa1c012b7207', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'删除', N'', N'admin_menu_del', CAST(N'2019-03-26T18:10:14.847' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T16:22:18.793' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2cf548f4-90e9-4987-b203-aa1c012d1301', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'权限绑定', N'', N'admin_menu_bind_permission', CAST(N'2019-03-26T18:16:10.663' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T16:22:21.240' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'按钮绑定', N'', N'admin_menu_bind_button', CAST(N'2019-03-26T18:18:52.740' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T16:22:26.123' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'547fd71a-8a82-4141-84fd-aa1d01139752', N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'添加', N'', N'admin_permission_add', CAST(N'2019-03-27T16:43:23.787' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T16:43:23.787' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3978d596-12ea-4363-9fcc-aa1d011b2d43', N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'编辑', N'', N'admin_permission_edit', CAST(N'2019-03-27T17:11:00.910' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:11:00.910' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ac6f70af-3326-4471-9ce6-aa1d011b46f8', N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'删除', N'', N'admin_permission_del', CAST(N'2019-03-27T17:11:22.847' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:11:22.847' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8eacfa0e-69a7-4b35-aeab-aa2300aa77e0', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'添加', N'add', N'admin_role_add', CAST(N'2019-04-02T10:20:39.357' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:20:39.357' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'722a74ef-0a92-4a70-9973-aa2300aa90ed', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'编辑', N'edit', N'admin_role_edit', CAST(N'2019-04-02T10:21:00.737' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:21:00.737' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6800b9f7-32b6-4044-b677-aa2300aaa33c', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'删除', N'delete', N'admin_role_del', CAST(N'2019-04-02T10:21:16.357' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:21:16.357' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4ea55832-6264-4956-b34a-aa2300aab90e', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'菜单', N'menu', N'admin_role_bind_menu', CAST(N'2019-04-02T10:21:34.977' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:50:17.143' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6bdf66c9-5624-4bfe-8cc9-aa2300b08918', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'添加', N'', N'admin_account_add', CAST(N'2019-04-02T10:42:44.770' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:42:44.770' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'927b43de-bd23-4007-86fe-aa2300b0a7d9', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'编辑', N'', N'admin_account_edit', CAST(N'2019-04-02T10:43:11.013' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:43:11.013' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0c371c99-5ea2-4061-a17d-aa2300b0ee09', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'删除', N'', N'admin_account_del', CAST(N'2019-04-02T10:44:10.907' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:44:10.907' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'36ddc405-a4d6-42bd-9ac0-aa2300b10bce', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'重置密码', N'', N'admin_account_reset_password', CAST(N'2019-04-02T10:44:36.313' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:44:36.313' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
SET IDENTITY_INSERT [dbo].[Button_Permission] ON 

INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (6, N'2526bfc7-0610-4133-9c8f-aa1c01036ab0', N'a267022e-25ab-4e5f-b3e5-aa1c00fbb42c')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (7, N'c26bd80e-b8fa-4113-a68a-aa1c0105c52e', N'1fe78ded-1973-47f3-9830-aa1c00fbb42c')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (8, N'c26bd80e-b8fa-4113-a68a-aa1c0105c52e', N'5517f181-886d-434a-baf4-aa1c00fbb42c')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (9, N'21af0402-d0fe-49f1-bf09-aa1c00fc4899', N'a008b900-d85f-4d66-82ff-aa1c00fbb42c')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (17, N'a26b7098-140e-4f24-8f07-aa1c012b7207', N'6619d9d7-494d-4444-943e-aa1c012bdbec')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (20, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'4381b7d3-6768-46c3-8288-aa1c012dfba9')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (21, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'd0b19f7e-f441-4b82-8317-aa1c012cac7e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (22, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'537f1c60-eee4-49e3-80a7-aa1c012dfba9')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (23, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'ded41e8f-04a2-4967-8c1f-aa1c012dfba9')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (24, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'716e3fb5-2f66-455a-a87c-aa1c012dfba9')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (25, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'8efeb582-9c09-4bc2-b4d4-aa1c012dfba9')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (26, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'300c4109-de95-4fa7-9c29-aa1c012e2481')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (27, N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0', N'90caaf4a-eed4-47ee-bf63-aa1c012e39cf')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (29, N'359300c4-7abe-45cf-8d83-aa1d011b1b05', N'25f4f261-31e0-4494-bb91-aa1d0119ad21')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (30, N'3978d596-12ea-4363-9fcc-aa1d011b2d43', N'3faf1f25-ef62-49bd-a5a7-aa1d011992d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (31, N'3978d596-12ea-4363-9fcc-aa1d011b2d43', N'fe678857-3e3c-4bb1-8e83-aa1d011992d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (32, N'ac6f70af-3326-4471-9ce6-aa1d011b46f8', N'7d4f7434-df63-4c7c-a7ae-aa1d011992d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (33, N'8eacfa0e-69a7-4b35-aeab-aa2300aa77e0', N'9dad7acc-caf8-4d03-9d65-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (34, N'722a74ef-0a92-4a70-9973-aa2300aa90ed', N'd932c5b6-46c4-4e7c-beb6-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (35, N'722a74ef-0a92-4a70-9973-aa2300aa90ed', N'e8f9835b-202a-4a39-b7d1-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (36, N'6800b9f7-32b6-4044-b677-aa2300aaa33c', N'55dcac67-9eab-47cc-a33a-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (37, N'4ea55832-6264-4956-b34a-aa2300aab90e', N'e8bdc962-ee75-411d-986b-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (38, N'4ea55832-6264-4956-b34a-aa2300aab90e', N'3ec906da-70d1-47bc-90c6-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (39, N'4ea55832-6264-4956-b34a-aa2300aab90e', N'10af1d99-4cd5-4c8f-8f2d-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (40, N'4ea55832-6264-4956-b34a-aa2300aab90e', N'914e1075-ed2e-4ee2-87d8-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (44, N'927b43de-bd23-4007-86fe-aa2300b0a7d9', N'a72791d6-a213-478d-bd5c-aa1e00b216dd')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (45, N'927b43de-bd23-4007-86fe-aa2300b0a7d9', N'93fde69e-3265-4068-9613-aa1e00b216dd')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (46, N'927b43de-bd23-4007-86fe-aa2300b0a7d9', N'f8d69c57-0f6f-4297-bdae-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (47, N'6bdf66c9-5624-4bfe-8cc9-aa2300b08918', N'a2a9122e-1a36-4a51-b584-aa1e00b216dd')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (48, N'6bdf66c9-5624-4bfe-8cc9-aa2300b08918', N'f8d69c57-0f6f-4297-bdae-aa2300aa3b4e')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (49, N'0c371c99-5ea2-4061-a17d-aa2300b0ee09', N'0706379c-e037-4353-b1d7-aa1e00b216dd')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (50, N'36ddc405-a4d6-42bd-9ac0-aa2300b10bce', N'439519d3-c3c4-45cf-85c3-aa1e00b216dd')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (51, N'5279a702-9d7f-49e5-892c-aa1c012b32cf', N'9d855708-833e-4b61-b3a6-aa1c012bdbec')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (52, N'5279a702-9d7f-49e5-892c-aa1c012b32cf', N'2dc42aaf-c6c0-4e2e-87f0-aa1c00fbec81')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (53, N'ca56f057-09aa-4faa-b647-aa1c012b5931', N'9e6bfed4-2227-4f84-9f34-aa1c012bdbec')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (54, N'ca56f057-09aa-4faa-b647-aa1c012b5931', N'3f692824-9e21-48b9-9830-aa1c012bdbec')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (55, N'ca56f057-09aa-4faa-b647-aa1c012b5931', N'2dc42aaf-c6c0-4e2e-87f0-aa1c00fbec81')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (56, N'2cf548f4-90e9-4987-b203-aa1c012d1301', N'14b80672-7f12-4a4d-a55b-aa1c012c7e77')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (57, N'2cf548f4-90e9-4987-b203-aa1c012d1301', N'07d06d66-86fb-4f16-a5b4-aa1c012c952b')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (58, N'547fd71a-8a82-4141-84fd-aa1d01139752', N'cf2be404-97f6-4a00-9cd4-aa1d011992d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (59, N'547fd71a-8a82-4141-84fd-aa1d01139752', N'6c532827-28bb-445c-a920-aa1e00b16210')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (60, N'547fd71a-8a82-4141-84fd-aa1d01139752', N'7723ce46-9ca4-435d-9c66-aa1e00b1620f')
SET IDENTITY_INSERT [dbo].[Button_Permission] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (15, N'sys_title', N'通用权限管理系统', N'系统标题', CAST(N'2019-03-29T09:31:07.913' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-08T10:12:00.303' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (16, N'sys_logo', N'/img/logo.png', N'系统Logo', CAST(N'2019-03-29T09:31:07.913' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-08T10:12:00.303' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (17, N'sys_home', N'/default', N'系统首页', CAST(N'2019-03-29T09:31:07.917' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-08T10:12:00.303' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (18, N'sys_button_permission', N'True', N'启用按钮权限', CAST(N'2019-03-29T09:31:07.920' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-08T10:12:00.307' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (19, N'sys_auditing', N'True', N'启用审计日志', CAST(N'2019-03-29T09:31:07.923' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-08T10:12:00.323' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (20, N'sys_toolbar_fullscreen', N'True', N'显示工具栏全屏按钮', CAST(N'2019-03-29T09:31:07.930' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-08T10:12:00.327' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (21, N'sys_toolbar_skin', N'True', N'显示工具栏皮肤按钮', CAST(N'2019-03-29T09:31:07.933' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-08T10:12:00.347' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
SET IDENTITY_INSERT [dbo].[Config] OFF
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e43f672e-3fae-11e9-b821-a937310db87f', N'', 0, N'00000000-0000-0000-0000-000000000000', N'权限管理', N'', NULL, NULL, N'verifycode', N'', N'', 0, 1, 0, 0, NULL, NULL, 1, N'', CAST(N'2019-03-06T09:26:39.760' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T15:45:33.857' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'admin', 1, N'e43f672e-3fae-11e9-b821-a937310db87f', N'账户管理', N'admin_account', NULL, NULL, N'user', N'', N'', 1, 1, 4, 0, NULL, NULL, 1, N'', CAST(N'2019-03-20T16:28:52.793' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:49:38.263' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6500f416-dd92-44fa-afd2-aa1c00debdf3', N'admin', 1, N'e43f672e-3fae-11e9-b821-a937310db87f', N'审计日志', N'admin_auditinfo', NULL, NULL, N'log', N'', N'', 1, 1, 5, 0, NULL, NULL, 1, N'', CAST(N'2019-03-26T13:30:58.580' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:49:47.903' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'46dbe757-04d1-4528-97bf-aa1e00f3a479', N'admin', 1, N'e43f672e-3fae-11e9-b821-a937310db87f', N'系统配置', N'admin_config_system', NULL, NULL, N'system', N'', N'', 1, 1, 6, 0, NULL, NULL, 1, N'', CAST(N'2019-03-28T14:47:04.477' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T14:49:20.187' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f6d861c2-452c-4c4e-b19f-aa25010c3356', N'', 2, N'00000000-0000-0000-0000-000000000000', N'ElementUI', N'', N'', N'', N'log', N'', N'http://element-cn.eleme.io', 0, 1, 4, 2, N'1000px', N'500px', 0, N'', CAST(N'2019-04-04T16:16:29.253' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-04T16:36:57.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'admin', 1, N'e43f672e-3fae-11e9-b821-a937310db87f', N'模块管理', N'admin_moduleinfo', NULL, NULL, N'app', N'', N'', 1, 1, 0, 0, NULL, NULL, 1, N'', CAST(N'2019-03-06T11:27:17.987' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:46:40.703' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'admin', 1, N'e43f672e-3fae-11e9-b821-a937310db87f', N'权限管理', N'admin_permission', NULL, NULL, N'verifycode', N'', N'', 1, 1, 1, 0, NULL, NULL, 1, N'', CAST(N'2019-03-06T15:09:02.660' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:46:54.250' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'admin', 1, N'e43f672e-3fae-11e9-b821-a937310db87f', N'角色管理', N'admin_role', NULL, NULL, N'user', N'', N'', 1, 1, 3, 0, NULL, NULL, 1, N'', CAST(N'2019-03-06T15:14:56.813' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:48:59.767' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'admin', 1, N'e43f672e-3fae-11e9-b821-a937310db87f', N'菜单管理', N'admin_menu', NULL, NULL, N'menu', N'', N'', 1, 1, 2, 0, NULL, NULL, 1, N'', CAST(N'2019-03-06T15:12:43.797' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:48:47.643' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
SET IDENTITY_INSERT [dbo].[Menu_Permission] ON 

INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (48, N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'9c520dfd-68e5-4b35-b33c-aa1c00fbb42a')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (51, N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'01c7dbb1-f420-4775-9987-aa1d011992d6')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (52, N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'89919bbe-6a4d-4985-8d0a-aa1e00b216dd')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (53, N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'd613b9ea-e3b7-4e05-ba21-aa2300aa3b4d')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (54, N'6500f416-dd92-44fa-afd2-aa1c00debdf3', N'92b008ef-0c53-46bb-9d2d-aa2300b16c65')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (55, N'6500f416-dd92-44fa-afd2-aa1c00debdf3', N'149d0880-0e75-4941-91ee-aa2300b16c65')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (56, N'46dbe757-04d1-4528-97bf-aa1e00f3a479', N'2cfd16ae-e784-420c-a2e7-aa2300b19a23')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (57, N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'37aef09b-8817-4a6f-9ea2-aa1c012bdbeb')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (58, N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'4aba9013-2c8b-4656-b884-aa1c012c42a5')
SET IDENTITY_INSERT [dbo].[Menu_Permission] OFF
INSERT [dbo].[ModuleInfo] ([Id], [Name], [Code], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'87ebd858-3e1d-11e9-979f-d807b3e52901', N'权限管理', N'admin', N'', CAST(N'2019-03-04T09:33:36.677' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T15:01:57.640' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9c520dfd-68e5-4b35-b33c-aa1c00fbb42a', N'模块-查询', N'admin', N'moduleinfo', N'query', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a008b900-d85f-4d66-82ff-aa1c00fbb42c', N'模块-添加', N'admin', N'moduleinfo', N'add', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1fe78ded-1973-47f3-9830-aa1c00fbb42c', N'模块-编辑', N'admin', N'moduleinfo', N'edit', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a267022e-25ab-4e5f-b3e5-aa1c00fbb42c', N'模块-删除', N'admin', N'moduleinfo', N'delete', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5517f181-886d-434a-baf4-aa1c00fbb42c', N'模块-更新', N'admin', N'moduleinfo', N'update', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T15:16:25.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2dc42aaf-c6c0-4e2e-87f0-aa1c00fbec81', N'模块-下拉列表', N'admin', N'moduleinfo', N'select', CAST(N'2019-03-26T15:17:13.493' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T15:17:13.493' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'37aef09b-8817-4a6f-9ea2-aa1c012bdbeb', N'菜单-查询', N'admin', N'menu', N'query', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6619d9d7-494d-4444-943e-aa1c012bdbec', N'菜单-删除', N'admin', N'menu', N'delete', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3f692824-9e21-48b9-9830-aa1c012bdbec', N'菜单-更新', N'admin', N'menu', N'update', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9e6bfed4-2227-4f84-9f34-aa1c012bdbec', N'菜单-编辑', N'admin', N'menu', N'edit', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9d855708-833e-4b61-b3a6-aa1c012bdbec', N'菜单-添加', N'admin', N'menu', N'add', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:11:45.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4aba9013-2c8b-4656-b884-aa1c012c42a5', N'菜单-树', N'admin', N'menu', N'tree', CAST(N'2019-03-26T18:13:12.860' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:13:12.860' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c4a8780e-7d67-4f40-b8f8-aa1c012c66a6', N'菜单-详情', N'admin', N'menu', N'details', CAST(N'2019-03-26T18:13:43.583' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:13:43.583' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'14b80672-7f12-4a4d-a55b-aa1c012c7e77', N'菜单-权限列表', N'admin', N'menu', N'permissionlist', CAST(N'2019-03-26T18:14:03.907' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:14:03.907' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'07d06d66-86fb-4f16-a5b4-aa1c012c952b', N'菜单-绑定权限', N'admin', N'menu', N'bindpermission', CAST(N'2019-03-26T18:14:23.283' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:14:23.283' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd0b19f7e-f441-4b82-8317-aa1c012cac7e', N'菜单-获取按钮列表', N'admin', N'menu', N'buttonlist', CAST(N'2019-03-26T18:14:43.170' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:14:43.170' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'537f1c60-eee4-49e3-80a7-aa1c012dfba9', N'按钮-添加', N'admin', N'button', N'add', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4381b7d3-6768-46c3-8288-aa1c012dfba9', N'按钮-查询', N'admin', N'button', N'query', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ded41e8f-04a2-4967-8c1f-aa1c012dfba9', N'按钮-更新', N'admin', N'button', N'update', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'716e3fb5-2f66-455a-a87c-aa1c012dfba9', N'按钮-删除', N'admin', N'button', N'delete', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8efeb582-9c09-4bc2-b4d4-aa1c012dfba9', N'按钮-编辑', N'admin', N'button', N'edit', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:19:29.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'300c4109-de95-4fa7-9c29-aa1c012e2481', N'按钮-权限列表', N'admin', N'button', N'permissionlist', CAST(N'2019-03-26T18:20:04.050' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:20:04.050' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'90caaf4a-eed4-47ee-bf63-aa1c012e39cf', N'按钮-权限绑定', N'admin', N'button', N'bindpermission', CAST(N'2019-03-26T18:20:22.213' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-26T18:20:22.213' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fe678857-3e3c-4bb1-8e83-aa1d011992d6', N'权限-更新', N'admin', N'permission', N'update', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'01c7dbb1-f420-4775-9987-aa1d011992d6', N'权限-查询', N'admin', N'permission', N'query', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cf2be404-97f6-4a00-9cd4-aa1d011992d6', N'权限-添加', N'admin', N'permission', N'add', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3faf1f25-ef62-49bd-a5a7-aa1d011992d6', N'权限-编辑', N'admin', N'permission', N'edit', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7d4f7434-df63-4c7c-a7ae-aa1d011992d6', N'权限-删除', N'admin', N'permission', N'delete', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:05:10.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'25f4f261-31e0-4494-bb91-aa1d0119ad21', N'权限-批量添加', N'admin', N'permission', N'batchadd', CAST(N'2019-03-27T17:05:33.100' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-27T17:05:33.100' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7723ce46-9ca4-435d-9c66-aa1e00b1620f', N'权限-获取控制器下拉列表', N'admin', N'permission', N'controllers', CAST(N'2019-03-28T10:45:49.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:45:49.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6c532827-28bb-445c-a920-aa1e00b16210', N'权限-获取控制器下拉列表', N'admin', N'permission', N'actions', CAST(N'2019-03-28T10:45:49.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:45:49.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bb3e491a-3235-42ae-819e-aa1e00b216dd', N'账户管理-绑定角色', N'admin', N'account', N'bindrole', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'439519d3-c3c4-45cf-85c3-aa1e00b216dd', N'账户管理-重置密码', N'admin', N'account', N'resetpassword', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'89919bbe-6a4d-4985-8d0a-aa1e00b216dd', N'账户管理-查询', N'admin', N'account', N'query', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'93fde69e-3265-4068-9613-aa1e00b216dd', N'账户管理-更新', N'admin', N'account', N'update', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0706379c-e037-4353-b1d7-aa1e00b216dd', N'账户管理-删除', N'admin', N'account', N'delete', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a2a9122e-1a36-4a51-b584-aa1e00b216dd', N'账户管理-添加', N'admin', N'account', N'add', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a72791d6-a213-478d-bd5c-aa1e00b216dd', N'账户管理-编辑', N'admin', N'account', N'edit', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-28T10:48:24.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd613b9ea-e3b7-4e05-ba21-aa2300aa3b4d', N'角色管理-查询', N'admin', N'role', N'query', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'914e1075-ed2e-4ee2-87d8-aa2300aa3b4e', N'角色管理-获取角色的关联菜单列表', N'admin', N'role', N'menulist', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'10af1d99-4cd5-4c8f-8f2d-aa2300aa3b4e', N'角色管理-获取角色关联的菜单按钮列表', N'admin', N'role', N'menubuttonlist', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3ec906da-70d1-47bc-90c6-aa2300aa3b4e', N'角色管理-绑定菜单', N'admin', N'role', N'bindmenu', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e8bdc962-ee75-411d-986b-aa2300aa3b4e', N'角色管理-绑定菜单按钮', N'admin', N'role', N'bindmenubutton', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9dad7acc-caf8-4d03-9d65-aa2300aa3b4e', N'角色管理-添加', N'admin', N'role', N'add', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'55dcac67-9eab-47cc-a33a-aa2300aa3b4e', N'角色管理-删除', N'admin', N'role', N'delete', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e8f9835b-202a-4a39-b7d1-aa2300aa3b4e', N'角色管理-修改', N'admin', N'role', N'update', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f8d69c57-0f6f-4297-bdae-aa2300aa3b4e', N'角色管理-下拉列表数据', N'admin', N'role', N'select', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd932c5b6-46c4-4e7c-beb6-aa2300aa3b4e', N'角色管理-编辑', N'admin', N'role', N'edit', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:19:47.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'149d0880-0e75-4941-91ee-aa2300b16c65', N'审计信息-查询', N'admin', N'auditinfo', N'query', CAST(N'2019-04-02T10:45:58.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:45:58.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'92b008ef-0c53-46bb-9d2d-aa2300b16c65', N'审计信息-详情', N'admin', N'auditinfo', N'details', CAST(N'2019-04-02T10:45:58.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:45:58.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2cfd16ae-e784-420c-a2e7-aa2300b19a23', N'配置项管理-修改系统配置', N'admin', N'config', N'systemconfigupdate', CAST(N'2019-04-02T10:46:37.000' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-04-02T10:46:37.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Role] ([Id], [Name], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'系统管理员', N'', CAST(N'2019-03-18T14:42:20.343' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-18T14:42:20.343' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', 0, CAST(N'2019-03-26T09:41:44.920' AS DateTime), NULL)
INSERT [dbo].[Role] ([Id], [Name], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'1f84a3f3-1aa5-4914-acda-aa1f00a91287', N'测试', N'', CAST(N'2019-03-29T10:15:34.420' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', CAST(N'2019-03-29T10:15:34.420' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6', 1, CAST(N'2019-04-08T10:07:47.430' AS DateTime), N'15e9e294-81d8-404e-96a6-a9ac011640d6')
SET IDENTITY_INSERT [dbo].[Role_Menu] ON 

INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (113, N'1f84a3f3-1aa5-4914-acda-aa1f00a91287', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (114, N'1f84a3f3-1aa5-4914-acda-aa1f00a91287', N'e43f672e-3fae-11e9-b821-a937310db87f')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (270, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'e43f672e-3fae-11e9-b821-a937310db87f')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (271, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (272, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'b8db98c2-3fde-11e9-a373-f5a8791f61db')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (273, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (274, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (275, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (276, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'6500f416-dd92-44fa-afd2-aa1c00debdf3')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (277, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'46dbe757-04d1-4528-97bf-aa1e00f3a479')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (278, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'f6d861c2-452c-4c4e-b19f-aa25010c3356')
SET IDENTITY_INSERT [dbo].[Role_Menu] OFF
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] ON 

INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (16, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'21af0402-d0fe-49f1-bf09-aa1c00fc4899')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (17, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'5279a702-9d7f-49e5-892c-aa1c012b32cf')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (18, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'ca56f057-09aa-4faa-b647-aa1c012b5931')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (19, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'a26b7098-140e-4f24-8f07-aa1c012b7207')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (20, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'2cf548f4-90e9-4987-b203-aa1c012d1301')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (21, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'3c9462dc-3fdf-11e9-a373-f5a8791f61db', N'aa3f5190-daf2-4da0-a450-aa1c012dd0f0')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (22, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'2526bfc7-0610-4133-9c8f-aa1c01036ab0')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (23, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'c26bd80e-b8fa-4113-a68a-aa1c0105c52e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (24, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'547fd71a-8a82-4141-84fd-aa1d01139752')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (26, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'3978d596-12ea-4363-9fcc-aa1d011b2d43')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (27, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'ac6f70af-3326-4471-9ce6-aa1d011b46f8')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (28, N'1f84a3f3-1aa5-4914-acda-aa1f00a91287', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'21af0402-d0fe-49f1-bf09-aa1c00fc4899')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (29, N'1f84a3f3-1aa5-4914-acda-aa1f00a91287', N'be90f6e0-3fbf-11e9-bed0-b0df8c166ead', N'2526bfc7-0610-4133-9c8f-aa1c01036ab0')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (30, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'8eacfa0e-69a7-4b35-aeab-aa2300aa77e0')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (31, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'722a74ef-0a92-4a70-9973-aa2300aa90ed')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (32, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'6800b9f7-32b6-4044-b677-aa2300aaa33c')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (33, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'8bdc0b28-3fdf-11e9-a373-f5a8791f61db', N'4ea55832-6264-4956-b34a-aa2300aab90e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (34, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'6bdf66c9-5624-4bfe-8cc9-aa2300b08918')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (35, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'927b43de-bd23-4007-86fe-aa2300b0a7d9')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (36, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'0c371c99-5ea2-4061-a17d-aa2300b0ee09')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (37, N'82ef1b85-c767-40d9-af6c-aa1400f25779', N'25887a8b-e3e0-4a05-b9c0-aa16010f9aa1', N'36ddc405-a4d6-42bd-9ac0-aa2300b10bce')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (38, N'1f84a3f3-1aa5-4914-acda-aa1f00a91287', N'b8db98c2-3fde-11e9-a373-f5a8791f61db', N'547fd71a-8a82-4141-84fd-aa1d01139752')
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] OFF
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_account_LastLoginTime]  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_account_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  CONSTRAINT [DF_AuditInfo_ExecutionTime]  DEFAULT (getdate()) FOR [ExecutionTime]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  CONSTRAINT [DF_AuditInfo_ExecutionDuration]  DEFAULT ((0)) FOR [ExecutionDuration]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  CONSTRAINT [DF_AuditInfo_Platform]  DEFAULT ((0)) FOR [Platform]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_DomId]  DEFAULT (N'') FOR [Code]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_DialogFullscreen]  DEFAULT ((1)) FOR [DialogFullscreen]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[ModuleInfo] ADD  CONSTRAINT [DF_ModuleInfo_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[ModuleInfo] ADD  CONSTRAINT [DF_ModuleInfo_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：0、未激活 1、正常 2、禁用 3、注销' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法开始执行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'ExecutionTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法执行总用时(ms)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'ExecutionDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'BrowserInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuditInfo', @level2type=N'COLUMN',@level2name=N'Platform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'ButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型，0、节点 1、链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteParams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteQuery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IconColor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Show'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打开方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogHeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框可全屏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogFullscreen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleInfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
USE [master]
GO
ALTER DATABASE [Nm_Admin] SET  READ_WRITE 
GO
