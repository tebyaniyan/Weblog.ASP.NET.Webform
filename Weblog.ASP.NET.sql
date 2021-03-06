USE [master]
GO
/****** Object:  Database [Weblog.ASP.NET]    Script Date: 8/31/2018 8:18:28 PM ******/
CREATE DATABASE [Weblog.ASP.NET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Weblog.ASP.NET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Weblog.ASP.NET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Weblog.ASP.NET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Weblog.ASP.NET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Weblog.ASP.NET] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Weblog.ASP.NET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Weblog.ASP.NET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET ARITHABORT OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Weblog.ASP.NET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Weblog.ASP.NET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Weblog.ASP.NET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Weblog.ASP.NET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET RECOVERY FULL 
GO
ALTER DATABASE [Weblog.ASP.NET] SET  MULTI_USER 
GO
ALTER DATABASE [Weblog.ASP.NET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Weblog.ASP.NET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Weblog.ASP.NET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Weblog.ASP.NET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Weblog.ASP.NET] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Weblog.ASP.NET', N'ON'
GO
ALTER DATABASE [Weblog.ASP.NET] SET QUERY_STORE = OFF
GO
USE [Weblog.ASP.NET]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Weblog.ASP.NET]
GO
/****** Object:  Table [dbo].[BlogComments]    Script Date: 8/31/2018 8:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogComments](
	[NewsComment] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[webSite] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[NewsCommentText] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BlogComments] PRIMARY KEY CLUSTERED 
(
	[NewsComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogGroups]    Script Date: 8/31/2018 8:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogGroups](
	[NewsGroupID] [int] IDENTITY(1,1) NOT NULL,
	[TitleGroup] [nvarchar](50) NULL,
 CONSTRAINT [PK_BlogGroups] PRIMARY KEY CLUSTERED 
(
	[NewsGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 8/31/2018 8:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [nvarchar](max) NOT NULL,
	[NewsGroupID] [int] NULL,
	[NewsSee] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[NewsImage] [varchar](150) NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUS]    Script Date: 8/31/2018 8:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUS](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](150) NULL,
	[Email] [varchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_ContactUS] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/31/2018 8:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleTiitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/31/2018 8:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Password] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Guid] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BlogComments] ON 

INSERT [dbo].[BlogComments] ([NewsComment], [NewsID], [FullName], [webSite], [Email], [Date], [IsActive], [NewsCommentText]) VALUES (1, 1, N'مسعود', NULL, N'mm@yahoo.com', CAST(N'2018-08-31T16:32:33.443' AS DateTime), 1, N'سلام تست یکنم برای نظر')
INSERT [dbo].[BlogComments] ([NewsComment], [NewsID], [FullName], [webSite], [Email], [Date], [IsActive], [NewsCommentText]) VALUES (2, 1, N'مسعود', NULL, N'mm@yahoo.com', CAST(N'2018-08-31T16:32:36.963' AS DateTime), 1, N'سلام تست یکنم برای نظر')
SET IDENTITY_INSERT [dbo].[BlogComments] OFF
SET IDENTITY_INSERT [dbo].[BlogGroups] ON 

INSERT [dbo].[BlogGroups] ([NewsGroupID], [TitleGroup]) VALUES (1, N'کسب کار')
SET IDENTITY_INSERT [dbo].[BlogGroups] OFF
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([NewsID], [NewsTitle], [NewsGroupID], [NewsSee], [Date], [IsActive], [NewsImage], [Description]) VALUES (1, N'یک خبر تستی است', 1, 0, CAST(N'2018-08-31T16:18:16.630' AS DateTime), 1, N'681ff580dbf840399059618348ca7956.jpg', N'<p>سلام دارم تست میکنم</p>
')
INSERT [dbo].[Blogs] ([NewsID], [NewsTitle], [NewsGroupID], [NewsSee], [Date], [IsActive], [NewsImage], [Description]) VALUES (2, N'مراحل راه‌اندازی استارتاپ', 1, 0, CAST(N'2018-08-31T19:51:22.447' AS DateTime), 1, N'5b4b959af44d4785bc011929e6eee60a.jpg', N'<p>برای راه&zwnj;اندازی استارتاپ بهتر است اصلا عجله نکنید.قدم هایتان را درست و حساب شده بردارید و از متخصصان مشاوره بگیرید تا بتوانید در کسب و کار موفق باشید.</p>

<h2>راه&zwnj;اندازی استارتاپ</h2>

<p>داشتن یک ایده&zwnj;ی جدید و بزرگ تنها آغاز راه پر پیچ و خم راه&zwnj;اندازی یک&nbsp;<a href="http://blog.mspsoft.com/learning-and-consulting-a-business-coach/" rel="noopener" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; background-color: transparent; color: rgb(244, 126, 0); text-decoration-line: none; transition: color 0.2s ease-in 0s;" target="_blank">کسب&zwnj;وکار</a>&nbsp;است. به&zwnj;عنوان مثال اگر ایده را روز اول دانشگاه در نظر بگیریم، اولین دلاری که از آن درآمد کسب می&zwnj;کنید معادل فارغ&zwnj;التحصیلی است. زندگی بخشیدن به یک استارتاپ و به موفقیت رساندن آن ساده نیست و باید ابتدا پیش&zwnj;نیازهای آن برطرف شود. معمولا اولین قدم&zwnj;ها با بررسی و تجزیه و تحلیل بازار و پتانسیل آن برای پذیرش محصول جدید آغاز می&zwnj;شود. سپس با بررسی رقبا، عملکرد آن&zwnj;ها و تحقیق در مورد اینکه آیا کسب&zwnj;وکار می&zwnj;تواند عملکرد بهتری داشته باشد یا خیر، ادامه پیدا می&zwnj;کند.</p>

<p>شخصی که استارتاپی را راه&zwnj;اندازی می&zwnj;کند یعنی محصول یا خدمات جدیدی را معرفی می&zwnj;کند که نمونه&zwnj;ی آن قبلا در بازار وجود نداشته است. سپس باید استراتژی مورد نظر خود را برای فروش مشخص کند. سرمایه&zwnj;گذاران نیز پیش از آغاز همکاری باید گزارش دقیقی از ارزیابی مالی استارتاپ دریافت کنند درنتیجه بنیان&zwnj;گذار استارتاپ باید آشنایی نسبی با امور حسابداری داشته باشد. به همین دلیل بسیاری از استارتاپ&zwnj;ها کار خود را از مراکز شتابدهی آغاز می&zwnj;کنند تا در مورد این مسائل به آن&zwnj;ها آموزش دهند. اما هر استارتاپی حتی پیش از ورود به مراکز شتابدهنده نیز باید جزئیات دقیق و ارزش کار خود را بسنجد زیرا همان&zwnj;طور که می&zwnj;دانید هر استارتاپی نمی&zwnj;تواند به مراکز شتابدهنده وارد شود و باید ابتدا از طرف کارشناسان ارزیابی شود. در ادامه&zwnj;ی این مقاله&zwnj;ی زومیت به معرفی بیشتر پیش نیازهایی می&zwnj;پردازیم که برای راه&zwnj;اندازی<a href="https://fa.wikipedia.org/wiki/%D8%B4%D8%B1%DA%A9%D8%AA_%D9%86%D9%88%D9%BE%D8%A7" rel="noopener" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; background-color: transparent; color: rgb(244, 126, 0); text-decoration-line: none; transition: color 0.2s ease-in 0s;" target="_blank">&nbsp;استارتاپ</a>لازم هستند.</p>

<p><img alt="راه‌اندازی استارتاپ" class="size-full wp-image-660" src="https://dl.mspsoft.com/img/2018/08/set-of-vector-icons-and-elements-of-application-development_1441-214.jpg" style="-webkit-font-smoothing:antialiased; border:0px; box-sizing:border-box; display:block; height:auto; margin:0px; max-width:100%; vertical-align:middle; width:626px" /></p>
')
INSERT [dbo].[Blogs] ([NewsID], [NewsTitle], [NewsGroupID], [NewsSee], [Date], [IsActive], [NewsImage], [Description]) VALUES (3, N'راه کار هایی برای حفظ آرامش و تسلط به خود در مصاحبه‌ کاری', 1, 0, CAST(N'2018-08-31T19:52:55.503' AS DateTime), 1, N'9e1feed72cc84e3bb2c7be694e82c3ec.jpg', N'<p>بعضی وقت ها مصاحبه کاری یکی از&nbsp;<a href="http://blog.mspsoft.com/%d8%a8%d9%87%d8%b1%d9%87%e2%80%8c%d9%88%d8%b1%db%8c-%d8%ac%d9%84%d8%b3%d8%a7%d8%aa-%da%a9%d8%a7%d8%b1%db%8c-%d8%a7%d8%b3%d8%aa%d8%a7%d8%b1%d8%aa%d8%a7%d9%be-%da%a9%d8%b3%d8%a8%e2%80%8c-%d9%88-%da%a9/" rel="noopener" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; background-color: transparent; color: rgb(244, 126, 0); text-decoration-line: none; transition: color 0.2s ease-in 0s;" target="_blank">جلسات کاری</a>&nbsp;پر استرس است.در این مقاله میخواهیم چند راه کار برای کاهش استرس در جلسات مصاحبه کاری ارائه دهیم.</p>

<h2>مصاحبه&zwnj; کاری</h2>

<p>کمتر ملاقاتی به&zwnj;اندازه&zwnj;ی یک مصاحبه&zwnj; کاری استرس&zwnj;زا است. اگر به توانایی خود برای انجام شغل مورد نظر اطمینان دارید، تنها کافی است تاثیر خوبی ایجاد کنید و به مدیر استخدام و سایر افراد شرکت نشان دهید واجد شرایط کار تیمی به&zwnj;عنوان یک عضو فعال هستید.پس باید ببینیم چه کاری باعث حفظ آرامش ذهنی ما و جلوگیری از تاثیر هیجان بر این فرصت بالقوه می&zwnj;شود؟</p>

<h3>۱. اطلاعات اولیه را راجب مصاحبه کاری بدانید.</h3>

<p>چه قرار باشد در یک&nbsp;<a href="https://fa.wikipedia.org/wiki/%D9%85%D8%B5%D8%A7%D8%AD%D8%A8%D9%87_%DA%A9%D8%A7%D8%B1%DB%8C" rel="noopener" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; background-color: transparent; color: rgb(244, 126, 0); text-decoration-line: none; transition: color 0.2s ease-in 0s;" target="_blank">مصاحبه&zwnj;</a>&nbsp;تلفنی غیر رسمی و راحت شرکت کنید و چه یک جلسه&zwnj;ی سنگین و طولانی با روسای شرکت داشته&zwnj;باشید، در هر حالت باید پیش از آن مطالعه کنید. در اختیار داشتن اطلاعات کافی هنگام مصاحبه به آرامش و آسودگی ذهنی می&zwnj;انجامد. اما چه اطلاعاتی باید داشته&zwnj;باشید؟</p>

<h6>آیلین شاگارا، مشاور و مربی شغلی اینطور می&zwnj;گوید:</h6>

<p>شرکت را بشناسید، درباره&zwnj;ی شغل مورد نظر، یک شرح کلی از شغل و توصیف آن&zwnj; بدانید. از قبل حرف آماده&zwnj;ای برای توضیح خود داشته باشید که به بالابردن شما کمک کند. بهترین راه برای کاهش نگرانی داشتن آمادگی پیش از مصاحبه است. در نتیجه می&zwnj;فهمید آیا واقعا این شغل را می&zwnj;خواهید؟ آیا برای این شغل شایستگی لازم را دارید؟ آیا این مسیر واقعی شما است؟</p>
')
INSERT [dbo].[Blogs] ([NewsID], [NewsTitle], [NewsGroupID], [NewsSee], [Date], [IsActive], [NewsImage], [Description]) VALUES (4, N'مدیران بی‌تجربه چرا از تصمیم‌گیری‌های دشوار اجتناب می‌کنند؟', 1, 0, CAST(N'2018-08-31T19:53:22.117' AS DateTime), 1, N'fc61d65a4e274c87bc31098dd56d5dbd.jpg', N'<p>مهم ترین وظایف مدیران؛ گرفتن تصمیمات دشوار است. بسیاری از مدیران بی&zwnj;تجربه سعی می&zwnj;کنند از قرارگیری در چنین شرایطی اجتناب کنند. مدیران بی تجربه جلوگیری از ناراحتی دیگران یا از دست رفتن وجهه و موقعیتشان در برابر&nbsp;<a href="http://blog.mspsoft.com/what-can-we-do-to-help-managers-understand-the-value-of-our-work/" rel="noopener" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; background-color: transparent; color: rgb(244, 126, 0); text-decoration-line: none; transition: color 0.2s ease-in 0s;" target="_blank">کارمندان</a>&nbsp;را به عنوان توجیه و بهانه&zwnj;ای در قبال این رفتار خود معرفی می&zwnj;کنند. با این وجود در اغلب موارد، تأخیر در تصمیم&zwnj;گیری&zwnj;های دشوار می&zwnj;تواند خسارات بیشتری را نسبت به بهانه&zwnj;های این مدیران به بار بیاورد. در واقع، به تعویق انداختن تصمیم&zwnj;های سخت، شرایط را پیچیده&zwnj;تر خواهد کرد و هر چه جایگاه یک مدیر ارتقا یابد، تصمیم&zwnj;های دشوار او نیز بیش از پیش خواهد شد.</p>

<h2>مدیران بی&zwnj;تجربه از تصمیمات د شوار اجتناب میکنند.</h2>

<p>برای ارزیابی دلایل اجتناب مدیران بی تجربه از تصمیم&zwnj;گیری&zwnj;های دشوار و پیامدهای آن، مجله &laquo;<a href="https://fa.wikipedia.org/wiki/%D9%87%D8%A7%D8%B1%D9%88%D8%A7%D8%B1%D8%AF_%D8%A8%DB%8C%D8%B2%DB%8C%D9%86%D8%B3_%D8%B1%DB%8C%D9%88%DB%8C%D9%88" rel="noopener" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; background-color: transparent; color: rgb(244, 126, 0); text-decoration-line: none; transition: color 0.2s ease-in 0s;" target="_blank">هاروارد بیزینس ریویو</a>&raquo; (Harvard Business Review) یا به طور مختصر &laquo;HBR&raquo;، مطالعه&zwnj;ای را بر روی بیش از ۲۷۰۰ مدیر ترتیب داد. در این مطالعه، حدود ۵۷ درصد از افرادی که به تازگی ترفیع گرفته بودند، اذعان داشتند که تصمیمات فعلی آن&zwnj;ها نسبت به شرایط مورد انتظارشان، پیچیده&zwnj;تر و سخت&zwnj;تر است. در بین اکثر آنها، سه توجیه و بهانه متداول برای به تعویق انداختن تصمیم&zwnj;گیری&zwnj;های دشوار وجود دارد. در این مقاله به تشریح هر یک از این موارد خواهیم پرداخت. با درک پیامدهای این رویکرد اشتباه، می&zwnj;توانید از رخ دادن آن&zwnj;ها جلوگیری کنید.</p>
')
SET IDENTITY_INSERT [dbo].[Blogs] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [RoleTiitle]) VALUES (1, N'Admin', N'مدیر سایت')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Email], [Password], [Date], [IsActive], [Guid]) VALUES (1, 1, N'Masoud', N'm@yahoo.com', N'123', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_FK_BlogComment_Blog]    Script Date: 8/31/2018 8:18:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BlogComment_Blog] ON [dbo].[BlogComments]
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Blog_BlogGroup]    Script Date: 8/31/2018 8:18:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Blog_BlogGroup] ON [dbo].[Blogs]
(
	[NewsGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tbl_User_Tbl_Role]    Script Date: 8/31/2018 8:18:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Tbl_User_Tbl_Role] ON [dbo].[Users]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlogComments]  WITH CHECK ADD  CONSTRAINT [FK_BlogComment_Blog] FOREIGN KEY([NewsID])
REFERENCES [dbo].[Blogs] ([NewsID])
GO
ALTER TABLE [dbo].[BlogComments] CHECK CONSTRAINT [FK_BlogComment_Blog]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blog_BlogGroup] FOREIGN KEY([NewsGroupID])
REFERENCES [dbo].[BlogGroups] ([NewsGroupID])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blog_BlogGroup]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_User_Tbl_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Tbl_User_Tbl_Role]
GO
USE [master]
GO
ALTER DATABASE [Weblog.ASP.NET] SET  READ_WRITE 
GO
