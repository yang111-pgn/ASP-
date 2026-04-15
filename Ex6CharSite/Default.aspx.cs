using System;
using System.Web.UI;

public partial class _Default : Page
{
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        // 循环查找选中的宠物（仍使用 Session 存储，但查看购物车不再依赖此逻辑）
        for (int i = 0; i < chklsPet.Items.Count; i++)
        {
            if (chklsPet.Items[i].Selected)
            {
                Session["cart"] += chklsPet.Items[i].Text + ",";
            }
        }
    }

    // 第五题修改部分：跨页面提交后不再需要原 btnView_Click 逻辑，注释掉第四题代码
    protected void btnView_Click(object sender, EventArgs e)
    {
        // 第四题修改部分（已注释）：收集选中的宠物通过 QueryString 传递
        /*
        string selectedPets = "";
        for (int i = 0; i < chklsPet.Items.Count; i++)
        {
            if (chklsPet.Items[i].Selected)
            {
                selectedPets += chklsPet.Items[i].Text + ",";
            }
        }
        if (selectedPets.EndsWith(","))
            selectedPets = selectedPets.Substring(0, selectedPets.Length - 1);
        string encodedPets = Server.UrlEncode(selectedPets);
        Response.Redirect("ViewCart.aspx?pets=" + encodedPets);
        */
        // 跨页面提交后此方法不再被调用，保留空方法体
    }
}