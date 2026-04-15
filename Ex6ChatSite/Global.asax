<%@ Application Language="C#" %>
<%@ Import Namespace="System.Collections.Concurrent" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码
        ScriptResourceDefinition scriptResDef = new ScriptResourceDefinition();
        //设置jQuery提供的JavaScript库路径，其中版本号由安装的jQuery版本号确定
        scriptResDef.Path = "~/Scripts/jquery-3.6.0.min.js";
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery", scriptResDef);
        //初始话聊天信息的配置
        Application["message"] = "/<hr />";
        // 初始化在线用户字典和总访问人数 
        Application["OnlineUsers"] = new ConcurrentDictionary<string, string>();
        Application["TotalVisitors"] = 0;
    }

    void Application_End(object sender, EventArgs e)
    {
        // 会话结束时，从在线用户列表中移除当前 Session
        var onlineUsers = Application["OnlineUsers"] as ConcurrentDictionary<string, string>;
        if (onlineUsers != null)
        {
            onlineUsers.TryRemove(Session.SessionID, out _);
        }

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。

    }

</script>
