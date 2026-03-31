using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Ex3_ArrayListDescending : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // 1. 获取输入，去除首尾空格
        string sInput = txtInput.Text.Trim();
        if (string.IsNullOrEmpty(sInput))
        {
            Response.Write("请输入整数，用空格分隔！");
            return;
        }

        try
        {
            // 2. 按空格分割字符串，过滤空项
            string[] strArray = sInput.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            // 3. 创建ArrayList集合
            ArrayList arrayList = new ArrayList();

            // 4. 遍历转换，支持正、负、0
            foreach (string s in strArray)
            {
                if (int.TryParse(s, out int num))
                {
                    arrayList.Add(num);
                }
                else
                {
                    Response.Write($"输入包含非法字符：{s}，请输入有效整数！");
                    return;
                }
            }

            // 5. 降序排序：先升序，再反转
            arrayList.Sort();
            arrayList.Reverse();

            // 6. 输出结果（保留0和负数）
            Response.Write("ArrayList 降序结果：<br/>");
            foreach (int num in arrayList)
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