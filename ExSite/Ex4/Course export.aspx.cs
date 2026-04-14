using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex4_Choice_export : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindYear();
            BindTerm();
            BindCollege();
        }
    }

    protected void BindYear()
    {
        ddlYear.Items.Clear();
        for (int i = 2020; i <= 2025; i++)
        {
            ddlYear.Items.Add((i - 1) + "-" + i);
        }
    }

    protected void BindTerm()
    {
        ddlTerm.Items.Clear();
        ddlTerm.Items.Add("1");
        ddlTerm.Items.Add("2");
    }

    protected void BindCollege()
    {
        ddlCollege.Items.Clear();
        ddlCollege.Items.Add("计算机学院");
        ddlCollege.Items.Add("外国语学院");
        ddlCollege.Items.Add("机电学院");
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindTeacher();
    }

    protected void BindTeacher()
    {
        ddlTeacher.Items.Clear();

        switch (ddlCollege.SelectedValue)
        {
            case "计算机学院":
                ddlTeacher.Items.Add("曹明");
                ddlTeacher.Items.Add("李妙");
                ddlTeacher.Items.Add("王芳");
                break;
            case "外国语学院":
                ddlTeacher.Items.Add("张强");
                ddlTeacher.Items.Add("王勇男");
                break;
            case "机电学院":
                ddlTeacher.Items.Add("朱兆清");
                ddlTeacher.Items.Add("毛沁程");
                break;
        }
    }

    protected void ddlTeacher_SelectedIndexChanged(object sender, EventArgs e)
    {
        string teacher = ddlTeacher.SelectedValue;

        litTable.Text = "<h3>教师：" + teacher + " 的课表</h3>";
        litTable.Text += "<table border='1' cellpadding='4'>";
        litTable.Text += "<tr><th>星期</th><th>节次</th><th>课程</th><th>教室</th></tr>";
        litTable.Text += "<tr><td>周一</td><td>1-2节</td><td>ASP.NET</td><td>304</td></tr>";
        litTable.Text += "<tr><td>周三</td><td>3-4节</td><td>C#</td><td>205</td></tr>";
        litTable.Text += "</table>";
    }
}