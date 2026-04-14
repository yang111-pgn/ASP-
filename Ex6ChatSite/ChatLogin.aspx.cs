using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatLogin : System.Web.UI.Page
{
    string[,] user = { { "张三", "111111" }, { "王五", "111111" }, { "李四", "111111" } };

    protected void Page_Load(object sender, EventArgs e)
    {
        txtName.Focus();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= 2; i++)
        {
            if (txtName.Text == user[i, 0] && txtPassword.Text == user[i, 1])
            {
                Session["user"] = user[i, 0];

                // ========== 我加的代码：记录登录次数 Cookie ==========
                int count = 0;
                // 读取旧Cookie
                if (Request.Cookies["LoginCount"] != null)
                {
                    count = int.Parse(Request.Cookies["LoginCount"].Value);
                }
                count++; // 次数+1

                // 写入新Cookie
                HttpCookie cookie = new HttpCookie("LoginCount", count.ToString());
                cookie.Expires = DateTime.Now.AddDays(30); // 保存30天
                Response.Cookies.Add(cookie);
                // ====================================================

                Response.Redirect("Chat.aspx");
                return;
            }
        }
        Response.Write("<script type='text/javascript'>alert('用户名或密码错误!')</script>");
    }
}