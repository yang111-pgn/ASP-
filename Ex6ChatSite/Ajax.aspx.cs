using System;

public partial class Ajax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 清除所有已有的输出
        Response.Clear();
        Response.ContentType = "text/html";
        Response.Charset = "utf-8";

        // 输出聊天记录（注意：不要修改 Application["message"]）
        Response.Write(Application["message"]?.ToString() ?? "");

        // 终止页面的后续生命周期，不再输出任何 HTML 标签
        Response.End();
    }
}