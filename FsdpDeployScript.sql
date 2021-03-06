/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT IF EXISTS [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/6/2020 9:50:19 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[CourseId] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[CourseDescription] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFilename] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[LessonId] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 5/6/2020 9:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Company] [varchar](50) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202004271834249_InitialCreate', N'TrinityLMS.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE338127D5F60FE41D0D3CE2263E532DDE80DEC19649C643798DCD04E1AFBD6A025DA215AA234129549B0982FDB87FDA4FD852D4A942CF1A28BADD8CEA0818645164F158B45B2582CE67FFFF9EFF8E797C0B79E719C90904EECA3D1A16D61EA861EA1CB899DB2C50F9FEC9F7FFAEE2FE30B2F78B1BE1474279C0E5AD264623F31169D3A4EE23EE10025A380B87198840B3672C3C0415EE81C1F1EFEDD393A723040D8806559E3CF296524C0D9077C4E43EAE288A5C8BF093DEC27A21C6A6619AA758B029C44C8C513FB212694B0D7EB9BD9E8F16A74F3653ACADBD8D6994F10C833C3FEC2B610A521430CA43D7D4CF08CC5215DCE222840FEC36B84816E81FC048B5E9CAEC8BB76E8F09877C859352CA0DC346161D013F0E84468C8919BAFA567BBD420E8F00274CD5E79AF333D4EEC2B0F67459F431F1420333C9DFA31279ED837258BB324BAC56C54341CE5909731C0FD1EC6DF4655C403AB73BB83D2A28E4787FCDF81354D7D96C6784271CA62E41F58F7E9DC27EEAFF8F521FC86E9E4E468BE38F9F4E123F24E3EFE884F3E547B0A7D05BA5A0114DDC7618463900D2FCAFEDB96536FE7C80DCB669536B956C0966072D8D60D7AB9C674C99E60DA1C7FB2AD4BF282BDA24418D723253097A0118B53F8BC4D7D1FCD7D5CD63B8D3CF9FF0D5C8F3F7C1C84EB2D7A26CB6CE825FE30716298579FB19FD5264F24CAA7576DBCBF0AB2CB380CF877DDBEF2DAAFB3308D5DDE99D048F280E2256675E9C6CECA783B9934871ADEAC0BD4FD376D2EA96ADE5A52DEA1756642C162DBB3A190F76DF976B6B8B32882C1CB4C8B6BA4C9E04C5BD648C238B014CA95191D7535230ADDFB33AF8A170122FE00CB62072EE0972C481CE0B297BF84608488F696F91E2509AC0ADE3F51F2D4203AFC1C40F41976D318AC68C65010BD39B7FBA790E2DB3498F339B03D5E830DCDC3EFE1257259185F50DE6A63BCEBD0FD16A6EC827AE788E147E61680FCF38104DD010611E7CC7571925C8231636F1A82DB5D005E517672DC1B8E2F53BB764BA63E2281DE2F9116D4AF05E9CA37D15328FE89814CE7A334897A1D2E09ED266A416A1635A768155590F5159583759354509A05CD085AE5CCA906F3FAB2111ADEEDCB60F7DFEFDB6CF336AD051535CE6085C4FFC014C7B08C79F788311CD3D50874593776E12C64C3C799BEF9DE9471FA82FC7468566BCD866C11187E3664B0FB3F1B3231A1F89978DC2BE970182A8801BE13BDFE9CD53EE724C9B63D1D6ADDDC36F3EDAC01A6E9729624A14BB259A009838920465D7EF0E1ACF68846DE1B392A021D0343277CCB8312E89B2D1BD51D3DC73E66D83A73F330E114252EF254354287BC1E82153BAA46B05574A42EDCDF149E60E938E68D103F042530530965EAB420D42511F25BB524B5ECB885F1BE973CE49A731C61CA19B66AA20B737D30840B50F29106A54D4363A76271CD8668F05A4D63DEE6C2AEC65D89516CC5265B7C67835D0AFFED4D0CB359635B30CE66957411C018D8DB85818AB34A5703900F2EFB66A0D289C960A0C2A5DA8A81D635B60303ADABE4DD19687E44ED3AFED27975DFCCB37E50DEFEB6DEA8AE1DD8664D1F7B669AB9EF096D18B4C0B16A9EE7735E895F98E67006728AF359225C5DD94438F80CB37AC866E5EF6AFD50A7194436A226C095A1B5808A2B41054899503D842B62798DD2092FA2076C11776B84156BBF045BB10115BB7A355A21345FA0CAC6D9E9F451F6ACB406C5C83B1D162A381A839017AF7AC73B28C514975515D3C517EEE30D573A2606A341412D9EAB4149456706D752619AED5AD239647D5CB28DB424B94F062D159D195C4BC246DB95A4710A7AB8051BA9A8BE850F34D98A4847B9DB94756327CF9B120563C7906035BE415144E8B29270254AAC599E6D35FD61D63F0129C8311C37D1E42195D2969C5818A325966A8135487A49E2849D2386E688C779A65EA09069F756C3F25FB0AC6E9FEA2016FB4041CD7F8BBB42D3457E6DC7555D12817409FD0CB85F9305D33556A06F6EF13438E4A35813BF9F867E1A50B39B656E9DDFE255DBE7252AC2D891E457DC2845678AB35B1F804EC3A34E8D4187AAF465D61F2E338449E985275A55BBC93B35A314C1AA2A8A2980B5B3E13339356B0C99EC35F61FB15684B799632255A50A208A7A6254B21D14B04A5D77D47A424A15B35ED31D51CA3AA9424A553DA4ACE696D484AC56AC8567D0A89EA23B07359BA48AAED67647D6E49554A135D56B606B6496EBBAA36A524FAAC09AEAEED8AB3C147929DDE35DCC7896D9701BCB0FBD9BED63068CB7591787D9062B77FB55A04A714F2C717BAF8089F2BDB429E3C96F439BCA231E9BD99401C3BC0AD5EEC6EB8B50E385BE19B376E15D5BE89B2EFCCD78FD2CF74DED4339FEC92425F7F218281DF7C6E2E8D5FEE846398BE524B655A81136F9D784E160C40946B3DFFCA94F305FD20B821B44C902272C4FF2B08F0F8F8EA5173BFBF37AC64912CFD71C5D4D4F68EA63B6857C2DFA8C62F709C56AF6C4062F4C56A04A60FA8A7AF86562FF3B6B759AC538F8AFACF8C0BA4A1E29F92D858A8738C5D61F6A36E83019F71DDE789482FEF12E1E4F7457F9D5BFBEE64D0FACBB18A6D3A97528297A9DE1AF3FA9E8254DDE740369D67E68F17E675BEDE58216559A2DEB3F54981336C8238542CABF06E8E5FBBEA2691F226C84A8796C3014DE202A343D265807CBF890C0834F963D24E8D759FDC3827544333E2A20B43F98FCA4A0FB3254B4DCE13EA439366D6349CAF4DC9A92BD517EE6AEF72625737BA389AE6667F7801B34037B3317E59D65360FB6756A129707C3DEA5DDBF79B6F2BE2428AF9CF6DDE6256F3315B9E18AE94F9581BC0739739A1CA0DDE7196FDBD64C71E03D4FD6EC974DBC67C626B6F9DDE70C6FDBD84C01E23D37B65E99C17B666BBBDA3F776C699DB7D09DE7F9AA294B86FB1C5D14B92D8F370FB9C3F17F1E8211E41E65FEFC529F38D694F4DAC2704562666ACE5893192B1347E1AB5034B3EDD757B1E1377656D034B335E47936F116EB7F236F41D3CCDB903DB98B0C646DFEA22E2BBC651D6B4AA87A4F19C7B59EB424B8B7F9AC8D97F3EF29C17810A5D4668FE176F9FDE4130FA29221A74E8FFC61F5A218F6CECADF7084FD3B21CB1504FF8B8E14BBB55DB3A4B9A28BB0D8BC25890A122942738319F2604B3D8B1959209741350F4067EFC7B3A01EBF069963EF8ADEA52C4A1974190773BF16F0E24E4013FF2C49BA2EF3F82EE25FC9105D0031090FDCDFD15F52E27BA5DC979A989001827B1722DCCBC792F1B0EFF2B544BA0D694720A1BED2297AC041E40358724767E819AF231B98DF355E22F77515013481B40F445DEDE3738296310A1281B16A0F9F60C35EF0F2D3FF011A535A40CA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'6ccb4e5f-d1bd-460b-a7b9-82f0fb5fdd71', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ed00b4fe-986c-487f-9119-69bccb1093d4', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'af15b726-c7f0-45b3-96cb-c1ee0c8d2b3f', N'HR Administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'77782ce4-3688-447e-8c11-8286e3f7eab4', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'85f7a2ce-f0bf-4484-8d47-6b2ceffb8de0', N'6ccb4e5f-d1bd-460b-a7b9-82f0fb5fdd71')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd28cab4d-8222-4f3b-8099-1dbdb43f4268', N'6ccb4e5f-d1bd-460b-a7b9-82f0fb5fdd71')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b262b711-115a-4cb9-950b-bc8c1afe8170', N'77782ce4-3688-447e-8c11-8286e3f7eab4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e63bb36d-adc1-4429-adf1-9af797276463', N'af15b726-c7f0-45b3-96cb-c1ee0c8d2b3f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'39c87181-c1f9-41ed-b873-501b4f278dcc', N'ed00b4fe-986c-487f-9119-69bccb1093d4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9a23299-ac68-4555-8868-8403d5f5a4e3', N'ed00b4fe-986c-487f-9119-69bccb1093d4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eb2b54d2-3da8-4cb7-a334-73a96000743e', N'ed00b4fe-986c-487f-9119-69bccb1093d4')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'39c87181-c1f9-41ed-b873-501b4f278dcc', N'SGoodwin104@gmail.com', 0, N'AETuwxgySI0fX95rtnyz7STRXhdr3SxlSj+FDpKDo3vuNYPi81m8pUNnymy1jpdBJg==', N'4f506974-3469-40b0-8a96-68efb11f57e9', NULL, 0, 0, NULL, 1, 0, N'SGoodwin104@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'85f7a2ce-f0bf-4484-8d47-6b2ceffb8de0', N'admin@trinitylms.com', 0, N'AE114d5CtnuBKuN1wWblXRoqUrZOe+nLNGVdAWr/ZBz+Xtu2Hk/sNBc67uF2dwgAMw==', N'f74134cd-083c-4021-aadd-7fd08ced3c7f', NULL, 0, 0, NULL, 1, 0, N'admin@trinitylms.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b262b711-115a-4cb9-950b-bc8c1afe8170', N'ACarter234@gmail.com', 0, N'AIb3gXSYFq3LsqQIpEHxKZTUodPQVWmGrxGX0DltzZdK0QD/jUMA6u67C0tLNp8T3g==', N'ae64ba5c-ab99-4db2-8209-be569cad15fb', NULL, 0, 0, NULL, 1, 0, N'ACarter234@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c9a23299-ac68-4555-8868-8403d5f5a4e3', N'TWhitfield201@gmail.com', 0, N'AFWNJ+daZqWSFnyzKlVvobZoorx59MDMafWRXAxqb8Vhkl1bdUmBll4ikfjPB+d/lw==', N'72b15378-3164-4690-9925-8c6ea3d508cb', NULL, 0, 0, NULL, 1, 0, N'TWhitfield201@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd28cab4d-8222-4f3b-8099-1dbdb43f4268', N'spreckerd@gmail.com', 0, N'AE3JlHK+OOe4ZmOc32Eu2SlhefKtetOLdU21vhDrkD5A1OLKj04dqzCuIfCe9m42rQ==', N'a9f18c3b-0082-4676-9c63-df2dca79385d', NULL, 0, 0, NULL, 1, 0, N'spreckerd@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e63bb36d-adc1-4429-adf1-9af797276463', N'Klawson306@gmail.com', 0, N'AMEZWj5IKA+h7Eq24r6dlkurInj5VyBeCVhX7P0OQCG3ORg1z5PstaHNVSIsFqm1MQ==', N'97937483-3c9d-48d5-a9ea-370470539f92', NULL, 0, 0, NULL, 1, 0, N'Klawson306@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'eb2b54d2-3da8-4cb7-a334-73a96000743e', N'qhedges408@gmail.com', 0, N'ABGsfU1/mBRscc85oiZ23hsqMEB4PfyTbJ4P8yzMO1YgNbzHe1+riQ7sW/HDA7FWMQ==', N'4a6d7fc5-c0cf-437b-8add-4a04a9c86cf8', NULL, 0, 0, NULL, 1, 0, N'qhedges408@gmail.com')
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (1, N'Example Course', N'This is an example course for formatting purposes', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (2, N'Demonstration Course', N'This is a demo course for formatting purposes', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (3, N'Courtesy Course', N'This is a courtesy course for formatting purposes', 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (1, N'Lesson1', 1, N'This is a generic introduction for lesson 1', N'http://www.youtube.com/embed/dwqDGLQIINY', N'6feff770-9b37-4dad-afec-fccf538ded1e.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (2, N'Lesson2', 1, N'This is a generic introduction for lesson 2', N'http://www.lesson2vid.com', N'dbf2f15a-c81e-4dc0-ab0d-dee72b33ab13.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (3, N'Lesson3', 1, N'This is a generic introduction for lesson 3', N'http://www.lesson3vid.com', N'86b8776b-296e-4b1a-92eb-d87df051bda4.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (4, N'Teaching1', 2, N'This is a generic introduction for teaching 1', N'http://www.teaching1vid.com', N'514d9e7e-879f-4cca-806a-685d351f7ff4.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (5, N'Teaching2', 2, N'This is a generic introduction for teaching 2', N'http://www.teaching2vid.com', N'6d9a4fa2-a6c5-495b-884d-76a8010e2722.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (6, N'Teaching3', 2, N'This is a generic introduction for teaching 3', N'http://www.teaching3vid.com', N'9317b0fa-4e75-40de-9286-a4e8bea42dfd.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (7, N'Lecture1', 3, N'This is a generic introduction for lecture 1', N'http://www.lecture1vid.com', N'fa2736b4-c829-4fab-a8e7-aa6753c560f3.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (8, N'Lecture2', 3, N'This is a generic introduction for lecture 2', N'http://www.lecture2vid.com', N'f033e8da-38ac-4ac6-9792-d060a1065a24.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (9, N'Lecture3', 3, N'This is a generic introduction for lecture 3', N'http://www.lecture3vid.com', N'f41571d9-0df1-430b-b540-3c10ecc185d2.pdf', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (1, N'd28cab4d-8222-4f3b-8099-1dbdb43f4268', 1, CAST(N'2020-05-05' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (2, N'39c87181-c1f9-41ed-b873-501b4f278dcc', 1, CAST(N'2020-05-05' AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Company]) VALUES (N'39c87181-c1f9-41ed-b873-501b4f278dcc', N'Stephanie', N'Goodwin', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Company]) VALUES (N'85f7a2ce-f0bf-4484-8d47-6b2ceffb8de0', N'Devin', N'Sprecker', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Company]) VALUES (N'b262b711-115a-4cb9-950b-bc8c1afe8170', N'Alistair', N'Carter', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Company]) VALUES (N'c9a23299-ac68-4555-8868-8403d5f5a4e3', N'Terrence', N'Whitfield', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Company]) VALUES (N'd28cab4d-8222-4f3b-8099-1dbdb43f4268', N'Devin', N'Sprecker', N'DevCo')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Company]) VALUES (N'e63bb36d-adc1-4429-adf1-9af797276463', N'Kayla', N'Lawson', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Company]) VALUES (N'eb2b54d2-3da8-4cb7-a334-73a96000743e', N'Quinn', N'Hedges', NULL)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
