using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Update : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //这里加了安全判断，现在空输入去修改不会报错了
            string categoryId = Request.QueryString["CategoryId"];
            if (string.IsNullOrEmpty(categoryId) || !int.TryParse(categoryId, out int id))
            {
                Response.Redirect("DataManage.aspx");
                return;   
            }
            var category = db.Category.Find(id);

            txtCategoryId.Text = category.CategoryId.ToString();
            txtName.Text = category.Name;
            txtDescn.Text = category.Descn;
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        var category = db.Category.Find(int.Parse(txtCategoryId.Text));
        category.Name = txtName.Text;
        category.Descn = txtDescn.Text;

        db.SaveChanges();
        Response.Redirect("DataManage.aspx");
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DataManage.aspx");
    }
}