using System;
using System.Collections.Specialized;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 第五题修改部分：使用跨页面提交技术，通过 PreviousPage 获取前一页的控件值
        if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
        {
            // 获取前一页的 CheckBoxList 控件
            CheckBoxList previousCheckBoxList = (CheckBoxList)PreviousPage.FindControl("chklsPet");
            if (previousCheckBoxList != null)
            {
                StringCollection selectedPets = new StringCollection();
                foreach (ListItem item in previousCheckBoxList.Items)
                {
                    if (item.Selected)
                    {
                        selectedPets.Add(item.Text);
                    }
                }

                if (selectedPets.Count > 0)
                {
                    lblMsg.Text = "您选中的宠物:";
                    chklsPet.DataSource = selectedPets;
                    chklsPet.DataBind();
                }
                else
                {
                    lblMsg.Text = "没有选购任何宠物!";
                    chklsPet.Visible = false;
                    btnClear.Enabled = false;
                }
            }
            else
            {
                lblMsg.Text = "无法获取上一页的宠物列表!";
                chklsPet.Visible = false;
            }
        }
        else
        {
            // 第四题修改部分（已注释）：原 QueryString 方式获取数据
            /*
            string petsQuery = Request.QueryString["pets"];
            if (string.IsNullOrEmpty(petsQuery))
            {
                lblMsg.Text = "没有选购任何宠物!";
                chklsPet.Visible = false;
                btnClear.Enabled = false;
            }
            else
            {
                string decodedPets = Server.UrlDecode(petsQuery);
                string[] petArray = decodedPets.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                StringCollection pets = new StringCollection();
                pets.AddRange(petArray);
                lblMsg.Text = "您选中的宠物:";
                chklsPet.DataSource = pets;
                chklsPet.DataBind();
            }
            */
            // 非跨页面提交时的处理（如直接访问该页）
            lblMsg.Text = "请从主页点击“查看购物车”访问。";
            chklsPet.Visible = false;
            btnClear.Enabled = false;
        }
    }

    // 清空购物车按钮已隐藏，保留空实现
    protected void btnClear_Click(object sender, EventArgs e)
    {
        // 由于数据来自跨页面提交，此方法不再使用
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}