using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Concurrent;
using System.Linq;

public partial class Chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userName = Session["user"]?.ToString() ?? "未知用户";

        // 获取登录次数（来自 Cookie）
        string loginCount = "1";
        if (Request.Cookies["LoginCount"] != null)
        {
            loginCount = Request.Cookies["LoginCount"].Value;
        }
        // 显示欢迎语：×××，您是第 × 次光临聊天室！
        lblName.Text = $"欢迎您，{userName}！您是第{loginCount}次光临聊天室。";

        // 显示总访问人数
        if (Application["TotalVisitors"] != null)
            lblTotalVisitors.Text = Application["TotalVisitors"].ToString();
        else
            lblTotalVisitors.Text = "0";

        // 显示当前在线人数及用户列表
        var onlineUsersDict = Application["OnlineUsers"] as ConcurrentDictionary<string, string>;
        if (onlineUsersDict != null)
        {
            lblOnlineCount.Text = onlineUsersDict.Count.ToString();
            var userList = onlineUsersDict.Values.ToList();
            lblOnlineUsers.Text = userList.Any() ? string.Join(", ", userList) : "无";
        }
        else
        {
            lblOnlineCount.Text = "0";
            lblOnlineUsers.Text = "无";
        }

        // 首次进入聊天室时添加“进入”消息（防止刷新重复添加）
        if (!IsPostBack && Session["HasEntered"] == null)
        {
            string ip = GetClientIP();
            Application.Lock();
            Application["message"] = $"{userName} 进入了聊天室 (IP: {ip})<br />" + Application["message"];
            Application.UnLock();
            Session["HasEntered"] = true;
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        string userName = Session["user"]?.ToString() ?? "未知用户";
        string ip = GetClientIP();
        Application.Lock();
        Application["message"] = $"{userName} 说: {txtMessage.Text} ({DateTime.Now:yyyy-MM-dd HH:mm:ss}) [IP: {ip}]<br />" + Application["message"];
        Application.UnLock();
        txtMessage.Text = "";
    }

    /// <summary>
    /// 获取客户端真实 IP 地址（支持代理）
    /// </summary>
    private string GetClientIP()
    {
        string ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (string.IsNullOrEmpty(ip))
            ip = Request.UserHostAddress;
        return ip;
    }
}