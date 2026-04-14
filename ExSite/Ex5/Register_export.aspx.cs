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

    // 升级后的身份证号验证（长度 + 省份 + 日期 + 校验码）
    protected void csvIdentity_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string idCard = args.Value.Trim();
        args.IsValid = false;

        // 1. 长度必须是18位
        if (idCard.Length != 18) return;

        // 2. 前17位必须是数字
        if (!long.TryParse(idCard.Substring(0, 17), out _)) return;

        try
        {
            // 3. 省份编码校验（核心新增：前2位必须是合法省级代码）
            string provinceCode = idCard.Substring(0, 2);
            if (!IsValidProvinceCode(provinceCode)) return;

            // 4. 出生日期合法性验证
            string year = idCard.Substring(6, 4);
            string month = idCard.Substring(10, 2);
            string day = idCard.Substring(12, 2);
            DateTime birth = DateTime.Parse($"{year}-{month}-{day}");

            // 5. 最后一位校验码验证
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

    /// <summary>
    /// 验证身份证前2位是否为合法省份代码（国家标准）
    /// </summary>
    private bool IsValidProvinceCode(string code)
    {
        // 全国合法省级行政区代码（GB/T 2260）
        HashSet<string> validProvinces = new HashSet<string>
        {
            "11","12","13","14","15", // 华北：京、津、冀、晋、内蒙古
            "21","22","23",           // 东北：辽、吉、黑
            "31","32","33","34","35","36","37", // 华东：沪、苏、浙、皖、闽、赣、鲁
            "41","42","43","44","45","46", // 中南：豫、鄂、湘、粤、桂、琼
            "50","51","52","53","54", // 西南：渝、川、贵、云、藏
            "61","62","63","64","65"  // 西北：陕、甘、青、宁、新
        };
        return validProvinces.Contains(code);
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