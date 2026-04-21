using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FuzzyQuery : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        var list = db.Category.Where(c => c.Name.Contains(txtSearch.Text)).ToList();
        gvCategory.DataSource = list;
        gvCategory.DataBind();
        lblMsg.Text = list.Count == 0 ? "没有满足条件的数据！" : "";
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DataManage.aspx");
    }
}