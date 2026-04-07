using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex5_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // 身份证号 自定义服务器验证
    protected void csvIdentity_ServerValidate(object source, ServerValidateEventArgs args)
    {
        // 获取输入的身份证号
        string idCard = args.Value.Trim();

        // 必须是18位才进行验证
        if (idCard.Length != 18)
        {
            args.IsValid = false;
            return;
        }

        try
        {
            // 从身份证中截取 年、月、日
            string year = idCard.Substring(6, 4);   // 第7-10位
            string month = idCard.Substring(10, 2); // 第11-12位
            string day = idCard.Substring(12, 2);   // 第13-14位

            // 组合成日期并验证是否合法
            DateTime birthDate = DateTime.Parse(year + "-" + month + "-" + day);

            // 如果能正常转成日期，验证通过
            args.IsValid = true;
        }
        catch
        {
            // 日期格式非法 → 验证失败
            args.IsValid = false;
        }
    }

    // 确定按钮点击事件
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // 触发页面所有验证
        Page.Validate();

        if (Page.IsValid)
        {
            // 全部验证通过
            lblMsg.Text = "注册成功！";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            // 有验证失败
            lblMsg.Text = "输入有误，请检查！";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}