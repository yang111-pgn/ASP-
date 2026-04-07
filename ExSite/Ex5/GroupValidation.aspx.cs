using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex5_GroupValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cvName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string inputName = args.Value.Trim();
        // 验证规则：如果输入是 "leaf"，则判定为占用
        if (inputName.ToLower() == "leaf")
        {
            args.IsValid = false; // 验证失败
        }
        else
        {
            args.IsValid = true;  // 验证通过
        }
    }

    // 点击"检查用户名"按钮的事件
    protected void btnValidateName_Click(object sender, EventArgs e)
    {
        // 手动触发该分组 (groupName) 的验证
        Page.Validate("groupName");

        if (Page.IsValid)
        {
            lblName.Text = "恭喜！该用户名可用！";
            lblName.CssClass = "greenSucc";
        }
        else
        {
            lblName.Text = "抱歉！该用户名已被占用！";
            lblName.CssClass = "redErr";
        }
    }
    protected void cvIdCard_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string idCard = args.Value.Trim();
        args.IsValid = true; // 初始化为通过

        try
        {
            // 简单验证18位长度
            if (idCard.Length != 18)
            {
                args.IsValid = false;
                return;
            }

            // 截取出生日期部分 (第7-14位)
            string birthPart = idCard.Substring(6, 8);
            // 转换为DateTime验证日期合法性
            DateTime birthDate = DateTime.ParseExact(birthPart, "yyyyMMdd", null);
        }
        catch
        {
            // 转换失败即日期非法
            args.IsValid = false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // 触发整个分组 (groupSubmit) 的验证
        Page.Validate("groupSubmit");

        if (Page.IsValid)
        {
            // 模拟写入数据库
            lblMsg.Text = "恭喜！注册成功，信息已保存！";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblMsg.Text = "注册失败，请修正红色错误后重试！";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}