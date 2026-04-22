using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataManage : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Bind()
    {
        var results = db.Category.ToList();
        gvCategory.DataSource = results;
        gvCategory.DataBind();
    }

    protected void BtnQueryAll_Click(object sender, EventArgs e)
    {
        Bind();
    }

    protected void BtnFuzzy_Click(object sender, EventArgs e)
    {
        Response.Redirect("FuzzyQuery.aspx");
    }

    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("Insert.aspx");
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Update.aspx?CategoryId=" + txtCategoryId.Text);
    }
    protected void BtnProductQuery_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductQuery.aspx");
    }
    protected void BtnProductManage_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductManage.aspx");
    }
    protected void BtnManageProductXml_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageProductXml.aspx");
    }
    protected void BtnProductToXml_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductToXml.aspx");
    }

    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        if (!int.TryParse(txtCategoryId.Text, out int id)) return;
        var category = db.Category.Find(id);
        if (category != null)
        {
            db.Category.Remove(category);
            db.SaveChanges();
        }
        Bind();
    }
}