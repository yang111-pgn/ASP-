using System;
using System.Linq;
using System.Xml.Linq;
using System.Web.UI.WebControls;

public partial class ManageProductXml : System.Web.UI.Page
{
    private string xmlFilePath;

    protected void Page_Load(object sender, EventArgs e)
    {
        xmlFilePath = Server.MapPath("~/Product.xml");
        if (!IsPostBack)
        {
            LoadXmlToGridView();
        }
    }


    private void LoadXmlToGridView()
    {
        if (!System.IO.File.Exists(xmlFilePath))
        {
            gvProductXml.EmptyDataText = "XML 文件不存在，请先生成 Product.xml";
            gvProductXml.DataSource = null;
            gvProductXml.DataBind();
            return;
        }

        XDocument doc = XDocument.Load(xmlFilePath);
        var products = from p in doc.Descendants("Product")
                       let productIdElem = p.Element("ProductId")
                       let nameElem = p.Element("Name")
                       let priceElem = p.Element("Price")
                       let categoryIdElem = p.Element("CategoryId")
                       where productIdElem != null && nameElem != null && priceElem != null && categoryIdElem != null
                       select new
                       {
                           ProductId = (int)productIdElem,
                           Name = (string)nameElem,
                           Price = (decimal)priceElem,
                           CategoryId = (int)categoryIdElem
                       };
        gvProductXml.DataSource = products.ToList();
        gvProductXml.DataBind();
    }

    /// 删除指定 ID 的商品元素
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        if (!int.TryParse(txtDeleteId.Text.Trim(), out int id))
        {
            lblDeleteMsg.Text = "商品ID必须是数字";
            return;
        }

        if (!System.IO.File.Exists(xmlFilePath))
        {
            lblDeleteMsg.Text = "XML 文件不存在";
            return;
        }

        XDocument doc = XDocument.Load(xmlFilePath);
        // 查找匹配的 Product 元素
        XElement productElement = doc.Descendants("Product")
                                      .FirstOrDefault(p => (int)p.Element("ProductId") == id);
        if (productElement == null)
        {
            lblDeleteMsg.Text = $"未找到商品ID为 {id} 的商品";
            return;
        }

        // 删除元素
        productElement.Remove();
        doc.Save(xmlFilePath);
        lblDeleteMsg.Text = $"成功删除商品ID {id}";
        lblDeleteMsg.ForeColor = System.Drawing.Color.Green;

        // 刷新显示
        LoadXmlToGridView();
        txtDeleteId.Text = "";
    }

    // 修改指定商品的价格

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (!int.TryParse(txtUpdateId.Text.Trim(), out int id))
        {
            lblUpdateMsg.Text = "商品ID必须是数字";
            return;
        }
        if (!decimal.TryParse(txtNewPrice.Text.Trim(), out decimal newPrice))
        {
            lblUpdateMsg.Text = "新价格必须是数字";
            return;
        }
        if (newPrice < 0)
        {
            lblUpdateMsg.Text = "价格不能为负数";
            return;
        }

        if (!System.IO.File.Exists(xmlFilePath))
        {
            lblUpdateMsg.Text = "XML 文件不存在";
            return;
        }

        XDocument doc = XDocument.Load(xmlFilePath);
        XElement productElement = doc.Descendants("Product")
                                      .FirstOrDefault(p => (int)p.Element("ProductId") == id);
        if (productElement == null)
        {
            lblUpdateMsg.Text = $"未找到商品ID为 {id} 的商品";
            return;
        }

        // 修改 Price 元素的值
        XElement priceElement = productElement.Element("Price");
        if (priceElement != null)
        {
            priceElement.Value = newPrice.ToString();
        }
        else
        {
            // 如果不存在 Price 节点，则添加（一般不会）
            productElement.Add(new XElement("Price", newPrice));
        }

        doc.Save(xmlFilePath);
        lblUpdateMsg.Text = $"成功修改商品ID {id} 的价格为 {newPrice} 元";
        lblUpdateMsg.ForeColor = System.Drawing.Color.Green;

        // 刷新显示
        LoadXmlToGridView();
        txtUpdateId.Text = "";
        txtNewPrice.Text = "";
    }

    protected void BtnRefresh_Click(object sender, EventArgs e)
    {
        LoadXmlToGridView();
        // 清除所有提示消息
        lblDeleteMsg.Text = "";
        lblUpdateMsg.Text = "";
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DataManage.aspx");
    }
}