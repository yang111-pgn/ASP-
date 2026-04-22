-- =============================================
-- SQL Server Express 配置脚本
-- 用于配置 MyPetShop 数据库的 SQL Server 身份验证
-- =============================================

-- =============================================
-- 步骤 1: 附加数据库到 SQL Express 实例
-- =============================================

-- 如果数据库已存在，先分离
USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'MyPetShop')
BEGIN
    ALTER DATABASE MyPetShop SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE MyPetShop;
END
GO


-- 如果没有日志文件，使用此命令（会自动重建日志）
CREATE DATABASE MyPetShop
ON (FILENAME = 'E:\ASP\test2\Ex7LinqSqlSite\App_Data\MyPetShop.mdf')
FOR ATTACH_REBUILD_LOG;
GO

-- =============================================
-- 步骤 2: 创建 SQL Server 登录用户
-- =============================================

USE master;
GO

-- 如果登录已存在，先删除
IF EXISTS (SELECT name FROM sys.server_principals WHERE name = 'petshop_user')
BEGIN
    DROP LOGIN petshop_user;
END
GO

-- 创建新的 SQL Server 登录
-- 注意：请修改密码为更安全的密码
CREATE LOGIN petshop_user
WITH PASSWORD = 'YourStrongPassword123!',
     DEFAULT_DATABASE = MyPetShop,
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = OFF;
GO

PRINT '登录用户 petshop_user 创建成功';
GO

-- =============================================
-- 步骤 3: 在数据库中创建用户并授权
-- =============================================

USE MyPetShop;
GO

-- 如果用户已存在，先删除
IF EXISTS (SELECT name FROM sys.database_principals WHERE name = 'petshop_user')
BEGIN
    DROP USER petshop_user;
END
GO

-- 创建数据库用户并映射到登录
CREATE USER petshop_user FOR LOGIN petshop_user;
GO

-- 授予数据读取权限
ALTER ROLE db_datareader ADD MEMBER petshop_user;
GO

-- 授予数据写入权限
ALTER ROLE db_datawriter ADD MEMBER petshop_user;
GO

-- 授予 DDL 管理权限（如果需要创建/修改表结构）
ALTER ROLE db_ddladmin ADD MEMBER petshop_user;
GO

-- 可选：授予存储过程执行权限
-- GRANT EXECUTE TO petshop_user;
-- GO

PRINT '数据库用户 petshop_user 创建并授权成功';
GO

-- =============================================
-- 步骤 4: 验证配置
-- =============================================

-- 查看登录信息
USE master;
GO
SELECT
    name AS LoginName,
    type_desc AS LoginType,
    default_database_name AS DefaultDatabase,
    create_date AS CreateDate,
    is_disabled AS IsDisabled
FROM sys.server_principals
WHERE name = 'petshop_user';
GO

-- 查看数据库用户权限
USE MyPetShop;
GO
SELECT
    dp.name AS UserName,
    dp.type_desc AS UserType,
    r.name AS RoleName
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
LEFT JOIN sys.database_principals r ON drm.role_principal_id = r.principal_id
WHERE dp.name = 'petshop_user';
GO

-- 查看数据库中的表
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_NAME;
GO

PRINT '配置完成！';
PRINT '请使用以下信息测试连接：';
PRINT '服务器: .\SQLEXPRESS';
PRINT '数据库: MyPetShop';
PRINT '用户名: petshop_user';
PRINT '密码: YourStrongPassword123!';
GO
