using System;
using System.Linq;
using System.Xml.Linq;
using System.Web.UI;

public partial class ProductToXml : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GenerateProductXml();
        }
    }

    private void GenerateProductXml()
    {
        try
        {
            // 1. 获取所有商品数据（使用 LINQ to Entities）
            var products = db.Product 
                             .Select(p => new
                             {
                                 p.ProductId,
                                 p.Name,
                                 ListPrice = p.ListPrice,
                                 p.UnitCost,
                                 p.Qty,
                                 p.CategoryId,
                                 p.SuppId,
                                 p.Descn,
                                 p.Image
                             })
                             .ToList();

            // 2. 创建 XML 文档
            XDocument doc = new XDocument(
                new XDeclaration("1.0", "utf-8", "yes"),
                new XComment("商品表数据导出"),
                new XElement("Products",
                    from p in products
                    select new XElement("Product",
                        new XElement("ProductId", p.ProductId),
                        new XElement("Name", p.Name),
                        new XElement("ListPrice", p.ListPrice),
                        new XElement("UnitCost", p.UnitCost ?? 0),
                        new XElement("Qty", p.Qty),
                        new XElement("CategoryId", p.CategoryId),
                        new XElement("SuppId", p.SuppId ?? 0),
                        new XElement("Descn", p.Descn ?? ""),
                        new XElement("Image", p.Image ?? "")
                    )
                )
            );

            // 3. 保存 XML 文件到服务器（可选）
            string xmlFilePath = Server.MapPath("~/Product.xml");
            doc.Save(xmlFilePath);

            // 4. 也可以直接输出到浏览器（如下一行注释）
            // Response.ContentType = "text/xml";
            // doc.Save(Response.Output);

            // 5. 显示成功信息并提供下载链接
            lblMsg.Text = $"成功生成 XML 文件，共 {products.Count} 条记录。<br />";
            lblMsg.Text += $"保存路径：<a href='Product.xml' target='_blank'>Product.xml</a>";

            // 若需要直接跳转到 XML 文件（类似 TableToXml 的行为），取消下面注释：
            // Response.Redirect("~/Product.xml");
        }
        catch (Exception ex)
        {
            lblMsg.Text = "生成 XML 时出错：" + ex.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DataManage.aspx");
    }
}