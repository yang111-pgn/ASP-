using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex5_Register_export : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // 升级后的身份证号验证（长度 + 日期 + 校验码）
    protected void csvIdentity_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string idCard = args.Value.Trim();
        args.IsValid = false;

        if (idCard.Length != 18) return;
        if (!long.TryParse(idCard.Substring(0, 17), out _)) return;

        try
        {
            string year = idCard.Substring(6, 4);
            string month = idCard.Substring(10, 2);
            string day = idCard.Substring(12, 2);
            DateTime birth = DateTime.Parse($"{year}-{month}-{day}");

            int[] weights = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
            char[] validCodes = { '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' };
            int sum = 0;

            for (int i = 0; i < 17; i++)
                sum += (idCard[i] - '0') * weights[i];

            int mod = sum % 11;
            char correct = validCodes[mod];
            char last = char.ToUpper(idCard[17]);

            if (last == correct)
                args.IsValid = true;
        }
        catch
        {
            args.IsValid = false;
        }
    }

    // 确定按钮点击事件
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            lblMsg.Text = "注册成功！";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblMsg.Text = "输入有误，请检查！";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}