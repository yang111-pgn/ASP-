using System;
using System.Linq;
using System.Xml.Linq;

public partial class LinqXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // 1. 显示全部XML
    protected void BtnQueryAll_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.open('Category.xml','_blank')</script>");
    }

    // 2. 按名称查询
    protected void BtnQuery_Click(object sender, EventArgs e)
    {
        string xmlFilePath = Server.MapPath("~/Category.xml");
        XElement els = XElement.Load(xmlFilePath);

        var elements = from el in els.Elements("Category")
                       where (string)el.Element("Name") == txtName.Text
                       select el;

        if (elements.Count() == 0)
        {
            lblMsg.Text = "没有满足条件的数据！";
        }
        else
        {
            lblMsg.Text = "";
            foreach (XElement el in elements)
            {
                lblMsg.Text +=
                    "CategoryId: " + el.Element("CategoryId").Value + "<br/>" +
                    "Name: " + el.Element("Name").Value + "<br/>" +
                    "Descn: " + el.Element("Descn").Value + "<br/><br/>";
            }
        }
    }

    // 3. 跳转到插入页
    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("LinqXmlInsert.aspx");
    }
}