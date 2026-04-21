using System;

public partial class Insert : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        Category category = new Category();
        category.Name = txtName.Text;
        category.Descn = txtDescn.Text;

        db.Category.Add(category);
        db.SaveChanges();

        Response.Redirect("DataManage.aspx");
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DataManage.aspx");
    }
}