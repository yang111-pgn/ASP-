-- =============================================
-- 测试 SQL Server 连接脚本
-- 使用 SQL Server 身份验证连接到 MyPetShop 数据库
-- =============================================

-- 在 SSMS 中使用以下信息连接：
-- 服务器名称: .\SQLEXPRESS (或 localhost\SQLEXPRESS)
-- 身份验证: SQL Server 身份验证
-- 登录名: petshop_user
-- 密码: YourStrongPassword123!

-- 连接成功后，运行以下测试脚本：

USE MyPetShop;
GO

-- 测试 1: 查看当前用户
SELECT
    SYSTEM_USER AS CurrentLogin,
    USER_NAME() AS CurrentUser,
    DB_NAME() AS CurrentDatabase;
GO

-- 测试 2: 查看用户权限
SELECT
    dp.name AS UserName,
    r.name AS RoleName,
    p.permission_name AS Permission,
    p.state_desc AS PermissionState
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
LEFT JOIN sys.database_principals r ON drm.role_principal_id = r.principal_id
LEFT JOIN sys.database_permissions p ON dp.principal_id = p.grantee_principal_id
WHERE dp.name = USER_NAME()
ORDER BY r.name, p.permission_name;
GO

-- 测试 3: 列出所有表
SELECT
    TABLE_SCHEMA AS SchemaName,
    TABLE_NAME AS TableName,
    TABLE_TYPE AS TableType
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO

-- 测试 4: 测试读取权限（查询第一个表的前 10 行）
-- 注意：根据实际表名修改
DECLARE @TableName NVARCHAR(128);
DECLARE @SQL NVARCHAR(MAX);

SELECT TOP 1 @TableName = TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

IF @TableName IS NOT NULL
BEGIN
    SET @SQL = 'SELECT TOP 10 * FROM ' + QUOTENAME(@TableName);
    PRINT '正在查询表: ' + @TableName;
    EXEC sp_executesql @SQL;
END
ELSE
BEGIN
    PRINT '数据库中没有找到表';
END
GO

-- 测试 5: 测试写入权限（创建测试表）
IF OBJECT_ID('dbo.ConnectionTest', 'U') IS NOT NULL
    DROP TABLE dbo.ConnectionTest;
GO

CREATE TABLE dbo.ConnectionTest (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    TestMessage NVARCHAR(100),
    TestDate DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO dbo.ConnectionTest (TestMessage)
VALUES ('SQL Server 身份验证测试成功！');
GO

SELECT * FROM dbo.ConnectionTest;
GO

-- 清理测试表
DROP TABLE dbo.ConnectionTest;
GO

PRINT '所有测试完成！';
PRINT '如果以上测试都成功执行，说明 SQL Server 身份验证配置正确。';
GO
