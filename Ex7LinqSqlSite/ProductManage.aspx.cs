using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class ProductManage : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        var products = db.Product.Select(p => new
        {
            p.ProductId,
            p.Name,
            p.ListPrice,
            p.CategoryId,
            p.UnitCost,
            p.Qty,
            p.SuppId
        }).ToList();
        gvProduct.DataSource = products;
        gvProduct.DataBind();
    }

    protected void BtnQueryAll_Click(object sender, EventArgs e)
    {
        BindData();
    }

    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("InsertProduct.aspx");
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (!int.TryParse(txtProductId.Text, out int id))
        {
            // 提示错误
            return;
        }
        Response.Redirect("UpdateProduct.aspx?ProductId=" + id);
    }

    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        if (!int.TryParse(txtProductId.Text, out int id))
            return;
        var product = db.Product.Find(id);
        if (product != null)
        {
            db.Product.Remove(product);
            db.SaveChanges();
        }
        BindData();
        txtProductId.Text = "";
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DataManage.aspx");
    }
}