using System;
using System.Web.UI;

public partial class _Default : Page
{
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        //循环查找选中的宠物
        for (int i = 0; i < chklsPet.Items.Count; i++)
        {
            if (chklsPet.Items[i].Selected)
            {
                Session["cart"] += chklsPet.Items[i].Text + ",";
            }
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewCart.aspx");
    }
}