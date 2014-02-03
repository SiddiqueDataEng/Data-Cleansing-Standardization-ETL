/*
 * Data Cleansing Standardization ETL
 * Project #65 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS, T-SQL
 * Created: 2012
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'CleansingETL')
BEGIN
    ALTER DATABASE CleansingETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE CleansingETL;
END
GO

CREATE DATABASE CleansingETL
ON PRIMARY
(
    NAME = 'CleansingETL_Data',
    FILENAME = 'C:\SQLData\CleansingETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'CleansingETL_Log',
    FILENAME = 'C:\SQLData\CleansingETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE CleansingETL SET RECOVERY SIMPLE;
ALTER DATABASE CleansingETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE CleansingETL;
GO

PRINT 'Database CleansingETL created successfully';
PRINT 'Project: Data Cleansing Standardization ETL';
PRINT 'Description: Duplicate removal and format correction';
GO
