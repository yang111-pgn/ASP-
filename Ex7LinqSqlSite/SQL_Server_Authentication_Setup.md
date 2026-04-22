# SQL Server 身份验证访问 MyPetShop.mdf 数据库配置步骤

## 一、SQL Server Express 配置步骤

### 1. 启用 SQL Server 身份验证模式

1. 打开 **SQL Server Management Studio (SSMS)**
2. 连接到 SQL Server Express 实例（通常是 `(local)\SQLEXPRESS` 或 `.\SQLEXPRESS`）
3. 右键点击服务器名称 → 选择 **属性**
4. 在左侧选择 **安全性**
5. 在 **服务器身份验证** 部分，选择 **SQL Server 和 Windows 身份验证模式**
6. 点击 **确定**
7. 重启 SQL Server 服务（在 SQL Server 配置管理器中或使用服务管理器）

### 2. 创建 SQL Server 登录用户

在 SSMS 中执行以下 SQL 脚本：

```sql
-- 创建登录用户
CREATE LOGIN petshop_user WITH PASSWORD = 'YourStrongPassword123!';

-- 切换到 MyPetShop 数据库（需要先附加数据库）
USE MyPetShop;

-- 创建数据库用户并映射到登录
CREATE USER petshop_user FOR LOGIN petshop_user;

-- 授予数据库权限
ALTER ROLE db_datareader ADD MEMBER petshop_user;
ALTER ROLE db_datawriter ADD MEMBER petshop_user;
ALTER ROLE db_ddladmin ADD MEMBER petshop_user;
```

### 3. 附加 MyPetShop.mdf 数据库到 SQL Express 实例

**方法一：使用 SSMS 图形界面**
1. 在 SSMS 中，右键点击 **数据库** → 选择 **附加**
2. 点击 **添加** 按钮
3. 浏览到 `E:\ASP\test2\Ex7LinqSqlSite\App_Data\MyPetShop.mdf`
4. 点击 **确定**

**方法二：使用 T-SQL 脚本**
```sql
CREATE DATABASE MyPetShop
ON (FILENAME = 'E:\ASP\test2\Ex7LinqSqlSite\App_Data\MyPetShop.mdf'),
   (FILENAME = 'E:\ASP\test2\Ex7LinqSqlSite\App_Data\MyPetShop_log.ldf')
FOR ATTACH;
```

如果没有日志文件，使用：
```sql
CREATE DATABASE MyPetShop
ON (FILENAME = 'E:\ASP\test2\Ex7LinqSqlSite\App_Data\MyPetShop.mdf')
FOR ATTACH_REBUILD_LOG;
```

### 4. 启用 TCP/IP 协议（如果需要远程访问）

1. 打开 **SQL Server 配置管理器**
2. 展开 **SQL Server 网络配置**
3. 选择 **SQLEXPRESS 的协议**
4. 右键点击 **TCP/IP** → 选择 **启用**
5. 双击 **TCP/IP**，在 **IP 地址** 选项卡中，找到 **IPAll** 部分
6. 设置 **TCP 端口** 为 `1433`（或其他端口）
7. 重启 SQL Server 服务

## 二、ASP.NET 应用程序配置

### 修改 Web.config 连接字符串

将 `Web.config` 中的连接字符串修改为使用 SQL Server 身份验证：

**原连接字符串（Windows 集成身份验证）：**
```xml
<add name="MyPetShopEntities" 
     connectionString="metadata=res://*/App_Code.MyPetShop.csdl|res://*/App_Code.MyPetShop.ssdl|res://*/App_Code.MyPetShop.msl;
                       provider=System.Data.SqlClient;
                       provider connection string=&quot;data source=(LocalDB)\MSSQLLocalDB;
                       attachdbfilename=|DataDirectory|\MyPetShop.mdf;
                       integrated security=True;
                       MultipleActiveResultSets=True;
                       App=EntityFramework&quot;" 
     providerName="System.Data.EntityClient" />
```

**新连接字符串（SQL Server 身份验证）：**
```xml
<add name="MyPetShopEntities" 
     connectionString="metadata=res://*/App_Code.MyPetShop.csdl|res://*/App_Code.MyPetShop.ssdl|res://*/App_Code.MyPetShop.msl;
                       provider=System.Data.SqlClient;
                       provider connection string=&quot;data source=.\SQLEXPRESS;
                       initial catalog=MyPetShop;
                       user id=petshop_user;
                       password=YourStrongPassword123!;
                       MultipleActiveResultSets=True;
                       App=EntityFramework&quot;" 
     providerName="System.Data.EntityClient" />
```

## 三、连接字符串参数说明

| 参数 | 说明 | 示例值 |
|------|------|--------|
| `data source` | SQL Server 实例名称 | `.\SQLEXPRESS` 或 `localhost\SQLEXPRESS` 或 `(local)\SQLEXPRESS` |
| `initial catalog` | 数据库名称 | `MyPetShop` |
| `user id` | SQL Server 登录用户名 | `petshop_user` |
| `password` | 登录密码 | `YourStrongPassword123!` |
| `MultipleActiveResultSets` | 允许多个活动结果集 | `True` |

## 四、测试连接

### 方法一：在 SSMS 中测试
1. 打开 SSMS
2. 服务器名称输入：`.\SQLEXPRESS`
3. 身份验证选择：**SQL Server 身份验证**
4. 登录名：`petshop_user`
5. 密码：`YourStrongPassword123!`
6. 点击 **连接**

### 方法二：在应用程序中测试
运行 ASP.NET 应用程序，查看是否能正常访问数据库。

## 五、常见问题排查

### 1. 无法连接到服务器
- 检查 SQL Server 服务是否启动
- 检查防火墙是否允许 SQL Server 端口（默认 1433）
- 确认实例名称是否正确

### 2. 登录失败
- 确认已启用 SQL Server 身份验证模式
- 检查用户名和密码是否正确
- 确认用户已创建并授予权限

### 3. 数据库不存在
- 确认数据库已附加到 SQL Express 实例
- 检查数据库名称是否正确

### 4. 权限不足
- 确认用户已授予足够的数据库权限（db_datareader, db_datawriter）

## 六、安全建议

1. **不要在 Web.config 中明文存储密码**，考虑使用：
   - 加密连接字符串
   - 使用 Azure Key Vault 或其他密钥管理服务
   - 使用环境变量

2. **使用强密码**：至少 8 位，包含大小写字母、数字和特殊字符

3. **最小权限原则**：只授予应用程序所需的最小数据库权限

4. **定期更新密码**

5. **启用 SSL/TLS 加密连接**（生产环境）
