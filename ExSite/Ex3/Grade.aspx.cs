using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_Grade : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        float fgrade = float.Parse(txtInput.Text);
        int igrade = (int)(fgrade / 10);
        switch (igrade)
        {
            case 10:
            case 9:
                lblDisplay.Text = "优秀";
                break;
            case 8:
                lblDisplay.Text = "良好";
                break;
            case 7:
                lblDisplay.Text = "中等";
                break;
            case 6:
                lblDisplay.Text = "及格";
                break;
            default:
                lblDisplay.Text = "不及格";
                break;
        }
        //        float fGrade;
        //        string result = "";

        //        //2.第一步：合法性判断 - 是否为有效数字
        //        if (!float.TryParse(txtInput.Text, out fGrade))
        //        {
        //            lblDisplay.Text = "错误：请输入有效的数字！";
        //            return;
        //        }

        //        //3.第二步：合法性判断 - 成绩范围是否在 0~100 之间
        //        if (fGrade < 0 || fGrade > 100)
        //        {
        //            lblDisplay.Text = "错误：成绩必须在 0 ~ 100 之间！";
        //            return;
        //        }

        //        int iGrade = (int)(fGrade / 10);
        //        switch (iGrade)
        //        {
        //            case 10:
        //            case 9:
        //                result = "优秀";
        //                break;
        //            case 8:
        //                result = "良好";
        //                break;
        //            case 7:
        //                result = "中等";
        //                break;
        //            case 6:
        //                result = "及格";
        //                break;
        //            default:
        //                result = "不及格";
        //                break;
        //        }
        //        lblDisplay.Text = result;
    //}
}
}