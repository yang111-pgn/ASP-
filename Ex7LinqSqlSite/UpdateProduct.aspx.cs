using System;
using System.Linq;

public partial class UpdateProduct : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!int.TryParse(Request.QueryString["ProductId"], out int id))
            {
                Response.Redirect("ProductManage.aspx");
                return;
            }
            var product = db.Product.Find(id);
            if (product == null)
            {
                Response.Redirect("ProductManage.aspx");
                return;
            }
            txtProductId.Text = product.ProductId.ToString();
            txtName.Text = product.Name;
            txtListPrice.Text = product.ListPrice.ToString();
            txtUnitCost.Text = product.UnitCost?.ToString() ?? "";
            txtQty.Text = product.Qty.ToString();
            txtCategoryId.Text = product.CategoryId.ToString();
            txtSuppId.Text = product.SuppId?.ToString() ?? "";
            txtDescn.Text = product.Descn;
            txtImage.Text = product.Image;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        int id = int.Parse(txtProductId.Text);
        var product = db.Product.Find(id);
        if (product == null)
        {
            lblMsg.Text = "商品不存在";
            return;
        }

        // 验证
        if (string.IsNullOrWhiteSpace(txtName.Text))
        {
            lblMsg.Text = "商品名称不能为空";
            return;
        }
        if (!decimal.TryParse(txtListPrice.Text, out decimal price))
        {
            lblMsg.Text = "价格格式错误";
            return;
        }
        if (!int.TryParse(txtCategoryId.Text, out int cid))
        {
            lblMsg.Text = "分类ID必须是整数";
            return;
        }
        if (db.Category.Find(cid) == null)
        {
            lblMsg.Text = "分类不存在";
            return;
        }

        product.Name = txtName.Text;
        product.ListPrice = price;
        product.UnitCost = string.IsNullOrEmpty(txtUnitCost.Text) ? (decimal?)null : decimal.Parse(txtUnitCost.Text);
        product.Qty = string.IsNullOrEmpty(txtQty.Text) ? 0 : int.Parse(txtQty.Text);
        product.CategoryId = cid;
        product.SuppId = string.IsNullOrEmpty(txtSuppId.Text) ? (int?)null : int.Parse(txtSuppId.Text);
        product.Descn = txtDescn.Text;
        product.Image = txtImage.Text;

        db.SaveChanges();
        Response.Redirect("ProductManage.aspx");
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductManage.aspx");
    }
}