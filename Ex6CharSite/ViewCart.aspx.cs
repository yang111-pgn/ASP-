using System;
using System.Collections.Specialized;
using System.Web.UI;

public partial class ViewCart : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cart"] == null)
        {
            lblMsg.Text = "没有选购任何宠物!";
            btnClear.Enabled = false;
        }
        else
        {
            string strPets = Session["cart"].ToString();
            StringCollection pets = new StringCollection();
            int iPosition = strPets.IndexOf(",");

            while (iPosition != -1)
            {
                string strPet = strPets.Substring(0, iPosition);
                if (strPet != "")
                {
                    pets.Add(strPet);
                    strPets = strPets.Substring(iPosition + 1);
                    iPosition = strPets.IndexOf(",");
                }
            }
            lblMsg.Text = "购物车中现有宠物:";
            chklsPet.DataSource = pets;    //设置chklsPet的数据源
            chklsPet.DataBind();           //显示数据
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Session.Remove("cart");           //清空Session变量cart
        lblMsg.Text = "没有选购任何宠物!";
        chklsPet.Visible = false;
        btnClear.Enabled = false;
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}