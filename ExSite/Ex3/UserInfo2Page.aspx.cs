using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_UserInfo2Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        string birthday = txtBirthday.Text;

        // 1. 非空校验
        if (string.IsNullOrWhiteSpace(name))
        {
            Response.Write("请输入姓名！<br/>");
            return;
        }
        if (string.IsNullOrWhiteSpace(birthday))
        {
            Response.Write("请输入生日！<br/>");
            return;
        }

        try
        {
            // 2. 日期转换
            DateTime birthDate = DateTime.ParseExact(birthday, "yyyyMMdd", null);

            // 3. 实例化 + 绑定事件
            UserInfo2 userInfo = new UserInfo2(name, birthDate);
            string errorMsg = "";

            userInfo.ValidateBirthday += (msg) =>
            {
                errorMsg = msg;
                Response.Write($"<span style='color:red'>{msg}</span><br/>");
            };

            userInfo.OnValidateBirthday();

            // 4. 计算年龄
            int age = userInfo.DecideAge();

            // 5. 无错误则输出
            if (string.IsNullOrEmpty(errorMsg))
            {
                Response.Write("年龄：" + userInfo.DecideAge());
            }
        }
        catch (FormatException)
        {
            Response.Write("<span style='color:red'>生日格式错误！请输入8位数字格式（如20000101）</span><br/>");
        }
        catch (Exception ex)
        {
            Response.Write($"<span style='color:red'>程序错误：{ex.Message}</span><br/>");
        }
    }
}