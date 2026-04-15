using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Concurrent;   // 新增：支持 ConcurrentDictionary

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

                // 记录登录次数 Cookie
                int count = 0;
                if (Request.Cookies["LoginCount"] != null)
                {
                    count = int.Parse(Request.Cookies["LoginCount"].Value);
                }
                count++;
                HttpCookie cookie = new HttpCookie("LoginCount", count.ToString());
                cookie.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(cookie);

                // 统计总访问人数
                Application.Lock();
                if (Application["TotalVisitors"] == null)
                    Application["TotalVisitors"] = 0;
                Application["TotalVisitors"] = (int)Application["TotalVisitors"] + 1;
                Application.UnLock();

                // 加入在线用户列表
                var onlineUsers = Application["OnlineUsers"] as ConcurrentDictionary<string, string>;
                if (onlineUsers == null)
                {
                    onlineUsers = new ConcurrentDictionary<string, string>();
                    Application["OnlineUsers"] = onlineUsers;
                }
                onlineUsers.AddOrUpdate(Session.SessionID, user[i, 0], (k, v) => user[i, 0]);

                Response.Redirect("Chat.aspx");
                return;
            }
        }
        Response.Write("<script type='text/javascript'>alert('用户名或密码错误!')</script>");
    }
}