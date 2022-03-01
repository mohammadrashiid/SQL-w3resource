USE [master]
GO
/****** Object:  Database [W3Resource]    Script Date: 26/12/2019 2:24:04 AM ******/
CREATE DATABASE [W3Resource]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'W3Resource', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\W3Resource.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'W3Resource_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\W3Resource_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [W3Resource] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [W3Resource].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [W3Resource] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [W3Resource] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [W3Resource] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [W3Resource] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [W3Resource] SET ARITHABORT OFF 
GO
ALTER DATABASE [W3Resource] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [W3Resource] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [W3Resource] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [W3Resource] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [W3Resource] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [W3Resource] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [W3Resource] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [W3Resource] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [W3Resource] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [W3Resource] SET  DISABLE_BROKER 
GO
ALTER DATABASE [W3Resource] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [W3Resource] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [W3Resource] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [W3Resource] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [W3Resource] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [W3Resource] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [W3Resource] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [W3Resource] SET RECOVERY FULL 
GO
ALTER DATABASE [W3Resource] SET  MULTI_USER 
GO
ALTER DATABASE [W3Resource] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [W3Resource] SET DB_CHAINING OFF 
GO
ALTER DATABASE [W3Resource] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [W3Resource] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [W3Resource] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'W3Resource', N'ON'
GO
ALTER DATABASE [W3Resource] SET QUERY_STORE = OFF
GO
USE [W3Resource]
GO
/****** Object:  Schema [Employee]    Script Date: 26/12/2019 2:24:04 AM ******/
CREATE SCHEMA [Employee]
GO
/****** Object:  Schema [Hospital]    Script Date: 26/12/2019 2:24:04 AM ******/
CREATE SCHEMA [Hospital]
GO
/****** Object:  Schema [HR]    Script Date: 26/12/2019 2:24:04 AM ******/
CREATE SCHEMA [HR]
GO
/****** Object:  Schema [Inventory]    Script Date: 26/12/2019 2:24:04 AM ******/
CREATE SCHEMA [Inventory]
GO
/****** Object:  Schema [Movies]    Script Date: 26/12/2019 2:24:04 AM ******/
CREATE SCHEMA [Movies]
GO
/****** Object:  Schema [SOCCER]    Script Date: 26/12/2019 2:24:04 AM ******/
CREATE SCHEMA [SOCCER]
GO
/****** Object:  Table [dbo].[emp_details]    Script Date: 26/12/2019 2:24:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_details](
	[emp_idno] [int] NULL,
	[emp_fname] [nvarchar](15) NULL,
	[emp_lname] [nvarchar](15) NULL,
	[emp_dept] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_mast]    Script Date: 26/12/2019 2:24:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_mast](
	[pro_id] [int] NULL,
	[pro_name] [nvarchar](25) NULL,
	[pro_price] [numeric](8, 2) NULL,
	[pro_com] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nobel_win]    Script Date: 26/12/2019 2:24:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nobel_win](
	[year] [int] NULL,
	[subject] [nvarchar](25) NULL,
	[winner] [nvarchar](45) NULL,
	[country] [nvarchar](25) NULL,
	[category] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[department]    Script Date: 26/12/2019 2:24:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[department](
	[dep_id] [int] NOT NULL,
	[dep_name] [varchar](20) NULL,
	[dep_location] [varchar](15) NULL,
 CONSTRAINT [PK_department_1] PRIMARY KEY CLUSTERED 
(
	[dep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[employees]    Script Date: 26/12/2019 2:24:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[employees](
	[emp_id] [int] NOT NULL,
	[emp_name] [varchar](15) NULL,
	[job_name] [varchar](10) NULL,
	[manager_id] [int] NULL,
	[hire_date] [date] NULL,
	[salary] [decimal](10, 2) NULL,
	[commission] [decimal](7, 2) NULL,
	[dep_id] [int] NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[salary_grade]    Script Date: 26/12/2019 2:24:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[salary_grade](
	[grade] [int] IDENTITY(1,1) NOT NULL,
	[min_salary] [int] NULL,
	[max_salary] [int] NULL,
 CONSTRAINT [PK_salary_grade] PRIMARY KEY CLUSTERED 
(
	[grade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Affiliated_With]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Affiliated_With](
	[physician] [int] NOT NULL,
	[department] [int] NOT NULL,
	[primaryaffiliation] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[physician] ASC,
	[department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Appointment]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Appointment](
	[appointmentid] [int] NOT NULL,
	[patient] [int] NULL,
	[prepnurse] [int] NULL,
	[physician] [int] NULL,
	[start_dt_time] [datetime] NULL,
	[end_dt_time] [datetime] NULL,
	[examinationroom] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[appointmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Block]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Block](
	[blockfloor] [int] NOT NULL,
	[blockcode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[blockfloor] ASC,
	[blockcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Department]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Department](
	[name] [nvarchar](max) NULL,
	[departmentid] [int] NOT NULL,
	[head] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[departmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Medication]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Medication](
	[code] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[brand] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Medication] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Nurse]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Nurse](
	[employeeid] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[position] [nvarchar](max) NULL,
	[registered] [bit] NULL,
	[ssn] [int] NULL,
 CONSTRAINT [PK_Nurse] PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[On-Call]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[On-Call](
	[nurse] [int] NOT NULL,
	[blockfloor] [int] NOT NULL,
	[blockcode] [int] NOT NULL,
	[oncallstart] [datetime] NOT NULL,
	[oncallend] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Patient]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Patient](
	[ssn] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[insuranceid] [int] NULL,
	[pcp] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Physician]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Physician](
	[employeeid] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[position] [nvarchar](max) NULL,
	[ssn] [int] NULL,
 CONSTRAINT [PK_Physician] PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Prescribes]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Prescribes](
	[physician] [int] NOT NULL,
	[patient] [int] NOT NULL,
	[medication] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[appointment] [int] NULL,
	[dose] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[physician] ASC,
	[patient] ASC,
	[medication] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Procedures]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Procedures](
	[code] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[cost] [real] NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Room]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Room](
	[blockfloor] [int] NULL,
	[blockcode] [int] NULL,
	[roomnumber] [int] NOT NULL,
	[roomtype] [nvarchar](30) NULL,
	[unavailable] [bit] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Stay]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Stay](
	[stayid] [int] NOT NULL,
	[patient] [int] NULL,
	[room] [int] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
 CONSTRAINT [PK_Stay] PRIMARY KEY CLUSTERED 
(
	[stayid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Trained_in]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Trained_in](
	[physician] [int] NOT NULL,
	[treatment] [int] NOT NULL,
	[certificationdate] [date] NULL,
	[certificationexpires] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[physician] ASC,
	[treatment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Undergoes]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Undergoes](
	[patient] [int] NOT NULL,
	[procedur] [int] NOT NULL,
	[stay] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[physician] [int] NULL,
	[assistingnurse] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[patient] ASC,
	[procedur] ASC,
	[stay] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Countries]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Countries](
	[country_id] [nvarchar](2) NOT NULL,
	[country_name] [nvarchar](40) NULL,
	[region_id] [numeric](10, 0) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Departments]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Departments](
	[department_id] [numeric](4, 0) NOT NULL,
	[department_name] [nvarchar](30) NULL,
	[manager_id] [numeric](6, 0) NULL,
	[location_id] [numeric](4, 0) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Employees]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Employees](
	[employee_id] [numeric](6, 0) NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](25) NULL,
	[email] [nvarchar](25) NULL,
	[phone_number] [nvarchar](20) NULL,
	[hire_date] [date] NULL,
	[job_id] [nvarchar](10) NULL,
	[salary] [numeric](8, 2) NULL,
	[commission_pct] [numeric](2, 2) NULL,
	[manager_id] [numeric](6, 0) NULL,
	[department_id] [numeric](4, 0) NULL,
 CONSTRAINT [PK_Employees_1] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Job_Grades]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Job_Grades](
	[grade_level] [nvarchar](20) NOT NULL,
	[lowest_sal] [numeric](5, 0) NULL,
	[highest_sal] [numeric](5, 0) NULL,
 CONSTRAINT [PK_Job_Grades] PRIMARY KEY CLUSTERED 
(
	[grade_level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Job_History]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Job_History](
	[employee_id] [numeric](6, 0) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[job_id] [nvarchar](10) NULL,
	[department_id] [numeric](4, 0) NULL,
 CONSTRAINT [PK_Job_History] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Jobs]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Jobs](
	[job_id] [nvarchar](10) NOT NULL,
	[job_title] [nvarchar](35) NOT NULL,
	[min_salary] [numeric](6, 0) NULL,
	[max_salary] [numeric](6, 0) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Locations]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Locations](
	[location_id] [numeric](4, 0) NOT NULL,
	[street_address] [nvarchar](40) NULL,
	[postal_code] [nvarchar](12) NULL,
	[city] [nvarchar](30) NULL,
	[state_province] [nvarchar](25) NULL,
	[country_id] [nvarchar](2) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Regions]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Regions](
	[region_id] [numeric](10, 0) NOT NULL,
	[region_name] [nvarchar](25) NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Inventory].[Customer]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Inventory].[Customer](
	[salesman_id] [numeric](5, 0) NULL,
	[customer_id] [numeric](5, 0) NOT NULL,
	[cust_name] [nvarchar](30) NULL,
	[city] [nvarchar](15) NULL,
	[grade] [numeric](3, 0) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Inventory].[Orders]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Inventory].[Orders](
	[salesman_id] [numeric](5, 0) NULL,
	[ord_no] [numeric](5, 0) NOT NULL,
	[purch_amt] [numeric](8, 2) NULL,
	[ord_date] [date] NULL,
	[customer_id] [numeric](5, 0) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ord_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Inventory].[Salesman]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Inventory].[Salesman](
	[salesman_id] [numeric](5, 0) NOT NULL,
	[name] [nvarchar](30) NULL,
	[city] [nvarchar](15) NULL,
	[commission] [numeric](5, 2) NULL,
 CONSTRAINT [PK_Salesman] PRIMARY KEY CLUSTERED 
(
	[salesman_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Actor]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Actor](
	[act_id] [int] NULL,
	[act_fname] [nvarchar](20) NULL,
	[act_lname] [nvarchar](20) NULL,
	[act_gender] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Director]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Director](
	[dir_id] [int] NULL,
	[dir_fname] [nvarchar](20) NULL,
	[dir_lname] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Genres]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Genres](
	[gen_id] [int] NULL,
	[gen_title] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Movie]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Movie](
	[mov_id] [int] NULL,
	[mov_title] [nvarchar](50) NULL,
	[mov_year] [int] NULL,
	[mov_time] [int] NULL,
	[mov_lang] [nvarchar](15) NULL,
	[mov_dt_rel] [date] NULL,
	[mov_rel_country] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Movie_cast]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Movie_cast](
	[mov_id] [int] NULL,
	[act_id] [int] NULL,
	[role] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Movie_Direction]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Movie_Direction](
	[mov_id] [int] NULL,
	[dir_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Movie_Genres]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Movie_Genres](
	[mov_id] [int] NULL,
	[gen_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Rating]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Rating](
	[mov_id] [int] NULL,
	[rev_id] [int] NULL,
	[rev_stars] [numeric](4, 2) NULL,
	[num_o_ratings] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Reviewer]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Reviewer](
	[rev_id] [int] NULL,
	[rev_name] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[asst_referee_mast]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[asst_referee_mast](
	[ass_ref_id] [int] NOT NULL,
	[ass_ref_name] [nvarchar](40) NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_asst_referee_mast] PRIMARY KEY CLUSTERED 
(
	[ass_ref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[coach_mast]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[coach_mast](
	[coach_id] [int] NOT NULL,
	[coach_name] [nvarchar](40) NULL,
 CONSTRAINT [PK_coach_mast] PRIMARY KEY CLUSTERED 
(
	[coach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[goal_details]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[goal_details](
	[goal_id] [int] NOT NULL,
	[match_no] [int] NULL,
	[player_id] [int] NULL,
	[team_id] [int] NULL,
	[goal_time] [int] NULL,
	[goal_type] [nvarchar](1) NULL,
	[play_stage] [nvarchar](1) NULL,
	[goal_schedule] [nvarchar](2) NULL,
	[goal_half] [int] NULL,
 CONSTRAINT [PK_goal_details] PRIMARY KEY CLUSTERED 
(
	[goal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[match_captain]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[match_captain](
	[match_no] [int] NULL,
	[team_id] [int] NULL,
	[player_captain] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[match_details]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[match_details](
	[match_no] [int] NULL,
	[team_id] [int] NULL,
	[play_stage] [nvarchar](1) NULL,
	[win_lose] [nvarchar](1) NULL,
	[decided_by] [nvarchar](1) NULL,
	[goal_score] [int] NULL,
	[penalty_score] [int] NULL,
	[ass_ref] [int] NULL,
	[player_gk] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[match_mast]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[match_mast](
	[match_no] [int] NOT NULL,
	[play_stage] [nvarchar](1) NULL,
	[decided_by] [nvarchar](1) NULL,
	[goal_score] [varchar](5) NULL,
	[play_date] [date] NULL,
	[results] [nvarchar](5) NULL,
	[venue_id] [int] NULL,
	[referee_id] [int] NULL,
	[audience] [int] NULL,
	[plr_of_match] [int] NULL,
	[stop1_sec] [int] NULL,
	[stop2_sec] [int] NULL,
 CONSTRAINT [PK_match_mast] PRIMARY KEY CLUSTERED 
(
	[match_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[penalty_gk]    Script Date: 26/12/2019 2:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[penalty_gk](
	[match_no] [int] NULL,
	[team_id] [int] NULL,
	[player_gk] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[penalty_shootout]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[penalty_shootout](
	[match_no] [int] NULL,
	[team_id] [int] NULL,
	[kick_id] [int] NOT NULL,
	[player_id] [int] NULL,
	[score_goal] [nvarchar](1) NULL,
	[kick_no] [int] NULL,
 CONSTRAINT [PK_penalty_shootout] PRIMARY KEY CLUSTERED 
(
	[kick_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[player_booked]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[player_booked](
	[match_no] [int] NULL,
	[team_id] [int] NULL,
	[player_id] [int] NULL,
	[booking_time] [int] NULL,
	[sent_off] [nvarchar](1) NULL,
	[play_schedule] [nvarchar](2) NULL,
	[play_half] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[player_in_out]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[player_in_out](
	[match_no] [int] NULL,
	[team_id] [int] NULL,
	[player_id] [int] NULL,
	[play_schedule] [nvarchar](2) NULL,
	[play_half] [int] NULL,
	[in_out] [nvarchar](1) NULL,
	[time_in_out] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[player_mast]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[player_mast](
	[team_id] [int] NULL,
	[player_id] [int] NOT NULL,
	[jersey_no] [int] NULL,
	[player_name] [nvarchar](40) NULL,
	[posi_to_play] [nvarchar](2) NULL,
	[dt_of_bir] [date] NULL,
	[age] [int] NULL,
	[playing_club] [nvarchar](40) NULL,
 CONSTRAINT [PK_player_mast] PRIMARY KEY CLUSTERED 
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[playing_position]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[playing_position](
	[position_id] [nvarchar](2) NOT NULL,
	[position_desc] [nvarchar](15) NULL,
 CONSTRAINT [PK_playing_position] PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[referee_mast]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[referee_mast](
	[referee_id] [int] NOT NULL,
	[referee_name] [nvarchar](40) NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_referee_mast] PRIMARY KEY CLUSTERED 
(
	[referee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[soccer_city]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[soccer_city](
	[city_id] [int] NOT NULL,
	[city] [nvarchar](25) NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_soccer_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[soccer_country]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[soccer_country](
	[country_id] [int] NOT NULL,
	[country_abbr] [nvarchar](4) NULL,
	[country_name] [nvarchar](40) NULL,
 CONSTRAINT [PK_soccer_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[soccer_team]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[soccer_team](
	[team_id] [int] NOT NULL,
	[team_group] [nvarchar](1) NULL,
	[match_played] [int] NULL,
	[won] [int] NULL,
	[draw] [int] NULL,
	[lost] [int] NULL,
	[goal_for] [int] NULL,
	[goal_agnst] [int] NULL,
	[goal_diff] [int] NULL,
	[points] [int] NULL,
	[group_position] [int] NULL,
 CONSTRAINT [PK_soccer_team] PRIMARY KEY CLUSTERED 
(
	[team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[soccer_venue]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[soccer_venue](
	[venue_id] [int] NOT NULL,
	[venue_name] [nvarchar](30) NULL,
	[city_id] [int] NULL,
	[aud_capacity] [int] NULL,
 CONSTRAINT [PK_soccer_venue] PRIMARY KEY CLUSTERED 
(
	[venue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SOCCER].[team_coaches]    Script Date: 26/12/2019 2:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SOCCER].[team_coaches](
	[team_id] [int] NULL,
	[coach_id] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (631548, N'Alan           ', N'Snappy         ', 27)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (839139, N'Maria          ', N'Foster         ', 57)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (127323, N'Michale        ', N'Robbin         ', 57)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (526689, N'Carlos         ', N'Snares         ', 63)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (843795, N'Enric          ', N'Dosio          ', 57)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (328717, N'Jhon           ', N'Snares         ', 63)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (444527, N'Joseph         ', N'Dosni          ', 47)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (659831, N'Zanifer        ', N'Emily          ', 47)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (847674, N'Kuleswar       ', N'Sitaraman      ', 57)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (748681, N'Henrey         ', N'Gabriel        ', 47)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (555935, N'Alex           ', N'Manuel         ', 57)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (539569, N'George         ', N'Mardy          ', 27)
INSERT [dbo].[emp_details] ([emp_idno], [emp_fname], [emp_lname], [emp_dept]) VALUES (733843, N'Mario          ', N'Saule          ', 63)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (101, N'Mother Board', CAST(3200.00 AS Numeric(8, 2)), 15)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (102, N'Key 

Board', CAST(450.00 AS Numeric(8, 2)), 16)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (103, N'ZIP 

drive', CAST(250.00 AS Numeric(8, 2)), 14)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (104, N'Speaker', CAST(550.00 AS Numeric(8, 2)), 16)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (105, N'Monitor', CAST(5000.00 AS Numeric(8, 2)), 11)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (106, N'DVD 

drive', CAST(900.00 AS Numeric(8, 2)), 12)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (107, N'CD 

drive', CAST(800.00 AS Numeric(8, 2)), 12)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (108, N'Printer', CAST(2600.00 AS Numeric(8, 2)), 13)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (109, N'Refill cartridge', CAST(350.00 AS Numeric(8, 2)), 13)
INSERT [dbo].[item_mast] ([pro_id], [pro_name], [pro_price], [pro_com]) VALUES (110, N'Mouse', CAST(250.00 AS Numeric(8, 2)), 12)
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Physics                  ', N'Hannes Alfven                                ', N'Sweden                   ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Physics                  ', N'Louis Neel                                   ', N'France                   ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Chemistry                ', N'Luis Federico Leloir                         ', N'France                   ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Physiology               ', N'Julius Axelrod                               ', N'USA                      ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Physiology               ', N'Ulf von Euler                                ', N'Sweden                   ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Physiology               ', N'Bernard Katz                                 ', N'Germany                  ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Literature               ', N'Aleksandr Solzhenitsyn                       ', N'Russia                   ', N'Linguist                 ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1970, N'Economics                ', N'Paul Samuelson                               ', N'USA                      ', N'Economist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1971, N'Physics                  ', N'Dennis Gabor                                 ', N'Hungary                  ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1971, N'Chemistry                ', N'Gerhard Herzberg                             ', N'Germany                  ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1971, N'Peace                    ', N'Willy Brandt                                 ', N'Germany                  ', N'Chancellor               ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1971, N'Literature               ', N'Pablo Neruda                                 ', N'Chile                    ', N'Linguist                 ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1971, N'Economics                ', N'Simon Kuznets                                ', N'Russia                   ', N'Economist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1978, N'Peace                    ', N'Anwar al-Sadat                               ', N'Egypt                    ', N'President                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1978, N'Peace                    ', N'Menachem Begin                               ', N'Israel                   ', N'Prime Minister           ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1994, N'Peace                    ', N'Yitzhak Rabin                                ', N'Israel                   ', N'Prime Minister           ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1987, N'Physics                  ', N'Johannes Georg Bednorz                       ', N'Germany                  ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1987, N'Chemistry                ', N'Donald J. Cram                               ', N'USA                      ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1987, N'Chemistry                ', N'Jean-Marie Lehn                              ', N'France                   ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1987, N'Physiology               ', N'Susumu Tonegawa                              ', N'Japan                    ', N'Scientist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1987, N'Literature               ', N'Joseph Brodsky                               ', N'Russia                   ', N'Linguist                 ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1987, N'Economics                ', N'Robert Solow                                 ', N'USA                      ', N'Economist                ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1994, N'Literature               ', N'Kenzaburo Oe                                 ', N'Japan                    ', N'Linguist                 ')
INSERT [dbo].[nobel_win] ([year], [subject], [winner], [country], [category]) VALUES (1994, N'Economics                ', N'Reinhard Selten                              ', N'Germany                  ', N'Economist                ')
INSERT [Employee].[department] ([dep_id], [dep_name], [dep_location]) VALUES (1001, N'FINANCE', N'SYDNEY')
INSERT [Employee].[department] ([dep_id], [dep_name], [dep_location]) VALUES (2001, N'AUDIT', N'MELBOURNE')
INSERT [Employee].[department] ([dep_id], [dep_name], [dep_location]) VALUES (3001, N'MARKETING', N'PERTH')
INSERT [Employee].[department] ([dep_id], [dep_name], [dep_location]) VALUES (4001, N'PRODUCTION', N'BRISBANE')
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (63679, N'SANDRINE', N'CLERK', 69062, CAST(N'1990-12-18' AS Date), CAST(900.00 AS Decimal(10, 2)), NULL, 2001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (64989, N'ADELYN', N'SALESMAN', 66928, CAST(N'1991-02-20' AS Date), CAST(1700.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(7, 2)), 3001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (65271, N'WADE', N'SALESMAN', 66928, CAST(N'1991-02-22' AS Date), CAST(1350.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(7, 2)), 3001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (65646, N'JONAS', N'MANAGER', 68319, CAST(N'1991-04-02' AS Date), CAST(2957.00 AS Decimal(10, 2)), NULL, 2001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (66564, N'MADDEN', N'SALESMAN', 66928, CAST(N'1991-09-28' AS Date), CAST(1350.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(7, 2)), 3001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (66928, N'BLAZE', N'MANAGER', 68319, CAST(N'1991-05-01' AS Date), CAST(2750.00 AS Decimal(10, 2)), NULL, 3001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (67832, N'CLARE', N'MANAGER', 68319, CAST(N'1991-06-09' AS Date), CAST(2550.00 AS Decimal(10, 2)), NULL, 1001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (67858, N'SCARLET', N'ANALYST', 65646, CAST(N'1997-04-19' AS Date), CAST(3100.00 AS Decimal(10, 2)), NULL, 2001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (68319, N'KAYLING', N'PRESIDENT', NULL, CAST(N'1991-11-18' AS Date), CAST(6000.00 AS Decimal(10, 2)), NULL, 1001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (68454, N'TUCKER', N'SALESMAN', 66928, CAST(N'1991-09-08' AS Date), CAST(1600.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(7, 2)), 3001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (68736, N'ADNRES', N'CLERK', 67858, CAST(N'1997-05-23' AS Date), CAST(1200.00 AS Decimal(10, 2)), NULL, 2001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (69000, N'JULIUS', N'CLERK', 66928, CAST(N'1991-12-03' AS Date), CAST(1050.00 AS Decimal(10, 2)), NULL, 3001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (69062, N'FRANK', N'ANALYST', 65646, CAST(N'1991-12-03' AS Date), CAST(3100.00 AS Decimal(10, 2)), NULL, 2001)
INSERT [Employee].[employees] ([emp_id], [emp_name], [job_name], [manager_id], [hire_date], [salary], [commission], [dep_id]) VALUES (69324, N'MARKER', N'CLERK', 67832, CAST(N'1992-01-23' AS Date), CAST(1400.00 AS Decimal(10, 2)), NULL, 1001)
SET IDENTITY_INSERT [Employee].[salary_grade] ON 

INSERT [Employee].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (1, 800, 1300)
INSERT [Employee].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (2, 1301, 1500)
INSERT [Employee].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (3, 1501, 2100)
INSERT [Employee].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (4, 2101, 3100)
INSERT [Employee].[salary_grade] ([grade], [min_salary], [max_salary]) VALUES (5, 3101, 9999)
SET IDENTITY_INSERT [Employee].[salary_grade] OFF
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (1, 1, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (2, 1, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (3, 1, 0)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (3, 2, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (4, 1, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (5, 1, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (6, 2, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (7, 1, 0)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (7, 2, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (8, 1, 1)
INSERT [Hospital].[Affiliated_With] ([physician], [department], [primaryaffiliation]) VALUES (9, 3, 1)
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (13216584, 100000001, 101, 1, CAST(N'2008-04-24T10:00:00.000' AS DateTime), CAST(N'2008-04-24T11:00:00.000' AS DateTime), N'A')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (26548913, 100000002, 101, 2, CAST(N'2008-04-24T10:00:00.000' AS DateTime), CAST(N'2008-04-24T11:00:00.000' AS DateTime), N'B')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (36549879, 100000001, 102, 1, CAST(N'2008-04-25T10:00:00.000' AS DateTime), CAST(N'2008-04-25T11:00:00.000' AS DateTime), N'A')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (46846589, 100000004, 103, 4, CAST(N'2008-04-25T10:00:00.000' AS DateTime), CAST(N'2008-04-25T11:00:00.000' AS DateTime), N'B')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (59871321, 100000004, NULL, 4, CAST(N'2008-04-26T10:00:00.000' AS DateTime), CAST(N'2008-04-26T11:00:00.000' AS DateTime), N'C')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (69879231, 100000003, 103, 2, CAST(N'2008-04-26T11:00:00.000' AS DateTime), CAST(N'2008-04-26T12:00:00.000' AS DateTime), N'C')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (76983231, 100000001, NULL, 3, CAST(N'2008-04-26T12:00:00.000' AS DateTime), CAST(N'2008-04-26T13:00:00.000' AS DateTime), N'C')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (86213939, 100000004, 102, 9, CAST(N'2008-04-27T10:00:00.000' AS DateTime), CAST(N'2008-04-21T11:00:00.000' AS DateTime), N'A')
INSERT [Hospital].[Appointment] ([appointmentid], [patient], [prepnurse], [physician], [start_dt_time], [end_dt_time], [examinationroom]) VALUES (93216548, 100000002, 101, 2, CAST(N'2008-04-27T10:00:00.000' AS DateTime), CAST(N'2008-04-27T11:00:00.000' AS DateTime), N'B')
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (1, 1)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (1, 2)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (1, 3)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (2, 1)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (2, 2)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (2, 3)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (3, 1)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (3, 2)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (3, 3)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (4, 1)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (4, 2)
INSERT [Hospital].[Block] ([blockfloor], [blockcode]) VALUES (4, 3)
INSERT [Hospital].[Department] ([name], [departmentid], [head]) VALUES (N'General Medicine', 1, 4)
INSERT [Hospital].[Department] ([name], [departmentid], [head]) VALUES (N'Surgery', 2, 7)
INSERT [Hospital].[Department] ([name], [departmentid], [head]) VALUES (N'Psychiatry', 3, 9)
INSERT [Hospital].[Medication] ([code], [name], [brand], [description]) VALUES (1, N'Procrastin-X', N'X', N'N/A')
INSERT [Hospital].[Medication] ([code], [name], [brand], [description]) VALUES (2, N'Thesisin', N'Foo Labs', N'N/A')
INSERT [Hospital].[Medication] ([code], [name], [brand], [description]) VALUES (3, N'Awakin', N'Bar Laboratories', N'N/A')
INSERT [Hospital].[Medication] ([code], [name], [brand], [description]) VALUES (4, N'Crescavitin', N'Baz Industries', N'N/A')
INSERT [Hospital].[Medication] ([code], [name], [brand], [description]) VALUES (5, N'Melioraurin', N'Snafu Pharmaceuticals', N'N/A')
INSERT [Hospital].[Nurse] ([employeeid], [name], [position], [registered], [ssn]) VALUES (101, N'Carla Espinosa', N'Head Nurse', 1, 111111110)
INSERT [Hospital].[Nurse] ([employeeid], [name], [position], [registered], [ssn]) VALUES (102, N'Laverne Roberts', N'Nurse', 1, 222222220)
INSERT [Hospital].[Nurse] ([employeeid], [name], [position], [registered], [ssn]) VALUES (103, N'Paul Flowers', N'Nurse', 0, 333333330)
INSERT [Hospital].[On-Call] ([nurse], [blockfloor], [blockcode], [oncallstart], [oncallend]) VALUES (101, 1, 1, CAST(N'2008-11-04T11:00:00.000' AS DateTime), CAST(N'2008-11-04T19:00:00.000' AS DateTime))
INSERT [Hospital].[On-Call] ([nurse], [blockfloor], [blockcode], [oncallstart], [oncallend]) VALUES (101, 1, 2, CAST(N'2008-11-04T11:00:00.000' AS DateTime), CAST(N'2008-11-04T19:00:00.000' AS DateTime))
INSERT [Hospital].[On-Call] ([nurse], [blockfloor], [blockcode], [oncallstart], [oncallend]) VALUES (102, 1, 3, CAST(N'2008-11-04T11:00:00.000' AS DateTime), CAST(N'2008-11-04T19:00:00.000' AS DateTime))
INSERT [Hospital].[On-Call] ([nurse], [blockfloor], [blockcode], [oncallstart], [oncallend]) VALUES (103, 1, 1, CAST(N'2008-11-04T19:00:00.000' AS DateTime), CAST(N'2008-11-05T03:00:00.000' AS DateTime))
INSERT [Hospital].[On-Call] ([nurse], [blockfloor], [blockcode], [oncallstart], [oncallend]) VALUES (103, 1, 2, CAST(N'2008-11-04T19:00:00.000' AS DateTime), CAST(N'2008-11-05T03:00:00.000' AS DateTime))
INSERT [Hospital].[On-Call] ([nurse], [blockfloor], [blockcode], [oncallstart], [oncallend]) VALUES (103, 1, 3, CAST(N'2008-11-04T19:00:00.000' AS DateTime), CAST(N'2008-11-05T03:00:00.000' AS DateTime))
INSERT [Hospital].[Patient] ([ssn], [name], [address], [phone], [insuranceid], [pcp]) VALUES (100000001, N'John Smith', N'42 Foobar Lane', N'555-0256', 68476213, 1)
INSERT [Hospital].[Patient] ([ssn], [name], [address], [phone], [insuranceid], [pcp]) VALUES (100000002, N'Grace Ritchie', N'37 Snafu Drive', N'555-0512', 36546321, 2)
INSERT [Hospital].[Patient] ([ssn], [name], [address], [phone], [insuranceid], [pcp]) VALUES (100000003, N'Random J. Patient', N'101 Omgbbq Street', N'555-1204', 65465421, 2)
INSERT [Hospital].[Patient] ([ssn], [name], [address], [phone], [insuranceid], [pcp]) VALUES (100000004, N'Dennis Doe', N'1100 Foobaz Avenue', N'555-2048', 68421879, 3)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (1, N'John Dorian', N'Staff Internist', 111111111)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (2, N'Elliot Reid', N'Attending Physician', 222222222)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (3, N'Christopher Turk', N'Surgical Attending Physician', 333333333)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (4, N'Percival Cox', N'Senior Attending Physician', 444444444)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (5, N'Bob Kelso', N'Head Chief of Medicine', 555555555)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (6, N'Todd Quinlan', N'Surgical Attending Physician', 666666666)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (7, N'John Wen', N'Surgical Attending Physician', 777777777)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (8, N'Keith Dudemeister', N'MD Resident', 888888888)
INSERT [Hospital].[Physician] ([employeeid], [name], [position], [ssn]) VALUES (9, N'Molly Clock', N'Attending Psychiatrist', 999999999)
INSERT [Hospital].[Prescribes] ([physician], [patient], [medication], [date], [appointment], [dose]) VALUES (1, 100000001, 1, CAST(N'2008-04-24T10:47:00.000' AS DateTime), 13216584, N'5')
INSERT [Hospital].[Prescribes] ([physician], [patient], [medication], [date], [appointment], [dose]) VALUES (9, 100000004, 2, CAST(N'2008-04-27T10:53:00.000' AS DateTime), 86213939, N'10')
INSERT [Hospital].[Prescribes] ([physician], [patient], [medication], [date], [appointment], [dose]) VALUES (9, 100000004, 2, CAST(N'2008-04-30T16:53:00.000' AS DateTime), NULL, N'5')
INSERT [Hospital].[Procedures] ([code], [name], [cost]) VALUES (1, N'Reverse Rhinopodoplasty', 1500)
INSERT [Hospital].[Procedures] ([code], [name], [cost]) VALUES (2, N'Obtuse Pyloric Recombobulation', 3750)
INSERT [Hospital].[Procedures] ([code], [name], [cost]) VALUES (3, N'Folded Demiophtalmectomy', 4500)
INSERT [Hospital].[Procedures] ([code], [name], [cost]) VALUES (4, N'Complete Walletectomy', 10000)
INSERT [Hospital].[Procedures] ([code], [name], [cost]) VALUES (5, N'Obfuscated Dermogastrotomy', 4899)
INSERT [Hospital].[Procedures] ([code], [name], [cost]) VALUES (6, N'Reversible Pancreomyoplasty', 5600)
INSERT [Hospital].[Procedures] ([code], [name], [cost]) VALUES (7, N'Follicular Demiectomy', 25)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 1, 101, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 1, 102, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 1, 103, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 2, 111, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 2, 112, N'Single', 1)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 2, 113, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 3, 121, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 3, 122, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (1, 3, 123, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 1, 201, N'Single', 1)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 1, 202, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 1, 203, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 2, 211, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 2, 212, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 2, 213, N'Single', 1)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 3, 221, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 3, 222, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (2, 3, 223, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 1, 301, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 1, 302, N'Single', 1)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 1, 303, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 2, 311, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 2, 312, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 2, 313, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 3, 321, N'Single', 1)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 3, 322, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (3, 3, 323, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 1, 401, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 1, 402, N'Single', 1)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 1, 403, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 2, 411, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 2, 412, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 2, 413, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 3, 421, N'Single', 1)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 3, 422, N'Single', 0)
INSERT [Hospital].[Room] ([blockfloor], [blockcode], [roomnumber], [roomtype], [unavailable]) VALUES (4, 3, 423, N'Single', 0)
INSERT [Hospital].[Stay] ([stayid], [patient], [room], [start_time], [end_time]) VALUES (3215, 100000001, 111, CAST(N'2008-05-01T00:00:00.000' AS DateTime), CAST(N'2008-05-04T00:00:00.000' AS DateTime))
INSERT [Hospital].[Stay] ([stayid], [patient], [room], [start_time], [end_time]) VALUES (3216, 100000003, 123, CAST(N'2008-05-03T00:00:00.000' AS DateTime), CAST(N'2008-05-14T00:00:00.000' AS DateTime))
INSERT [Hospital].[Stay] ([stayid], [patient], [room], [start_time], [end_time]) VALUES (3217, 100000004, 112, CAST(N'2008-05-02T00:00:00.000' AS DateTime), CAST(N'2008-05-03T00:00:00.000' AS DateTime))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (3, 1, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (3, 2, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (3, 5, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (3, 6, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (3, 7, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (6, 2, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (6, 5, CAST(N'2007-01-01' AS Date), CAST(N'2007-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (6, 6, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (7, 1, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (7, 2, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (7, 3, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (7, 4, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (7, 5, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (7, 6, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Trained_in] ([physician], [treatment], [certificationdate], [certificationexpires]) VALUES (7, 7, CAST(N'2008-01-01' AS Date), CAST(N'2008-12-31' AS Date))
INSERT [Hospital].[Undergoes] ([patient], [procedur], [stay], [date], [physician], [assistingnurse]) VALUES (100000001, 2, 3215, CAST(N'2008-05-03T00:00:00.000' AS DateTime), 7, 101)
INSERT [Hospital].[Undergoes] ([patient], [procedur], [stay], [date], [physician], [assistingnurse]) VALUES (100000001, 6, 3215, CAST(N'2008-05-02T00:00:00.000' AS DateTime), 3, 101)
INSERT [Hospital].[Undergoes] ([patient], [procedur], [stay], [date], [physician], [assistingnurse]) VALUES (100000001, 7, 3217, CAST(N'2008-05-10T00:00:00.000' AS DateTime), 7, 101)
INSERT [Hospital].[Undergoes] ([patient], [procedur], [stay], [date], [physician], [assistingnurse]) VALUES (100000004, 1, 3217, CAST(N'2008-05-07T00:00:00.000' AS DateTime), 3, 102)
INSERT [Hospital].[Undergoes] ([patient], [procedur], [stay], [date], [physician], [assistingnurse]) VALUES (100000004, 4, 3217, CAST(N'2008-05-13T00:00:00.000' AS DateTime), 3, 103)
INSERT [Hospital].[Undergoes] ([patient], [procedur], [stay], [date], [physician], [assistingnurse]) VALUES (100000004, 5, 3217, CAST(N'2008-05-09T00:00:00.000' AS DateTime), 6, NULL)
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'AR', N'Argentina', CAST(2 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'AU', N'Australia', CAST(3 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'BE', N'Belgium', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'BR', N'Brazil', CAST(2 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'CA', N'Canada', CAST(2 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'CH', N'Switzerland', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'CN', N'China', CAST(3 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'DE', N'Germany', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'DK', N'Denmark', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'EG', N'Egypt', CAST(4 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'FR', N'France', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'HK', N'HongKong', CAST(3 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'IL', N'Israel', CAST(4 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'IN', N'India', CAST(3 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'IT', N'Italy', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'JP', N'Japan', CAST(3 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'KW', N'Kuwait', CAST(4 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'MX', N'Mexico', CAST(2 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'NG', N'Nigeria', CAST(4 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'NL', N'Netherlands', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'SG', N'Singapore', CAST(3 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'UK', N'United Kingdom', CAST(1 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'US', N'United States of America', CAST(2 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'ZM', N'Zambia', CAST(4 AS Numeric(10, 0)))
INSERT [HR].[Countries] ([country_id], [country_name], [region_id]) VALUES (N'ZW', N'Zimbabwe', CAST(4 AS Numeric(10, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(10 AS Numeric(4, 0)), N'Administration', CAST(200 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(20 AS Numeric(4, 0)), N'Marketing', CAST(201 AS Numeric(6, 0)), CAST(1800 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(30 AS Numeric(4, 0)), N'Purchasing', CAST(114 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(40 AS Numeric(4, 0)), N'Human Resources', CAST(203 AS Numeric(6, 0)), CAST(2400 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(50 AS Numeric(4, 0)), N'Shipping', CAST(121 AS Numeric(6, 0)), CAST(1500 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(60 AS Numeric(4, 0)), N'IT', CAST(103 AS Numeric(6, 0)), CAST(1400 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(70 AS Numeric(4, 0)), N'Public Relations', CAST(204 AS Numeric(6, 0)), CAST(2700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(80 AS Numeric(4, 0)), N'Sales', CAST(145 AS Numeric(6, 0)), CAST(2500 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(90 AS Numeric(4, 0)), N'Executive', CAST(100 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(100 AS Numeric(4, 0)), N'Finance', CAST(108 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(110 AS Numeric(4, 0)), N'Accounting', CAST(205 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(120 AS Numeric(4, 0)), N'Treasury', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(130 AS Numeric(4, 0)), N'Corporate Tax', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(140 AS Numeric(4, 0)), N'Control And Credit', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(150 AS Numeric(4, 0)), N'Shareholder Services', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(160 AS Numeric(4, 0)), N'Benefits', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(170 AS Numeric(4, 0)), N'Manufacturing', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(180 AS Numeric(4, 0)), N'Construction', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(190 AS Numeric(4, 0)), N'Contracting', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(200 AS Numeric(4, 0)), N'Operations', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(210 AS Numeric(4, 0)), N'IT Support', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(220 AS Numeric(4, 0)), N'NOC', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(230 AS Numeric(4, 0)), N'IT Helpdesk', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(240 AS Numeric(4, 0)), N'Government Sales', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(250 AS Numeric(4, 0)), N'Retail Sales', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(260 AS Numeric(4, 0)), N'Recruiting', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (CAST(270 AS Numeric(4, 0)), N'Payroll', CAST(0 AS Numeric(6, 0)), CAST(1700 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(100 AS Numeric(6, 0)), N'Steven', N'King', N'SKING', N'515.123.4567', CAST(N'2003-06-17' AS Date), N'AD_PRES', CAST(24000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(0 AS Numeric(6, 0)), CAST(90 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(101 AS Numeric(6, 0)), N'Neena', N'Kochhar', N'NKOCHHAR', N'515.123.4568', CAST(N'2005-09-21' AS Date), N'AD_VP', CAST(17000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(90 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(102 AS Numeric(6, 0)), N'Lex', N'De Haan', N'LDEHAAN', N'515.123.4569', CAST(N'2001-01-13' AS Date), N'AD_VP', CAST(17000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(90 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(103 AS Numeric(6, 0)), N'Alexander', N'Hunold', N'AHUNOLD', N'590.423.4567', CAST(N'2006-01-03' AS Date), N'IT_PROG', CAST(9000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(102 AS Numeric(6, 0)), CAST(60 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(104 AS Numeric(6, 0)), N'Bruce', N'Ernst', N'BERNST', N'590.423.4568', CAST(N'2007-05-21' AS Date), N'IT_PROG', CAST(6000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(103 AS Numeric(6, 0)), CAST(60 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(105 AS Numeric(6, 0)), N'David', N'Austin', N'DAUSTIN', N'590.423.4569', CAST(N'2005-06-25' AS Date), N'IT_PROG', CAST(4800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(103 AS Numeric(6, 0)), CAST(60 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(106 AS Numeric(6, 0)), N'Valli', N'Pataballa', N'VPATABAL', N'590.423.4560', CAST(N'2006-02-05' AS Date), N'IT_PROG', CAST(4800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(103 AS Numeric(6, 0)), CAST(60 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(107 AS Numeric(6, 0)), N'Diana', N'Lorentz', N'DLORENTZ', N'590.423.5567', CAST(N'2007-02-07' AS Date), N'IT_PROG', CAST(4200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(103 AS Numeric(6, 0)), CAST(60 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(108 AS Numeric(6, 0)), N'Nancy', N'Greenberg', N'NGREENBE', N'515.124.4569', CAST(N'2002-08-17' AS Date), N'FI_MGR', CAST(12000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(101 AS Numeric(6, 0)), CAST(100 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(109 AS Numeric(6, 0)), N'Daniel', N'Faviet', N'DFAVIET', N'515.124.4169', CAST(N'2002-08-16' AS Date), N'FI_ACCOUNT', CAST(9000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(108 AS Numeric(6, 0)), CAST(100 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(110 AS Numeric(6, 0)), N'John', N'Chen', N'JCHEN', N'515.124.4269', CAST(N'2005-09-28' AS Date), N'FI_ACCOUNT', CAST(8200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(108 AS Numeric(6, 0)), CAST(100 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(111 AS Numeric(6, 0)), N'Ismael', N'Sciarra', N'ISCIARRA', N'515.124.4369', CAST(N'2005-09-30' AS Date), N'FI_ACCOUNT', CAST(7700.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(108 AS Numeric(6, 0)), CAST(100 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(112 AS Numeric(6, 0)), N'Jose Manuel', N'Urman', N'JMURMAN', N'515.124.4469', CAST(N'2006-03-07' AS Date), N'FI_ACCOUNT', CAST(7800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(108 AS Numeric(6, 0)), CAST(100 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(113 AS Numeric(6, 0)), N'Luis', N'Popp', N'LPOPP', N'515.124.4567', CAST(N'2007-12-07' AS Date), N'FI_ACCOUNT', CAST(6900.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(108 AS Numeric(6, 0)), CAST(100 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(114 AS Numeric(6, 0)), N'Den', N'Raphaely', N'DRAPHEAL', N'515.127.4561', CAST(N'2002-12-07' AS Date), N'PU_MAN', CAST(11000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(30 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(115 AS Numeric(6, 0)), N'Alexander', N'Khoo', N'AKHOO', N'515.127.4562', CAST(N'2003-05-18' AS Date), N'PU_CLERK', CAST(3100.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(114 AS Numeric(6, 0)), CAST(30 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(116 AS Numeric(6, 0)), N'Shelli', N'Baida', N'SBAIDA', N'515.127.4563', CAST(N'2005-12-24' AS Date), N'PU_CLERK', CAST(2900.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(114 AS Numeric(6, 0)), CAST(30 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(117 AS Numeric(6, 0)), N'Sigal', N'Tobias', N'STOBIAS', N'515.127.4564', CAST(N'2005-07-24' AS Date), N'PU_CLERK', CAST(2800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(114 AS Numeric(6, 0)), CAST(30 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(118 AS Numeric(6, 0)), N'Guy', N'Himuro', N'GHIMURO', N'515.127.4565', CAST(N'2006-11-15' AS Date), N'PU_CLERK', CAST(2600.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(114 AS Numeric(6, 0)), CAST(30 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(119 AS Numeric(6, 0)), N'Karen', N'Colmenares', N'KCOLMENA', N'515.127.4566', CAST(N'2007-08-10' AS Date), N'PU_CLERK', CAST(2500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(114 AS Numeric(6, 0)), CAST(30 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(120 AS Numeric(6, 0)), N'Matthew', N'Weiss', N'MWEISS', N'650.123.1234', CAST(N'2004-07-18' AS Date), N'ST_MAN', CAST(8000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(121 AS Numeric(6, 0)), N'Adam', N'Fripp', N'AFRIPP', N'650.123.2234', CAST(N'2005-04-10' AS Date), N'ST_MAN', CAST(8200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(122 AS Numeric(6, 0)), N'Payam', N'Kaufling', N'PKAUFLIN', N'650.123.3234', CAST(N'2003-05-01' AS Date), N'ST_MAN', CAST(7900.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(123 AS Numeric(6, 0)), N'Shanta', N'Vollman', N'SVOLLMAN', N'650.123.4234', CAST(N'2005-10-10' AS Date), N'ST_MAN', CAST(6500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(124 AS Numeric(6, 0)), N'Kevin', N'Mourgos', N'KMOURGOS', N'650.123.5234', CAST(N'2007-11-16' AS Date), N'ST_MAN', CAST(5800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(125 AS Numeric(6, 0)), N'Julia', N'Nayer', N'JNAYER', N'650.124.1214', CAST(N'2005-07-16' AS Date), N'ST_CLERK', CAST(3200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(126 AS Numeric(6, 0)), N'Irene', N'Mikkilineni', N'IMIKKILI', N'650.124.1224', CAST(N'2006-09-28' AS Date), N'ST_CLERK', CAST(2700.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(127 AS Numeric(6, 0)), N'James', N'Landry', N'JLANDRY', N'650.124.1334', CAST(N'2007-01-14' AS Date), N'ST_CLERK', CAST(2400.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(128 AS Numeric(6, 0)), N'Steven', N'Markle', N'SMARKLE', N'650.124.1434', CAST(N'2008-03-08' AS Date), N'ST_CLERK', CAST(2200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(129 AS Numeric(6, 0)), N'Laura', N'Bissot', N'LBISSOT', N'650.124.5234', CAST(N'2005-08-20' AS Date), N'ST_CLERK', CAST(3300.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(130 AS Numeric(6, 0)), N'Mozhe', N'Atkinson', N'MATKINSO', N'650.124.6234', CAST(N'2005-10-30' AS Date), N'ST_CLERK', CAST(2800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(131 AS Numeric(6, 0)), N'James', N'Marlow', N'JAMRLOW', N'650.124.7234', CAST(N'2005-02-16' AS Date), N'ST_CLERK', CAST(2500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(132 AS Numeric(6, 0)), N'TJ', N'Olson', N'TJOLSON', N'650.124.8234', CAST(N'2007-04-10' AS Date), N'ST_CLERK', CAST(2100.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(133 AS Numeric(6, 0)), N'Jason', N'Mallin', N'JMALLIN', N'650.127.1934', CAST(N'2004-06-14' AS Date), N'ST_CLERK', CAST(3300.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(134 AS Numeric(6, 0)), N'Michael', N'Rogers', N'MROGERS', N'650.127.1834', CAST(N'2006-08-26' AS Date), N'ST_CLERK', CAST(2900.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(135 AS Numeric(6, 0)), N'Ki', N'Gee', N'KGEE', N'650.127.1734', CAST(N'2007-12-12' AS Date), N'ST_CLERK', CAST(2400.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(136 AS Numeric(6, 0)), N'Hazel', N'Philtanker', N'HPHILTAN', N'650.127.1634', CAST(N'2008-02-06' AS Date), N'ST_CLERK', CAST(2200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(137 AS Numeric(6, 0)), N'Renske', N'Ladwig', N'RLADWIG', N'650.121.1234', CAST(N'2003-07-14' AS Date), N'ST_CLERK', CAST(3600.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(138 AS Numeric(6, 0)), N'Stephen', N'Stiles', N'SSTILES', N'650.121.2034', CAST(N'2005-10-26' AS Date), N'ST_CLERK', CAST(3200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(139 AS Numeric(6, 0)), N'John', N'Seo', N'JSEO', N'650.121.2019', CAST(N'2006-02-12' AS Date), N'ST_CLERK', CAST(2700.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(140 AS Numeric(6, 0)), N'Joshua', N'Patel', N'JPATEL', N'650.121.1834', CAST(N'2006-04-06' AS Date), N'ST_CLERK', CAST(2500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(141 AS Numeric(6, 0)), N'Trenna', N'Rajs', N'TRAJS', N'650.121.8009', CAST(N'2003-10-17' AS Date), N'ST_CLERK', CAST(3500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(142 AS Numeric(6, 0)), N'Curtis', N'Davies', N'CDAVIES', N'650.121.2994', CAST(N'2005-01-29' AS Date), N'ST_CLERK', CAST(3100.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(143 AS Numeric(6, 0)), N'Randall', N'Matos', N'RMATOS', N'650.121.2874', CAST(N'2006-03-15' AS Date), N'ST_CLERK', CAST(2600.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(144 AS Numeric(6, 0)), N'Peter', N'Vargas', N'PVARGAS', N'650.121.2004', CAST(N'2006-07-09' AS Date), N'ST_CLERK', CAST(2500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(145 AS Numeric(6, 0)), N'John', N'Russell', N'JRUSSEL', N'011.44.1344.429268', CAST(N'2004-10-01' AS Date), N'SA_MAN', CAST(14000.00 AS Numeric(8, 2)), CAST(0.40 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(146 AS Numeric(6, 0)), N'Karen', N'Partners', N'KPARTNER', N'011.44.1344.467268', CAST(N'2005-01-05' AS Date), N'SA_MAN', CAST(13500.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(147 AS Numeric(6, 0)), N'Alberto', N'Errazuriz', N'AERRAZUR', N'011.44.1344.429278', CAST(N'2005-03-10' AS Date), N'SA_MAN', CAST(12000.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(148 AS Numeric(6, 0)), N'Gerald', N'Cambrault', N'GCAMBRAU', N'011.44.1344.619268', CAST(N'2007-10-15' AS Date), N'SA_MAN', CAST(11000.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(149 AS Numeric(6, 0)), N'Eleni', N'Zlotkey', N'EZLOTKEY', N'011.44.1344.429018', CAST(N'2008-01-29' AS Date), N'SA_MAN', CAST(10500.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), CAST(100 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(150 AS Numeric(6, 0)), N'Peter', N'Tucker', N'PTUCKER', N'011.44.1344.129268', CAST(N'2005-01-30' AS Date), N'SA_REP', CAST(10000.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), CAST(145 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(151 AS Numeric(6, 0)), N'David', N'Bernstein', N'DBERNSTE', N'011.44.1344.345268', CAST(N'2005-03-24' AS Date), N'SA_REP', CAST(9500.00 AS Numeric(8, 2)), CAST(0.25 AS Numeric(2, 2)), CAST(145 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(152 AS Numeric(6, 0)), N'Peter', N'Hall', N'PHALL', N'011.44.1344.478968', CAST(N'2005-08-20' AS Date), N'SA_REP', CAST(9000.00 AS Numeric(8, 2)), CAST(0.25 AS Numeric(2, 2)), CAST(145 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(153 AS Numeric(6, 0)), N'Christopher', N'Olsen', N'COLSEN', N'011.44.1344.498718', CAST(N'2006-03-30' AS Date), N'SA_REP', CAST(8000.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), CAST(145 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(154 AS Numeric(6, 0)), N'Nanette', N'Cambrault', N'NCAMBRAU', N'011.44.1344.987668', CAST(N'2006-12-09' AS Date), N'SA_REP', CAST(7500.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), CAST(145 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(155 AS Numeric(6, 0)), N'Oliver', N'Tuvault', N'OTUVAULT', N'011.44.1344.486508', CAST(N'2007-11-23' AS Date), N'SA_REP', CAST(7000.00 AS Numeric(8, 2)), CAST(0.15 AS Numeric(2, 2)), CAST(145 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(156 AS Numeric(6, 0)), N'Janette', N'King', N'JKING', N'011.44.1345.429268', CAST(N'2004-01-30' AS Date), N'SA_REP', CAST(10000.00 AS Numeric(8, 2)), CAST(0.35 AS Numeric(2, 2)), CAST(146 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(157 AS Numeric(6, 0)), N'Patrick', N'Sully', N'PSULLY', N'011.44.1345.929268', CAST(N'2004-03-04' AS Date), N'SA_REP', CAST(9500.00 AS Numeric(8, 2)), CAST(0.35 AS Numeric(2, 2)), CAST(146 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(158 AS Numeric(6, 0)), N'Allan', N'McEwen', N'AMCEWEN', N'011.44.1345.829268', CAST(N'2004-08-01' AS Date), N'SA_REP', CAST(9000.00 AS Numeric(8, 2)), CAST(0.35 AS Numeric(2, 2)), CAST(146 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(159 AS Numeric(6, 0)), N'Lindsey', N'Smith', N'LSMITH', N'011.44.1345.729268', CAST(N'2005-03-10' AS Date), N'SA_REP', CAST(8000.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), CAST(146 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(160 AS Numeric(6, 0)), N'Louise', N'Doran', N'LDORAN', N'011.44.1345.629268', CAST(N'2005-12-15' AS Date), N'SA_REP', CAST(7500.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), CAST(146 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(161 AS Numeric(6, 0)), N'Sarath', N'Sewall', N'SSEWALL', N'011.44.1345.529268', CAST(N'2006-11-03' AS Date), N'SA_REP', CAST(7000.00 AS Numeric(8, 2)), CAST(0.25 AS Numeric(2, 2)), CAST(146 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(162 AS Numeric(6, 0)), N'Clara', N'Vishney', N'CVISHNEY', N'011.44.1346.129268', CAST(N'2005-11-11' AS Date), N'SA_REP', CAST(10500.00 AS Numeric(8, 2)), CAST(0.25 AS Numeric(2, 2)), CAST(147 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(163 AS Numeric(6, 0)), N'Danielle', N'Greene', N'DGREENE', N'011.44.1346.229268', CAST(N'2007-03-19' AS Date), N'SA_REP', CAST(9500.00 AS Numeric(8, 2)), CAST(0.15 AS Numeric(2, 2)), CAST(147 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(164 AS Numeric(6, 0)), N'Mattea', N'Marvins', N'MMARVINS', N'011.44.1346.329268', CAST(N'2008-01-24' AS Date), N'SA_REP', CAST(7200.00 AS Numeric(8, 2)), CAST(0.10 AS Numeric(2, 2)), CAST(147 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(165 AS Numeric(6, 0)), N'David', N'Lee', N'DLEE', N'011.44.1346.529268', CAST(N'2008-02-23' AS Date), N'SA_REP', CAST(6800.00 AS Numeric(8, 2)), CAST(0.10 AS Numeric(2, 2)), CAST(147 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(166 AS Numeric(6, 0)), N'Sundar', N'Ande', N'SANDE', N'011.44.1346.629268', CAST(N'2008-03-24' AS Date), N'SA_REP', CAST(6400.00 AS Numeric(8, 2)), CAST(0.10 AS Numeric(2, 2)), CAST(147 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(167 AS Numeric(6, 0)), N'Amit', N'Banda', N'ABANDA', N'011.44.1346.729268', CAST(N'2008-04-21' AS Date), N'SA_REP', CAST(6200.00 AS Numeric(8, 2)), CAST(0.10 AS Numeric(2, 2)), CAST(147 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(168 AS Numeric(6, 0)), N'Lisa', N'Ozer', N'LOZER', N'011.44.1343.929268', CAST(N'2005-03-11' AS Date), N'SA_REP', CAST(11500.00 AS Numeric(8, 2)), CAST(0.25 AS Numeric(2, 2)), CAST(148 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(169 AS Numeric(6, 0)), N'Harrison', N'Bloom', N'HBLOOM', N'011.44.1343.829268', CAST(N'2006-03-23' AS Date), N'SA_REP', CAST(10000.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), CAST(148 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(170 AS Numeric(6, 0)), N'Tayler', N'Fox', N'TFOX', N'011.44.1343.729268', CAST(N'2006-01-24' AS Date), N'SA_REP', CAST(9600.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), CAST(148 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(171 AS Numeric(6, 0)), N'William', N'Smith', N'WSMITH', N'011.44.1343.629268', CAST(N'2007-02-23' AS Date), N'SA_REP', CAST(7400.00 AS Numeric(8, 2)), CAST(0.15 AS Numeric(2, 2)), CAST(148 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(172 AS Numeric(6, 0)), N'Elizabeth', N'Bates', N'EBATES', N'011.44.1343.529268', CAST(N'2007-03-24' AS Date), N'SA_REP', CAST(7300.00 AS Numeric(8, 2)), CAST(0.15 AS Numeric(2, 2)), CAST(148 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(173 AS Numeric(6, 0)), N'Sundita', N'Kumar', N'SKUMAR', N'011.44.1343.329268', CAST(N'2008-04-21' AS Date), N'SA_REP', CAST(6100.00 AS Numeric(8, 2)), CAST(0.10 AS Numeric(2, 2)), CAST(148 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(174 AS Numeric(6, 0)), N'Ellen', N'Abel', N'EABEL', N'011.44.1644.429267', CAST(N'2004-05-11' AS Date), N'SA_REP', CAST(11000.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), CAST(149 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(175 AS Numeric(6, 0)), N'Alyssa', N'Hutton', N'AHUTTON', N'011.44.1644.429266', CAST(N'2005-03-19' AS Date), N'SA_REP', CAST(8800.00 AS Numeric(8, 2)), CAST(0.25 AS Numeric(2, 2)), CAST(149 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(176 AS Numeric(6, 0)), N'Jonathon', N'Taylor', N'JTAYLOR', N'011.44.1644.429265', CAST(N'2006-03-24' AS Date), N'SA_REP', CAST(8600.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), CAST(149 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(177 AS Numeric(6, 0)), N'Jack', N'Livingston', N'JLIVINGS', N'011.44.1644.429264', CAST(N'2006-04-23' AS Date), N'SA_REP', CAST(8400.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), CAST(149 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(178 AS Numeric(6, 0)), N'Kimberely', N'Grant', N'KGRANT', N'011.44.1644.429263', CAST(N'2007-05-24' AS Date), N'SA_REP', CAST(7000.00 AS Numeric(8, 2)), CAST(0.15 AS Numeric(2, 2)), CAST(149 AS Numeric(6, 0)), CAST(0 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(179 AS Numeric(6, 0)), N'Charles', N'Johnson', N'CJOHNSON', N'011.44.1644.429262', CAST(N'2008-01-04' AS Date), N'SA_REP', CAST(6200.00 AS Numeric(8, 2)), CAST(0.10 AS Numeric(2, 2)), CAST(149 AS Numeric(6, 0)), CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(180 AS Numeric(6, 0)), N'Winston', N'Taylor', N'WTAYLOR', N'650.507.9876', CAST(N'2006-01-24' AS Date), N'SH_CLERK', CAST(3200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(181 AS Numeric(6, 0)), N'Jean', N'Fleaur', N'JFLEAUR', N'650.507.9877', CAST(N'2006-02-23' AS Date), N'SH_CLERK', CAST(3100.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(182 AS Numeric(6, 0)), N'Martha', N'Sullivan', N'MSULLIVA', N'650.507.9878', CAST(N'2007-06-21' AS Date), N'SH_CLERK', CAST(2500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(183 AS Numeric(6, 0)), N'Girard', N'Geoni', N'GGEONI', N'650.507.9879', CAST(N'2008-02-03' AS Date), N'SH_CLERK', CAST(2800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(120 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(184 AS Numeric(6, 0)), N'Nandita', N'Sarchand', N'NSARCHAN', N'650.509.1876', CAST(N'2004-01-27' AS Date), N'SH_CLERK', CAST(4200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(185 AS Numeric(6, 0)), N'Alexis', N'Bull', N'ABULL', N'650.509.2876', CAST(N'2005-02-20' AS Date), N'SH_CLERK', CAST(4100.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(186 AS Numeric(6, 0)), N'Julia', N'Dellinger', N'JDELLING', N'650.509.3876', CAST(N'2006-06-24' AS Date), N'SH_CLERK', CAST(3400.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(187 AS Numeric(6, 0)), N'Anthony', N'Cabrio', N'ACABRIO', N'650.509.4876', CAST(N'2007-02-07' AS Date), N'SH_CLERK', CAST(3000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(121 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(188 AS Numeric(6, 0)), N'Kelly', N'Chung', N'KCHUNG', N'650.505.1876', CAST(N'2005-06-14' AS Date), N'SH_CLERK', CAST(3800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(189 AS Numeric(6, 0)), N'Jennifer', N'Dilly', N'JDILLY', N'650.505.2876', CAST(N'2005-08-13' AS Date), N'SH_CLERK', CAST(3600.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(190 AS Numeric(6, 0)), N'Timothy', N'Gates', N'TGATES', N'650.505.3876', CAST(N'2006-07-11' AS Date), N'SH_CLERK', CAST(2900.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(191 AS Numeric(6, 0)), N'Randall', N'Perkins', N'RPERKINS', N'650.505.4876', CAST(N'2007-12-19' AS Date), N'SH_CLERK', CAST(2500.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(122 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(192 AS Numeric(6, 0)), N'Sarah', N'Bell', N'SBELL', N'650.501.1876', CAST(N'2004-02-04' AS Date), N'SH_CLERK', CAST(4000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(193 AS Numeric(6, 0)), N'Britney', N'Everett', N'BEVERETT', N'650.501.2876', CAST(N'2005-03-03' AS Date), N'SH_CLERK', CAST(3900.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(194 AS Numeric(6, 0)), N'Samuel', N'McCain', N'SMCCAIN', N'650.501.3876', CAST(N'2006-07-01' AS Date), N'SH_CLERK', CAST(3200.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(195 AS Numeric(6, 0)), N'Vance', N'Jones', N'VJONES', N'650.501.4876', CAST(N'2007-03-17' AS Date), N'SH_CLERK', CAST(2800.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(123 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(196 AS Numeric(6, 0)), N'Alana', N'Walsh', N'AWALSH', N'650.507.9811', CAST(N'2006-04-24' AS Date), N'SH_CLERK', CAST(3100.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(197 AS Numeric(6, 0)), N'Kevin', N'Feeney', N'KFEENEY', N'650.507.9822', CAST(N'2006-05-23' AS Date), N'SH_CLERK', CAST(3000.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(198 AS Numeric(6, 0)), N'Donald', N'OConnell', N'DOCONNEL', N'650.507.9833', CAST(N'2007-06-21' AS Date), N'SH_CLERK', CAST(2600.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (CAST(199 AS Numeric(6, 0)), N'Douglas', N'Grant', N'DGRANT', N'650.507.9844', CAST(N'2008-01-13' AS Date), N'SH_CLERK', CAST(2600.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(2, 2)), CAST(124 AS Numeric(6, 0)), CAST(50 AS Numeric(4, 0)))
GO
INSERT [HR].[Job_Grades] ([grade_level], [lowest_sal], [highest_sal]) VALUES (N'A', CAST(1000 AS Numeric(5, 0)), CAST(2999 AS Numeric(5, 0)))
INSERT [HR].[Job_Grades] ([grade_level], [lowest_sal], [highest_sal]) VALUES (N'B', CAST(3000 AS Numeric(5, 0)), CAST(5999 AS Numeric(5, 0)))
INSERT [HR].[Job_Grades] ([grade_level], [lowest_sal], [highest_sal]) VALUES (N'C', CAST(6000 AS Numeric(5, 0)), CAST(9999 AS Numeric(5, 0)))
INSERT [HR].[Job_Grades] ([grade_level], [lowest_sal], [highest_sal]) VALUES (N'D', CAST(10000 AS Numeric(5, 0)), CAST(14999 AS Numeric(5, 0)))
INSERT [HR].[Job_Grades] ([grade_level], [lowest_sal], [highest_sal]) VALUES (N'E', CAST(15000 AS Numeric(5, 0)), CAST(24999 AS Numeric(5, 0)))
INSERT [HR].[Job_Grades] ([grade_level], [lowest_sal], [highest_sal]) VALUES (N'F', CAST(25000 AS Numeric(5, 0)), CAST(40000 AS Numeric(5, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(101 AS Numeric(6, 0)), CAST(N'1997-09-21' AS Date), CAST(N'2001-10-27' AS Date), N'AC_ACCOUNT', CAST(110 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(101 AS Numeric(6, 0)), CAST(N'2001-10-28' AS Date), CAST(N'2005-03-15' AS Date), N'AC_MGR', CAST(110 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(102 AS Numeric(6, 0)), CAST(N'2001-01-13' AS Date), CAST(N'2006-07-24' AS Date), N'IT_PROG', CAST(60 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(114 AS Numeric(6, 0)), CAST(N'2006-03-24' AS Date), CAST(N'2007-12-31' AS Date), N'ST_CLERK', CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(122 AS Numeric(6, 0)), CAST(N'2007-01-01' AS Date), CAST(N'2007-12-31' AS Date), N'ST_CLERK', CAST(50 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(176 AS Numeric(6, 0)), CAST(N'2006-03-24' AS Date), CAST(N'2006-12-31' AS Date), N'SA_REP', CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(176 AS Numeric(6, 0)), CAST(N'2007-01-01' AS Date), CAST(N'2007-12-31' AS Date), N'SA_MAN', CAST(80 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(200 AS Numeric(6, 0)), CAST(N'1995-09-17' AS Date), CAST(N'2001-06-17' AS Date), N'AD_ASST', CAST(90 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(200 AS Numeric(6, 0)), CAST(N'2002-07-01' AS Date), CAST(N'2006-12-31' AS Date), N'AC_ACCOUNT', CAST(90 AS Numeric(4, 0)))
INSERT [HR].[Job_History] ([employee_id], [start_date], [end_date], [job_id], [department_id]) VALUES (CAST(201 AS Numeric(6, 0)), CAST(N'2004-02-17' AS Date), CAST(N'2007-12-19' AS Date), N'MK_REP', CAST(20 AS Numeric(4, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AC_ACCOUNT', N'Public Accountant', CAST(4200 AS Numeric(6, 0)), CAST(9000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AC_MGR', N'Accounting Manager', CAST(8200 AS Numeric(6, 0)), CAST(16000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AD_ASST', N'Administration Assistant', CAST(3000 AS Numeric(6, 0)), CAST(6000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AD_PRES', N'President', CAST(20000 AS Numeric(6, 0)), CAST(40000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AD_VP', N'Administration Vice President', CAST(15000 AS Numeric(6, 0)), CAST(30000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'FI_ACCOUNT', N'Accountant', CAST(4200 AS Numeric(6, 0)), CAST(9000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'FI_MGR', N'Finance Manager', CAST(8200 AS Numeric(6, 0)), CAST(16000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'HR_REP', N'Human Resources Representative', CAST(4000 AS Numeric(6, 0)), CAST(9000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'IT_PROG', N'Programmer', CAST(4000 AS Numeric(6, 0)), CAST(10000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'MK_MAN', N'Marketing Manager', CAST(9000 AS Numeric(6, 0)), CAST(15000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'MK_REP', N'Marketing Representative', CAST(4000 AS Numeric(6, 0)), CAST(9000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'PR_REP', N'Public Relations Representative', CAST(4500 AS Numeric(6, 0)), CAST(10500 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'PU_CLERK', N'Purchasing Clerk', CAST(2500 AS Numeric(6, 0)), CAST(5500 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'PU_MAN', N'Purchasing Manager', CAST(8000 AS Numeric(6, 0)), CAST(15000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'SA_MAN', N'Sales Manager', CAST(10000 AS Numeric(6, 0)), CAST(20000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'SA_REP', N'Sales Representative', CAST(6000 AS Numeric(6, 0)), CAST(12000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'SH_CLERK', N'Shipping Clerk', CAST(2500 AS Numeric(6, 0)), CAST(5500 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'ST_CLERK', N'Stock Clerk', CAST(2000 AS Numeric(6, 0)), CAST(5000 AS Numeric(6, 0)))
INSERT [HR].[Jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'ST_MAN', N'Stock Manager', CAST(5500 AS Numeric(6, 0)), CAST(8500 AS Numeric(6, 0)))
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1000 AS Numeric(4, 0)), N'1297 Via Cola di Rie', N'989', N'Roma', N'', N'IT')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1100 AS Numeric(4, 0)), N'93091 Calle della Testa', N'10934', N'Venice', N'', N'IT')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1200 AS Numeric(4, 0)), N'2017 Shinjuku-ku', N'1689', N'Tokyo', N'Tokyo Prefecture', N'JP')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1300 AS Numeric(4, 0)), N'9450 Kamiya-cho', N'6823', N'Hiroshima', N'', N'JP')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1400 AS Numeric(4, 0)), N'2014 Jabberwocky Rd', N'26192', N'Southlake', N'Texas', N'US')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1500 AS Numeric(4, 0)), N'2011 Interiors Blvd', N'99236', N'South San Francisco', N'California', N'US')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1600 AS Numeric(4, 0)), N'2007 Zagora St', N'50090', N'South Brunswick', N'New Jersey', N'US')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1700 AS Numeric(4, 0)), N'2004 Charade Rd', N'98199', N'Seattle', N'Washington', N'US')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1800 AS Numeric(4, 0)), N'147 Spadina Ave', N'M5V 2L7', N'Toronto', N'Ontario', N'CA')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(1900 AS Numeric(4, 0)), N'6092 Boxwood St', N'YSW 9T2', N'Whitehorse', N'Yukon', N'CA')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2000 AS Numeric(4, 0)), N'40-5-12 Laogianggen', N'190518', N'Beijing', N'', N'CN')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2100 AS Numeric(4, 0)), N'1298 Vileparle (E)', N'490231', N'Bombay', N'Maharashtra', N'IN')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2200 AS Numeric(4, 0)), N'12-98 Victoria Street', N'2901', N'Sydney', N'New South Wales', N'AU')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2300 AS Numeric(4, 0)), N'198 Clementi North', N'540198', N'Singapore', N'', N'SG')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2400 AS Numeric(4, 0)), N'8204 Arthur St', N'', N'London', N'', N'UK')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2500 AS Numeric(4, 0)), N'"Magdalen Centre', N' The Oxford ', N'OX9 9ZB', N'Oxford', N'Ox')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2600 AS Numeric(4, 0)), N'9702 Chester Road', N'9629850293', N'Stretford', N'Manchester', N'UK')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2700 AS Numeric(4, 0)), N'Schwanthalerstr. 7031', N'80925', N'Munich', N'Bavaria', N'DE')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2800 AS Numeric(4, 0)), N'Rua Frei Caneca 1360', N'01307-002', N'Sao Paulo', N'Sao Paulo', N'BR')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(2900 AS Numeric(4, 0)), N'20 Rue des Corps-Saints', N'1730', N'Geneva', N'Geneve', N'CH')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(3000 AS Numeric(4, 0)), N'Murtenstrasse 921', N'3095', N'Bern', N'BE', N'CH')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(3100 AS Numeric(4, 0)), N'Pieter Breughelstraat 837', N'3029SK', N'Utrecht', N'Utrecht', N'NL')
INSERT [HR].[Locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (CAST(3200 AS Numeric(4, 0)), N'Mariano Escobedo 9991', N'11932', N'Mexico City', N'"Distrito Federal', N'"')
INSERT [HR].[Regions] ([region_id], [region_name]) VALUES (CAST(1 AS Numeric(10, 0)), N'Europe                   ')
INSERT [HR].[Regions] ([region_id], [region_name]) VALUES (CAST(2 AS Numeric(10, 0)), N'Americas                 ')
INSERT [HR].[Regions] ([region_id], [region_name]) VALUES (CAST(3 AS Numeric(10, 0)), N'Asia                     ')
INSERT [HR].[Regions] ([region_id], [region_name]) VALUES (CAST(4 AS Numeric(10, 0)), N'Middle East and Africa   ')
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5005 AS Numeric(5, 0)), CAST(3001 AS Numeric(5, 0)), N'Brad Guzan', N'London', NULL)
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5001 AS Numeric(5, 0)), CAST(3002 AS Numeric(5, 0)), N'Nick Rimando', N'New York', CAST(100 AS Numeric(3, 0)))
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5007 AS Numeric(5, 0)), CAST(3003 AS Numeric(5, 0)), N'Jozy Altidor', N'Moscow', CAST(200 AS Numeric(3, 0)))
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5006 AS Numeric(5, 0)), CAST(3004 AS Numeric(5, 0)), N'Fabian Johnson', N'Paris', CAST(300 AS Numeric(3, 0)))
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5002 AS Numeric(5, 0)), CAST(3005 AS Numeric(5, 0)), N'Graham Zusi', N'California', CAST(200 AS Numeric(3, 0)))
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5001 AS Numeric(5, 0)), CAST(3007 AS Numeric(5, 0)), N'Brad Davis', N'New York', CAST(200 AS Numeric(3, 0)))
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5002 AS Numeric(5, 0)), CAST(3008 AS Numeric(5, 0)), N'Julian Green', N'London', CAST(300 AS Numeric(3, 0)))
INSERT [Inventory].[Customer] ([salesman_id], [customer_id], [cust_name], [city], [grade]) VALUES (CAST(5003 AS Numeric(5, 0)), CAST(3009 AS Numeric(5, 0)), N'Geoff Cameron', N'Berlin', CAST(100 AS Numeric(3, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5002 AS Numeric(5, 0)), CAST(70001 AS Numeric(5, 0)), CAST(150.50 AS Numeric(8, 2)), CAST(N'2012-10-05' AS Date), CAST(3005 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5001 AS Numeric(5, 0)), CAST(70002 AS Numeric(5, 0)), CAST(65.26 AS Numeric(8, 2)), CAST(N'2012-10-05' AS Date), CAST(3002 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5003 AS Numeric(5, 0)), CAST(70003 AS Numeric(5, 0)), CAST(2480.40 AS Numeric(8, 2)), CAST(N'2012-10-10' AS Date), CAST(3009 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5003 AS Numeric(5, 0)), CAST(70004 AS Numeric(5, 0)), CAST(110.50 AS Numeric(8, 2)), CAST(N'2012-08-17' AS Date), CAST(3009 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5001 AS Numeric(5, 0)), CAST(70005 AS Numeric(5, 0)), CAST(2400.60 AS Numeric(8, 2)), CAST(N'2012-07-27' AS Date), CAST(3007 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5002 AS Numeric(5, 0)), CAST(70007 AS Numeric(5, 0)), CAST(948.50 AS Numeric(8, 2)), CAST(N'2012-09-10' AS Date), CAST(3005 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5001 AS Numeric(5, 0)), CAST(70008 AS Numeric(5, 0)), CAST(5760.00 AS Numeric(8, 2)), CAST(N'2012-09-10' AS Date), CAST(3002 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5005 AS Numeric(5, 0)), CAST(70009 AS Numeric(5, 0)), CAST(270.65 AS Numeric(8, 2)), CAST(N'2012-09-10' AS Date), CAST(3001 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5006 AS Numeric(5, 0)), CAST(70010 AS Numeric(5, 0)), CAST(1983.43 AS Numeric(8, 2)), CAST(N'2012-10-10' AS Date), CAST(3004 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5007 AS Numeric(5, 0)), CAST(70011 AS Numeric(5, 0)), CAST(75.29 AS Numeric(8, 2)), CAST(N'2012-08-17' AS Date), CAST(3003 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5002 AS Numeric(5, 0)), CAST(70012 AS Numeric(5, 0)), CAST(250.45 AS Numeric(8, 2)), CAST(N'2012-06-27' AS Date), CAST(3008 AS Numeric(5, 0)))
INSERT [Inventory].[Orders] ([salesman_id], [ord_no], [purch_amt], [ord_date], [customer_id]) VALUES (CAST(5001 AS Numeric(5, 0)), CAST(70013 AS Numeric(5, 0)), CAST(3045.60 AS Numeric(8, 2)), CAST(N'2012-04-25' AS Date), CAST(3002 AS Numeric(5, 0)))
INSERT [Inventory].[Salesman] ([salesman_id], [name], [city], [commission]) VALUES (CAST(5001 AS Numeric(5, 0)), N'James Hoog', N'New York', CAST(0.15 AS Numeric(5, 2)))
INSERT [Inventory].[Salesman] ([salesman_id], [name], [city], [commission]) VALUES (CAST(5002 AS Numeric(5, 0)), N'Nail Knite', N'Paris', CAST(0.13 AS Numeric(5, 2)))
INSERT [Inventory].[Salesman] ([salesman_id], [name], [city], [commission]) VALUES (CAST(5003 AS Numeric(5, 0)), N'Lauson Hen', N'San Jose', CAST(0.12 AS Numeric(5, 2)))
INSERT [Inventory].[Salesman] ([salesman_id], [name], [city], [commission]) VALUES (CAST(5005 AS Numeric(5, 0)), N'Pit Alex', N'London', CAST(0.11 AS Numeric(5, 2)))
INSERT [Inventory].[Salesman] ([salesman_id], [name], [city], [commission]) VALUES (CAST(5006 AS Numeric(5, 0)), N'Mc Lyon', N'Paris', CAST(0.14 AS Numeric(5, 2)))
INSERT [Inventory].[Salesman] ([salesman_id], [name], [city], [commission]) VALUES (CAST(5007 AS Numeric(5, 0)), N'Paul Adam', N'Rome', CAST(0.13 AS Numeric(5, 2)))
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (101, N'James               ', N'Stewart             ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (102, N'Deborah             ', N'Kerr                ', N'F')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (103, N'Peter               ', N'OToole              ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (104, N'Robert              ', N'De Niro             ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (105, N'F. Murray           ', N'Abraham             ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (106, N'Harrison            ', N'Ford                ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (107, N'Nicole              ', N'Kidman              ', N'F')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (108, N'Stephen             ', N'Baldwin             ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (109, N'Jack                ', N'Nicholson           ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (110, N'Mark                ', N'Wahlberg            ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (111, N'Woody               ', N'Allen               ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (112, N'Claire              ', N'Danes               ', N'F')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (113, N'Tim                 ', N'Robbins             ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (114, N'Kevin               ', N'Spacey              ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (115, N'Kate                ', N'Winslet             ', N'F')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (116, N'Robin               ', N'Williams            ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (117, N'Jon                 ', N'Voight              ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (118, N'Ewan                ', N'McGregor            ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (119, N'Christian           ', N'Bale                ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (120, N'Maggie              ', N'Gyllenhaal          ', N'F')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (121, N'Dev                 ', N'Patel               ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (122, N'Sigourney           ', N'Weaver              ', N'F')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (123, N'David               ', N'Aston               ', N'M')
INSERT [Movies].[Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (124, N'Ali                 ', N'Astin               ', N'F')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (201, N'Alfred              ', N'Hitchcock           ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (202, N'Jack                ', N'Clayton             ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (203, N'David               ', N'Lean                ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (204, N'Michael             ', N'Cimino              ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (205, N'Milos               ', N'Forman              ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (206, N'Ridley              ', N'Scott               ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (207, N'Stanley             ', N'Kubrick             ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (208, N'Bryan               ', N'Singer              ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (209, N'Roman               ', N'Polanski            ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (210, N'Paul                ', N'Thomas Anderson     ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (211, N'Woody               ', N'Allen               ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (212, N'Hayao               ', N'Miyazaki            ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (213, N'Frank               ', N'Darabont            ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (214, N'Sam                 ', N'Mendes              ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (215, N'James               ', N'Cameron             ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (216, N'Gus                 ', N'Van Sant            ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (217, N'John                ', N'Boorman             ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (218, N'Danny               ', N'Boyle               ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (219, N'Christopher         ', N'Nolan               ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (220, N'Richard             ', N'Kelly               ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (221, N'Kevin               ', N'Spacey              ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (222, N'Andrei              ', N'Tarkovsky           ')
INSERT [Movies].[Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (223, N'Peter               ', N'Jackson             ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1001, N'Action              ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1002, N'Adventure           ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1003, N'Animation           ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1004, N'Biography           ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1005, N'Comedy              ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1006, N'Crime               ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1007, N'Drama               ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1008, N'Horror              ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1009, N'Music               ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1010, N'Mystery             ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1011, N'Romance             ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1012, N'Thriller            ')
INSERT [Movies].[Genres] ([gen_id], [gen_title]) VALUES (1013, N'War                 ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (901, N'Vertigo                                           ', 1958, 128, N'English        ', CAST(N'1958-08-24' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (902, N'The Innocents                                     ', 1961, 100, N'English        ', CAST(N'1962-02-19' AS Date), N'SW   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (903, N'Lawrence of Arabia                                ', 1962, 216, N'English        ', CAST(N'1962-12-11' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (904, N'The Deer Hunter                                   ', 1978, 183, N'English        ', CAST(N'1979-03-08' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (905, N'Amadeus                                           ', 1984, 160, N'English        ', CAST(N'1985-01-07' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (906, N'Blade Runner                                      ', 1982, 117, N'English        ', CAST(N'1982-09-09' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (907, N'Eyes Wide Shut                                    ', 1999, 159, N'English        ', NULL, N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (908, N'The Usual Suspects                                ', 1995, 106, N'English        ', CAST(N'1995-08-25' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (909, N'Chinatown                                         ', 1974, 130, N'English        ', CAST(N'1974-08-09' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (910, N'Boogie Nights                                     ', 1997, 155, N'English        ', CAST(N'1998-02-16' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (911, N'Annie Hall                                        ', 1977, 93, N'English        ', CAST(N'1977-04-20' AS Date), N'USA  ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (912, N'Princess Mononoke                                 ', 1997, 134, N'Japanese       ', CAST(N'2001-10-19' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (913, N'The Shawshank Redemption                          ', 1994, 142, N'English        ', CAST(N'1995-02-17' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (914, N'American Beauty                                   ', 1999, 122, N'English        ', NULL, N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (915, N'Titanic                                           ', 1997, 194, N'English        ', CAST(N'1998-01-23' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (916, N'Good Will Hunting                                 ', 1997, 126, N'English        ', CAST(N'1998-06-03' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (917, N'Deliverance                                       ', 1972, 109, N'English        ', CAST(N'1982-10-05' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (918, N'Trainspotting                                     ', 1996, 94, N'English        ', CAST(N'1996-02-23' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (919, N'The Prestige                                      ', 2006, 130, N'English        ', CAST(N'2006-11-10' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (920, N'Donnie Darko                                      ', 2001, 113, N'English        ', NULL, N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (921, N'Slumdog Millionaire                               ', 2008, 120, N'English        ', CAST(N'2009-01-09' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (922, N'Aliens                                            ', 1986, 137, N'English        ', CAST(N'1986-08-29' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (923, N'Beyond the Sea                                    ', 2004, 118, N'English        ', CAST(N'2004-11-26' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (924, N'Avatar                                            ', 2009, 162, N'English        ', CAST(N'2009-12-17' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (926, N'Seven Samurai                                     ', 1954, 207, N'Japanese       ', CAST(N'1954-04-26' AS Date), N'JP   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (927, N'Spirited Away                                     ', 2001, 125, N'Japanese       ', CAST(N'2003-09-12' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (928, N'Back to the Future                                ', 1985, 116, N'English        ', CAST(N'1985-12-04' AS Date), N'UK   ')
INSERT [Movies].[Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_dt_rel], [mov_rel_country]) VALUES (925, N'Braveheart                                        ', 1995, 178, N'English        ', CAST(N'1995-09-08' AS Date), N'UK   ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (901, 101, N'John Scottie Ferguson         ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (902, 102, N'Miss Giddens                  ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (903, 103, N'T.E. Lawrence                 ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (904, 104, N'Michael                       ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (905, 105, N'Antonio Salieri               ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (906, 106, N'Rick Deckard                  ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (907, 107, N'Alice Harford                 ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (908, 108, N'McManus                       ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (910, 110, N'Eddie Adams                   ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (911, 111, N'Alvy Singer                   ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (912, 112, N'San                           ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (913, 113, N'Andy Dufresne                 ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (914, 114, N'Lester Burnham                ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (915, 115, N'Rose DeWitt Bukater           ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (916, 116, N'Sean Maguire                  ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (917, 117, N'Ed                            ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (918, 118, N'Renton                        ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (920, 120, N'Elizabeth Darko               ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (921, 121, N'Older Jamal                   ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (922, 122, N'Ripley                        ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (923, 114, N'Bobby Darin                   ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (909, 109, N'J.J. Gittes                   ')
INSERT [Movies].[Movie_cast] ([mov_id], [act_id], [role]) VALUES (919, 119, N'Alfred Borden                 ')
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (901, 201)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (902, 202)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (903, 203)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (904, 204)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (905, 205)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (906, 206)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (907, 207)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (908, 208)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (909, 209)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (910, 210)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (911, 211)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (912, 212)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (913, 213)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (914, 214)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (915, 215)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (916, 216)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (917, 217)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (918, 218)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (919, 219)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (920, 220)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (921, 218)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (922, 215)
INSERT [Movies].[Movie_Direction] ([mov_id], [dir_id]) VALUES (923, 221)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (922, 1001)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (917, 1002)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (903, 1002)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (912, 1003)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (911, 1005)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (908, 1006)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (913, 1006)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (926, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (928, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (918, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (921, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (902, 1008)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (923, 1009)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (907, 1010)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (927, 1010)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (901, 1010)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (914, 1011)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (906, 1012)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (904, 1013)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (922, 1001)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (917, 1002)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (903, 1002)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (912, 1003)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (911, 1005)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (908, 1006)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (913, 1006)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (926, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (928, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (918, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (921, 1007)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (902, 1008)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (923, 1009)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (907, 1010)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (927, 1010)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (901, 1010)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (914, 1011)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (906, 1012)
INSERT [Movies].[Movie_Genres] ([mov_id], [gen_id]) VALUES (904, 1013)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (901, 9001, CAST(8.40 AS Numeric(4, 2)), 263575)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (902, 9002, CAST(7.90 AS Numeric(4, 2)), 20207)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (903, 9003, CAST(8.30 AS Numeric(4, 2)), 202778)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (906, 9005, CAST(8.20 AS Numeric(4, 2)), 484746)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (924, 9006, CAST(7.30 AS Numeric(4, 2)), NULL)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (908, 9007, CAST(8.60 AS Numeric(4, 2)), 779489)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (909, 9008, NULL, 227235)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (910, 9009, CAST(3.00 AS Numeric(4, 2)), 195961)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (911, 9010, CAST(8.10 AS Numeric(4, 2)), 203875)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (912, 9011, CAST(8.40 AS Numeric(4, 2)), NULL)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (914, 9013, CAST(7.00 AS Numeric(4, 2)), 862618)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (915, 9001, CAST(7.70 AS Numeric(4, 2)), 830095)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (916, 9014, CAST(4.00 AS Numeric(4, 2)), 642132)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (925, 9015, CAST(7.70 AS Numeric(4, 2)), 81328)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (918, 9016, NULL, 580301)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (920, 9017, CAST(8.10 AS Numeric(4, 2)), 609451)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (921, 9018, CAST(8.00 AS Numeric(4, 2)), 667758)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (922, 9019, CAST(8.40 AS Numeric(4, 2)), 511613)
INSERT [Movies].[Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (923, 9020, CAST(6.70 AS Numeric(4, 2)), 13091)
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9001, N'Righty Sock                   ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9002, N'Jack Malvern                  ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9003, N'Flagrant Baronessa            ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9004, N'Alec Shaw                     ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9005, NULL)
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9006, N'Victor Woeltjen               ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9007, N'Simon Wright                  ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9008, N'Neal Wruck                    ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9009, N'Paul Monks                    ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9010, N'Mike Salvati                  ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9011, NULL)
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9012, N'Wesley S. Walker              ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9013, N'Sasha Goldshtein              ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9014, N'Josh Cates                    ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9015, N'Krug Stillo                   ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9016, N'Scott LeBrun                  ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9017, N'Hannah Steele                 ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9018, N'Vincent Cadena                ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9019, N'Brandt Sponseller             ')
INSERT [Movies].[Reviewer] ([rev_id], [rev_name]) VALUES (9020, N'Richard Adams                 ')
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80001, N'Jure Praprotnik', 1225)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80002, N'Robert Vukan', 1225)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80003, N'Roberto Alonso Fernandez', 1219)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80004, N'Simon Beck', 1206)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80005, N'Mark Borsch', 1208)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80006, N'Stephen Child', 1206)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80007, N'Jake Collin', 1206)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80008, N'Elenito Di Liberatore', 1211)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80009, N'Bahattin Duran', 1222)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80010, N'Dalibor Durdevic', 1227)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80011, N'Mathias Klasenius', 1220)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80012, N'Tomasz Listkiewicz', 1213)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80013, N'Stefan Lupp', 1208)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80014, N'Mike Mullarkey', 1206)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80015, N'Tarik Ongun', 1222)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80016, N'Gyorgy Ring', 1209)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80017, N'Milovan Ristic', 1227)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80018, N'Pawel Sokolnicki', 1213)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80019, N'Mauro Tonolini', 1211)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80020, N'Vencel Toth', 1209)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80021, N'Sander van Roekel', 1226)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80022, N'Daniel Warnmark', 1220)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80023, N'Juan Yuste Jimenez', 1219)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80024, N'Erwin Zeinstra', 1226)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80025, N'Frank Andas', 1229)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80026, N'Frederic Cano', 1207)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80027, N'Frank Connor', 1228)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80028, N'Nicolas Danos', 1207)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80029, N'Sebastian Gheorghe', 1216)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80030, N'Nikolay Golubev', 1217)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80031, N'Kim Haglund', 1229)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80032, N'Tikhon Kalugin', 1217)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80033, N'Damien McGraith', 1215)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80034, N'Tomas Mokrusch', 1205)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80035, N'Roman Slysko', 1218)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80036, N'Octavian Sovre', 1216)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80037, N'Anton Averyanov', 1217)
INSERT [SOCCER].[asst_referee_mast] ([ass_ref_id], [ass_ref_name], [country_id]) VALUES (80038, N'Martin Wilczek', 1205)
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5550, N'Gianni De Biasi')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5551, N'Marcel Koller')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5552, N'Marc Wilmots')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5553, N'Ante Cacic')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5554, N'Pavel Vrba')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5555, N'Roy Hodgson')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5556, N'Didier Deschamps')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5557, N'Joachim Low')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5558, N'Bernd Storck')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5559, N'Lars Lagerback')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5560, N'Heimir Hallgrímsson')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5561, N'Antonio Conte')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5562, N'Michael ONeill')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5563, N'Adam Nawalka')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5564, N'Fernando Santos')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5565, N'Martin ONeill')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5566, N'Anghel Iordanescu')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5567, N'Leonid Slutski')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5568, N'Jan Kozak')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5569, N'Vicente del Bosque')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5570, N'Erik Hamren')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5571, N'Vladimir Petkovic')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5572, N'Fatih Terim')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5573, N'Mykhailo Fomenko')
INSERT [SOCCER].[coach_mast] ([coach_id], [coach_name]) VALUES (5574, N'Chris Coleman')
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (1, 1, 160159, 1207, 57, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (2, 1, 160368, 1216, 65, N'P', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (3, 1, 160154, 1207, 89, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (4, 2, 160470, 1221, 5, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (5, 3, 160547, 1224, 10, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (6, 3, 160403, 1218, 61, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (7, 3, 160550, 1224, 81, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (8, 4, 160128, 1206, 73, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (9, 4, 160373, 1217, 93, N'N', N'G', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (10, 5, 160084, 1204, 41, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (11, 6, 160298, 1213, 51, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (12, 7, 160183, 1208, 19, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (13, 7, 160180, 1208, 93, N'N', N'G', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (14, 8, 160423, 1219, 87, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (15, 9, 160335, 1215, 48, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (16, 9, 160327, 1215, 71, N'O', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (17, 10, 160244, 1211, 32, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (18, 10, 160252, 1211, 93, N'N', N'G', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (19, 11, 160207, 1209, 62, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (20, 11, 160200, 1209, 87, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (21, 12, 160320, 1214, 31, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (22, 12, 160221, 1210, 50, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (23, 13, 160411, 1218, 32, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (24, 13, 160405, 1218, 45, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (25, 13, 160380, 1217, 80, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (26, 14, 160368, 1216, 18, N'P', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (27, 14, 160481, 1221, 57, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (28, 15, 160160, 1207, 90, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (29, 15, 160154, 1207, 96, N'N', N'G', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (30, 16, 160547, 1224, 42, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (31, 16, 160138, 1206, 56, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (32, 16, 160137, 1206, 93, N'N', N'G', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (33, 17, 160262, 1212, 49, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (34, 17, 160275, 1212, 96, N'N', N'G', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (35, 19, 160248, 1211, 88, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (36, 20, 160085, 1204, 37, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (37, 20, 160086, 1204, 59, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (38, 20, 160115, 1205, 76, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (39, 20, 160114, 1205, 89, N'P', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (40, 21, 160435, 1219, 34, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (41, 21, 160436, 1219, 37, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (42, 21, 160435, 1219, 48, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (43, 22, 160067, 1203, 48, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (44, 22, 160064, 1203, 61, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (45, 22, 160067, 1203, 70, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (46, 23, 160224, 1210, 40, N'P', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (47, 23, 160216, 1210, 88, N'O', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (48, 25, 160023, 1201, 43, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (49, 27, 160544, 1224, 11, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (50, 27, 160538, 1224, 20, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (51, 27, 160547, 1224, 67, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (52, 29, 160287, 1213, 54, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (53, 30, 160182, 1208, 30, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (54, 31, 160504, 1222, 10, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (55, 31, 160500, 1222, 65, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (56, 32, 160435, 1219, 7, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (57, 32, 160089, 1204, 45, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (58, 32, 160085, 1204, 87, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (59, 33, 160226, 1210, 18, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (60, 33, 160042, 1202, 60, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (61, 33, 160226, 1210, 94, N'N', N'G', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (62, 34, 160203, 1209, 19, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (63, 34, 160320, 1214, 42, N'N', N'G', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (64, 34, 160202, 1209, 47, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (65, 34, 160322, 1214, 50, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (66, 34, 160202, 1209, 55, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (67, 34, 160322, 1214, 62, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (68, 35, 160333, 1215, 85, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (69, 36, 160063, 1203, 84, N'N', N'G', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (70, 37, 160287, 1213, 39, N'N', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (71, 37, 160476, 1221, 82, N'N', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (72, 38, 160262, 1212, 75, N'O', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (73, 39, 160321, 1214, 117, N'N', N'R', N'ET', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (74, 40, 160333, 1215, 2, N'P', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (75, 40, 160160, 1207, 58, N'N', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (76, 40, 160160, 1207, 61, N'N', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (77, 41, 160165, 1208, 8, N'N', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (78, 41, 160182, 1208, 43, N'N', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (79, 41, 160173, 1208, 63, N'N', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (80, 42, 160050, 1203, 10, N'N', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (81, 42, 160065, 1203, 78, N'N', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (82, 42, 160062, 1203, 80, N'N', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (83, 42, 160058, 1203, 90, N'N', N'R', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (84, 43, 160236, 1211, 33, N'N', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (85, 43, 160252, 1211, 91, N'N', N'R', N'ST', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (86, 44, 160136, 1206, 4, N'P', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (87, 44, 160219, 1210, 6, N'N', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (88, 44, 160230, 1210, 18, N'N', N'R', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (89, 45, 160297, 1213, 2, N'N', N'Q', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (90, 45, 160316, 1214, 33, N'N', N'Q', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (91, 46, 160063, 1203, 13, N'N', N'Q', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (92, 46, 160539, 1224, 31, N'N', N'Q', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (93, 46, 160550, 1224, 55, N'N', N'Q', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (94, 46, 160551, 1224, 86, N'N', N'Q', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (95, 47, 160177, 1208, 65, N'N', N'Q', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (96, 47, 160235, 1211, 78, N'P', N'Q', N'NT', 2)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (97, 48, 160159, 1207, 12, N'N', N'Q', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (98, 48, 160155, 1207, 20, N'N', N'Q', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (99, 48, 160154, 1207, 43, N'N', N'Q', N'NT', 1)
INSERT [SOCCER].[goal_details] ([goal_id], [match_no], [player_id], [team_id], [goal_time], [goal_type], [play_stage], [goal_schedule], [goal_half]) VALUES (100, 48, 160160, 1207, 45, N'N', N'Q', N'NT', 1)
GO
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (1, 1207, 160140)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (1, 1216, 160349)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (2, 1201, 160013)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (2, 1221, 160467)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (3, 1224, 160539)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (3, 1218, 160401)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (4, 1206, 160136)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (4, 1217, 160373)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (5, 1222, 160494)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (5, 1204, 160076)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (6, 1213, 160297)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (6, 1212, 160267)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (7, 1208, 160163)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (7, 1223, 160515)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (8, 1219, 160424)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (8, 1205, 160110)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (9, 1215, 160331)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (9, 1220, 160459)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (10, 1203, 160062)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (10, 1211, 160231)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (11, 1202, 160028)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (11, 1209, 160202)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (12, 1214, 160322)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (12, 1210, 160222)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (13, 1217, 160373)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (13, 1218, 160401)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (14, 1216, 160349)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (14, 1221, 160467)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (15, 1207, 160140)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (15, 1201, 160004)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (16, 1206, 160136)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (16, 1224, 160539)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (17, 1223, 160515)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (17, 1212, 160267)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (18, 1208, 160163)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (18, 1213, 160297)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (19, 1211, 160231)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (19, 1220, 160459)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (20, 1205, 160110)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (20, 1204, 160076)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (21, 1219, 160424)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (21, 1222, 160494)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (22, 1203, 160062)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (22, 1215, 160331)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (23, 1210, 160222)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (23, 1209, 160202)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (24, 1214, 160322)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (24, 1202, 160028)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (25, 1216, 160349)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (25, 1201, 160004)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (26, 1221, 160467)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (26, 1207, 160140)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (27, 1217, 160386)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (27, 1224, 160539)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (28, 1218, 160401)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (28, 1206, 160120)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (29, 1223, 160520)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (29, 1213, 160297)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (30, 1212, 160267)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (30, 1208, 160163)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (31, 1205, 160093)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (31, 1222, 160494)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (32, 1204, 160076)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (32, 1219, 160424)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (33, 1210, 160222)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (33, 1202, 160028)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (34, 1209, 160202)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (34, 1214, 160322)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (35, 1211, 160235)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (35, 1215, 160328)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (36, 1220, 160459)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (36, 1203, 160062)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (37, 1221, 160467)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (37, 1213, 160297)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (38, 1224, 160539)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (38, 1212, 160267)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (39, 1204, 160076)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (39, 1214, 160322)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (40, 1207, 160140)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (40, 1215, 160328)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (41, 1208, 160163)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (41, 1218, 160401)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (42, 1209, 160202)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (42, 1203, 160062)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (43, 1211, 160231)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (43, 1219, 160424)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (44, 1206, 160136)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (44, 1210, 160222)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (45, 1213, 160297)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (45, 1214, 160322)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (46, 1224, 160539)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (46, 1203, 160062)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (47, 1208, 160163)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (47, 1211, 160231)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (48, 1207, 160140)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (48, 1210, 160222)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (49, 1214, 160322)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (49, 1224, 160539)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (50, 1207, 160140)
INSERT [SOCCER].[match_captain] ([match_no], [team_id], [player_captain]) VALUES (50, 1208, 160180)
GO
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (1, 1207, N'G', N'W', N'N', 2, NULL, 80016, 160140)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (1, 1216, N'G', N'L', N'N', 1, NULL, 80020, 160348)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (2, 1201, N'G', N'L', N'N', 0, NULL, 80003, 160001)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (2, 1221, N'G', N'W', N'N', 1, NULL, 80023, 160463)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (3, 1224, N'G', N'W', N'N', 2, NULL, 80031, 160532)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (3, 1218, N'G', N'L', N'N', 1, NULL, 80025, 160392)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (4, 1206, N'G', N'D', N'N', 1, NULL, 80008, 160117)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (4, 1217, N'G', N'D', N'N', 1, NULL, 80019, 160369)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (5, 1222, N'G', N'L', N'N', 0, NULL, 80011, 160486)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (5, 1204, N'G', N'W', N'N', 1, NULL, 80022, 160071)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (6, 1213, N'G', N'W', N'N', 1, NULL, 80036, 160279)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (6, 1212, N'G', N'L', N'N', 0, NULL, 80029, 160256)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (7, 1208, N'G', N'W', N'N', 2, NULL, 80014, 160163)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (7, 1223, N'G', N'L', N'N', 0, NULL, 80006, 160508)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (8, 1219, N'G', N'W', N'N', 1, NULL, 80018, 160416)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (8, 1205, N'G', N'L', N'N', 0, NULL, 80012, 160093)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (9, 1215, N'G', N'D', N'N', 1, NULL, 80017, 160324)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (9, 1220, N'G', N'D', N'N', 1, NULL, 80010, 160439)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (10, 1203, N'G', N'L', N'N', 0, NULL, 80004, 160047)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (10, 1211, N'G', N'W', N'N', 2, NULL, 80007, 160231)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (11, 1202, N'G', N'L', N'N', 0, NULL, 80026, 160024)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (11, 1209, N'G', N'W', N'N', 2, NULL, 80028, 160187)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (12, 1214, N'G', N'D', N'N', 1, NULL, 80009, 160302)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (12, 1210, N'G', N'D', N'N', 1, NULL, 80015, 160208)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (13, 1217, N'G', N'L', N'N', 1, NULL, 80001, 160369)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (13, 1218, N'G', N'W', N'N', 2, NULL, 80002, 160392)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (14, 1216, N'G', N'D', N'N', 1, NULL, 80030, 160348)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (14, 1221, N'G', N'D', N'N', 1, NULL, 80032, 160463)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (15, 1207, N'G', N'W', N'N', 2, NULL, 80033, 160140)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (15, 1201, N'G', N'L', N'N', 0, NULL, 80027, 160001)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (16, 1206, N'G', N'W', N'N', 2, NULL, 80005, 160117)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (16, 1224, N'G', N'L', N'N', 1, NULL, 80013, 160531)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (17, 1223, N'G', N'L', N'N', 0, NULL, 80035, 160508)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (17, 1212, N'G', N'W', N'N', 2, NULL, 80034, 160256)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (18, 1208, N'G', N'D', N'N', 0, NULL, 80021, 160163)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (18, 1213, N'G', N'D', N'N', 0, NULL, 80024, 160278)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (19, 1211, N'G', N'W', N'N', 1, NULL, 80016, 160231)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (19, 1220, N'G', N'L', N'N', 0, NULL, 80020, 160439)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (20, 1205, N'G', N'D', N'N', 2, NULL, 80004, 160093)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (20, 1204, N'G', N'D', N'N', 2, NULL, 80007, 160071)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (21, 1219, N'G', N'W', N'N', 3, NULL, 80017, 160416)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (21, 1222, N'G', N'L', N'N', 0, NULL, 80010, 160486)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (22, 1203, N'G', N'W', N'N', 3, NULL, 80009, 160047)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (22, 1215, N'G', N'L', N'N', 0, NULL, 80015, 160324)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (23, 1210, N'G', N'D', N'N', 1, NULL, 80030, 160208)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (23, 1209, N'G', N'D', N'N', 1, NULL, 80032, 160187)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (24, 1214, N'G', N'D', N'N', 0, NULL, 80008, 160302)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (24, 1202, N'G', N'D', N'N', 0, NULL, 80019, 160024)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (25, 1216, N'G', N'L', N'N', 0, NULL, 80035, 160348)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (25, 1201, N'G', N'W', N'N', 1, NULL, 80034, 160001)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (26, 1221, N'G', N'D', N'N', 0, NULL, 80001, 160463)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (26, 1207, N'G', N'D', N'N', 0, NULL, 80002, 160140)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (27, 1217, N'G', N'L', N'N', 0, NULL, 80011, 160369)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (27, 1224, N'G', N'W', N'N', 3, NULL, 80022, 160531)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (28, 1218, N'G', N'D', N'N', 0, NULL, 80003, 160392)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (28, 1206, N'G', N'D', N'N', 0, NULL, 80023, 160117)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (29, 1223, N'G', N'L', N'N', 0, NULL, 80031, 160508)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (29, 1213, N'G', N'W', N'N', 1, NULL, 80025, 160278)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (30, 1212, N'G', N'L', N'N', 0, NULL, 80026, 160256)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (30, 1208, N'G', N'W', N'N', 1, NULL, 80028, 160163)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (31, 1205, N'G', N'L', N'N', 0, NULL, 80033, 160093)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (31, 1222, N'G', N'W', N'N', 2, NULL, 80027, 160486)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (32, 1204, N'G', N'W', N'N', 2, NULL, 80021, 160071)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (32, 1219, N'G', N'L', N'N', 1, NULL, 80024, 160416)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (33, 1210, N'G', N'W', N'N', 2, NULL, 80018, 160208)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (33, 1202, N'G', N'L', N'N', 1, NULL, 80012, 160024)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (34, 1209, N'G', N'D', N'N', 3, NULL, 80014, 160187)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (34, 1214, N'G', N'D', N'N', 3, NULL, 80006, 160302)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (35, 1211, N'G', N'L', N'N', 0, NULL, 80036, 160233)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (35, 1215, N'G', N'W', N'N', 1, NULL, 80029, 160324)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (36, 1220, N'G', N'L', N'N', 0, NULL, 80005, 160439)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (36, 1203, N'G', N'W', N'N', 1, NULL, 80013, 160047)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (37, 1221, N'R', N'L', N'P', 1, 4, 80004, 160463)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (37, 1213, N'R', N'W', N'P', 1, 5, 80007, 160278)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (38, 1224, N'R', N'W', N'N', 1, NULL, 80014, 160531)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (38, 1212, N'R', N'L', N'N', 0, NULL, 80006, 160256)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (39, 1204, N'R', N'L', N'N', 0, NULL, 80003, 160071)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (39, 1214, N'R', N'W', N'N', 1, NULL, 80023, 160302)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (40, 1207, N'R', N'W', N'N', 2, NULL, 80008, 160140)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (40, 1215, N'R', N'L', N'N', 1, NULL, 80019, 160324)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (41, 1208, N'R', N'W', N'N', 3, NULL, 80018, 160163)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (41, 1218, N'R', N'L', N'N', 0, NULL, 80012, 160392)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (42, 1209, N'R', N'L', N'N', 0, NULL, 80017, 160187)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (42, 1203, N'R', N'W', N'N', 4, NULL, 80010, 160047)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (43, 1211, N'R', N'W', N'N', 2, NULL, 80009, 160231)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (43, 1219, N'R', N'L', N'N', 0, NULL, 80015, 160416)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (44, 1206, N'R', N'L', N'N', 1, NULL, 80001, 160117)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (44, 1210, N'R', N'W', N'N', 2, NULL, 80002, 160208)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (45, 1213, N'Q', N'L', N'P', 1, 3, 80005, 160278)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (45, 1214, N'Q', N'W', N'P', 1, 5, 80013, 160302)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (46, 1224, N'Q', N'W', N'N', 3, NULL, 80001, 160531)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (46, 1203, N'Q', N'L', N'N', 1, NULL, 80002, 160047)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (47, 1208, N'Q', N'W', N'P', 1, 6, 80016, 160163)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (47, 1211, N'Q', N'L', N'P', 1, 5, 80020, 160231)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (48, 1207, N'Q', N'W', N'N', 5, NULL, 80021, 160140)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (48, 1210, N'Q', N'L', N'N', 2, NULL, 80024, 160208)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (49, 1214, N'S', N'W', N'N', 2, NULL, 80011, 160302)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (49, 1224, N'S', N'L', N'N', 0, NULL, 80022, 160531)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (50, 1207, N'S', N'W', N'N', 2, NULL, 80008, 160140)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (50, 1208, N'S', N'L', N'N', 1, NULL, 80019, 160163)
GO
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (51, 1214, N'F', N'W', N'N', 1, NULL, 80004, 160302)
INSERT [SOCCER].[match_details] ([match_no], [team_id], [play_stage], [win_lose], [decided_by], [goal_score], [penalty_score], [ass_ref], [player_gk]) VALUES (51, 1207, N'F', N'L', N'N', 0, NULL, 80007, 160140)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (1, N'G', N'N', N'2-1', CAST(N'2016-06-11' AS Date), N'WIN  ', 20008, 70007, 75113, 160154, 131, 242)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (2, N'G', N'N', N'0-1', CAST(N'2016-06-11' AS Date), N'WIN  ', 20002, 70012, 33805, 160476, 61, 182)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (3, N'G', N'N', N'2-1', CAST(N'2016-06-11' AS Date), N'WIN  ', 20001, 70017, 37831, 160540, 64, 268)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (4, N'G', N'N', N'1-1', CAST(N'2016-06-12' AS Date), N'DRAW ', 20005, 70011, 62343, 160128, 0, 185)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (5, N'G', N'N', N'0-1', CAST(N'2016-06-12' AS Date), N'WIN  ', 20007, 70006, 43842, 160084, 125, 325)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (6, N'G', N'N', N'1-0', CAST(N'2016-06-12' AS Date), N'WIN  ', 20006, 70014, 33742, 160291, 2, 246)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (7, N'G', N'N', N'2-0', CAST(N'2016-06-13' AS Date), N'WIN  ', 20003, 70002, 43035, 160176, 89, 188)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (8, N'G', N'N', N'1-0', CAST(N'2016-06-13' AS Date), N'WIN  ', 20010, 70009, 29400, 160429, 360, 182)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (9, N'G', N'N', N'1-1', CAST(N'2016-06-13' AS Date), N'DRAW ', 20008, 70010, 73419, 160335, 67, 194)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (10, N'G', N'N', N'0-2', CAST(N'2016-06-14' AS Date), N'WIN  ', 20004, 70005, 55408, 160244, 63, 189)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (11, N'G', N'N', N'0-2', CAST(N'2016-06-14' AS Date), N'WIN  ', 20001, 70018, 34424, 160197, 61, 305)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (12, N'G', N'N', N'1-1', CAST(N'2016-06-15' AS Date), N'DRAW ', 20009, 70004, 38742, 160320, 15, 284)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (13, N'G', N'N', N'1-2', CAST(N'2016-06-15' AS Date), N'WIN  ', 20003, 70001, 38989, 160405, 62, 189)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (14, N'G', N'N', N'1-1', CAST(N'2016-06-15' AS Date), N'DRAW ', 20007, 70015, 43576, 160477, 74, 206)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (15, N'G', N'N', N'2-0', CAST(N'2016-06-16' AS Date), N'WIN  ', 20005, 70013, 63670, 160154, 71, 374)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (16, N'G', N'N', N'2-1', CAST(N'2016-06-16' AS Date), N'WIN  ', 20002, 70003, 34033, 160540, 62, 212)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (17, N'G', N'N', N'0-2', CAST(N'2016-06-16' AS Date), N'WIN  ', 20004, 70016, 51043, 160262, 7, 411)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (18, N'G', N'N', N'0-0', CAST(N'2016-06-17' AS Date), N'DRAW ', 20008, 70008, 73648, 160165, 6, 208)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (19, N'G', N'N', N'1-0', CAST(N'2016-06-17' AS Date), N'WIN  ', 20010, 70007, 29600, 160248, 2, 264)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (20, N'G', N'N', N'2-2', CAST(N'2016-06-17' AS Date), N'DRAW ', 20009, 70005, 38376, 160086, 71, 280)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (21, N'G', N'N', N'3-0', CAST(N'2016-06-18' AS Date), N'WIN  ', 20006, 70010, 33409, 160429, 84, 120)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (22, N'G', N'N', N'3-0', CAST(N'2016-06-18' AS Date), N'WIN  ', 20001, 70004, 39493, 160064, 11, 180)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (23, N'G', N'N', N'1-1', CAST(N'2016-06-18' AS Date), N'DRAW ', 20005, 70015, 60842, 160230, 61, 280)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (24, N'G', N'N', N'0-0', CAST(N'2016-06-19' AS Date), N'DRAW ', 20007, 70011, 44291, 160314, 3, 200)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (25, N'G', N'N', N'0-1', CAST(N'2016-06-20' AS Date), N'WIN  ', 20004, 70016, 49752, 160005, 125, 328)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (26, N'G', N'N', N'0-0', CAST(N'2016-06-20' AS Date), N'DRAW ', 20003, 70001, 45616, 160463, 60, 122)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (27, N'G', N'N', N'0-3', CAST(N'2016-06-21' AS Date), N'WIN  ', 20010, 70006, 28840, 160544, 62, 119)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (28, N'G', N'N', N'0-0', CAST(N'2016-06-21' AS Date), N'DRAW ', 20009, 70012, 39051, 160392, 62, 301)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (29, N'G', N'N', N'0-1', CAST(N'2016-06-21' AS Date), N'WIN  ', 20005, 70017, 58874, 160520, 29, 244)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (30, N'G', N'N', N'0-1', CAST(N'2016-06-21' AS Date), N'WIN  ', 20007, 70018, 44125, 160177, 21, 195)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (31, N'G', N'N', N'0-2', CAST(N'2016-06-22' AS Date), N'WIN  ', 20002, 70013, 32836, 160504, 60, 300)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (32, N'G', N'N', N'2-1', CAST(N'2016-06-22' AS Date), N'WIN  ', 20001, 70008, 37245, 160085, 70, 282)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (33, N'G', N'N', N'2-1', CAST(N'2016-06-22' AS Date), N'WIN  ', 20008, 70009, 68714, 160220, 7, 244)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (34, N'G', N'N', N'3-3', CAST(N'2016-06-22' AS Date), N'DRAW ', 20004, 70002, 55514, 160322, 70, 185)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (35, N'G', N'N', N'0-1', CAST(N'2016-06-23' AS Date), N'WIN  ', 20003, 70014, 44268, 160333, 79, 221)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (36, N'G', N'N', N'0-1', CAST(N'2016-06-23' AS Date), N'WIN  ', 20006, 70003, 34011, 160062, 63, 195)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (37, N'R', N'P', N'1-1', CAST(N'2016-06-25' AS Date), N'WIN  ', 20009, 70005, 38842, 160476, 126, 243)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (38, N'R', N'N', N'1-0', CAST(N'2016-06-25' AS Date), N'WIN  ', 20007, 70002, 44342, 160547, 5, 245)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (39, N'R', N'N', N'0-1', CAST(N'2016-06-26' AS Date), N'WIN  ', 20002, 70012, 33523, 160316, 61, 198)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (40, N'R', N'N', N'2-1', CAST(N'2016-06-26' AS Date), N'WIN  ', 20004, 70011, 56279, 160160, 238, 203)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (41, N'R', N'N', N'3-0', CAST(N'2016-06-26' AS Date), N'WIN  ', 20003, 70009, 44312, 160173, 62, 124)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (42, N'R', N'N', N'0-4', CAST(N'2016-06-27' AS Date), N'WIN  ', 20010, 70010, 28921, 160062, 3, 133)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (43, N'R', N'N', N'2-0', CAST(N'2016-06-27' AS Date), N'WIN  ', 20008, 70004, 76165, 160235, 63, 243)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (44, N'R', N'N', N'1-2', CAST(N'2016-06-28' AS Date), N'WIN  ', 20006, 70001, 33901, 160217, 5, 199)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (45, N'Q', N'P', N'1-1', CAST(N'2016-07-01' AS Date), N'WIN  ', 20005, 70003, 62940, 160316, 58, 181)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (46, N'Q', N'N', N'3-1', CAST(N'2016-07-02' AS Date), N'WIN  ', 20003, 70001, 45936, 160550, 14, 182)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (47, N'Q', N'P', N'1-1', CAST(N'2016-07-03' AS Date), N'WIN  ', 20001, 70007, 38764, 160163, 63, 181)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (48, N'Q', N'N', N'5-2', CAST(N'2016-07-04' AS Date), N'WIN  ', 20008, 70008, 76833, 160159, 16, 125)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (49, N'S', N'N', N'2-0', CAST(N'2016-07-07' AS Date), N'WIN  ', 20004, 70006, 55679, 160322, 2, 181)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (50, N'S', N'N', N'2-0', CAST(N'2016-07-08' AS Date), N'WIN  ', 20005, 70011, 64078, 160160, 126, 275)
INSERT [SOCCER].[match_mast] ([match_no], [play_stage], [decided_by], [goal_score], [play_date], [results], [venue_id], [referee_id], [audience], [plr_of_match], [stop1_sec], [stop2_sec]) VALUES (51, N'F', N'N', N'1-0', CAST(N'2016-07-11' AS Date), N'WIN  ', 20008, 70005, 75868, 160307, 161, 181)
INSERT [SOCCER].[penalty_gk] ([match_no], [team_id], [player_gk]) VALUES (37, 1221, 160463)
INSERT [SOCCER].[penalty_gk] ([match_no], [team_id], [player_gk]) VALUES (37, 1213, 160278)
INSERT [SOCCER].[penalty_gk] ([match_no], [team_id], [player_gk]) VALUES (45, 1213, 160278)
INSERT [SOCCER].[penalty_gk] ([match_no], [team_id], [player_gk]) VALUES (45, 1214, 160302)
INSERT [SOCCER].[penalty_gk] ([match_no], [team_id], [player_gk]) VALUES (47, 1208, 160163)
INSERT [SOCCER].[penalty_gk] ([match_no], [team_id], [player_gk]) VALUES (47, 1211, 160231)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1221, 1, 160467, N'Y', 1)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1213, 2, 160297, N'Y', 2)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1221, 3, 160477, N'N', 3)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1213, 4, 160298, N'Y', 4)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1221, 5, 160476, N'Y', 5)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1213, 6, 160281, N'Y', 6)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1221, 7, 160470, N'Y', 7)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1213, 8, 160287, N'Y', 8)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1221, 9, 160469, N'Y', 9)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (37, 1213, 10, 160291, N'Y', 10)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1214, 11, 160322, N'Y', 1)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1213, 12, 160297, N'Y', 2)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1214, 13, 160316, N'Y', 3)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1213, 14, 160298, N'Y', 4)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1214, 15, 160314, N'Y', 5)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1213, 16, 160281, N'Y', 6)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1214, 17, 160320, N'Y', 7)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1213, 18, 160287, N'N', 8)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (45, 1214, 19, 160321, N'Y', 9)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 20, 160251, N'Y', 1)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 21, 160176, N'Y', 2)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 22, 160253, N'N', 3)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 23, 160183, N'N', 4)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 24, 160234, N'Y', 5)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 25, 160177, N'N', 6)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 26, 160252, N'N', 7)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 27, 160173, N'Y', 8)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 28, 160235, N'N', 9)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 29, 160180, N'N', 10)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 30, 160244, N'Y', 11)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 31, 160168, N'Y', 12)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 32, 160246, N'Y', 13)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 33, 160169, N'Y', 14)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 34, 160238, N'Y', 15)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 35, 160165, N'Y', 16)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1211, 36, 160237, N'N', 17)
INSERT [SOCCER].[penalty_shootout] ([match_no], [team_id], [kick_id], [player_id], [score_goal], [kick_no]) VALUES (47, 1208, 37, 160166, N'Y', 18)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (1, 1216, 160349, 32, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (1, 1216, 160355, 45, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (1, 1207, 160159, 69, N'Y', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (1, 1216, 160360, 78, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (2, 1221, 160470, 14, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (2, 1201, 160013, 23, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (2, 1201, 160013, 36, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (2, 1201, 160014, 63, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (2, 1221, 160472, 66, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (2, 1201, 160015, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (2, 1201, 160009, 93, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (3, 1218, 160401, 2, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (3, 1218, 160406, 31, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (3, 1218, 160408, 78, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (3, 1218, 160411, 80, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (3, 1218, 160407, 83, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (4, 1206, 160120, 62, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (4, 1217, 160377, 72, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (5, 1222, 160505, 31, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (5, 1222, 160490, 48, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (5, 1204, 160077, 80, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (5, 1222, 160502, 91, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (6, 1213, 160290, 65, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (6, 1212, 160258, 69, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (6, 1213, 160284, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (7, 1223, 160518, 68, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (8, 1205, 160100, 61, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (9, 1215, 160336, 43, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (9, 1220, 160445, 61, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (9, 1215, 160341, 77, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (10, 1211, 160236, 65, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (10, 1211, 160248, 75, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (10, 1211, 160235, 78, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (10, 1211, 160245, 84, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (10, 1203, 160057, 93, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (11, 1202, 160027, 33, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (11, 1202, 160027, 66, N'Y', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (11, 1209, 160204, 80, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (12, 1210, 160227, 2, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (12, 1210, 160221, 55, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (13, 1218, 160395, 46, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (14, 1221, 160480, 2, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (14, 1216, 160361, 22, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (14, 1216, 160357, 24, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (14, 1216, 160367, 37, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (14, 1221, 160477, 50, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (14, 1216, 160352, 76, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (15, 1201, 160015, 55, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (15, 1201, 160011, 81, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (15, 1207, 160152, 88, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (16, 1224, 160535, 61, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (17, 1223, 160528, 40, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (17, 1212, 160272, 63, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (17, 1223, 160523, 67, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (17, 1212, 160266, 87, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (17, 1212, 160259, 90, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (18, 1208, 160175, 3, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (18, 1213, 160294, 3, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (18, 1208, 160177, 34, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (18, 1213, 160293, 45, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (18, 1213, 160288, 55, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (18, 1208, 160165, 67, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (19, 1211, 160242, 69, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (19, 1220, 160447, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (19, 1211, 160231, 94, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (20, 1204, 160080, 14, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (20, 1205, 160101, 72, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (20, 1204, 160081, 74, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (20, 1204, 160078, 88, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (21, 1219, 160424, 2, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (21, 1222, 160504, 9, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (21, 1222, 160500, 41, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (22, 1215, 160334, 42, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (22, 1203, 160056, 49, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (23, 1209, 160199, 2, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (23, 1210, 160229, 42, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (23, 1210, 160227, 75, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (23, 1210, 160216, 77, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (23, 1209, 160192, 81, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (23, 1209, 160197, 83, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (24, 1202, 160028, 6, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (24, 1214, 160321, 31, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (24, 1214, 160307, 40, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (24, 1202, 160037, 47, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (24, 1202, 160029, 78, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (24, 1202, 160042, 86, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (25, 1201, 160012, 6, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (25, 1216, 160353, 54, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (25, 1201, 160017, 85, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (25, 1216, 160356, 85, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (25, 1216, 160364, 91, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (25, 1201, 160007, 95, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (26, 1207, 160147, 25, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (26, 1207, 160145, 83, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (27, 1224, 160551, 16, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (27, 1217, 160383, 64, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (28, 1218, 160409, 24, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (28, 1206, 160119, 52, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (29, 1223, 160520, 25, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (29, 1223, 160513, 38, N' ', N'NT', 1)
GO
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (29, 1213, 160290, 60, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (31, 1222, 160491, 35, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (31, 1205, 160108, 36, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (31, 1205, 160107, 39, N'Y', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (31, 1222, 160490, 50, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (31, 1205, 160112, 87, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (32, 1204, 160087, 29, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (32, 1204, 160079, 70, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (32, 1204, 160076, 70, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (32, 1204, 160085, 88, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (33, 1210, 160218, 36, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (33, 1210, 160230, 51, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (33, 1202, 160045, 70, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (33, 1210, 160220, 78, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (33, 1210, 160208, 82, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (34, 1209, 160190, 13, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (34, 1209, 160191, 28, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (34, 1209, 160203, 34, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (34, 1209, 160202, 56, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (35, 1211, 160233, 39, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (35, 1215, 160343, 39, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (35, 1215, 160332, 73, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (35, 1211, 160234, 78, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (35, 1211, 160253, 87, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (35, 1211, 160251, 93, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (36, 1203, 160064, 1, N' ', N'ST', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (36, 1203, 160055, 30, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (36, 1220, 160451, 72, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (37, 1221, 160470, 55, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (37, 1213, 160282, 58, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (38, 1212, 160266, 44, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (38, 1224, 160538, 58, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (38, 1212, 160267, 67, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (38, 1224, 160544, 92, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (39, 1214, 160318, 78, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (40, 1215, 160328, 25, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (40, 1207, 160152, 27, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (40, 1215, 160334, 41, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (40, 1207, 160147, 44, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (40, 1215, 160329, 66, N'Y', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (40, 1215, 160343, 72, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (41, 1218, 160407, 2, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (41, 1218, 160401, 13, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (41, 1208, 160169, 46, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (41, 1208, 160168, 67, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (42, 1209, 160192, 34, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (42, 1209, 160194, 47, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (42, 1209, 160196, 61, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (42, 1203, 160056, 67, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (42, 1203, 160065, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (42, 1203, 160061, 91, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (42, 1209, 160207, 92, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (43, 1219, 160431, 2, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (43, 1211, 160238, 24, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (43, 1219, 160436, 41, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (43, 1211, 160252, 54, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (43, 1211, 160245, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (43, 1219, 160427, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (43, 1219, 160421, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (44, 1210, 160208, 38, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (44, 1206, 160137, 47, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (44, 1210, 160222, 65, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (45, 1214, 160318, 2, N' ', N'ST', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (45, 1213, 160282, 42, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (45, 1213, 160281, 66, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (45, 1214, 160310, 70, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (45, 1213, 160290, 89, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (46, 1224, 160535, 5, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (46, 1224, 160533, 16, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (46, 1224, 160536, 24, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (46, 1203, 160061, 59, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (46, 1224, 160544, 75, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (46, 1203, 160050, 85, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (47, 1211, 160247, 56, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (47, 1211, 160238, 57, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (47, 1211, 160246, 59, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (47, 1208, 160168, 90, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (47, 1208, 160180, 112, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (48, 1210, 160221, 58, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (48, 1207, 160149, 75, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (49, 1224, 160540, 8, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (49, 1224, 160533, 62, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (49, 1214, 160303, 71, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (49, 1214, 160322, 72, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (49, 1224, 160547, 88, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (50, 1208, 160177, 1, N' ', N'ST', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (50, 1208, 160172, 36, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (50, 1207, 160143, 43, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (50, 1208, 160180, 45, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (50, 1208, 160173, 50, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (50, 1207, 160152, 75, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1214, 160304, 34, N' ', N'NT', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1214, 160313, 62, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1207, 160149, 80, N' ', N'NT', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1214, 160308, 95, N' ', N'ET', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1207, 160153, 97, N' ', N'ET', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1214, 160318, 98, N' ', N'ET', 1)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1207, 160145, 107, N' ', N'ET', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1207, 160155, 115, N' ', N'ET', 2)
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1214, 160306, 119, N' ', N'ET', 2)
GO
INSERT [SOCCER].[player_booked] ([match_no], [team_id], [player_id], [booking_time], [sent_off], [play_schedule], [play_half]) VALUES (51, 1214, 160302, 122, N' ', N'ET', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1207, 160151, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1207, 160160, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1207, 160161, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1207, 160161, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1207, 160157, N'ST', 2, N'I', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1207, 160154, N'ST', 2, N'O', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1216, 160365, N'NT', 2, N'I', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1216, 160366, N'NT', 2, N'O', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1216, 160357, N'NT', 2, N'I', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1216, 160363, N'NT', 2, N'O', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1216, 160364, N'NT', 2, N'I', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (1, 1216, 160360, N'NT', 2, N'O', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1201, 160014, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1201, 160019, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1201, 160021, N'NT', 2, N'I', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1201, 160018, N'NT', 2, N'O', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1201, 160022, N'NT', 2, N'I', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1201, 160023, N'NT', 2, N'O', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1221, 160480, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1221, 160481, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1221, 160475, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1221, 160473, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1221, 160474, N'NT', 2, N'I', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (2, 1221, 160476, N'NT', 2, N'O', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1218, 160413, N'NT', 2, N'I', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1218, 160412, N'NT', 2, N'O', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1218, 160403, N'NT', 2, N'I', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1218, 160406, N'NT', 2, N'O', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1218, 160410, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1218, 160411, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1224, 160543, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1224, 160541, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1224, 160550, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1224, 160546, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1224, 160537, N'NT', 2, N'I', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (3, 1224, 160544, N'NT', 2, N'O', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1206, 160133, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1206, 160136, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1206, 160131, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1206, 160132, N'NT', 2, N'O', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1217, 160386, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1217, 160381, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1217, 160380, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1217, 160376, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1217, 160383, N'NT', 2, N'I', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (4, 1217, 160391, N'NT', 2, N'O', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1204, 160090, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1204, 160085, N'NT', 2, N'O', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1204, 160075, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1204, 160086, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1204, 160092, N'ST', 2, N'I', 3)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1204, 160091, N'ST', 2, N'O', 3)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1222, 160502, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1222, 160498, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1222, 160504, N'NT', 2, N'I', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1222, 160494, N'NT', 2, N'O', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1222, 160506, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (5, 1222, 160505, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1212, 160266, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1212, 160265, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1212, 160276, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1212, 160269, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1212, 160272, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1212, 160257, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1213, 160289, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1213, 160293, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1213, 160288, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1213, 160287, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1213, 160294, N'NT', 2, N'I', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (6, 1213, 160290, N'NT', 2, N'O', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1208, 160179, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1208, 160173, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1208, 160180, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1208, 160174, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1223, 160528, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1223, 160529, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1223, 160526, N'NT', 2, N'I', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (7, 1223, 160519, N'NT', 2, N'O', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1205, 160113, N'NT', 2, N'I', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1205, 160114, N'NT', 2, N'O', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1205, 160112, N'NT', 2, N'I', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1205, 160096, N'NT', 2, N'O', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1205, 160107, N'NT', 2, N'I', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1205, 160110, N'NT', 2, N'O', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1219, 160433, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1219, 160435, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1219, 160432, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1219, 160428, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1219, 160437, N'NT', 2, N'I', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (8, 1219, 160436, N'NT', 2, N'O', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1215, 160337, N'NT', 2, N'I', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1215, 160345, N'NT', 2, N'O', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1215, 160342, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1215, 160335, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1215, 160338, N'NT', 2, N'I', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1215, 160336, N'NT', 2, N'O', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1220, 160444, N'NT', 1, N'I', 45)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1220, 160446, N'NT', 1, N'O', 45)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1220, 160458, N'NT', 2, N'I', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1220, 160457, N'NT', 2, N'O', 59)
GO
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1219, 160437, N'NT', 2, N'I', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1219, 160433, N'NT', 2, N'O', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1206, 160133, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1206, 160128, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1206, 160138, N'NT', 2, N'I', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1206, 160132, N'NT', 2, N'O', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1206, 160135, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1206, 160136, N'NT', 2, N'O', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1210, 160211, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1210, 160230, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1210, 160219, N'NT', 2, N'I', 89)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (44, 1210, 160226, N'NT', 2, N'O', 89)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1213, 160289, N'ET', 1, N'I', 98)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1213, 160293, N'ET', 1, N'O', 98)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1213, 160290, N'NT', 2, N'I', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1213, 160288, N'NT', 2, N'O', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1214, 160313, N'ET', 1, N'I', 96)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1214, 160318, N'ET', 1, N'O', 96)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1214, 160314, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1214, 160310, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1214, 160321, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (45, 1214, 160313, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1203, 160061, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1203, 160058, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1203, 160068, N'NT', 2, N'I', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1203, 160054, N'NT', 2, N'O', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1203, 160065, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1203, 160067, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1224, 160542, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1224, 160543, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1224, 160551, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1224, 160550, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1224, 160534, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (46, 1224, 160544, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1208, 160180, N'NT', 1, N'I', 16)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1208, 160175, N'NT', 1, N'O', 16)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1208, 160173, N'NT', 2, N'I', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1208, 160182, N'NT', 2, N'O', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1211, 160253, N'ET', 2, N'I', 120)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1211, 160236, N'ET', 2, N'O', 120)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1211, 160237, N'NT', 2, N'I', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1211, 160243, N'NT', 2, N'O', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1211, 160251, N'NT', 2, N'I', 108)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (47, 1211, 160248, N'NT', 2, N'O', 108)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1207, 160158, N'NT', 2, N'I', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1207, 160159, N'NT', 2, N'O', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1207, 160146, N'NT', 2, N'I', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1207, 160145, N'NT', 2, N'O', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1207, 160151, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1207, 160154, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1210, 160214, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1210, 160227, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1210, 160220, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1210, 160226, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1210, 160228, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (48, 1210, 160230, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1214, 160311, N'NT', 2, N'I', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1214, 160316, N'NT', 2, N'O', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1214, 160314, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1214, 160310, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1214, 160321, N'NT', 2, N'I', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1214, 160320, N'NT', 2, N'O', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1224, 160551, N'NT', 2, N'I', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1224, 160543, N'NT', 2, N'O', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1224, 160548, N'NT', 2, N'I', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1224, 160550, N'NT', 2, N'O', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1224, 160546, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (49, 1224, 160534, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1207, 160152, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1207, 160154, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1207, 160158, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1207, 160159, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1207, 160150, N'ST', 2, N'I', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1207, 160160, N'ST', 2, N'O', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1208, 160170, N'NT', 2, N'I', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1208, 160165, N'NT', 2, N'O', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1208, 160174, N'NT', 2, N'I', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1208, 160172, N'NT', 2, N'O', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1208, 160178, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (50, 1208, 160180, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1207, 160161, N'ET', 2, N'I', 110)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1207, 160154, N'ET', 2, N'O', 110)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1207, 160151, N'NT', 2, N'I', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1207, 160154, N'NT', 2, N'O', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1207, 160158, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1207, 160159, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1214, 160321, N'NT', 1, N'I', 25)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1214, 160322, N'NT', 1, N'O', 25)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1214, 160314, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1214, 160310, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1214, 160319, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (51, 1214, 160316, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1220, 160449, N'NT', 2, N'I', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (9, 1220, 160455, N'NT', 2, N'O', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1203, 160068, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1203, 160063, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1203, 160069, N'NT', 2, N'I', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1203, 160067, N'NT', 2, N'O', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1203, 160058, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1203, 160051, N'NT', 2, N'O', 76)
GO
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1211, 160238, N'NT', 2, N'I', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1211, 160237, N'NT', 2, N'O', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1211, 160250, N'NT', 2, N'I', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1211, 160248, N'NT', 2, N'O', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1211, 160245, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (10, 1211, 160242, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1202, 160041, N'NT', 2, N'I', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1202, 160040, N'NT', 2, N'O', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1202, 160046, N'NT', 2, N'I', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1202, 160045, N'NT', 2, N'O', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1202, 160042, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1202, 160037, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1209, 160206, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1209, 160207, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1209, 160200, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1209, 160197, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1209, 160195, N'NT', 2, N'I', 89)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (11, 1209, 160204, N'NT', 2, N'O', 89)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1210, 160227, N'NT', 2, N'I', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1210, 160230, N'NT', 2, N'O', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1210, 160211, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1210, 160229, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1214, 160316, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1214, 160314, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1214, 160321, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1214, 160313, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1214, 160319, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (12, 1214, 160311, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1217, 160380, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1217, 160383, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1217, 160376, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1217, 160381, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1217, 160386, N'NT', 2, N'I', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1217, 160390, N'NT', 2, N'O', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1218, 160413, N'NT', 2, N'I', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1218, 160403, N'NT', 2, N'O', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1218, 160402, N'NT', 2, N'I', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1218, 160411, N'NT', 2, N'O', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1218, 160412, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (13, 1218, 160408, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1216, 160358, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1216, 160359, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1216, 160350, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1216, 160355, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1216, 160366, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1216, 160368, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1221, 160480, N'NT', 2, N'I', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1221, 160482, N'NT', 2, N'O', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1221, 160466, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1221, 160473, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1221, 160483, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (14, 1221, 160476, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1201, 160018, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1201, 160008, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1201, 160019, N'NT', 2, N'I', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1201, 160015, N'NT', 2, N'O', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1201, 160010, N'NT', 2, N'I', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1201, 160005, N'NT', 2, N'O', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1207, 160155, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1207, 160161, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1207, 160160, N'NT', 2, N'I', 68)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1207, 160151, N'NT', 2, N'O', 68)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1207, 160158, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (15, 1207, 160159, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1206, 160138, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1206, 160137, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1206, 160134, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1206, 160132, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1206, 160135, N'NT', 2, N'I', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1206, 160130, N'NT', 2, N'O', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1224, 160541, N'NT', 2, N'I', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1224, 160543, N'NT', 2, N'O', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1224, 160546, N'NT', 2, N'I', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (16, 1224, 160550, N'NT', 2, N'O', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1212, 160275, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1212, 160272, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1212, 160270, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1212, 160276, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1212, 160265, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1212, 160268, N'NT', 2, N'O', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1223, 160529, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1223, 160528, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1223, 160516, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1223, 160523, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1223, 160526, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (17, 1223, 160519, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1208, 160179, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1208, 160174, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1208, 160182, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1208, 160173, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1213, 160289, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1213, 160293, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1213, 160290, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1213, 160287, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1213, 160294, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (18, 1213, 160288, N'NT', 2, N'O', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1211, 160253, N'NT', 2, N'I', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1211, 160252, N'NT', 2, N'O', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1211, 160245, N'NT', 2, N'I', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1211, 160242, N'NT', 2, N'O', 74)
GO
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1211, 160247, N'NT', 2, N'I', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1211, 160243, N'NT', 2, N'O', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1220, 160455, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1220, 160448, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1220, 160449, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1220, 160451, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1220, 160457, N'NT', 2, N'I', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (19, 1220, 160458, N'NT', 2, N'O', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1204, 160083, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1204, 160084, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1204, 160075, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1204, 160086, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1204, 160079, N'ST', 2, N'I', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1204, 160077, N'ST', 2, N'O', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1205, 160115, N'NT', 2, N'I', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1205, 160112, N'NT', 2, N'I', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1205, 160113, N'NT', 2, N'O', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1205, 160111, N'NT', 2, N'O', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1205, 160114, N'NT', 2, N'I', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (20, 1205, 160108, N'NT', 2, N'O', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1219, 160426, N'NT', 2, N'I', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1219, 160431, N'NT', 2, N'O', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1219, 160430, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1219, 160428, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1219, 160418, N'NT', 2, N'I', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1219, 160421, N'NT', 2, N'O', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1222, 160497, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1222, 160495, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1222, 160499, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1222, 160498, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1222, 160503, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (21, 1222, 160501, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1203, 160063, N'NT', 2, N'I', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1203, 160060, N'NT', 2, N'O', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1203, 160068, N'NT', 2, N'I', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1203, 160058, N'NT', 2, N'O', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1203, 160066, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1203, 160067, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1215, 160337, N'NT', 2, N'I', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1215, 160336, N'NT', 2, N'O', 62)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1215, 160338, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1215, 160335, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1215, 160342, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (22, 1215, 160343, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1209, 160201, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1209, 160205, N'NT', 2, N'I', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1209, 160206, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1209, 160200, N'NT', 2, N'O', 66)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1209, 160207, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1209, 160191, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1210, 160223, N'NT', 2, N'I', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1210, 160222, N'NT', 2, N'O', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1210, 160227, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1210, 160226, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1210, 160228, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (23, 1210, 160230, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1202, 160042, N'NT', 2, N'I', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1202, 160034, N'NT', 2, N'O', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1202, 160044, N'NT', 2, N'I', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1202, 160041, N'NT', 2, N'O', 85)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1202, 160033, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1202, 160038, N'NT', 2, N'O', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1214, 160313, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1214, 160321, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1214, 160319, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1214, 160311, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1214, 160315, N'NT', 2, N'I', 89)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (24, 1214, 160320, N'NT', 2, N'O', 89)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1201, 160020, N'NT', 2, N'I', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1201, 160023, N'NT', 2, N'O', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1201, 160018, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1201, 160016, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1201, 160013, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1201, 160012, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1216, 160362, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1216, 160361, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1216, 160364, N'NT', 2, N'I', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1216, 160365, N'NT', 2, N'O', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1216, 160366, N'NT', 2, N'I', 68)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (25, 1216, 160360, N'NT', 2, N'O', 68)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1207, 160154, N'NT', 2, N'I', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1207, 160151, N'NT', 2, N'O', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1207, 160153, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1207, 160160, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1221, 160482, N'NT', 2, N'I', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1221, 160480, N'NT', 2, N'O', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1221, 160474, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1221, 160476, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1221, 160466, N'NT', 2, N'I', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (26, 1221, 160481, N'NT', 2, N'O', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1217, 160372, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1217, 160373, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1217, 160381, N'NT', 2, N'I', 52)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1217, 160386, N'NT', 2, N'O', 52)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1217, 160384, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1217, 160391, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1224, 160541, N'NT', 2, N'I', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1224, 160540, N'NT', 2, N'O', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1224, 160542, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1224, 160543, N'NT', 2, N'O', 76)
GO
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1224, 160548, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (27, 1224, 160547, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1206, 160136, N'NT', 2, N'I', 56)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1206, 160133, N'NT', 2, N'O', 56)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1206, 160126, N'NT', 2, N'I', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1206, 160130, N'NT', 2, N'O', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1206, 160134, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1206, 160137, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1218, 160402, N'NT', 2, N'I', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1218, 160403, N'NT', 2, N'O', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1218, 160396, N'NT', 2, N'I', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1218, 160409, N'NT', 2, N'O', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1218, 160400, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (28, 1218, 160411, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1213, 160287, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1213, 160296, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1213, 160288, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1213, 160290, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1213, 160295, N'ST', 2, N'I', 3)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1213, 160298, N'ST', 2, N'O', 3)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1223, 160519, N'NT', 2, N'I', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1223, 160526, N'NT', 2, N'O', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1223, 160524, N'ST', 2, N'I', 1)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (29, 1223, 160529, N'ST', 2, N'O', 1)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1208, 160179, N'NT', 2, N'I', 55)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1208, 160174, N'NT', 2, N'O', 55)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1208, 160180, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1208, 160175, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1208, 160167, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1208, 160165, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1212, 160274, N'NT', 2, N'I', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1212, 160276, N'NT', 2, N'O', 59)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1212, 160270, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1212, 160272, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1212, 160275, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (30, 1212, 160268, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1205, 160115, N'NT', 2, N'I', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1205, 160107, N'NT', 2, N'O', 57)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1205, 160112, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1205, 160104, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1205, 160105, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1205, 160108, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1222, 160498, N'NT', 2, N'I', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1222, 160502, N'NT', 2, N'O', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1222, 160499, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1222, 160506, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1222, 160505, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (31, 1222, 160504, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1204, 160083, N'NT', 2, N'I', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1204, 160087, N'NT', 2, N'O', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1204, 160088, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1204, 160092, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1204, 160090, N'ST', 2, N'I', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1204, 160085, N'ST', 2, N'O', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1219, 160426, N'NT', 2, N'I', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1219, 160436, N'NT', 2, N'O', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1219, 160433, N'NT', 2, N'I', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1219, 160435, N'NT', 2, N'O', 67)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1219, 160432, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (32, 1219, 160428, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1202, 160042, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1202, 160045, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1202, 160031, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1202, 160038, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1202, 160039, N'NT', 2, N'I', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1202, 160041, N'NT', 2, N'O', 78)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1210, 160211, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1210, 160226, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1210, 160219, N'NT', 2, N'I', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1210, 160230, N'NT', 2, N'O', 80)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1210, 160214, N'NT', 2, N'I', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (33, 1210, 160229, N'NT', 2, N'O', 86)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1209, 160188, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1209, 160203, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1209, 160204, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1209, 160207, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1209, 160200, N'NT', 2, N'I', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1209, 160198, N'NT', 2, N'O', 83)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1214, 160316, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1214, 160314, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1214, 160321, N'NT', 2, N'I', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1214, 160311, N'NT', 2, N'O', 61)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1214, 160313, N'NT', 2, N'I', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (34, 1214, 160320, N'NT', 2, N'O', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1211, 160237, N'NT', 2, N'I', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1211, 160240, N'NT', 2, N'O', 60)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1211, 160251, N'NT', 2, N'I', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1211, 160250, N'NT', 2, N'O', 74)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1211, 160249, N'NT', 2, N'I', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1211, 160238, N'NT', 2, N'O', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1215, 160338, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1215, 160344, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1215, 160335, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1215, 160336, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1215, 160340, N'NT', 2, N'I', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (35, 1215, 160343, N'NT', 2, N'O', 90)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1203, 160068, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1203, 160058, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1203, 160066, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1203, 160067, N'NT', 2, N'O', 87)
GO
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1203, 160069, N'ST', 2, N'I', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1203, 160062, N'ST', 2, N'O', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1220, 160458, N'NT', 2, N'I', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1220, 160457, N'NT', 2, N'O', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1220, 160448, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1220, 160454, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1220, 160450, N'NT', 2, N'I', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (36, 1220, 160451, N'NT', 2, N'O', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1213, 160289, N'ET', 1, N'I', 101)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1213, 160293, N'ET', 1, N'O', 101)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1213, 160294, N'ET', 1, N'I', 104)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1213, 160288, N'ET', 1, N'O', 104)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1221, 160480, N'NT', 2, N'I', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1221, 160473, N'NT', 2, N'O', 58)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1221, 160479, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1221, 160481, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1221, 160474, N'NT', 2, N'I', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (37, 1221, 160472, N'NT', 2, N'O', 77)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1212, 160276, N'NT', 2, N'I', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1212, 160272, N'NT', 2, N'O', 69)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1212, 160275, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1212, 160271, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1212, 160270, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1212, 160262, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1224, 160550, N'NT', 2, N'I', 55)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1224, 160551, N'NT', 2, N'O', 55)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1224, 160546, N'NT', 2, N'I', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (38, 1224, 160543, N'NT', 2, N'O', 63)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1204, 160092, N'ET', 2, N'I', 110)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1204, 160086, N'ET', 2, N'O', 110)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1204, 160090, N'ET', 2, N'I', 120)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1204, 160073, N'ET', 2, N'O', 120)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1204, 160089, N'NT', 2, N'I', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1204, 160091, N'NT', 2, N'O', 88)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1214, 160313, N'ET', 2, N'I', 117)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1214, 160310, N'ET', 2, N'O', 117)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1214, 160316, N'NT', 2, N'I', 50)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1214, 160311, N'NT', 2, N'O', 50)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1214, 160321, N'NT', 2, N'I', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (39, 1214, 160313, N'NT', 2, N'O', 87)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1207, 160151, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1207, 160152, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1207, 160158, N'NT', 2, N'I', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1207, 160159, N'NT', 2, N'O', 73)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1207, 160157, N'ST', 2, N'I', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1207, 160151, N'ST', 2, N'O', 2)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1215, 160345, N'NT', 2, N'I', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1215, 160344, N'NT', 2, N'O', 65)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1215, 160331, N'NT', 2, N'I', 68)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1215, 160337, N'NT', 2, N'O', 68)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1215, 160335, N'NT', 2, N'I', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (40, 1215, 160336, N'NT', 2, N'O', 71)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1208, 160167, N'NT', 2, N'I', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1208, 160184, N'NT', 2, N'I', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1208, 160165, N'NT', 2, N'O', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1208, 160173, N'NT', 2, N'O', 72)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1208, 160180, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1208, 160175, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1218, 160404, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1218, 160411, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1218, 160414, N'NT', 2, N'I', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1218, 160412, N'NT', 2, N'O', 64)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1218, 160399, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (41, 1218, 160396, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1203, 160058, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1203, 160068, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1203, 160065, N'NT', 2, N'I', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1203, 160067, N'NT', 2, N'O', 76)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1203, 160061, N'NT', 2, N'I', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1203, 160062, N'NT', 2, N'O', 81)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1209, 160196, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1209, 160203, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1209, 160205, N'NT', 2, N'I', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1209, 160195, N'NT', 2, N'O', 75)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1209, 160201, N'NT', 2, N'I', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (42, 1209, 160191, N'NT', 2, N'O', 79)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1211, 160245, N'NT', 2, N'I', 54)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1211, 160242, N'NT', 2, N'O', 54)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1211, 160251, N'NT', 2, N'I', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1211, 160248, N'NT', 2, N'O', 82)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1211, 160237, N'NT', 2, N'I', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1211, 160243, N'NT', 2, N'O', 84)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1219, 160433, N'NT', 2, N'I', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1219, 160436, N'NT', 2, N'O', 46)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1219, 160434, N'NT', 2, N'I', 70)
INSERT [SOCCER].[player_in_out] ([match_no], [team_id], [player_id], [play_schedule], [play_half], [in_out], [time_in_out]) VALUES (43, 1219, 160435, N'NT', 2, N'O', 70)
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160001, 1, N'Etrit Berisha ', N'GK', CAST(N'1989-03-10' AS Date), 27, N'Lazio')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160002, 23, N'Alban Hoxha ', N'GK', CAST(N'1987-11-23' AS Date), 28, N'Partizani')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160003, 12, N'Orges Shehi ', N'GK', CAST(N'1977-09-25' AS Date), 38, N'Skenderbeu')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160004, 7, N'Ansi Agolli ', N'DF', CAST(N'1982-10-11' AS Date), 33, N'Qarabag')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160005, 18, N'Arlind Ajeti ', N'DF', CAST(N'1993-09-25' AS Date), 22, N'Frosinone')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160006, 17, N'Naser Aliji ', N'DF', CAST(N'1993-12-27' AS Date), 22, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160007, 4, N'Elseid Hysaj ', N'DF', CAST(N'1994-02-20' AS Date), 22, N'Napoli')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160008, 2, N'Andi Lila ', N'DF', CAST(N'1986-02-12' AS Date), 30, N'Giannina')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160009, 15, N'Mergim Mavraj ', N'DF', CAST(N'1986-06-09' AS Date), 30, N'Koln')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160010, 6, N'Frederic Veseli ', N'DF', CAST(N'1992-11-20' AS Date), 23, N'Lugano')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160011, 22, N'Amir Abrashi ', N'MF', CAST(N'1990-03-27' AS Date), 26, N'Freiburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160012, 8, N'Migjen Basha ', N'MF', CAST(N'1987-01-05' AS Date), 29, N'Como')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160013, 5, N'Lorik Cana ', N'MF', CAST(N'1983-07-27' AS Date), 32, N'Nantes')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160014, 20, N'Ergys Kace ', N'MF', CAST(N'1993-07-08' AS Date), 22, N'PAOK')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160015, 13, N'Burim Kukeli ', N'MF', CAST(N'1984-01-16' AS Date), 32, N'Zurich')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160016, 3, N'Ermir Lenjani ', N'MF', CAST(N'1989-08-05' AS Date), 26, N'Nantes')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160017, 9, N'Ledian Memushaj ', N'MF', CAST(N'1986-12-17' AS Date), 29, N'Pescara')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160018, 21, N'Odise Roshi ', N'MF', CAST(N'1991-05-22' AS Date), 25, N'Rijeka')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160019, 14, N'Taulant Xhaka ', N'MF', CAST(N'1991-03-28' AS Date), 25, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160020, 19, N'Bekim Balaj ', N'FD', CAST(N'1991-01-11' AS Date), 25, N'Rijeka')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160021, 16, N'Sokol Cikalleshi ', N'FD', CAST(N'1990-07-27' AS Date), 25, N'Istanbul Basaksehir')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160022, 11, N'Shkelzen Gashi ', N'FD', CAST(N'1988-07-15' AS Date), 27, N'Colorado')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1201, 160023, 10, N'Armando Sadiku ', N'FD', CAST(N'1991-05-27' AS Date), 25, N'Vaduz')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160024, 1, N'Robert Almer ', N'GK', CAST(N'1984-03-20' AS Date), 32, N'Austria Wien')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160025, 12, N'Heinz Lindner ', N'GK', CAST(N'1990-07-17' AS Date), 25, N'Frankfurt')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160026, 23, N'Ramazan Ozcan ', N'GK', CAST(N'1984-06-28' AS Date), 31, N'Ingolstadt')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160027, 3, N'Aleksandar Dragovic ', N'DF', CAST(N'1991-03-06' AS Date), 25, N'Dynamo Kyiv')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160028, 5, N'Christian Fuchs ', N'DF', CAST(N'1986-04-07' AS Date), 30, N'Leicester')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160029, 4, N'Martin Hinteregger ', N'DF', CAST(N'1992-09-07' AS Date), 23, N'Monchengladbach')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160030, 17, N'Florian Klein ', N'DF', CAST(N'1986-11-17' AS Date), 29, N'Stuttgart')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160031, 15, N'Sebastian Prodl ', N'DF', CAST(N'1987-06-21' AS Date), 28, N'Watford')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160032, 13, N'Markus Suttner ', N'DF', CAST(N'1987-04-16' AS Date), 29, N'Ingolstadt')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160033, 16, N'Kevin Wimmer ', N'DF', CAST(N'1992-11-15' AS Date), 23, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160034, 8, N'David Alaba ', N'MF', CAST(N'1992-06-24' AS Date), 23, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160035, 14, N'Julian Baumgartlinger ', N'MF', CAST(N'1988-01-02' AS Date), 28, N'Mainz')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160036, 2, N'Gyorgy Garics ', N'MF', CAST(N'1984-03-08' AS Date), 32, N'Darmstadt')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160037, 11, N'Martin Harnik ', N'MF', CAST(N'1987-06-10' AS Date), 29, N'Stuttgart')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160038, 6, N'Stefan Ilsanker ', N'MF', CAST(N'1989-05-18' AS Date), 27, N'Leipzig')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160039, 22, N'Jakob Jantscher ', N'MF', CAST(N'1989-01-08' AS Date), 27, N'Luzern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160040, 10, N'Zlatko Junuzovic ', N'MF', CAST(N'1987-09-26' AS Date), 28, N'Bremen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160041, 20, N'Marcel Sabitzer ', N'MF', CAST(N'1994-03-17' AS Date), 22, N'Leipzig')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160042, 18, N'Alessandro Schopf ', N'MF', CAST(N'1994-02-07' AS Date), 22, N'Schalke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160043, 7, N'Marko Arnautovic ', N'FD', CAST(N'1989-04-19' AS Date), 27, N'Stoke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160044, 19, N'Lukas Hinterseer ', N'FD', CAST(N'1991-03-28' AS Date), 25, N'Ingolstadt')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160045, 21, N'Marc Janko ', N'FD', CAST(N'1983-06-25' AS Date), 32, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1202, 160046, 9, N'Rubin Okotie ', N'FD', CAST(N'1987-06-06' AS Date), 29, N'1860 Munchen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160047, 1, N'Thibaut Courtois ', N'GK', CAST(N'1992-05-11' AS Date), 24, N'Chelsea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160048, 13, N'Jean-Francois Gillet ', N'GK', CAST(N'1979-05-31' AS Date), 37, N'Mechelen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160049, 12, N'Simon Mignolet ', N'GK', CAST(N'1988-08-06' AS Date), 27, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160050, 2, N'Toby Alderweireld ', N'DF', CAST(N'1989-03-02' AS Date), 27, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160051, 23, N'Laurent Ciman ', N'DF', CAST(N'1985-08-05' AS Date), 30, N'Montreal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160052, 15, N'Jason Denayer ', N'DF', CAST(N'1995-06-28' AS Date), 20, N'Galatasaray')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160053, 18, N'Christian Kabasele ', N'DF', CAST(N'1991-02-24' AS Date), 25, N'Genk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160054, 21, N'Jordan Lukaku ', N'DF', CAST(N'1994-07-25' AS Date), 21, N'Oostende')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160055, 16, N'Thomas Meunier ', N'DF', CAST(N'1991-09-12' AS Date), 24, N'Club Brugge')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160056, 3, N'Thomas Vermaelen ', N'DF', CAST(N'1985-11-14' AS Date), 30, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160057, 5, N'Jan Vertonghen ', N'DF', CAST(N'1987-04-24' AS Date), 29, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160058, 11, N'Yannick Carrasco ', N'MF', CAST(N'1993-09-04' AS Date), 22, N'Atletico')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160059, 7, N'Kevin De Bruyne ', N'MF', CAST(N'1991-06-28' AS Date), 24, N'Man. City')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160060, 19, N'Mousa Dembele ', N'MF', CAST(N'1987-07-16' AS Date), 28, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160061, 8, N'Marouane Fellaini ', N'MF', CAST(N'1987-11-22' AS Date), 28, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160062, 10, N'Eden Hazard ', N'MF', CAST(N'1991-01-07' AS Date), 25, N'Chelsea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160063, 4, N'Radja Nainggolan ', N'MF', CAST(N'1988-05-04' AS Date), 28, N'Roma')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160064, 6, N'Axel Witsel ', N'MF', CAST(N'1989-01-12' AS Date), 27, N'Zenit')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160065, 22, N'Michy Batshuayi ', N'FD', CAST(N'1993-10-02' AS Date), 22, N'Marseille')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160066, 20, N'Christian Benteke ', N'FD', CAST(N'1990-12-03' AS Date), 25, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160067, 9, N'Romelu Lukaku ', N'FD', CAST(N'1993-05-13' AS Date), 23, N'Everton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160068, 14, N'Dries Mertens ', N'FD', CAST(N'1987-05-06' AS Date), 29, N'Napoli')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1203, 160069, 17, N'Divock Origi ', N'FD', CAST(N'1995-04-18' AS Date), 21, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160070, 12, N'Lovre Kalinic ', N'GK', CAST(N'1990-04-03' AS Date), 26, N'Hajduk Split')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160071, 23, N'Danijel SubaSic ', N'GK', CAST(N'1984-10-27' AS Date), 31, N'Monaco')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160072, 1, N'Ivan Vargic ', N'GK', CAST(N'1987-03-15' AS Date), 29, N'Rijeka')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160073, 5, N'Vedran Corluka ', N'DF', CAST(N'1986-02-05' AS Date), 30, N'Lokomotiv Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160074, 6, N'Tin Jedvaj ', N'DF', CAST(N'1995-11-28' AS Date), 20, N'Leverkusen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160075, 13, N'Gordon Schildenfeld ', N'DF', CAST(N'1985-03-18' AS Date), 31, N'Dinamo Zagreb')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160076, 11, N'Darijo Srna ', N'DF', CAST(N'1982-05-01' AS Date), 34, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160077, 3, N'Ivan Strinic ', N'DF', CAST(N'1987-07-17' AS Date), 28, N'Napoli')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160078, 21, N'Domagoj Vida ', N'DF', CAST(N'1989-04-29' AS Date), 27, N'Dynamo Kyiv')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160079, 2, N'Sime Vrsaljko ', N'DF', CAST(N'1992-01-10' AS Date), 24, N'Sassuolo')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160080, 19, N'Milan Badelj ', N'MF', CAST(N'1989-02-25' AS Date), 27, N'Fiorentina')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160081, 14, N'Marcelo Brozovic ', N'MF', CAST(N'1992-11-16' AS Date), 23, N'Internazionale')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160082, 18, N'Ante Coric ', N'MF', CAST(N'1997-04-14' AS Date), 19, N'Dinamo Zagreb')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160083, 8, N'Mateo Kovacic ', N'MF', CAST(N'1994-05-06' AS Date), 22, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160084, 10, N'Luka Modric ', N'MF', CAST(N'1985-09-09' AS Date), 30, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160085, 4, N'Ivan PeriSic ', N'MF', CAST(N'1989-02-02' AS Date), 27, N'Internazionale')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160086, 7, N'Ivan Rakitic ', N'MF', CAST(N'1988-03-10' AS Date), 28, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160087, 15, N'Marko Rog ', N'MF', CAST(N'1995-07-19' AS Date), 20, N'Dinamo Zagreb')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160088, 22, N'Duje Cop ', N'FD', CAST(N'1990-02-01' AS Date), 26, N'Malaga')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160089, 16, N'Nikola Kalinic ', N'FD', CAST(N'1988-01-05' AS Date), 28, N'Fiorentina')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160090, 9, N'Andrej Kramaric ', N'FD', CAST(N'1991-06-19' AS Date), 24, N'Hoffenheim')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160091, 17, N'Mario Mandzukic ', N'FD', CAST(N'1986-05-21' AS Date), 30, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1204, 160092, 20, N'Marko Pjaca ', N'FD', CAST(N'1995-05-06' AS Date), 21, N'Dinamo Zagreb')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160093, 1, N'Petr Cech ', N'GK', CAST(N'1982-05-20' AS Date), 34, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160094, 23, N'TomasKoubek ', N'GK', CAST(N'1992-08-26' AS Date), 23, N'Liberec')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160095, 16, N'TomasVaclik ', N'GK', CAST(N'1989-03-29' AS Date), 27, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160096, 4, N'Theodor Gebre Selassie ', N'DF', CAST(N'1986-12-24' AS Date), 29, N'Bremen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160097, 5, N'Roman Hubnik ', N'DF', CAST(N'1984-06-06' AS Date), 32, N'Plzen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160098, 2, N'Pavel Kaderabek ', N'DF', CAST(N'1992-04-25' AS Date), 24, N'Hoffenheim')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160099, 3, N'Michal Kadlec ', N'DF', CAST(N'1984-12-13' AS Date), 31, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160100, 8, N'David Limbersky ', N'DF', CAST(N'1983-10-06' AS Date), 32, N'Plzen')
GO
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160101, 6, N'TomasSivok ', N'DF', CAST(N'1983-09-15' AS Date), 32, N'Bursaspor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160102, 17, N'Marek Suchy ', N'DF', CAST(N'1988-03-29' AS Date), 28, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160103, 22, N'Vladimir Darida ', N'MF', CAST(N'1990-08-08' AS Date), 25, N'Hertha')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160104, 9, N'Borek Dockal ', N'MF', CAST(N'1988-09-30' AS Date), 27, N'Sparta Praha')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160105, 14, N'Daniel Kolar ', N'MF', CAST(N'1985-10-27' AS Date), 30, N'Plzen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160106, 19, N'Ladislav Krejci ', N'MF', CAST(N'1992-07-05' AS Date), 23, N'Sparta Praha')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160107, 15, N'David Pavelka ', N'MF', CAST(N'1991-05-18' AS Date), 25, N'Kasimpasa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160108, 13, N'Jaroslav PlaSil ', N'MF', CAST(N'1982-01-05' AS Date), 34, N'Bordeaux')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160109, 11, N'Daniel Pudil ', N'MF', CAST(N'1985-09-27' AS Date), 30, N'Sheff. Wednesday')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160110, 10, N'TomasRosicky ', N'MF', CAST(N'1980-10-04' AS Date), 35, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160111, 20, N'Jiri Skalak ', N'MF', CAST(N'1992-03-12' AS Date), 24, N'Brighton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160112, 18, N'Josef Sural ', N'MF', CAST(N'1990-05-30' AS Date), 26, N'Sparta Praha')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160113, 21, N'David Lafata ', N'FD', CAST(N'1981-09-18' AS Date), 34, N'Sparta Praha')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160114, 7, N'TomasNecid ', N'FD', CAST(N'1989-08-13' AS Date), 26, N'Bursaspor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1205, 160115, 12, N'Milan Skoda ', N'FD', CAST(N'1986-01-16' AS Date), 30, N'Slavia Praha')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160116, 13, N'Fraser Forster ', N'GK', CAST(N'1988-03-17' AS Date), 28, N'Southampton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160117, 1, N'Joe Hart ', N'GK', CAST(N'1987-04-19' AS Date), 29, N'Man. City')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160118, 23, N'Tom Heaton ', N'GK', CAST(N'1986-04-15' AS Date), 30, N'Burnley')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160119, 21, N'Ryan Bertrand ', N'DF', CAST(N'1989-08-05' AS Date), 26, N'Southampton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160120, 5, N'Gary Cahill ', N'DF', CAST(N'1985-12-19' AS Date), 30, N'Chelsea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160121, 12, N'Nathaniel Clyne ', N'DF', CAST(N'1991-04-05' AS Date), 25, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160122, 3, N'Danny Rose ', N'DF', CAST(N'1990-07-02' AS Date), 25, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160123, 6, N'Chris Smalling ', N'DF', CAST(N'1989-11-22' AS Date), 26, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160124, 16, N'John Stones ', N'DF', CAST(N'1994-05-28' AS Date), 22, N'Everton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160125, 2, N'Kyle Walker ', N'DF', CAST(N'1990-05-28' AS Date), 26, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160126, 20, N'Dele Alli ', N'MF', CAST(N'1996-04-11' AS Date), 20, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160127, 19, N'Ross Barkley ', N'MF', CAST(N'1993-12-05' AS Date), 22, N'Everton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160128, 17, N'Eric Dier ', N'MF', CAST(N'1994-01-15' AS Date), 22, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160129, 14, N'Jordan Henderson ', N'MF', CAST(N'1990-06-17' AS Date), 26, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160130, 8, N'Adam Lallana ', N'MF', CAST(N'1988-05-10' AS Date), 28, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160131, 4, N'James Milner ', N'MF', CAST(N'1986-01-04' AS Date), 30, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160132, 7, N'Raheem Sterling ', N'MF', CAST(N'1994-12-08' AS Date), 21, N'Man. City')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160133, 18, N'Jack Wilshere ', N'MF', CAST(N'1992-01-01' AS Date), 24, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160134, 9, N'Harry Kane ', N'FD', CAST(N'1993-07-28' AS Date), 22, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160135, 22, N'Marcus Rashford ', N'FD', CAST(N'1997-10-31' AS Date), 18, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160136, 10, N'Wayne Rooney ', N'FD', CAST(N'1985-10-24' AS Date), 30, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160137, 15, N'Daniel Sturridge ', N'FD', CAST(N'1989-09-01' AS Date), 26, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1206, 160138, 11, N'Jamie Vardy ', N'FD', CAST(N'1987-01-11' AS Date), 29, N'Leicester')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160139, 23, N'Benoit Costil ', N'GK', CAST(N'1987-07-03' AS Date), 28, N'Rennes')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160140, 1, N'Hugo Lloris ', N'GK', CAST(N'1986-12-26' AS Date), 29, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160141, 16, N'Steve Mandanda ', N'GK', CAST(N'1985-03-28' AS Date), 31, N'Marseille')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160142, 17, N'Lucas Digne ', N'DF', CAST(N'1993-07-20' AS Date), 22, N'Roma')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160143, 3, N'Patrice Evra ', N'DF', CAST(N'1981-05-15' AS Date), 35, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160144, 2, N'Christophe Jallet ', N'DF', CAST(N'1983-10-31' AS Date), 32, N'Lyon')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160145, 21, N'Laurent Koscielny ', N'DF', CAST(N'1985-09-10' AS Date), 30, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160146, 13, N'Eliaquim Mangala ', N'DF', CAST(N'1991-02-13' AS Date), 25, N'Man. City')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160147, 4, N'Adil Rami ', N'DF', CAST(N'1985-12-27' AS Date), 30, N'Sevilla')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160148, 19, N'Bacary Sagna ', N'DF', CAST(N'1983-02-14' AS Date), 33, N'Man. City')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160149, 22, N'Samuel Umtiti ', N'DF', CAST(N'1993-11-14' AS Date), 22, N'Lyon')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160150, 6, N'Yohan Cabaye ', N'MF', CAST(N'1986-01-14' AS Date), 30, N'Crystal Palace')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160151, 20, N'Kingsley Coman ', N'MF', CAST(N'1996-06-13' AS Date), 20, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160152, 5, N'NGolo Kante ', N'MF', CAST(N'1991-03-29' AS Date), 25, N'Leicester')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160153, 14, N'Blaise Matuidi ', N'MF', CAST(N'1987-04-09' AS Date), 29, N'Paris')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160154, 8, N'Dimitri Payet ', N'MF', CAST(N'1987-03-29' AS Date), 29, N'West Ham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160155, 15, N'Paul Pogba ', N'MF', CAST(N'1993-03-15' AS Date), 23, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160156, 12, N'Morgan Schneiderlin ', N'MF', CAST(N'1989-11-08' AS Date), 26, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160157, 18, N'Moussa Sissoko ', N'MF', CAST(N'1989-08-16' AS Date), 26, N'Newcastle')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160158, 10, N'Andre-Pierre Gignac ', N'FD', CAST(N'1985-12-05' AS Date), 30, N'Tigres')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160159, 9, N'Olivier Giroud ', N'FD', CAST(N'1986-09-30' AS Date), 29, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160160, 7, N'Antoine Griezmann ', N'FD', CAST(N'1991-03-21' AS Date), 25, N'Atletico')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1207, 160161, 11, N'Anthony Martial ', N'FD', CAST(N'1995-12-05' AS Date), 20, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160162, 12, N'Bernd Leno ', N'GK', CAST(N'1992-03-04' AS Date), 24, N'Leverkusen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160163, 1, N'Manuel Neuer ', N'GK', CAST(N'1986-03-27' AS Date), 30, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160164, 22, N'Marc-Andre ter Stegen ', N'GK', CAST(N'1992-04-30' AS Date), 24, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160165, 17, N'Jerome Boateng ', N'DF', CAST(N'1988-09-03' AS Date), 27, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160166, 3, N'Jonas Hector ', N'DF', CAST(N'1990-05-27' AS Date), 26, N'Koln')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160167, 4, N'Benedikt Howedes ', N'DF', CAST(N'1988-02-29' AS Date), 28, N'Schalke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160168, 5, N'Mats Hummels ', N'DF', CAST(N'1988-12-16' AS Date), 27, N'Dortmund')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160169, 21, N'Joshua Kimmich ', N'DF', CAST(N'1995-02-08' AS Date), 21, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160170, 2, N'Shkodran Mustafi ', N'DF', CAST(N'1992-04-17' AS Date), 24, N'Valencia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160171, 16, N'Jonathan Tah ', N'DF', CAST(N'1996-02-11' AS Date), 20, N'Leverkusen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160172, 14, N'Emre Can ', N'MF', CAST(N'1994-01-12' AS Date), 22, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160173, 11, N'Julian Draxler ', N'MF', CAST(N'1993-09-20' AS Date), 22, N'Wolfsburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160174, 19, N'Mario Gotze ', N'MF', CAST(N'1992-06-03' AS Date), 24, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160175, 6, N'Sami Khedira ', N'MF', CAST(N'1987-04-04' AS Date), 29, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160176, 18, N'Toni Kroos ', N'MF', CAST(N'1990-01-04' AS Date), 26, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160177, 8, N'Mesut ozil ', N'MF', CAST(N'1988-10-15' AS Date), 27, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160178, 20, N'Leroy Sane ', N'MF', CAST(N'1996-01-11' AS Date), 20, N'Schalke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160179, 9, N'Andre Schurrle ', N'MF', CAST(N'1990-11-06' AS Date), 25, N'Wolfsburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160180, 7, N'Bastian Schweinsteiger ', N'MF', CAST(N'1984-08-01' AS Date), 31, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160181, 15, N'Julian Weigl ', N'MF', CAST(N'1995-09-08' AS Date), 20, N'Dortmund')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160182, 23, N'Mario Gomez ', N'FD', CAST(N'1985-07-10' AS Date), 30, N'Besiktas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160183, 13, N'Thomas Muller ', N'FD', CAST(N'1989-09-13' AS Date), 26, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1208, 160184, 10, N'Lukas Podolski ', N'FD', CAST(N'1985-06-04' AS Date), 31, N'Galatasaray')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160185, 12, N'Denes Dibusz ', N'GK', CAST(N'1990-11-16' AS Date), 25, N'Ferencvaros')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160186, 22, N'Peter Gulacsi ', N'GK', CAST(N'1990-05-06' AS Date), 26, N'Leipzig')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160187, 1, N'Gabor Kiraly ', N'GK', CAST(N'1976-04-01' AS Date), 40, N'Haladas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160188, 21, N'Barnabas Bese ', N'DF', CAST(N'1994-05-06' AS Date), 22, N'MTK')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160189, 5, N'Attila Fiola ', N'DF', CAST(N'1990-02-17' AS Date), 26, N'Puskas Akademia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160190, 20, N'Richard Guzmics ', N'DF', CAST(N'1987-04-16' AS Date), 29, N'Wisla')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160191, 23, N'Roland Juhasz ', N'DF', CAST(N'1983-07-01' AS Date), 32, N'Videoton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160192, 4, N'Tamas Kadar ', N'DF', CAST(N'1990-03-14' AS Date), 26, N'Lech')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160193, 3, N'Mihaly Korhut ', N'DF', CAST(N'1988-12-01' AS Date), 27, N'Debrecen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160194, 2, N'Adam Lang ', N'DF', CAST(N'1993-01-17' AS Date), 23, N'Videoton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160195, 16, N'adam Pinter ', N'DF', CAST(N'1988-06-12' AS Date), 28, N'Ferencvaros')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160196, 6, N'Akos Elek ', N'MF', CAST(N'1988-07-21' AS Date), 27, N'Diosgyor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160197, 15, N'Laszlo Kleinheisler ', N'MF', CAST(N'1994-04-08' AS Date), 22, N'Bremen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160198, 14, N'Gergo Lovrencsics ', N'MF', CAST(N'1988-09-01' AS Date), 27, N'Lech')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160199, 8, N'Adam Nagy ', N'MF', CAST(N'1995-06-17' AS Date), 21, N'Ferencvaros')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160200, 18, N'Zoltan Stieber ', N'MF', CAST(N'1988-10-16' AS Date), 27, N'Nurnberg')
GO
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160201, 13, N'Daniel Bode ', N'FD', CAST(N'1986-10-24' AS Date), 29, N'Ferencvaros')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160202, 7, N'Balazs Dzsudzsak ', N'FD', CAST(N'1986-12-23' AS Date), 29, N'Bursaspor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160203, 10, N'Zoltan Gera ', N'FD', CAST(N'1979-04-22' AS Date), 37, N'Ferencvaros')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160204, 11, N'Krisztian Nemeth ', N'FD', CAST(N'1989-01-05' AS Date), 27, N'Al-Gharafa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160205, 17, N'Nemanja Nikolic ', N'FD', CAST(N'1987-12-31' AS Date), 28, N'Legia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160206, 19, N'Tamas Priskin ', N'FD', CAST(N'1986-09-27' AS Date), 29, N'Slovan Bratislava')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1209, 160207, 9, N'Adam Szalai ', N'FD', CAST(N'1987-12-09' AS Date), 28, N'Hannover')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160208, 1, N'Hannes Halldorsson ', N'GK', CAST(N'1984-04-27' AS Date), 32, N'Bodo/Glimt')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160209, 13, N'Ingvar Jonsson ', N'GK', CAST(N'1989-10-18' AS Date), 26, N'Sandefjord')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160210, 12, N'Ogmundur Kristinsson ', N'GK', CAST(N'1989-06-19' AS Date), 26, N'Hammarby')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160211, 18, N'Elmar Bjarnason ', N'DF', CAST(N'1987-03-04' AS Date), 29, N'AGF')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160212, 3, N'Haukur Heidar Hauksson ', N'DF', CAST(N'1991-09-01' AS Date), 24, N'AIK')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160213, 4, N'Hjortur Hermannsson ', N'DF', CAST(N'1995-02-08' AS Date), 21, N'Goteborg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160214, 5, N'Sverrir Ingason ', N'DF', CAST(N'1993-08-05' AS Date), 22, N'Lokeren')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160215, 19, N'Hordur Magnusson ', N'DF', CAST(N'1993-02-11' AS Date), 23, N'Cesena')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160216, 2, N'Birkir Saevarsson ', N'DF', CAST(N'1984-11-11' AS Date), 31, N'Hammarby')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160217, 6, N'Ragnar Sigurdsson ', N'DF', CAST(N'1986-06-19' AS Date), 29, N'Krasnodar')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160218, 23, N'Ari Skulason ', N'DF', CAST(N'1987-05-14' AS Date), 29, N'OB')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160219, 21, N'Arnor Ingvi Traustason ', N'DF', CAST(N'1993-04-30' AS Date), 23, N'Norrkoping')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160220, 14, N'Kari Arnason ', N'MF', CAST(N'1982-10-13' AS Date), 33, N'Malmo')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160221, 8, N'Birkir Bjarnason ', N'MF', CAST(N'1988-05-27' AS Date), 28, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160222, 17, N'Aron Gunnarsson ', N'MF', CAST(N'1989-04-22' AS Date), 27, N'Cardiff')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160223, 20, N'Emil Hallfredsson ', N'MF', CAST(N'1984-06-29' AS Date), 31, N'Udinese')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160224, 10, N'Gylfi Sigurdsson ', N'MF', CAST(N'1989-09-08' AS Date), 26, N'Swansea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160225, 16, N'Runar Mar Sigurjonsson ', N'MF', CAST(N'1990-06-18' AS Date), 26, N'Sundsvall')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160226, 15, N'Jon Dadi Bodvarsson ', N'FD', CAST(N'1992-05-25' AS Date), 24, N'Kaiserslautern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160227, 11, N'Alfred Finnbogason ', N'FD', CAST(N'1989-02-01' AS Date), 27, N'Augsburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160228, 22, N'Eidur Gudjohnsen ', N'FD', CAST(N'1978-09-15' AS Date), 37, N'Molde')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160229, 7, N'Johann Gudmundsson ', N'FD', CAST(N'1990-10-27' AS Date), 25, N'Charlton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1210, 160230, 9, N'Kolbeinn Sigthorsson ', N'FD', CAST(N'1990-03-14' AS Date), 26, N'Nantes')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160231, 1, N'Gianluigi Buffon ', N'GK', CAST(N'1978-01-28' AS Date), 38, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160232, 13, N'Federico Marchetti ', N'GK', CAST(N'1983-02-07' AS Date), 33, N'Lazio')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160233, 12, N'Salvatore Sirigu ', N'GK', CAST(N'1987-01-12' AS Date), 29, N'Paris')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160234, 15, N'Andrea Barzagli ', N'DF', CAST(N'1981-05-08' AS Date), 35, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160235, 19, N'Leonardo Bonucci ', N'DF', CAST(N'1987-05-01' AS Date), 29, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160236, 3, N'Giorgio Chiellini ', N'DF', CAST(N'1984-08-14' AS Date), 31, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160237, 4, N'Matteo Darmian ', N'DF', CAST(N'1989-12-02' AS Date), 26, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160238, 2, N'Mattia De Sciglio ', N'DF', CAST(N'1992-10-20' AS Date), 23, N'Milan')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160239, 5, N'Angelo Ogbonna ', N'DF', CAST(N'1988-05-23' AS Date), 28, N'West Ham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160240, 21, N'Federico Bernardeschi ', N'MF', CAST(N'1994-02-16' AS Date), 22, N'Fiorentina')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160241, 6, N'Antonio Candreva ', N'MF', CAST(N'1987-02-28' AS Date), 29, N'Lazio')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160242, 16, N'Daniele De Rossi ', N'MF', CAST(N'1983-07-24' AS Date), 32, N'Roma')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160243, 8, N'Alessandro Florenzi ', N'MF', CAST(N'1991-03-11' AS Date), 25, N'Roma')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160244, 23, N'Emanuele Giaccherini ', N'MF', CAST(N'1985-05-05' AS Date), 31, N'Bologna')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160245, 10, N'Thiago Motta ', N'MF', CAST(N'1982-08-28' AS Date), 33, N'Paris')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160246, 18, N'Marco Parolo ', N'MF', CAST(N'1985-01-25' AS Date), 31, N'Lazio')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160247, 14, N'Stefano Sturaro ', N'MF', CAST(N'1993-03-09' AS Date), 23, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160248, 17, N'Eder ', N'FD', CAST(N'1986-11-15' AS Date), 29, N'Internazionale')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160249, 22, N'Stephan El Shaarawy ', N'FD', CAST(N'1992-10-27' AS Date), 23, N'Roma')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160250, 11, N'Ciro Immobile ', N'FD', CAST(N'1990-02-20' AS Date), 26, N'Torino')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160251, 20, N'Lorenzo Insigne ', N'FD', CAST(N'1991-06-04' AS Date), 25, N'Napoli')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160252, 9, N'Graziano Pelle', N'FD', CAST(N'1985-07-15' AS Date), 30, N'Southampton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1211, 160253, 7, N'Simone Zaza ', N'FD', CAST(N'1991-06-25' AS Date), 24, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160254, 12, N'Roy Carroll', N'GK', CAST(N'1977-09-30' AS Date), 38, N'Notts County')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160255, 23, N'Alan Mannus ', N'GK', CAST(N'1982-05-19' AS Date), 34, N'St Johnstone')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160256, 1, N'Michael McGovern ', N'GK', CAST(N'1984-07-12' AS Date), 31, N'Hamilton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160257, 6, N'Chris Baird ', N'DF', CAST(N'1982-02-25' AS Date), 34, N'Fulham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160258, 20, N'Craig Cathcart ', N'DF', CAST(N'1989-02-06' AS Date), 27, N'Watford')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160259, 5, N'Jonny Evans ', N'DF', CAST(N'1988-01-03' AS Date), 28, N'West Brom')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160260, 22, N'Lee Hodson ', N'DF', CAST(N'1991-10-02' AS Date), 24, N'MK Dons')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160261, 18, N'Aaron Hughes ', N'DF', CAST(N'1979-11-08' AS Date), 36, N'Melbourne City')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160262, 4, N'Gareth McAuley ', N'DF', CAST(N'1979-12-05' AS Date), 36, N'West Brom')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160263, 15, N'Luke McCullough ', N'DF', CAST(N'1994-02-15' AS Date), 22, N'Doncaster')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160264, 2, N'Conor McLaughlin ', N'DF', CAST(N'1991-07-26' AS Date), 24, N'Fleetwood')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160265, 17, N'Paddy McNair ', N'DF', CAST(N'1995-04-27' AS Date), 21, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160266, 14, N'Stuart Dallas ', N'MF', CAST(N'1991-04-19' AS Date), 25, N'Leeds')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160267, 8, N'Steven Davis ', N'MF', CAST(N'1985-01-01' AS Date), 31, N'Southampton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160268, 13, N'Corry Evans ', N'MF', CAST(N'1990-07-30' AS Date), 25, N'Blackburn')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160269, 3, N'Shane Ferguson ', N'MF', CAST(N'1991-07-12' AS Date), 24, N'Millwall')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160270, 21, N'Josh Magennis ', N'MF', CAST(N'1990-08-15' AS Date), 25, N'Kilmarnock')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160271, 16, N'Oliver Norwood ', N'MF', CAST(N'1991-04-12' AS Date), 25, N'Reading')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160272, 19, N'Jamie Ward ', N'MF', CAST(N'1986-05-12' AS Date), 30, N'Nottm Forest')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160273, 9, N'Will Grigg ', N'FD', CAST(N'1991-07-03' AS Date), 24, N'Wigan')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160274, 10, N'Kyle Lafferty ', N'FD', CAST(N'1987-09-16' AS Date), 28, N'Birmingham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160275, 7, N'Niall McGinn ', N'FD', CAST(N'1987-07-20' AS Date), 28, N'Aberdeen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1212, 160276, 11, N'Conor Washington ', N'FD', CAST(N'1992-05-18' AS Date), 24, N'QPR')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160277, 12, N'Artur Boruc ', N'GK', CAST(N'1980-02-20' AS Date), 36, N'Bournemouth')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160278, 22, N'Lukasz Fabianski ', N'GK', CAST(N'1985-04-18' AS Date), 31, N'Swansea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160279, 1, N'Wojciech Szczesny ', N'GK', CAST(N'1990-04-18' AS Date), 26, N'Roma')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160280, 4, N'Thiago Cionek ', N'DF', CAST(N'1986-04-21' AS Date), 30, N'Palermo')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160281, 15, N'Kamil Glik ', N'DF', CAST(N'1988-02-03' AS Date), 28, N'Torino')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160282, 3, N'Artur Jedrzejczyk ', N'DF', CAST(N'1987-11-04' AS Date), 28, N'Legia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160283, 2, N'Michal Pazdan ', N'DF', CAST(N'1987-09-21' AS Date), 28, N'Legia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160284, 20, N'Lukasz Piszczek ', N'DF', CAST(N'1985-06-03' AS Date), 31, N'Dortmund')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160285, 18, N'Bartosz Salamon ', N'DF', CAST(N'1991-05-01' AS Date), 25, N'Cagliari')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160286, 14, N'Jakub Wawrzyniak ', N'DF', CAST(N'1983-07-07' AS Date), 32, N'Lechia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160287, 16, N'Jakub Blaszczykowski ', N'MF', CAST(N'1985-12-14' AS Date), 30, N'Fiorentina')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160288, 11, N'Kamil Grosicki ', N'MF', CAST(N'1988-06-08' AS Date), 28, N'Rennes')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160289, 6, N'Tomasz Jodlowiec ', N'MF', CAST(N'1985-09-08' AS Date), 30, N'Legia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160290, 21, N'Bartosz Kapustka ', N'MF', CAST(N'1996-12-23' AS Date), 19, NULL)
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160291, 10, N'Grzegorz Krychowiak ', N'MF', CAST(N'1990-01-29' AS Date), 26, N'Sevilla')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160292, 8, N'Karol Linetty ', N'MF', CAST(N'1995-02-02' AS Date), 21, N'Lech')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160293, 5, N'Krzysztof Maczynski ', N'MF', CAST(N'1987-05-23' AS Date), 29, N'Wisla')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160294, 17, N'Slawomir Peszko ', N'MF', CAST(N'1985-02-19' AS Date), 31, N'Lechia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160295, 23, N'Filip Starzynski ', N'MF', CAST(N'1991-05-27' AS Date), 25, N'Zaglebie')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160296, 19, N'Piotr Zielinski ', N'MF', CAST(N'1994-05-20' AS Date), 22, N'Empoli')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160297, 9, N'Robert Lewandowski ', N'FD', CAST(N'1988-08-21' AS Date), 27, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160298, 7, N'Arkadiusz Milik ', N'FD', CAST(N'1994-02-28' AS Date), 22, N'Ajax')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1213, 160299, 13, N'Mariusz Stepinski ', N'FD', CAST(N'1995-05-12' AS Date), 21, N'Ruch')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160300, 22, N'Eduardo ', N'GK', CAST(N'1982-09-19' AS Date), 33, N'Dinamo Zagreb')
GO
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160301, 12, N'Anthony Lopes ', N'GK', CAST(N'1990-10-01' AS Date), 25, N'Lyon')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160302, 1, N'Rui Patricio ', N'GK', CAST(N'1988-02-15' AS Date), 28, N'Sporting CP')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160303, 2, N'Bruno Alves ', N'DF', CAST(N'1981-11-27' AS Date), 34, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160304, 21, N'Cedric ', N'DF', CAST(N'1991-08-31' AS Date), 24, N'Southampton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160305, 19, N'Eliseu ', N'DF', CAST(N'1983-10-01' AS Date), 32, N'Benfica')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160306, 4, N'Jose Fonte ', N'DF', CAST(N'1983-12-22' AS Date), 32, N'Southampton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160307, 3, N'Pepe ', N'DF', CAST(N'1983-02-26' AS Date), 33, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160308, 5, N'Raphael Guerreiro ', N'DF', CAST(N'1993-12-22' AS Date), 22, N'Lorient')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160309, 6, N'Ricardo Carvalho ', N'DF', CAST(N'1978-05-18' AS Date), 38, N'Monaco')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160310, 23, N'Adrien Silva ', N'MF', CAST(N'1989-03-15' AS Date), 27, N'Sporting CP')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160311, 15, N'Andre Gomes ', N'MF', CAST(N'1993-07-30' AS Date), 22, N'Valencia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160312, 13, N'Danilo ', N'MF', CAST(N'1991-09-09' AS Date), 24, N'Porto')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160313, 10, N'Joao Mario ', N'MF', CAST(N'1993-01-19' AS Date), 23, N'Sporting CP')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160314, 8, N'Joao Moutinho ', N'MF', CAST(N'1986-09-08' AS Date), 29, N'Monaco')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160315, 18, N'Rafa Silva ', N'MF', CAST(N'1993-05-17' AS Date), 23, N'Braga')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160316, 16, N'Renato Sanches ', N'MF', CAST(N'1997-08-18' AS Date), 18, N'Benfica')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160317, 11, N'Vieirinha ', N'MF', CAST(N'1986-01-24' AS Date), 30, N'Wolfsburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160318, 14, N'William Carvalho ', N'MF', CAST(N'1992-04-07' AS Date), 24, N'Sporting CP')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160319, 9, N'Eder ', N'FD', CAST(N'1987-12-22' AS Date), 28, N'LOSC')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160320, 17, N'Nani ', N'FD', CAST(N'1986-11-17' AS Date), 29, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160321, 20, N'Ricardo Quaresma ', N'FD', CAST(N'1983-09-26' AS Date), 32, N'Besiktas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1214, 160322, 7, N'Cristiano Ronaldo ', N'FD', CAST(N'1985-02-05' AS Date), 31, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160323, 16, N'Shay Given ', N'GK', CAST(N'1976-04-20' AS Date), 40, N'Stoke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160324, 23, N'Darren Randolph ', N'GK', CAST(N'1987-05-12' AS Date), 29, N'West Ham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160325, 1, N'Keiren Westwood ', N'GK', CAST(N'1984-10-23' AS Date), 31, N'Sheff. Wednesday')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160326, 15, N'Cyrus Christie ', N'DF', CAST(N'1992-09-30' AS Date), 23, N'Derby')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160327, 3, N'Ciaran Clark ', N'DF', CAST(N'1989-09-26' AS Date), 26, N'Aston Villa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160328, 2, N'Seamus Coleman ', N'DF', CAST(N'1988-10-11' AS Date), 27, N'Everton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160329, 12, N'Shane Duffy ', N'DF', CAST(N'1992-01-01' AS Date), 24, N'Blackburn')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160330, 5, N'Richard Keogh ', N'DF', CAST(N'1986-08-11' AS Date), 29, N'Derby')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160331, 4, N'John OShea ', N'DF', CAST(N'1981-04-30' AS Date), 35, N'Sunderland')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160332, 17, N'Stephen Ward ', N'DF', CAST(N'1985-08-20' AS Date), 30, N'Burnley')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160333, 19, N'Robbie Brady ', N'MF', CAST(N'1992-01-14' AS Date), 24, N'Norwich')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160334, 13, N'Jeff Hendrick ', N'MF', CAST(N'1992-01-31' AS Date), 24, N'Derby')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160335, 20, N'Wes Hoolahan ', N'MF', CAST(N'1982-05-20' AS Date), 34, N'Norwich')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160336, 8, N'James McCarthy ', N'MF', CAST(N'1990-11-12' AS Date), 25, N'Everton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160337, 11, N'James McClean ', N'MF', CAST(N'1989-04-22' AS Date), 27, N'West Brom')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160338, 7, N'Aiden McGeady ', N'MF', CAST(N'1986-04-04' AS Date), 30, N'Sheff. Wednesday')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160339, 18, N'David Meyler ', N'MF', CAST(N'1989-05-29' AS Date), 27, N'Hull')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160340, 22, N'Stephen Quinn ', N'MF', CAST(N'1986-04-01' AS Date), 30, N'Reading')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160341, 6, N'Glenn Whelan ', N'MF', CAST(N'1984-01-13' AS Date), 32, N'Stoke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160342, 10, N'Robbie Keane ', N'FD', CAST(N'1980-07-08' AS Date), 35, N'LA Galaxy')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160343, 9, N'Shane Long ', N'FD', CAST(N'1987-01-22' AS Date), 29, N'Southampton')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160344, 21, N'Daryl Murphy ', N'FD', CAST(N'1983-03-15' AS Date), 33, N'Ipswich')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1215, 160345, 14, N'Jon Walters ', N'FD', CAST(N'1983-09-20' AS Date), 32, N'Stoke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160346, 23, N'Silviu Lung ', N'GK', CAST(N'1989-06-04' AS Date), 27, N'Astra')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160347, 1, N'Costel Pantilimon ', N'GK', CAST(N'1987-02-01' AS Date), 29, N'Watford')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160348, 12, N'Ciprian Tatarusanu ', N'GK', CAST(N'1986-02-09' AS Date), 30, N'Fiorentina')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160349, 6, N'Vlad Chiriches ', N'DF', CAST(N'1989-11-14' AS Date), 26, N'Napoli')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160350, 16, N'Steliano Filip ', N'DF', CAST(N'1994-05-15' AS Date), 22, N'Dinamo Bucuresti')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160351, 15, N'Valerica Gaman ', N'DF', CAST(N'1989-02-25' AS Date), 27, N'Astra')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160352, 21, N'Dragos Grigore ', N'DF', CAST(N'1986-09-07' AS Date), 29, N'Al-Sailiya')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160353, 2, N'Alexandru Matel ', N'DF', CAST(N'1989-10-17' AS Date), 26, N'Dinamo Zagreb')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160354, 4, N'Cosmin Moti ', N'DF', CAST(N'1984-12-03' AS Date), 31, N'Ludogorets')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160355, 3, N'Razvan Rat ', N'DF', CAST(N'1981-05-26' AS Date), 35, N'Rayo Vallecano')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160356, 22, N'Cristian Sapunaru ', N'DF', CAST(N'1984-04-05' AS Date), 32, N'Pandurii')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160357, 7, N'Alexandru Chipciu ', N'MF', CAST(N'1989-05-18' AS Date), 27, N'Steaua')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160358, 5, N'Ovidiu Hoban ', N'MF', CAST(N'1982-12-27' AS Date), 33, N'H. Beer-Sheva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160359, 8, N'Mihai Pintilii ', N'MF', CAST(N'1984-11-09' AS Date), 31, N'Steaua')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160360, 20, N'Adrian Popa ', N'MF', CAST(N'1988-07-24' AS Date), 27, N'Steaua')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160361, 18, N'Andrei Prepelita ', N'MF', CAST(N'1985-12-08' AS Date), 30, N'Ludogorets')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160362, 17, N'Lucian Sanmartean ', N'MF', CAST(N'1980-03-13' AS Date), 36, N'Al-Ittihad')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160363, 10, N'Nicolae Stanciu ', N'MF', CAST(N'1993-05-07' AS Date), 23, N'Steaua')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160364, 11, N'Gabriel Torje ', N'MF', CAST(N'1989-11-22' AS Date), 26, N'Osmanlispor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160365, 9, N'Denis Alibec ', N'FD', CAST(N'1991-01-05' AS Date), 25, N'Astra')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160366, 14, N'Florin Andone ', N'FD', CAST(N'1993-04-11' AS Date), 23, N'Cordoba')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160367, 13, N'Claudiu Keeru ', N'FD', CAST(N'1986-12-02' AS Date), 29, N'Ludogorets')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1216, 160368, 19, N'Bogdan Stancu ', N'FD', CAST(N'1987-06-28' AS Date), 28, N'Genclerbirligi')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160369, 1, N'Igor Akinfeev ', N'GK', CAST(N'1986-04-08' AS Date), 30, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160370, 16, N'Guilherme ', N'GK', CAST(N'1985-12-12' AS Date), 30, N'Lokomotiv Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160371, 12, N'Yuri Lodygin ', N'GK', CAST(N'1990-05-26' AS Date), 26, N'Zenit')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160372, 6, N'Aleksei Berezutski ', N'DF', CAST(N'1982-06-20' AS Date), 33, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160373, 14, N'Vasili Berezutski ', N'DF', CAST(N'1982-06-20' AS Date), 33, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160374, 4, N'Sergei Ignashevich ', N'DF', CAST(N'1979-07-14' AS Date), 36, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160375, 23, N'Dmitri Kombarov ', N'DF', CAST(N'1987-01-22' AS Date), 29, N'Spartak Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160376, 5, N'Roman Neustadter ', N'DF', CAST(N'1988-02-18' AS Date), 28, N'Schalke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160377, 21, N'Georgi Schennikov ', N'DF', CAST(N'1991-04-27' AS Date), 25, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160378, 2, N'Roman Shishkin ', N'DF', CAST(N'1987-01-27' AS Date), 29, N'Lokomotiv Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160379, 3, N'Igor Smolnikov ', N'DF', CAST(N'1988-08-08' AS Date), 27, N'Zenit')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160380, 8, N'Denis Glushakov ', N'MF', CAST(N'1987-01-27' AS Date), 29, N'Spartak Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160381, 13, N'Aleksandr Golovin ', N'MF', CAST(N'1996-05-30' AS Date), 20, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160382, 18, N'Oleg Ivanov ', N'MF', CAST(N'1986-08-04' AS Date), 29, N'Terek')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160383, 11, N'Pavel Mamaev ', N'MF', CAST(N'1988-09-17' AS Date), 27, N'Krasnodar')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160384, 19, N'Aleksandr Samedov ', N'MF', CAST(N'1984-07-19' AS Date), 31, N'Lokomotiv Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160385, 17, N'Oleg Shatov ', N'MF', CAST(N'1990-07-29' AS Date), 25, N'Zenit')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160386, 15, N'Roman Shirokov ', N'MF', CAST(N'1981-07-06' AS Date), 34, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160387, 20, N'Dmitri Torbinski ', N'MF', CAST(N'1984-04-28' AS Date), 32, N'Krasnodar')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160388, 7, N'Artur Yusupov ', N'MF', CAST(N'1989-09-01' AS Date), 26, N'Zenit')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160389, 22, N'Artem Dzyuba ', N'FD', CAST(N'1988-08-22' AS Date), 27, N'Zenit')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160390, 9, N'Aleksandr Kokorin ', N'FD', CAST(N'1991-03-19' AS Date), 25, N'Zenit')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1217, 160391, 10, N'Fedor Smolov ', N'FD', CAST(N'1990-02-09' AS Date), 26, N'Krasnodar')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160392, 23, N'MatusKozacik ', N'GK', CAST(N'1983-12-27' AS Date), 32, N'Plzen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160393, 1, N'Jan Mucha ', N'GK', CAST(N'1982-12-05' AS Date), 33, N'Slovan Bratislava')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160394, 12, N'Jan Novota ', N'GK', CAST(N'1983-11-29' AS Date), 32, N'Rapid Wien')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160395, 4, N'Jan Durica ', N'DF', CAST(N'1981-12-10' AS Date), 34, N'Lokomotiv Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160396, 5, N'Norbert Gyomber ', N'DF', CAST(N'1992-07-03' AS Date), 23, N'Roma')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160397, 15, N'TomasHubocan ', N'DF', CAST(N'1985-09-17' AS Date), 30, N'Dinamo Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160398, 2, N'Peter Pekarik ', N'DF', CAST(N'1986-10-30' AS Date), 29, N'Hertha')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160399, 16, N'Kornel Salata ', N'DF', CAST(N'1985-01-24' AS Date), 31, N'Slovan Bratislava')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160400, 14, N'Milan Skriniar ', N'DF', CAST(N'1995-02-11' AS Date), 21, N'Sampdoria')
GO
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160401, 3, N'Martin Skrtel ', N'DF', CAST(N'1984-12-15' AS Date), 31, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160402, 18, N'Dusan Svento ', N'DF', CAST(N'1985-08-01' AS Date), 30, N'Koln')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160403, 8, N'Ondrej Duda ', N'MF', CAST(N'1994-12-05' AS Date), 21, N'Legia')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160404, 6, N'Jan Gregus', N'MF', CAST(N'1991-01-29' AS Date), 25, N'Jablonec')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160405, 17, N'Marek Hamsik ', N'MF', CAST(N'1987-07-27' AS Date), 28, N'Napoli')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160406, 13, N'Patrik HroSovsky ', N'MF', CAST(N'1992-04-22' AS Date), 24, N'Plzen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160407, 19, N'Juraj Kucka ', N'MF', CAST(N'1987-02-26' AS Date), 29, N'Milan')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160408, 20, N'Robert Mak ', N'MF', CAST(N'1991-03-08' AS Date), 25, N'PAOK')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160409, 22, N'Viktor Pecovsky ', N'MF', CAST(N'1983-05-24' AS Date), 33, N'zilina')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160410, 10, N'Miroslav Stoch ', N'MF', CAST(N'1989-10-19' AS Date), 26, N'Bursaspor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160411, 7, N'Vladimir Weiss ', N'MF', CAST(N'1989-11-30' AS Date), 26, N'Al-Gharafa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160412, 21, N'Michal Duris', N'FD', CAST(N'1988-06-01' AS Date), 28, N'Plzen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160413, 11, N'Adam Nemec ', N'FD', CAST(N'1985-09-02' AS Date), 30, N'Willem II')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1218, 160414, 9, N'Stanislav Sestak ', N'FD', CAST(N'1982-12-16' AS Date), 33, N'Ferencvaros')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160415, 1, N'Lker Casillas ', N'GK', CAST(N'1981-05-20' AS Date), 35, N'Porto')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160416, 13, N'David de Gea ', N'GK', CAST(N'1990-11-07' AS Date), 25, N'Man. United')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160417, 23, N'Sergio Rico ', N'GK', CAST(N'1993-09-01' AS Date), 22, N'Sevilla')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160418, 2, N'Cesar Azpilicueta ', N'DF', CAST(N'1989-08-28' AS Date), 26, N'Chelsea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160419, 4, N'Marc Bartra ', N'DF', CAST(N'1991-01-15' AS Date), 25, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160420, 12, N'Hector Bellerin ', N'DF', CAST(N'1995-03-19' AS Date), 21, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160421, 18, N'Jordi Alba ', N'DF', CAST(N'1989-03-21' AS Date), 27, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160422, 16, N'Juanfran ', N'DF', CAST(N'1985-01-09' AS Date), 31, N'Atletico')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160423, 3, N'Gerard Pique ', N'DF', CAST(N'1987-02-02' AS Date), 29, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160424, 15, N'Sergio Ramos ', N'DF', CAST(N'1986-03-30' AS Date), 30, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160425, 17, N'Mikel San Jose ', N'DF', CAST(N'1989-05-30' AS Date), 27, N'Athletic')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160426, 19, N'Bruno Soriano ', N'MF', CAST(N'1984-06-12' AS Date), 32, N'Villarreal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160427, 5, N'Sergio Busquets ', N'MF', CAST(N'1988-07-16' AS Date), 27, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160428, 10, N'Cesc Fabregas ', N'MF', CAST(N'1987-05-04' AS Date), 29, N'Chelsea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160429, 6, N'Andres Iniesta ', N'MF', CAST(N'1984-05-11' AS Date), 32, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160430, 8, N'Koke ', N'MF', CAST(N'1992-01-08' AS Date), 24, N'Atletico')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160431, 21, N'David Silva ', N'MF', CAST(N'1986-01-08' AS Date), 30, N'Man. City')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160432, 14, N'Thiago Alcantara ', N'MF', CAST(N'1991-04-11' AS Date), 25, N'Bayern')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160433, 20, N'Aritz Aduriz ', N'FD', CAST(N'1981-02-11' AS Date), 35, N'Athletic')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160434, 9, N'Lucas Vazquez ', N'FD', CAST(N'1991-07-01' AS Date), 24, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160435, 7, N'Alvaro Morata ', N'FD', CAST(N'1992-10-23' AS Date), 23, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160436, 22, N'Nolito ', N'FD', CAST(N'1986-10-15' AS Date), 29, N'Celta')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1219, 160437, 11, N'Pedro Rodriguez ', N'FD', CAST(N'1987-07-28' AS Date), 28, N'Chelsea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160438, 23, N'Patrik Carlgren ', N'GK', CAST(N'1992-01-08' AS Date), 24, N'AIK')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160439, 1, N'Andreas Isaksson ', N'GK', CAST(N'1981-10-03' AS Date), 34, N'Kasimpasa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160440, 12, N'Robin Olsen ', N'GK', CAST(N'1990-01-08' AS Date), 26, N'Kobenhavn')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160441, 17, N'Ludwig Augustinsson ', N'DF', CAST(N'1994-04-21' AS Date), 22, N'Kobenhavn')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160442, 4, N'Andreas Granqvist ', N'DF', CAST(N'1985-04-16' AS Date), 31, N'Krasnodar')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160443, 13, N'Pontus Jansson ', N'DF', CAST(N'1991-02-13' AS Date), 25, N'Torino')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160444, 3, N'Erik Johansson ', N'DF', CAST(N'1988-12-30' AS Date), 27, N'Kobenhavn')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160445, 14, N'Victor Lindelof ', N'DF', CAST(N'1994-07-17' AS Date), 21, N'Benfica')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160446, 2, N'Mikael Lustig ', N'DF', CAST(N'1986-12-13' AS Date), 29, N'Celtic')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160447, 5, N'Martin Olsson ', N'DF', CAST(N'1988-05-17' AS Date), 28, N'Norwich')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160448, 21, N'Jimmy Durmaz ', N'MF', CAST(N'1989-03-22' AS Date), 27, N'Olympiacos')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160449, 8, N'Albin Ekdal ', N'MF', CAST(N'1989-07-28' AS Date), 26, N'Hamburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160450, 22, N'Erkan Zengin ', N'MF', CAST(N'1985-08-05' AS Date), 30, N'Trabzonspor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160451, 6, N'Emil Forsberg ', N'MF', CAST(N'1991-10-23' AS Date), 24, N'Leipzig')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160452, 15, N'Oscar Hiljemark ', N'MF', CAST(N'1992-06-28' AS Date), 23, N'Palermo')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160453, 9, N'Kim Kallstrom ', N'MF', CAST(N'1982-08-24' AS Date), 33, N'Grasshoppers')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160454, 7, N'Sebastian Larsson ', N'MF', CAST(N'1985-06-06' AS Date), 31, N'Sunderland')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160455, 18, N'Oscar Lewicki ', N'MF', CAST(N'1992-07-14' AS Date), 23, N'Malmo')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160456, 16, N'Pontus Wernbloom ', N'MF', CAST(N'1986-06-25' AS Date), 29, N'CSKA Moskva')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160457, 11, N'Marcus Berg ', N'FD', CAST(N'1986-08-17' AS Date), 29, N'Panathinaikos')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160458, 20, N'John Guidetti ', N'FD', CAST(N'1992-04-15' AS Date), 24, N'Celta')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160459, 10, N'Zlatan Ibrahimovic ', N'FD', CAST(N'1981-10-03' AS Date), 34, N'Paris')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1220, 160460, 19, N'Emir Kujovic ', N'FD', CAST(N'1988-06-22' AS Date), 27, N'Norrkoping')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160461, 21, N'Roman Burki ', N'GK', CAST(N'1990-11-14' AS Date), 25, N'Dortmund')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160462, 12, N'Marwin Hitz ', N'GK', CAST(N'1987-09-18' AS Date), 28, N'Augsburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160463, 1, N'Yann Sommer ', N'GK', CAST(N'1988-12-17' AS Date), 27, N'Monchengladbach')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160464, 20, N'Johan Djourou ', N'DF', CAST(N'1987-01-18' AS Date), 29, N'Hamburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160465, 4, N'Nico Elvedi ', N'DF', CAST(N'1996-09-30' AS Date), 19, N'Monchengladbach')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160466, 6, N'Michael Lang ', N'DF', CAST(N'1991-02-08' AS Date), 25, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160467, 2, N'Stephan Lichtsteiner ', N'DF', CAST(N'1984-01-16' AS Date), 32, N'Juventus')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160468, 3, N'Francois Moubandje ', N'DF', CAST(N'1990-06-21' AS Date), 25, N'Toulouse')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160469, 13, N'Ricardo Rodriguez ', N'DF', CAST(N'1992-08-25' AS Date), 23, N'Wolfsburg')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160470, 22, N'Fabian Schar ', N'DF', CAST(N'1991-12-20' AS Date), 24, N'Hoffenheim')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160471, 5, N'Steve von Bergen ', N'DF', CAST(N'1983-06-10' AS Date), 33, N'Young Boys')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160472, 11, N'Valon Behrami ', N'MF', CAST(N'1985-04-19' AS Date), 31, N'Watford')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160473, 15, N'Blerim Dzemaili ', N'MF', CAST(N'1986-04-12' AS Date), 30, N'Genoa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160474, 16, N'Gelson Fernandes ', N'MF', CAST(N'1986-09-02' AS Date), 29, N'Rennes')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160475, 8, N'Fabian Frei ', N'MF', CAST(N'1989-01-08' AS Date), 27, N'Mainz')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160476, 23, N'Xherdan Shaqiri ', N'MF', CAST(N'1991-10-10' AS Date), 24, N'Stoke')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160477, 10, N'Granit Xhaka ', N'MF', CAST(N'1992-09-27' AS Date), 23, N'Monchengladbach')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160478, 14, N'Denis Zakaria ', N'MF', CAST(N'1996-11-20' AS Date), 19, N'Young Boys')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160479, 19, N'Eren Derdiyok ', N'FD', CAST(N'1988-06-12' AS Date), 28, N'Kasimpasa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160480, 7, N'Breel Embolo ', N'FD', CAST(N'1997-02-14' AS Date), 19, N'Basel')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160481, 18, N'Admir Mehmedi ', N'FD', CAST(N'1991-03-16' AS Date), 25, N'Leverkusen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160482, 9, N'Haris Seferovic ', N'FD', CAST(N'1992-02-22' AS Date), 24, N'Frankfurt')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1221, 160483, 17, N'Shani Tarashaj ', N'FD', CAST(N'1995-02-07' AS Date), 21, N'Grasshoppers')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160484, 23, N'Harun Tekin ', N'GK', CAST(N'1989-06-17' AS Date), 27, N'Bursaspor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160485, 12, N'Onur Kivrak ', N'GK', CAST(N'1988-01-01' AS Date), 28, N'Trabzonspor')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160486, 1, N'Volkan Babacan ', N'GK', CAST(N'1988-08-11' AS Date), 27, N'Istanbul Basaksehir')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160487, 4, N'Ahmet Calik ', N'DF', CAST(N'1994-02-26' AS Date), 22, N'Genclerbirligi')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160488, 18, N'Caner Erkin ', N'DF', CAST(N'1988-10-04' AS Date), 27, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160489, 7, N'Gokhan Gonul ', N'DF', CAST(N'1985-01-04' AS Date), 31, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160490, 3, N'Hakan Balta ', N'DF', CAST(N'1983-03-23' AS Date), 33, N'Galatasaray')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160491, 13, N'Ismail Koybasi ', N'DF', CAST(N'1989-07-10' AS Date), 26, N'Besiktas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160492, 2, N'Semih Kaya ', N'DF', CAST(N'1991-02-24' AS Date), 25, N'Galatasaray')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160493, 22, N'Sener Ozbayrakli ', N'DF', CAST(N'1990-01-23' AS Date), 26, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160494, 10, N'Arda Turan ', N'MF', CAST(N'1987-01-30' AS Date), 29, N'Barcelona')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160495, 6, N'Hakan Calhanoglu ', N'MF', CAST(N'1994-02-08' AS Date), 22, N'Leverkusen')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160496, 15, N'Mehmet Topal ', N'MF', CAST(N'1986-03-03' AS Date), 30, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160497, 5, N'Nuri Sahin ', N'MF', CAST(N'1988-09-05' AS Date), 27, N'Dortmund')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160498, 14, N'Oguzhan Ozyakup ', N'MF', CAST(N'1992-09-23' AS Date), 23, N'Besiktas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160499, 11, N'Olcay Sahan ', N'MF', CAST(N'1987-05-26' AS Date), 29, N'Besiktas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160500, 16, N'Ozan Tufan ', N'MF', CAST(N'1995-03-23' AS Date), 21, N'Fenerbahce')
GO
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160501, 8, N'Selcuk Inan ', N'MF', CAST(N'1985-02-10' AS Date), 31, N'Galatasaray')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160502, 20, N'Volkan Sen ', N'MF', CAST(N'1987-07-07' AS Date), 28, N'Fenerbahce')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160503, 19, N'Yunus Malli ', N'MF', CAST(N'1992-02-24' AS Date), 24, N'Mainz')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160504, 17, N'Burak Yilmaz ', N'FD', CAST(N'1985-07-15' AS Date), 30, N'Beijing Guoan')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160505, 9, N'Cenk Tosun ', N'FD', CAST(N'1991-06-07' AS Date), 25, N'Besiktas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1222, 160506, 21, N'Emre Mor ', N'FD', CAST(N'1997-07-24' AS Date), 18, N'Nordsjælland')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160507, 1, N'Denys Boyko ', N'GK', CAST(N'1988-01-29' AS Date), 28, N'Besiktas')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160508, 12, N'Andriy Pyatov ', N'GK', CAST(N'1984-06-28' AS Date), 31, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160509, 23, N'Mykyta Shevchenko ', N'GK', CAST(N'1993-01-26' AS Date), 23, N'Zorya')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160510, 2, N'Bohdan Butko ', N'DF', CAST(N'1991-01-13' AS Date), 25, N'Amkar')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160511, 17, N'Artem Fedetskiy ', N'DF', CAST(N'1985-04-26' AS Date), 31, N'Dnipro')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160512, 3, N'Yevhen Khacheridi ', N'DF', CAST(N'1987-07-28' AS Date), 28, N'Dynamo Kyiv')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160513, 5, N'Olexandr Kucher ', N'DF', CAST(N'1982-10-22' AS Date), 33, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160514, 20, N'Yaroslav Rakitskiy ', N'DF', CAST(N'1989-08-03' AS Date), 26, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160515, 13, N'Vyacheslav Shevchuk ', N'DF', CAST(N'1979-05-13' AS Date), 37, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160516, 19, N'Denys Garmash ', N'MF', CAST(N'1990-04-19' AS Date), 26, N'Dynamo Kyiv')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160517, 22, N'Olexandr Karavaev ', N'MF', CAST(N'1992-06-02' AS Date), 24, N'Zorya')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160518, 10, N'Yevhen Konoplyanka ', N'MF', CAST(N'1989-09-29' AS Date), 26, N'Sevilla')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160519, 9, N'Viktor Kovalenko ', N'MF', CAST(N'1996-02-14' AS Date), 20, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160520, 14, N'Ruslan Rotan ', N'MF', CAST(N'1981-10-29' AS Date), 34, N'Dnipro')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160521, 18, N'Serhiy Rybalka ', N'MF', CAST(N'1990-04-01' AS Date), 26, N'Dynamo Kyiv')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160522, 6, N'Taras Stepanenko ', N'MF', CAST(N'1989-08-08' AS Date), 26, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160523, 16, N'Serhiy Sydorchuk ', N'MF', CAST(N'1991-05-02' AS Date), 25, N'Dynamo Kyiv')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160524, 4, N'Anatoliy Tymoshchuk ', N'MF', CAST(N'1979-03-30' AS Date), 37, N'Kairat')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160525, 7, N'Andriy Yarmolenko ', N'MF', CAST(N'1989-10-23' AS Date), 26, N'Dynamo Kyiv')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160526, 21, N'Olexandr Zinchenko ', N'MF', CAST(N'1996-12-15' AS Date), 19, N'Ufa')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160527, 15, N'Pylyp Budkivskiy ', N'FD', CAST(N'1992-03-10' AS Date), 24, N'Zorya')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160528, 11, N'Yevhen Seleznyov ', N'FD', CAST(N'1985-07-20' AS Date), 30, N'Shakhtar Donetsk')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1223, 160529, 8, N'Roman Zozulya ', N'FD', CAST(N'1989-11-17' AS Date), 26, N'Dnipro')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160530, 12, N'Owain Fon Williams ', N'GK', CAST(N'1987-03-17' AS Date), 29, N'Inverness')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160531, 1, N'Wayne Hennessey ', N'GK', CAST(N'1987-01-24' AS Date), 29, N'Crystal Palace')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160532, 21, N'Danny Ward ', N'GK', CAST(N'1993-06-22' AS Date), 22, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160533, 5, N'James Chester ', N'DF', CAST(N'1989-01-23' AS Date), 27, N'West Brom')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160534, 19, N'James Collins ', N'DF', CAST(N'1983-08-23' AS Date), 32, N'West Ham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160535, 4, N'Ben Davies ', N'DF', CAST(N'1993-04-24' AS Date), 23, N'Tottenham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160536, 2, N'Chris Gunter ', N'DF', CAST(N'1989-07-21' AS Date), 26, N'Reading')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160537, 15, N'Jazz Richards ', N'DF', CAST(N'1991-04-12' AS Date), 25, N'Fulham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160538, 3, N'Neil Taylor ', N'DF', CAST(N'1989-02-07' AS Date), 27, N'Swansea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160539, 6, N'Ashley Williams ', N'DF', CAST(N'1984-08-23' AS Date), 31, N'Swansea')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160540, 7, N'Joe Allen ', N'MF', CAST(N'1990-03-14' AS Date), 26, N'Liverpool')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160541, 14, N'David Edwards ', N'MF', CAST(N'1986-02-03' AS Date), 30, N'Wolves')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160542, 8, N'Andy King ', N'MF', CAST(N'1988-10-29' AS Date), 27, N'Leicester')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160543, 16, N'Joe Ledley ', N'MF', CAST(N'1987-01-23' AS Date), 29, N'Crystal Palace')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160544, 10, N'Aaron Ramsey ', N'MF', CAST(N'1990-12-26' AS Date), 25, N'Arsenal')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160545, 22, N'David Vaughan ', N'MF', CAST(N'1983-02-18' AS Date), 33, N'Nottm Forest')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160546, 20, N'Jonathan Williams ', N'MF', CAST(N'1993-10-09' AS Date), 22, N'Crystal Palace')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160547, 11, N'Gareth Bale ', N'FD', CAST(N'1989-07-16' AS Date), 26, N'Real Madrid')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160548, 23, N'Simon Church ', N'FD', CAST(N'1988-12-10' AS Date), 27, N'MK Dons')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160549, 17, N'David Cotterill ', N'FD', CAST(N'1987-12-04' AS Date), 28, N'Birmingham')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160550, 9, N'Hal Robson-Kanu ', N'FD', CAST(N'1989-05-21' AS Date), 27, N'Reading')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160551, 18, N'Sam Vokes ', N'FD', CAST(N'1989-10-21' AS Date), 26, N'Burnley')
INSERT [SOCCER].[player_mast] ([team_id], [player_id], [jersey_no], [player_name], [posi_to_play], [dt_of_bir], [age], [playing_club]) VALUES (1224, 160552, 13, N'George Williams ', N'FD', CAST(N'1995-09-07' AS Date), 20, N'Fulham')
INSERT [SOCCER].[playing_position] ([position_id], [position_desc]) VALUES (N'DF', N'Defenders')
INSERT [SOCCER].[playing_position] ([position_id], [position_desc]) VALUES (N'FD', N'Defenders')
INSERT [SOCCER].[playing_position] ([position_id], [position_desc]) VALUES (N'GK', N'Goalkeepers')
INSERT [SOCCER].[playing_position] ([position_id], [position_desc]) VALUES (N'MF', N'Midfielders')
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70001, N'Damir Skomina', 1225)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70002, N'Martin Atkinson', 1206)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70003, N'Felix Brych', 1208)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70004, N'Cuneyt Cakir', 1222)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70005, N'Mark Clattenburg', 1206)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70006, N'Jonas Eriksson', 1220)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70007, N'Viktor Kassai', 1209)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70008, N'Bjorn Kuipers', 1226)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70009, N'Szymon Marciniak', 1213)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70010, N'Milorad Mazic', 1227)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70011, N'Nicola Rizzoli', 1211)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70012, N'Carlos Velasco Carballo', 1219)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70013, N'William Collum', 1228)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70014, N'Ovidiu Hategan', 1216)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70015, N'Sergei Karasev', 1217)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70016, N'Pavel Kralovec', 1205)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70017, N'Svein Oddvar Moen', 1229)
INSERT [SOCCER].[referee_mast] ([referee_id], [referee_name], [country_id]) VALUES (70018, N'Clement Turpin', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10001, N'Paris', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10002, N'Saint-Denis', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10003, N'Bordeaux', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10004, N'Lens', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10005, N'Lille', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10006, N'Lyon', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10007, N'Marseille', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10008, N'Nice', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10009, N'Saint-Etienne', 1207)
INSERT [SOCCER].[soccer_city] ([city_id], [city], [country_id]) VALUES (10010, N'Toulouse', 1207)
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1201, N'ALB', N'Albania')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1202, N'AUT', N'Austria')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1203, N'BEL', N'Belgium')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1204, N'CRO', N'Croatia')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1205, N'CZE', N'Czech Republic')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1206, N'ENG', N'England')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1207, N'FRA', N'France')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1208, N'GER', N'Germany')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1209, N'HUN', N'Hungary')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1210, N'ISL', N'Iceland')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1211, N'ITA', N'Italy')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1212, N'NIR', N'Northern Ireland')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1213, N'POL', N'Poland')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1214, N'POR', N'Portugal')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1215, N'IRL', N'Republic of Ireland')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1216, N'ROU', N'Romania')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1217, N'RUS', N'Russia')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1218, N'SVK', N'Slovakia')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1219, N'ESP', N'Spain')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1220, N'SWE', N'Sweden')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1221, N'SUI', N'Switzerland')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1222, N'TUR', N'Turkey')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1223, N'UKR', N'Ukraine')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1224, N'WAL', N'Wales')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1225, N'SLO', N'Slovenia')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1226, N'NED', N'Netherlands')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1227, N'SRB', N'Serbia')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1228, N'SCO', N'Scotland')
INSERT [SOCCER].[soccer_country] ([country_id], [country_abbr], [country_name]) VALUES (1229, N'NOR', N'Norway')
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1201, N'A', 3, 1, 0, 2, 1, 3, -2, 3, 3)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1202, N'F', 3, 0, 1, 2, 1, 4, -3, 1, 4)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1203, N'E', 3, 2, 0, 1, 4, 2, 2, 6, 2)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1204, N'D', 3, 2, 1, 0, 5, 3, 2, 7, 1)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1205, N'D', 3, 0, 1, 2, 2, 5, -3, 1, 4)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1206, N'B', 3, 1, 2, 0, 3, 2, 1, 5, 2)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1207, N'A', 3, 2, 1, 0, 4, 1, 3, 7, 1)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1208, N'C', 3, 2, 1, 0, 3, 0, 3, 7, 1)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1209, N'F', 3, 1, 2, 0, 6, 4, 2, 5, 1)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1210, N'F', 3, 1, 2, 0, 4, 3, 1, 5, 2)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1211, N'E', 3, 2, 0, 1, 3, 1, 2, 6, 1)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1212, N'C', 3, 1, 0, 2, 2, 2, 0, 3, 3)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1213, N'C', 3, 2, 1, 0, 2, 0, 2, 7, 2)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1214, N'F', 3, 0, 3, 0, 4, 4, 0, 3, 3)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1215, N'E', 3, 1, 1, 1, 2, 4, -2, 4, 3)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1216, N'A', 3, 0, 1, 2, 2, 4, -2, 1, 4)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1217, N'B', 3, 0, 1, 2, 2, 6, -4, 1, 4)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1218, N'B', 3, 1, 1, 1, 3, 3, 0, 4, 3)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1219, N'D', 3, 2, 0, 1, 5, 2, 3, 6, 2)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1220, N'E', 3, 0, 1, 2, 1, 3, -2, 1, 4)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1221, N'A', 3, 1, 2, 0, 2, 1, 1, 5, 2)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1222, N'D', 3, 1, 0, 2, 2, 4, -2, 3, 3)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1223, N'C', 3, 0, 0, 3, 0, 5, -5, 0, 4)
INSERT [SOCCER].[soccer_team] ([team_id], [team_group], [match_played], [won], [draw], [lost], [goal_for], [goal_agnst], [goal_diff], [points], [group_position]) VALUES (1224, N'B', 3, 2, 0, 1, 6, 3, 3, 6, 1)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20001, N'Stade de Bordeaux', 10003, 42115)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20002, N'Stade Bollaert-Delelis', 10004, 38223)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20003, N'Stade Pierre Mauroy', 10005, 49822)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20004, N'Stade de Lyon', 10006, 58585)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20005, N'Stade VElodrome', 10007, 64354)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20006, N'Stade de Nice', 10008, 35624)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20007, N'Parc des Princes', 10001, 47294)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20008, N'Stade de France', 10002, 80100)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20009, N'Stade Geoffroy Guichard', 10009, 42000)
INSERT [SOCCER].[soccer_venue] ([venue_id], [venue_name], [city_id], [aud_capacity]) VALUES (20010, N'Stadium de Toulouse', 10010, 33150)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1201, 5550)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1202, 5551)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1203, 5552)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1204, 5553)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1205, 5554)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1206, 5555)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1207, 5556)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1208, 5557)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1209, 5558)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1210, 5559)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1210, 5560)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1211, 5561)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1212, 5562)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1213, 5563)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1214, 5564)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1215, 5565)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1216, 5566)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1217, 5567)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1218, 5568)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1219, 5569)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1220, 5570)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1221, 5571)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1222, 5572)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1223, 5573)
INSERT [SOCCER].[team_coaches] ([team_id], [coach_id]) VALUES (1224, 5574)
ALTER TABLE [Employee].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_department] FOREIGN KEY([dep_id])
REFERENCES [Employee].[department] ([dep_id])
GO
ALTER TABLE [Employee].[employees] CHECK CONSTRAINT [FK_employees_department]
GO
ALTER TABLE [Hospital].[Affiliated_With]  WITH CHECK ADD  CONSTRAINT [FK_Affiliated_With_Department] FOREIGN KEY([department])
REFERENCES [Hospital].[Department] ([departmentid])
GO
ALTER TABLE [Hospital].[Affiliated_With] CHECK CONSTRAINT [FK_Affiliated_With_Department]
GO
ALTER TABLE [Hospital].[Affiliated_With]  WITH CHECK ADD  CONSTRAINT [FK_Affiliated_With_Physician] FOREIGN KEY([physician])
REFERENCES [Hospital].[Physician] ([employeeid])
GO
ALTER TABLE [Hospital].[Affiliated_With] CHECK CONSTRAINT [FK_Affiliated_With_Physician]
GO
ALTER TABLE [Hospital].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Nurse] FOREIGN KEY([prepnurse])
REFERENCES [Hospital].[Nurse] ([employeeid])
GO
ALTER TABLE [Hospital].[Appointment] CHECK CONSTRAINT [FK_Appointment_Nurse]
GO
ALTER TABLE [Hospital].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Patient] FOREIGN KEY([patient])
REFERENCES [Hospital].[Patient] ([ssn])
GO
ALTER TABLE [Hospital].[Appointment] CHECK CONSTRAINT [FK_Appointment_Patient]
GO
ALTER TABLE [Hospital].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Physician] FOREIGN KEY([physician])
REFERENCES [Hospital].[Physician] ([employeeid])
GO
ALTER TABLE [Hospital].[Appointment] CHECK CONSTRAINT [FK_Appointment_Physician]
GO
ALTER TABLE [Hospital].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Physician] FOREIGN KEY([head])
REFERENCES [Hospital].[Physician] ([employeeid])
GO
ALTER TABLE [Hospital].[Department] CHECK CONSTRAINT [FK_Department_Physician]
GO
ALTER TABLE [Hospital].[On-Call]  WITH CHECK ADD  CONSTRAINT [fk_OnCall_Block] FOREIGN KEY([blockfloor], [blockcode])
REFERENCES [Hospital].[Block] ([blockfloor], [blockcode])
GO
ALTER TABLE [Hospital].[On-Call] CHECK CONSTRAINT [fk_OnCall_Block]
GO
ALTER TABLE [Hospital].[On-Call]  WITH CHECK ADD  CONSTRAINT [FK_On-Call_Nurse] FOREIGN KEY([nurse])
REFERENCES [Hospital].[Nurse] ([employeeid])
GO
ALTER TABLE [Hospital].[On-Call] CHECK CONSTRAINT [FK_On-Call_Nurse]
GO
ALTER TABLE [Hospital].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Physician] FOREIGN KEY([pcp])
REFERENCES [Hospital].[Physician] ([employeeid])
GO
ALTER TABLE [Hospital].[Patient] CHECK CONSTRAINT [FK_Patient_Physician]
GO
ALTER TABLE [Hospital].[Prescribes]  WITH CHECK ADD  CONSTRAINT [FK_Prescribes_Appointment] FOREIGN KEY([appointment])
REFERENCES [Hospital].[Appointment] ([appointmentid])
GO
ALTER TABLE [Hospital].[Prescribes] CHECK CONSTRAINT [FK_Prescribes_Appointment]
GO
ALTER TABLE [Hospital].[Prescribes]  WITH CHECK ADD  CONSTRAINT [FK_Prescribes_Medication] FOREIGN KEY([medication])
REFERENCES [Hospital].[Medication] ([code])
GO
ALTER TABLE [Hospital].[Prescribes] CHECK CONSTRAINT [FK_Prescribes_Medication]
GO
ALTER TABLE [Hospital].[Prescribes]  WITH CHECK ADD  CONSTRAINT [FK_Prescribes_Patient] FOREIGN KEY([patient])
REFERENCES [Hospital].[Patient] ([ssn])
GO
ALTER TABLE [Hospital].[Prescribes] CHECK CONSTRAINT [FK_Prescribes_Patient]
GO
ALTER TABLE [Hospital].[Prescribes]  WITH CHECK ADD  CONSTRAINT [FK_Prescribes_Physician] FOREIGN KEY([physician])
REFERENCES [Hospital].[Physician] ([employeeid])
GO
ALTER TABLE [Hospital].[Prescribes] CHECK CONSTRAINT [FK_Prescribes_Physician]
GO
ALTER TABLE [Hospital].[Room]  WITH CHECK ADD  CONSTRAINT [fk_Room_Block] FOREIGN KEY([blockfloor], [blockcode])
REFERENCES [Hospital].[Block] ([blockfloor], [blockcode])
GO
ALTER TABLE [Hospital].[Room] CHECK CONSTRAINT [fk_Room_Block]
GO
ALTER TABLE [Hospital].[Stay]  WITH CHECK ADD  CONSTRAINT [FK_Stay_Patient] FOREIGN KEY([patient])
REFERENCES [Hospital].[Patient] ([ssn])
GO
ALTER TABLE [Hospital].[Stay] CHECK CONSTRAINT [FK_Stay_Patient]
GO
ALTER TABLE [Hospital].[Stay]  WITH CHECK ADD  CONSTRAINT [FK_Stay_Room] FOREIGN KEY([room])
REFERENCES [Hospital].[Room] ([roomnumber])
GO
ALTER TABLE [Hospital].[Stay] CHECK CONSTRAINT [FK_Stay_Room]
GO
ALTER TABLE [Hospital].[Trained_in]  WITH CHECK ADD  CONSTRAINT [FK_Trained_in_Physician] FOREIGN KEY([physician])
REFERENCES [Hospital].[Physician] ([employeeid])
GO
ALTER TABLE [Hospital].[Trained_in] CHECK CONSTRAINT [FK_Trained_in_Physician]
GO
ALTER TABLE [Hospital].[Trained_in]  WITH CHECK ADD  CONSTRAINT [FK_Trained_in_Procedures] FOREIGN KEY([treatment])
REFERENCES [Hospital].[Procedures] ([code])
GO
ALTER TABLE [Hospital].[Trained_in] CHECK CONSTRAINT [FK_Trained_in_Procedures]
GO
ALTER TABLE [Hospital].[Undergoes]  WITH CHECK ADD  CONSTRAINT [FK_Undergoes_Nurse] FOREIGN KEY([assistingnurse])
REFERENCES [Hospital].[Nurse] ([employeeid])
GO
ALTER TABLE [Hospital].[Undergoes] CHECK CONSTRAINT [FK_Undergoes_Nurse]
GO
ALTER TABLE [Hospital].[Undergoes]  WITH CHECK ADD  CONSTRAINT [FK_Undergoes_Patient] FOREIGN KEY([patient])
REFERENCES [Hospital].[Patient] ([ssn])
GO
ALTER TABLE [Hospital].[Undergoes] CHECK CONSTRAINT [FK_Undergoes_Patient]
GO
ALTER TABLE [Hospital].[Undergoes]  WITH CHECK ADD  CONSTRAINT [FK_Undergoes_Physician] FOREIGN KEY([physician])
REFERENCES [Hospital].[Physician] ([employeeid])
GO
ALTER TABLE [Hospital].[Undergoes] CHECK CONSTRAINT [FK_Undergoes_Physician]
GO
ALTER TABLE [Hospital].[Undergoes]  WITH CHECK ADD  CONSTRAINT [FK_Undergoes_Procedures] FOREIGN KEY([procedur])
REFERENCES [Hospital].[Procedures] ([code])
GO
ALTER TABLE [Hospital].[Undergoes] CHECK CONSTRAINT [FK_Undergoes_Procedures]
GO
ALTER TABLE [Hospital].[Undergoes]  WITH CHECK ADD  CONSTRAINT [FK_Undergoes_Stay] FOREIGN KEY([stay])
REFERENCES [Hospital].[Stay] ([stayid])
GO
ALTER TABLE [Hospital].[Undergoes] CHECK CONSTRAINT [FK_Undergoes_Stay]
GO
ALTER TABLE [HR].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Regions] FOREIGN KEY([region_id])
REFERENCES [HR].[Regions] ([region_id])
GO
ALTER TABLE [HR].[Countries] CHECK CONSTRAINT [FK_Countries_Regions]
GO
ALTER TABLE [HR].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Locations] FOREIGN KEY([location_id])
REFERENCES [HR].[Locations] ([location_id])
GO
ALTER TABLE [HR].[Departments] CHECK CONSTRAINT [FK_Departments_Locations]
GO
ALTER TABLE [HR].[Employees]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [HR].[Departments] ([department_id])
GO
ALTER TABLE [HR].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Jobs] FOREIGN KEY([job_id])
REFERENCES [HR].[Jobs] ([job_id])
GO
ALTER TABLE [HR].[Employees] CHECK CONSTRAINT [FK_Employees_Jobs]
GO
ALTER TABLE [HR].[Job_History]  WITH NOCHECK ADD FOREIGN KEY([employee_id])
REFERENCES [HR].[Employees] ([employee_id])
GO
ALTER TABLE [HR].[Job_History]  WITH CHECK ADD  CONSTRAINT [FK_Job_History_Departments] FOREIGN KEY([department_id])
REFERENCES [HR].[Departments] ([department_id])
GO
ALTER TABLE [HR].[Job_History] CHECK CONSTRAINT [FK_Job_History_Departments]
GO
ALTER TABLE [HR].[Job_History]  WITH CHECK ADD  CONSTRAINT [FK_Job_History_Jobs] FOREIGN KEY([job_id])
REFERENCES [HR].[Jobs] ([job_id])
GO
ALTER TABLE [HR].[Job_History] CHECK CONSTRAINT [FK_Job_History_Jobs]
GO
ALTER TABLE [HR].[Locations]  WITH NOCHECK ADD FOREIGN KEY([country_id])
REFERENCES [HR].[Countries] ([country_id])
GO
ALTER TABLE [Inventory].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([customer_id])
REFERENCES [Inventory].[Customer] ([customer_id])
GO
ALTER TABLE [Inventory].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [Inventory].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Salesman] FOREIGN KEY([salesman_id])
REFERENCES [Inventory].[Salesman] ([salesman_id])
GO
ALTER TABLE [Inventory].[Orders] CHECK CONSTRAINT [FK_Orders_Salesman]
GO
ALTER TABLE [SOCCER].[asst_referee_mast]  WITH CHECK ADD  CONSTRAINT [FK_asst_referee_mast_soccer_country] FOREIGN KEY([country_id])
REFERENCES [SOCCER].[soccer_country] ([country_id])
GO
ALTER TABLE [SOCCER].[asst_referee_mast] CHECK CONSTRAINT [FK_asst_referee_mast_soccer_country]
GO
ALTER TABLE [SOCCER].[goal_details]  WITH CHECK ADD  CONSTRAINT [FK_goal_details_match_mast] FOREIGN KEY([match_no])
REFERENCES [SOCCER].[match_mast] ([match_no])
GO
ALTER TABLE [SOCCER].[goal_details] CHECK CONSTRAINT [FK_goal_details_match_mast]
GO
ALTER TABLE [SOCCER].[goal_details]  WITH CHECK ADD  CONSTRAINT [FK_goal_details_soccer_team] FOREIGN KEY([team_id])
REFERENCES [SOCCER].[soccer_team] ([team_id])
GO
ALTER TABLE [SOCCER].[goal_details] CHECK CONSTRAINT [FK_goal_details_soccer_team]
GO
ALTER TABLE [SOCCER].[goal_details]  WITH NOCHECK ADD  CONSTRAINT [FK_goal_detailsPlayer] FOREIGN KEY([player_id])
REFERENCES [SOCCER].[player_mast] ([player_id])
GO
ALTER TABLE [SOCCER].[goal_details] CHECK CONSTRAINT [FK_goal_detailsPlayer]
GO
ALTER TABLE [SOCCER].[match_captain]  WITH CHECK ADD  CONSTRAINT [FK_match_captain_match_mast] FOREIGN KEY([match_no])
REFERENCES [SOCCER].[match_mast] ([match_no])
GO
ALTER TABLE [SOCCER].[match_captain] CHECK CONSTRAINT [FK_match_captain_match_mast]
GO
ALTER TABLE [SOCCER].[match_captain]  WITH CHECK ADD  CONSTRAINT [FK_match_captain_soccer_team] FOREIGN KEY([team_id])
REFERENCES [SOCCER].[soccer_team] ([team_id])
GO
ALTER TABLE [SOCCER].[match_captain] CHECK CONSTRAINT [FK_match_captain_soccer_team]
GO
ALTER TABLE [SOCCER].[match_details]  WITH CHECK ADD  CONSTRAINT [FK_match_details_asst_referee_mast] FOREIGN KEY([ass_ref])
REFERENCES [SOCCER].[asst_referee_mast] ([ass_ref_id])
GO
ALTER TABLE [SOCCER].[match_details] CHECK CONSTRAINT [FK_match_details_asst_referee_mast]
GO
ALTER TABLE [SOCCER].[match_details]  WITH CHECK ADD  CONSTRAINT [FK_match_details_match_mast] FOREIGN KEY([match_no])
REFERENCES [SOCCER].[match_mast] ([match_no])
GO
ALTER TABLE [SOCCER].[match_details] CHECK CONSTRAINT [FK_match_details_match_mast]
GO
ALTER TABLE [SOCCER].[match_details]  WITH CHECK ADD  CONSTRAINT [FK_match_details_soccer_team] FOREIGN KEY([team_id])
REFERENCES [SOCCER].[soccer_team] ([team_id])
GO
ALTER TABLE [SOCCER].[match_details] CHECK CONSTRAINT [FK_match_details_soccer_team]
GO
ALTER TABLE [SOCCER].[match_mast]  WITH CHECK ADD  CONSTRAINT [FK_match_mast_referee_mast] FOREIGN KEY([referee_id])
REFERENCES [SOCCER].[referee_mast] ([referee_id])
GO
ALTER TABLE [SOCCER].[match_mast] CHECK CONSTRAINT [FK_match_mast_referee_mast]
GO
ALTER TABLE [SOCCER].[match_mast]  WITH CHECK ADD  CONSTRAINT [FK_match_mast_soccer_venue] FOREIGN KEY([venue_id])
REFERENCES [SOCCER].[soccer_venue] ([venue_id])
GO
ALTER TABLE [SOCCER].[match_mast] CHECK CONSTRAINT [FK_match_mast_soccer_venue]
GO
ALTER TABLE [SOCCER].[penalty_gk]  WITH CHECK ADD  CONSTRAINT [FK_penalty_gk_match_mast] FOREIGN KEY([match_no])
REFERENCES [SOCCER].[match_mast] ([match_no])
GO
ALTER TABLE [SOCCER].[penalty_gk] CHECK CONSTRAINT [FK_penalty_gk_match_mast]
GO
ALTER TABLE [SOCCER].[penalty_gk]  WITH CHECK ADD  CONSTRAINT [FK_penalty_gk_soccer_team] FOREIGN KEY([team_id])
REFERENCES [SOCCER].[soccer_team] ([team_id])
GO
ALTER TABLE [SOCCER].[penalty_gk] CHECK CONSTRAINT [FK_penalty_gk_soccer_team]
GO
ALTER TABLE [SOCCER].[penalty_shootout]  WITH CHECK ADD  CONSTRAINT [FK_penalty_shootout_match_mast] FOREIGN KEY([match_no])
REFERENCES [SOCCER].[match_mast] ([match_no])
GO
ALTER TABLE [SOCCER].[penalty_shootout] CHECK CONSTRAINT [FK_penalty_shootout_match_mast]
GO
ALTER TABLE [SOCCER].[penalty_shootout]  WITH CHECK ADD  CONSTRAINT [FK_penalty_shootout_soccer_team] FOREIGN KEY([team_id])
REFERENCES [SOCCER].[soccer_team] ([team_id])
GO
ALTER TABLE [SOCCER].[penalty_shootout] CHECK CONSTRAINT [FK_penalty_shootout_soccer_team]
GO
ALTER TABLE [SOCCER].[penalty_shootout]  WITH NOCHECK ADD  CONSTRAINT [FK_penalty_shootoutPlayer] FOREIGN KEY([player_id])
REFERENCES [SOCCER].[player_mast] ([player_id])
GO
ALTER TABLE [SOCCER].[penalty_shootout] CHECK CONSTRAINT [FK_penalty_shootoutPlayer]
GO
ALTER TABLE [SOCCER].[player_booked]  WITH CHECK ADD  CONSTRAINT [FK_player_booked_match_mast] FOREIGN KEY([match_no])
REFERENCES [SOCCER].[match_mast] ([match_no])
GO
ALTER TABLE [SOCCER].[player_booked] CHECK CONSTRAINT [FK_player_booked_match_mast]
GO
ALTER TABLE [SOCCER].[player_booked]  WITH NOCHECK ADD  CONSTRAINT [FK_player_bookedPlayer] FOREIGN KEY([player_id])
REFERENCES [SOCCER].[player_mast] ([player_id])
GO
ALTER TABLE [SOCCER].[player_booked] CHECK CONSTRAINT [FK_player_bookedPlayer]
GO
ALTER TABLE [SOCCER].[player_in_out]  WITH CHECK ADD  CONSTRAINT [FK_player_in_out_match_mast] FOREIGN KEY([match_no])
REFERENCES [SOCCER].[match_mast] ([match_no])
GO
ALTER TABLE [SOCCER].[player_in_out] CHECK CONSTRAINT [FK_player_in_out_match_mast]
GO
ALTER TABLE [SOCCER].[player_in_out]  WITH CHECK ADD  CONSTRAINT [FK_player_in_out_soccer_team] FOREIGN KEY([team_id])
REFERENCES [SOCCER].[soccer_team] ([team_id])
GO
ALTER TABLE [SOCCER].[player_in_out] CHECK CONSTRAINT [FK_player_in_out_soccer_team]
GO
ALTER TABLE [SOCCER].[player_in_out]  WITH NOCHECK ADD  CONSTRAINT [FK_player_in_outPlayer] FOREIGN KEY([player_id])
REFERENCES [SOCCER].[player_mast] ([player_id])
GO
ALTER TABLE [SOCCER].[player_in_out] CHECK CONSTRAINT [FK_player_in_outPlayer]
GO
ALTER TABLE [SOCCER].[player_mast]  WITH CHECK ADD  CONSTRAINT [FK_player_mast_playing_position] FOREIGN KEY([posi_to_play])
REFERENCES [SOCCER].[playing_position] ([position_id])
GO
ALTER TABLE [SOCCER].[player_mast] CHECK CONSTRAINT [FK_player_mast_playing_position]
GO
ALTER TABLE [SOCCER].[referee_mast]  WITH CHECK ADD  CONSTRAINT [FK_referee_mast_soccer_country] FOREIGN KEY([country_id])
REFERENCES [SOCCER].[soccer_country] ([country_id])
GO
ALTER TABLE [SOCCER].[referee_mast] CHECK CONSTRAINT [FK_referee_mast_soccer_country]
GO
ALTER TABLE [SOCCER].[soccer_city]  WITH CHECK ADD  CONSTRAINT [FK_soccer_city_soccer_country] FOREIGN KEY([country_id])
REFERENCES [SOCCER].[soccer_country] ([country_id])
GO
ALTER TABLE [SOCCER].[soccer_city] CHECK CONSTRAINT [FK_soccer_city_soccer_country]
GO
ALTER TABLE [SOCCER].[soccer_venue]  WITH CHECK ADD  CONSTRAINT [FK_soccer_venue_soccer_city] FOREIGN KEY([city_id])
REFERENCES [SOCCER].[soccer_city] ([city_id])
GO
ALTER TABLE [SOCCER].[soccer_venue] CHECK CONSTRAINT [FK_soccer_venue_soccer_city]
GO
ALTER TABLE [SOCCER].[team_coaches]  WITH CHECK ADD  CONSTRAINT [FK_team_coaches_coach_mast] FOREIGN KEY([coach_id])
REFERENCES [SOCCER].[coach_mast] ([coach_id])
GO
ALTER TABLE [SOCCER].[team_coaches] CHECK CONSTRAINT [FK_team_coaches_coach_mast]
GO
ALTER TABLE [SOCCER].[team_coaches]  WITH CHECK ADD  CONSTRAINT [FK_team_coaches_soccer_team] FOREIGN KEY([team_id])
REFERENCES [SOCCER].[soccer_team] ([team_id])
GO
ALTER TABLE [SOCCER].[team_coaches] CHECK CONSTRAINT [FK_team_coaches_soccer_team]
GO
USE [master]
GO
ALTER DATABASE [W3Resource] SET  READ_WRITE 
GO