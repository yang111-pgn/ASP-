using System;
using System.Linq;

public partial class Update : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string productIdStr = Request.QueryString["ProductId"];
            int productId;

            // 如果没有ID 或者 ID不是数字 → 直接跳回列表页
            if (!int.TryParse(productIdStr, out productId))
            {
                Response.Redirect("RepeaterForm.aspx");
                return;
            }

            // 绑定分类
            var categories = db.Category.ToList();
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataSource = categories;
            ddlCategory.DataBind();

            // 绑定供应商
            var suppliers = db.Supplier.ToList();
            ddlSupplier.DataTextField = "Name";
            ddlSupplier.DataValueField = "SuppId";
            ddlSupplier.DataSource = suppliers;
            ddlSupplier.DataBind();

            // 查找商品
            var product = db.Product.Find(productId);
            if (product == null)
            {
                Response.Redirect("RepeaterForm.aspx");
                return;
            }

            // 赋值到页面
            txtProductId.Text = productId.ToString();
            txtProductId.ReadOnly = true;

            ddlCategory.SelectedValue = product.CategoryId.ToString();
            txtName.Text = product.Name;
            txtListPrice.Text = product.ListPrice.ToString();
            txtQty.Text = product.Qty.ToString();
            ddlSupplier.SelectedValue = product.SuppId.ToString();
            txtDescn.Text = product.Descn;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int productId = int.Parse(txtProductId.Text);
        var product = db.Product.Find(productId);

        product.CategoryId = int.Parse(ddlCategory.SelectedValue);
        product.Name = txtName.Text;
        product.ListPrice = decimal.Parse(txtListPrice.Text);
        product.Qty = int.Parse(txtQty.Text);
        product.SuppId = int.Parse(ddlSupplier.SelectedValue);
        product.Descn = txtDescn.Text;

        db.SaveChanges();
        Response.Redirect("RepeaterForm.aspx");
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("RepeaterForm.aspx");
    }
}