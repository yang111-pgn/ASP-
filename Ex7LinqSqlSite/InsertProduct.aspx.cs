using System;

public partial class InsertProduct : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnCheckCategory_Click(object sender, EventArgs e)
    {
        if (!int.TryParse(txtCategoryId.Text, out int cid))
        {
            lblMsg.Text = "分类ID必须是数字";
            return;
        }
        var cat = db.Category.Find(cid);
        if (cat == null)
            lblMsg.Text = "分类不存在！";
        else
            lblMsg.Text = $"分类存在：{cat.Name}";
    }

    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        // 验证必填项
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
        // 检查分类是否存在
        if (db.Category.Find(cid) == null)
        {
            lblMsg.Text = "分类不存在，请先添加分类";
            return;
        }
        // 可选字段处理
        decimal? unitCost = null;
        if (!string.IsNullOrEmpty(txtUnitCost.Text))
        {
            if (!decimal.TryParse(txtUnitCost.Text, out decimal uc))
            {
                lblMsg.Text = "成本格式错误";
                return;
            }
            unitCost = uc;
        }
        int qty = 0;
        if (!string.IsNullOrEmpty(txtQty.Text))
        {
            if (!int.TryParse(txtQty.Text, out qty))
            {
                lblMsg.Text = "库存数量必须是整数";
                return;
            }
        }
        int? suppId = null;
        if (!string.IsNullOrEmpty(txtSuppId.Text))
        {
            if (!int.TryParse(txtSuppId.Text, out int sid))
            {
                lblMsg.Text = "供应商ID必须是整数";
                return;
            }
            suppId = sid;
        }
        string descn = txtDescn.Text.Trim();
        string image = txtImage.Text.Trim();

        Product product = new Product
        {
            Name = txtName.Text,
            ListPrice = price,
            UnitCost = unitCost,
            Qty = qty,
            CategoryId = cid,
            SuppId = suppId,
            Descn = descn,
            Image = image
        };

        db.Product.Add(product);
        db.SaveChanges();
        Response.Redirect("ProductManage.aspx");
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductManage.aspx");
    }
}