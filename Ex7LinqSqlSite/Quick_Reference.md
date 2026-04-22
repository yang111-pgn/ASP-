# 快速配置指南 - SQL Server 身份验证访问 MyPetShop 数据库

## 📋 配置清单

### 前置条件
- [ ] 已安装 SQL Server Express
- [ ] 已安装 SQL Server Management Studio (SSMS)
- [ ] SQL Server 服务正在运行

---

## 🚀 快速配置步骤（5 分钟）

### 第 1 步：启用 SQL Server 身份验证
1. 打开 SSMS，连接到 `.\SQLEXPRESS`（使用 Windows 身份验证）
2. 右键服务器 → **属性** → **安全性**
3. 选择 **SQL Server 和 Windows 身份验证模式**
4. 点击确定

### 第 2 步：重启 SQL Server 服务
**方法 A - 使用服务管理器：**
- 按 `Win + R`，输入 `services.msc`
- 找到 `SQL Server (SQLEXPRESS)`
- 右键 → **重新启动**

**方法 B - 使用命令行：**
```cmd
net stop MSSQL$SQLEXPRESS
net start MSSQL$SQLEXPRESS
```

### 第 3 步：执行数据库配置脚本
1. 在 SSMS 中打开文件：`Setup_SQLServer_Auth.sql`
2. 修改脚本中的密码（第 37 行）：
   ```sql
   CREATE LOGIN petshop_user
   WITH PASSWORD = '你的强密码';  -- 修改这里
   ```
3. 点击 **执行**（F5）

### 第 4 步：测试连接
1. 断开当前 SSMS 连接
2. 重新连接，使用以下信息：
   - **服务器名称**: `.\SQLEXPRESS`
   - **身份验证**: SQL Server 身份验证
   - **登录名**: `petshop_user`
   - **密码**: 你设置的密码
3. 打开并执行 `Test_Connection.sql` 验证权限

### 第 5 步：更新 Web.config
1. 备份原 `Web.config` 文件
2. 打开 `Web.config.sqlauth` 文件
3. 修改密码（第 35 行）：
   ```xml
   password=你的强密码;
   ```
4. 将 `Web.config.sqlauth` 重命名为 `Web.config`（覆盖原文件）

---

## 📁 生成的文件说明

| 文件名 | 用途 |
|--------|------|
| `SQL_Server_Authentication_Setup.md` | 完整配置文档（详细步骤和说明） |
| `Setup_SQLServer_Auth.sql` | 数据库配置脚本（创建用户和授权） |
| `Test_Connection.sql` | 连接测试脚本（验证配置是否成功） |
| `Web.config.sqlauth` | 修改后的配置文件（使用 SQL Server 身份验证） |
| `Quick_Reference.md` | 本文件（快速参考指南） |

---

## 🔑 默认配置信息

```
服务器实例: .\SQLEXPRESS
数据库名称: MyPetShop
登录用户名: petshop_user
默认密码: YourStrongPassword123!  ⚠️ 请务必修改！
```

---

## 🔧 连接字符串格式

### Entity Framework 连接字符串
```xml
<add name="MyPetShopEntities"
     connectionString="metadata=res://*/App_Code.MyPetShop.csdl|res://*/App_Code.MyPetShop.ssdl|res://*/App_Code.MyPetShop.msl;
                       provider=System.Data.SqlClient;
                       provider connection string=&quot;
                       data source=.\SQLEXPRESS;
                       initial catalog=MyPetShop;
                       user id=petshop_user;
                       password=你的密码;
                       MultipleActiveResultSets=True;
                       App=EntityFramework&quot;"
     providerName="System.Data.EntityClient" />
```

### 标准 ADO.NET 连接字符串
```
Data Source=.\SQLEXPRESS;Initial Catalog=MyPetShop;User ID=petshop_user;Password=你的密码;
```

---

## ❓ 常见问题

### 问题 1: 无法连接到 .\SQLEXPRESS
**解决方案：**
- 确认 SQL Server 服务正在运行
- 尝试使用 `localhost\SQLEXPRESS` 或 `(local)\SQLEXPRESS`
- 检查 SQL Server Browser 服务是否启动

### 问题 2: 登录失败（错误 18456）
**解决方案：**
- 确认已启用 SQL Server 身份验证模式
- 确认已重启 SQL Server 服务
- 检查用户名和密码是否正确
- 查看 SQL Server 错误日志：`C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Log\ERRORLOG`

### 问题 3: 数据库 'MyPetShop' 不存在
**解决方案：**
- 确认已执行 `Setup_SQLServer_Auth.sql` 脚本
- 检查 .mdf 文件路径是否正确
- 在 SSMS 中手动附加数据库

### 问题 4: 权限不足
**解决方案：**
- 重新执行 `Setup_SQLServer_Auth.sql` 中的授权部分（步骤 3）
- 确认用户已添加到 db_datareader 和 db_datawriter 角色

---

## 🔒 安全建议

1. **立即修改默认密码**
   - 使用至少 12 位字符
   - 包含大小写字母、数字和特殊字符

2. **不要在生产环境中明文存储密码**
   - 使用加密的连接字符串
   - 考虑使用 Windows 身份验证（如果可能）

3. **最小权限原则**
   - 如果应用只需要读取数据，只授予 db_datareader 权限
   - 定期审查用户权限

4. **启用 SSL/TLS**
   - 在生产环境中加密数据库连接
   - 在连接字符串中添加 `Encrypt=True`

---

## 📞 获取帮助

如果遇到问题：
1. 查看 `SQL_Server_Authentication_Setup.md` 中的详细说明
2. 检查 SQL Server 错误日志
3. 运行 `Test_Connection.sql` 诊断问题

---

## ✅ 验证清单

配置完成后，确认以下项目：
- [ ] 可以使用 SQL Server 身份验证登录 SSMS
- [ ] `Test_Connection.sql` 所有测试通过
- [ ] ASP.NET 应用程序可以正常访问数据库
- [ ] 已修改默认密码
- [ ] 已备份原 Web.config 文件

---

**配置完成！** 🎉

现在你的应用程序使用 SQL Server 身份验证连接到 MyPetShop 数据库。
