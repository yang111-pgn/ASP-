using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_ListDescending : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sInput = txtInput.Text.Trim();
        if (string.IsNullOrEmpty(sInput))
        {
            Response.Write("请输入整数，用空格分隔！");
            return;
        }

        try
        {
            string[] strArray = sInput.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            List<int> list = new List<int>();
            foreach (string s in strArray)
            {
                if (int.TryParse(s, out int num))
                {
                    list.Add(num);
                }
                else
                {
                    Response.Write($"输入包含非法字符：{s}，请输入有效整数！");
                    return;
                }
            }
            // 5. 降序排序
            // 方式1：先升序再反转（兼容原代码逻辑）
            list.Sort();
            list.Reverse();

            // 方式2：直接降序排序（更简洁）
            // list.Sort((a, b) => b.CompareTo(a));
            Response.Write("List<T> 降序结果：<br/>");
            foreach (int num in list)
            {
                Response.Write(num + "&nbsp;&nbsp;");
            }
        }
        catch (Exception ex)
        {
            Response.Write($"程序错误：{ex.Message}");
        }
    }
}