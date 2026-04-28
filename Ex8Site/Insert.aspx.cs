using System;
using System.Linq;

public partial class Insert : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 绑定商品分类下拉框
            ddlCategory.DataSource = db.Category.ToList();
            ddlCategory.DataBind();

            // 绑定供应商下拉框
            ddlSupplier.DataSource = db.Supplier.ToList();
            ddlSupplier.DataBind();
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        // 创建新商品对象
        Product product = new Product();
        product.CategoryId = int.Parse(ddlCategory.SelectedValue);
        product.Name = txtName.Text;
        product.ListPrice = decimal.Parse(txtListPrice.Text);
        product.Qty = int.Parse(txtQty.Text);
        product.SuppId = int.Parse(ddlSupplier.SelectedValue);
        product.Descn = txtDescn.Text;

        // 添加到数据库并保存
        db.Product.Add(product);
        db.SaveChanges();

        // 插入成功后返回列表页
        Response.Redirect("RepeaterForm.aspx");
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        // 直接返回列表页
        Response.Redirect("RepeaterForm.aspx");
    }
}