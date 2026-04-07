using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex4_Choice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 创建 Label 控件显示题目
        Label lblQuestion = new Label
        {
            ID = "lblQuestion",
            Text = "1. Web服务器控件不包括（&nbsp;&nbsp;&nbsp;&nbsp;）。"
        };
        // 将 Label 添加到 PlaceHolder 控件中
        plhChoice.Controls.Add(lblQuestion);

        // 创建 RadioButtonList 控件作为选项
        RadioButtonList rdoltChoice = new RadioButtonList
        {
            ID = "rdoltChoice"
        };
        // 添加选项
        rdoltChoice.Items.Add(new ListItem("A. Wizard", "A"));
        rdoltChoice.Items.Add(new ListItem("B. input", "B"));
        rdoltChoice.Items.Add(new ListItem("C. AdRotator", "C"));
        rdoltChoice.Items.Add(new ListItem("D. Calendar", "D"));
        // 将 RadioButtonList 添加到 PlaceHolder 控件中
        plhChoice.Controls.Add(rdoltChoice);
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // 在 PlaceHolder 中查找 RadioButtonList 控件
        RadioButtonList rdoltChoice = (RadioButtonList)plhChoice.FindControl("rdoltChoice");
        // 将选中结果显示在 lblDisplay 中
        lblDisplay.Text = "您选择了：" + rdoltChoice.SelectedValue;
    }
}