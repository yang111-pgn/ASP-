using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_ArrayDescending : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sInput = txtInput.Text.Trim() + " ";
        int j = 0;
        int[] aInput = new int[10];
        string temp = "0";
        for (int i = 0; i <= sInput.Length - 1; i++)
        {
            if (sInput.Substring(i, 1) != " ")
            {
                temp += sInput.Substring(i, 1);
            }
            else
            {
                aInput[j] = int.Parse(temp);
                j++;
                temp = "0";
            }
        }

        Array.Sort(aInput);
        Array.Reverse(aInput);

        foreach (int i in aInput)
        {
            if (i != 0)
            {
                Response.Write(i + "&nbsp;&nbsp;");
            }
        }
        //string sInput = txtInput.Text.Trim() + " ";
        //List<int> numList = new List<int>(); // 用List替代固定数组，支持任意长度
        //string temp = "";

        //for (int i = 0; i < sInput.Length; i++)
        //{
        //    string c = sInput.Substring(i, 1);
        //    // 允许负号、数字，非空格则拼接
        //    if (c != " ")
        //    {
        //        temp += c;
        //    }
        //    else
        //    {
        //        // 非空且转换成功才加入列表
        //        if (!string.IsNullOrEmpty(temp) && int.TryParse(temp, out int num))
        //        {
        //            numList.Add(num);
        //        }
        //        temp = ""; // 重置临时字符串
        //    }
        //}

        //// 转换为数组排序
        //int[] aInput = numList.ToArray();
        //Array.Sort(aInput);
        //Array.Reverse(aInput);

        //// 输出（移除if(i!=0)，保留0）
        //foreach (int i in aInput)
        //{
        //    Response.Write(i + "&nbsp;&nbsp;");
        //}
    }
}