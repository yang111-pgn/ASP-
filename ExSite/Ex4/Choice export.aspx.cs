using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex4_Choice_export : System.Web.UI.Page
{
    // 题目数组
    string[,] questions = new string[,]
    {
        {"1. Web服务器控件不包括（    ）。", "A. Wizard", "B. input", "C. AdRotator", "D. Calendar"},
        {"2. C#中字符串关键字是？", "A. int", "B. string", "C. double", "D. bool"},
        {"3. ASP.NET页面后缀是？", "A. .asp", "B. .aspx", "C. .php", "D. .jsp"},
        {"4. 以下哪个是循环语句？", "A. if", "B. for", "C. switch", "D. try"},
        {"5. 数据库主键作用是？", "A. 唯一", "B. 重复", "C. 空值", "D. 关联"}
    };

    // 控件数组
    Label[] lblQuestions;
    RadioButtonList[] rblList;

    protected void Page_Load(object sender, EventArgs e)
    {
        CreateQuestions();
    }

    private void CreateQuestions()
    {
        lblQuestions = new Label[5];
        rblList = new RadioButtonList[5];

        for (int i = 0; i < 5; i++)
        {
            lblQuestions[i] = new Label();
            lblQuestions[i].ID = "lblQ" + i;
            lblQuestions[i].Text = questions[i, 0];
            plhChoice.Controls.Add(lblQuestions[i]);
            plhChoice.Controls.Add(new LiteralControl("<br/>"));

            rblList[i] = new RadioButtonList();
            rblList[i].ID = "rbl" + i;
            rblList[i].Items.Add(questions[i, 1]);
            rblList[i].Items.Add(questions[i, 2]);
            rblList[i].Items.Add(questions[i, 3]);
            rblList[i].Items.Add(questions[i, 4]);
            plhChoice.Controls.Add(rblList[i]);
            plhChoice.Controls.Add(new LiteralControl("<br/><br/>"));
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblDisplay.Text = "";

        for (int i = 0; i < 5; i++)
        {
            RadioButtonList rbl = (RadioButtonList)plhChoice.FindControl("rbl" + i);

            if (rbl != null && rbl.SelectedItem != null)
            {
                lblDisplay.Text += "第" + (i + 1) + "题：" + rbl.SelectedItem.Text + "<br/>";
            }
            else
            {
                lblDisplay.Text += "第" + (i + 1) + "题：未选择<br/>";
            }
        }
    }
}