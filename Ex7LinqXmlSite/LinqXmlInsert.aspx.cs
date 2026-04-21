using System;
using System.Xml.Linq;

public partial class LinqXmlInsert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // 插入新元素
    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        string xmlFilePath = Server.MapPath("~/Category.xml");
        XElement els = XElement.Load(xmlFilePath);

        // 新建<Category>元素
        XElement el = new XElement("Category",
            new XElement("CategoryId", txtCategoryId.Text),
            new XElement("Name", txtName.Text),
            new XElement("Descn", txtDescn.Text));

        els.Add(el);               // 添加<Category>元素
        els.Save(xmlFilePath);     // 保存到Category.xml文件

        Response.Write("<script>alert('插入成功！');</script>");
    }

    // 返回主页面
    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("LinqXml.aspx");
    }
}