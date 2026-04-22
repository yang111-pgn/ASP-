using System;
using System.Linq;
using System.Xml.Linq;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    private string xmlFilePath;

    protected void Page_Load(object sender, EventArgs e)
    {
        xmlFilePath = Server.MapPath("~/MyProducts.xml");
        if (!IsPostBack)
        {
            LoadXmlData();
        }
    }

    private void LoadXmlData()
    {
        if (!System.IO.File.Exists(xmlFilePath))
        {
            gvProducts.EmptyDataText = "XML文件不存在";
            gvProducts.DataSource = null;
            gvProducts.DataBind();
            return;
        }
        XDocument doc = XDocument.Load(xmlFilePath);
        var products = doc.Descendants("Product")
                          .Select(p => new
                          {
                              ProductId = (int)p.Element("ProductId"),
                              Name = (string)p.Element("Name"),
                              Price = (decimal)p.Element("Price"),
                              CategoryId = (int)p.Element("CategoryId")
                          }).ToList();
        gvProducts.DataSource = products;
        gvProducts.DataBind();
    }

    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        if (!int.TryParse(txtProductId.Text, out int id))
        {
            lblMessage.Text = "请输入有效的商品ID";
            return;
        }

        XDocument doc = XDocument.Load(xmlFilePath);
        XElement target = doc.Descendants("Product")
                             .FirstOrDefault(p => (int)p.Element("ProductId") == id);
        if (target == null)
        {
            lblMessage.Text = $"未找到商品ID为 {id} 的节点";
            return;
        }

        var beforeIds = doc.Descendants("Product")
                           .Select(p => (int)p.Element("ProductId"))
                           .ToList();

        target.Remove();
        doc.Save(xmlFilePath);

        var afterIds = doc.Descendants("Product")
                          .Select(p => (int)p.Element("ProductId"))
                          .ToList();

        bool orderPreserved = afterIds.SequenceEqual(beforeIds.Where(x => x != id));
        string logMsg = $"删除操作：删除ID={id}<br/>";
        logMsg += $"删除前节点ID序列：{string.Join(", ", beforeIds)}<br/>";
        logMsg += $"删除后节点ID序列：{string.Join(", ", afterIds)}<br/>";
        logMsg += $"顺序是否保持不变：{(orderPreserved ? "是" : "否")}<br/>";
        logMsg += $"实验结论：{(orderPreserved ? "✅ 删除中间节点成功，剩余节点顺序正确。" : "❌ 顺序发生变化，请检查。")}";
        lblLog.Text = logMsg;
        lblMessage.Text = $"成功删除商品ID {id}";
        lblMessage.ForeColor = System.Drawing.Color.Green;

        LoadXmlData();
        txtProductId.Text = "";
    }

    protected void BtnRefresh_Click(object sender, EventArgs e)
    {
        LoadXmlData();
        lblMessage.Text = "";
    }
}