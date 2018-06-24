USE [master]
GO
/****** Object:  Database [smart-home-bd]    Script Date: 6/22/2018 5:18:50 PM ******/
CREATE DATABASE [smart-home-bd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'smart-home-bd_Data', FILENAME = N'c:\dzsqls\smart-home-bd.mdf' , SIZE = 8192KB , MAXSIZE = 15360KB , FILEGROWTH = 7168KB )
 LOG ON 
( NAME = N'smart-home-bd_Logs', FILENAME = N'c:\dzsqls\smart-home-bd.ldf' , SIZE = 8192KB , MAXSIZE = 20480KB , FILEGROWTH = 12288KB )
GO
ALTER DATABASE [smart-home-bd] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [smart-home-bd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [smart-home-bd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [smart-home-bd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [smart-home-bd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [smart-home-bd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [smart-home-bd] SET ARITHABORT OFF 
GO
ALTER DATABASE [smart-home-bd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [smart-home-bd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [smart-home-bd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [smart-home-bd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [smart-home-bd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [smart-home-bd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [smart-home-bd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [smart-home-bd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [smart-home-bd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [smart-home-bd] SET  ENABLE_BROKER 
GO
ALTER DATABASE [smart-home-bd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [smart-home-bd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [smart-home-bd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [smart-home-bd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [smart-home-bd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [smart-home-bd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [smart-home-bd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [smart-home-bd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [smart-home-bd] SET  MULTI_USER 
GO
ALTER DATABASE [smart-home-bd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [smart-home-bd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [smart-home-bd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [smart-home-bd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [smart-home-bd] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [smart-home-bd] SET QUERY_STORE = OFF
GO
USE [smart-home-bd]
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
USE [smart-home-bd]
GO
/****** Object:  User [dc36257120_SQLLogin_1]    Script Date: 6/22/2018 5:18:55 PM ******/
CREATE USER [dc36257120_SQLLogin_1] FOR LOGIN [dc36257120_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dc36257120_SQLLogin_1]
GO
/****** Object:  Schema [dc36257120_SQLLogin_1]    Script Date: 6/22/2018 5:18:57 PM ******/
CREATE SCHEMA [dc36257120_SQLLogin_1]
GO
/****** Object:  Table [dbo].[T_ARDUINO]    Script Date: 6/22/2018 5:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ARDUINO](
	[ID_ARDUINO] [int] IDENTITY(1,1) NOT NULL,
	[ID_EDIFICIO] [int] NULL,
	[ID_CLIENTE] [int] NULL,
 CONSTRAINT [PK_T_ARDUINO] PRIMARY KEY CLUSTERED 
(
	[ID_ARDUINO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_CONF_ARDUINO]    Script Date: 6/22/2018 5:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CONF_ARDUINO](
	[ID_CONF_ARDUINO] [int] IDENTITY(1,1) NOT NULL,
	[ID_SENAL] [int] NULL,
	[ID_ARDUINO] [int] NULL,
	[N_DELAY_ALARMA] [int] NULL,
	[N_CANAL] [int] NULL,
 CONSTRAINT [PK_T_CONF_ARDUINO] PRIMARY KEY CLUSTERED 
(
	[ID_CONF_ARDUINO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_EVENTO]    Script Date: 6/22/2018 5:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_EVENTO](
	[ID_EVENTO] [int] IDENTITY(1,1) NOT NULL,
	[ID_ARDUINO] [int] NULL,
	[ID_SENAL] [int] NULL,
	[VALOR] [int] NULL,
	[FECHA_EVENTO] [datetime] NULL,
 CONSTRAINT [PK_T_EVENTO] PRIMARY KEY CLUSTERED 
(
	[ID_EVENTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_INQUILINO]    Script Date: 6/22/2018 5:19:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_INQUILINO](
	[ID_INQUILINO] [int] IDENTITY(1,1) NOT NULL,
	[ID_EDIFICIO] [int] NULL,
	[V_NOMBRE] [varchar](50) NULL,
	[V_APELLIDO] [varchar](50) NULL,
	[V_MAIL] [varchar](50) NULL,
 CONSTRAINT [PK_T_INQUILINO] PRIMARY KEY CLUSTERED 
(
	[ID_INQUILINO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_NOTIFICACION]    Script Date: 6/22/2018 5:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_NOTIFICACION](
	[ID_NOTIFICACION] [int] IDENTITY(1,1) NOT NULL,
	[ID_ARDUINO] [int] NULL,
	[ID_SENAL] [int] NULL,
	[VALOR] [int] NULL,
	[FECHA_NOTIFICACION] [datetime] NULL,
 CONSTRAINT [PK_T_NOTIFICACION] PRIMARY KEY CLUSTERED 
(
	[ID_NOTIFICACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_SENAL]    Script Date: 6/22/2018 5:19:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SENAL](
	[ID_SENAL] [int] IDENTITY(1,1) NOT NULL,
	[V_DESCRIPCION] [varchar](50) NULL,
 CONSTRAINT [PK_T_SENAL] PRIMARY KEY CLUSTERED 
(
	[ID_SENAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_CONF_ARDUINO]  WITH CHECK ADD  CONSTRAINT [FK_CONF_ARDUINO_ARDUINO] FOREIGN KEY([ID_ARDUINO])
REFERENCES [dbo].[T_ARDUINO] ([ID_ARDUINO])
GO
ALTER TABLE [dbo].[T_CONF_ARDUINO] CHECK CONSTRAINT [FK_CONF_ARDUINO_ARDUINO]
GO
ALTER TABLE [dbo].[T_CONF_ARDUINO]  WITH CHECK ADD  CONSTRAINT [FK_CONF_ARDUINO_SENAL] FOREIGN KEY([ID_SENAL])
REFERENCES [dbo].[T_SENAL] ([ID_SENAL])
GO
ALTER TABLE [dbo].[T_CONF_ARDUINO] CHECK CONSTRAINT [FK_CONF_ARDUINO_SENAL]
GO
ALTER TABLE [dbo].[T_EVENTO]  WITH CHECK ADD  CONSTRAINT [FK_EVENTO_ARDUINO] FOREIGN KEY([ID_ARDUINO])
REFERENCES [dbo].[T_ARDUINO] ([ID_ARDUINO])
GO
ALTER TABLE [dbo].[T_EVENTO] CHECK CONSTRAINT [FK_EVENTO_ARDUINO]
GO
ALTER TABLE [dbo].[T_EVENTO]  WITH CHECK ADD  CONSTRAINT [FK_EVENTO_SENAL] FOREIGN KEY([ID_SENAL])
REFERENCES [dbo].[T_SENAL] ([ID_SENAL])
GO
ALTER TABLE [dbo].[T_EVENTO] CHECK CONSTRAINT [FK_EVENTO_SENAL]
GO
ALTER TABLE [dbo].[T_NOTIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_NOTIFICACION_ARDUINO] FOREIGN KEY([ID_ARDUINO])
REFERENCES [dbo].[T_ARDUINO] ([ID_ARDUINO])
GO
ALTER TABLE [dbo].[T_NOTIFICACION] CHECK CONSTRAINT [FK_NOTIFICACION_ARDUINO]
GO
ALTER TABLE [dbo].[T_NOTIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_NOTIFICACION_SENAL] FOREIGN KEY([ID_SENAL])
REFERENCES [dbo].[T_SENAL] ([ID_SENAL])
GO
ALTER TABLE [dbo].[T_NOTIFICACION] CHECK CONSTRAINT [FK_NOTIFICACION_SENAL]
GO
/****** Object:  StoredProcedure [dbo].[pr_ActualizarDelay_g]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_ActualizarDelay_g] @ID_ARDUINO int, @ID_SENAL int,@N_VALOR int AS
BEGIN
SET NOCOUNT ON
UPDATE t_conf_arduino SET N_DELAY_ALARMA=@N_VALOR WHERE ID_ARDUINO=@ID_ARDUINO and ID_SENAL=@ID_SENAL;
END


GO
/****** Object:  StoredProcedure [dbo].[PR_CONFIGURACION_L]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE PROCEDURE [dbo].[PR_CONFIGURACION_L] @ID_ARDUINO int, @ID_SENAL int
AS
BEGIN
    SET NOCOUNT ON;
			
            SELECT ISNULL( (SELECT MAX(N_DELAY_ALARMA)
            FROM T_CONF_ARDUINO t WHERE t.ID_SENAL=@ID_SENAL AND t.ID_ARDUINO=@ID_ARDUINO), -1)

   END
GO
/****** Object:  StoredProcedure [dbo].[PR_EVENTOS_G]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   CREATE PROCEDURE [dbo].[PR_EVENTOS_G] @ID_ARDUINO int, @ID_SENAL int,@VALOR int, @FECHA_EVENTO datetime AS
BEGIN
SET NOCOUNT ON
INSERT INTO T_EVENTO(ID_ARDUINO, ID_SENAL, VALOR, FECHA_EVENTO)
VALUES(@ID_ARDUINO, @ID_SENAL, @VALOR, @FECHA_EVENTO)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_EVENTOS_SF]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_EVENTOS_SF]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	SELECT t.ID_ARDUINO, t.ID_EVENTO,t.ID_SENAL, s.V_DESCRIPCION V_Descripcion_Senal, t.VALOR, t.FECHA_EVENTO fecha_evento
	FROM T_EVENTO t Join T_SENAL s on t.ID_SENAL=s.ID_SENAL
	END
GO
/****** Object:  StoredProcedure [dbo].[PR_NOTIFICACIONES_G]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[PR_NOTIFICACIONES_G] @ID_ARDUINO int, @ID_SENAL int,@VALOR int, @FECHA_NOTIFICACION datetime AS
BEGIN
SET NOCOUNT ON
INSERT INTO T_NOTIFICACION(ID_ARDUINO, ID_SENAL, VALOR, FECHA_NOTIFICACION)
VALUES(@ID_ARDUINO, @ID_SENAL, @VALOR, @FECHA_NOTIFICACION)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_NOTIFICACIONES_SF]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_NOTIFICACIONES_SF]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	SELECT t.ID_ARDUINO, t.ID_NOTIFICACION,t.ID_SENAL, s.V_DESCRIPCION V_Descripcion_Senal, t.VALOR, t.FECHA_NOTIFICACION fecha_notificacion
	FROM T_NOTIFICACION t Join T_SENAL s on t.ID_SENAL=s.ID_SENAL
	END
GO
/****** Object:  StoredProcedure [dbo].[pr_obtenerIdArduino_sf]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_obtenerIdArduino_sf]
AS
BEGIN
    SET NOCOUNT ON;
            SELECT ID_ARDUINO
            FROM T_arduino  

    END
GO
/****** Object:  StoredProcedure [dbo].[PR_SENAL_L]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[PR_SENAL_L] @ID_SENAL int
AS
BEGIN
    SET NOCOUNT ON;
			
           SELECT V_DESCRIPCION
            FROM T_SENAL t WHERE t.ID_SENAL=@ID_SENAL

   END
GO
/****** Object:  StoredProcedure [dbo].[PR_TEST_S]    Script Date: 6/22/2018 5:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_TEST_S]
	-- Add the parameters for the stored procedure here
	@P_IdEvento int, @P_FechaBaja datetime AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Realiza un UPDATE en la tabla, seteando la fecha baja del registro.
	
	UPDATE T_EVENTOS 
  SET    Fecha_evento= @P_FechaBaja 
       WHERE
    Id_Evento = @P_IdEvento;
	
END
GO
USE [master]
GO
ALTER DATABASE [smart-home-bd] SET  READ_WRITE 
GO
