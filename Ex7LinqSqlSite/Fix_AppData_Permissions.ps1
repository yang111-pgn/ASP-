# =============================================
# 修复 App_Data 文件夹权限
# 需要以管理员身份运行
# =============================================

$appDataPath = "E:\ASP\test2\Ex7LinqSqlSite\App_Data"

# SQL Server Express 服务账户
$sqlServiceAccount = "NT SERVICE\MSSQL`$SQLEXPRESS"

Write-Host "正在为 SQL Server 服务账户添加权限..." -ForegroundColor Yellow
Write-Host "路径: $appDataPath" -ForegroundColor Cyan
Write-Host "账户: $sqlServiceAccount" -ForegroundColor Cyan

try {
    # 获取当前 ACL
    $acl = Get-Acl $appDataPath

    # 创建新的访问规则（完全控制）
    $permission = $sqlServiceAccount, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow"
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission

    # 添加规则
    $acl.SetAccessRule($accessRule)

    # 应用 ACL
    Set-Acl $appDataPath $acl

    Write-Host "`n✓ 权限添加成功！" -ForegroundColor Green
    Write-Host "现在可以重新运行 Setup_SQLServer_Auth.sql 脚本了" -ForegroundColor Green
}
catch {
    Write-Host "`n✗ 错误: $_" -ForegroundColor Red
    Write-Host "`n请确保：" -ForegroundColor Yellow
    Write-Host "1. 以管理员身份运行此脚本" -ForegroundColor Yellow
    Write-Host "2. SQL Server Express 已安装" -ForegroundColor Yellow
    Write-Host "3. 实例名称是 SQLEXPRESS（如果不是，请修改脚本中的 `$sqlServiceAccount）" -ForegroundColor Yellow
}
