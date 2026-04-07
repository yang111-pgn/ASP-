using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex4_Calculator_export : System.Web.UI.Page
{
    static string num1 = "0", num2 = "0", total = "", sign = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnOne_Click(object sender, EventArgs e)
    {
        total += "1";
        txtDisplay.Text = total;
    }

    protected void btnTwo_Click(object sender, EventArgs e)
    {
        total += "2";
        txtDisplay.Text = total;
    }

    protected void btnThree_Click(object sender, EventArgs e)
    {
        total += "3";
        txtDisplay.Text = total;
    }

    protected void btnFour_Click(object sender, EventArgs e)
    {
        total += "4";
        txtDisplay.Text = total;
    }

    protected void btnFive_Click(object sender, EventArgs e)
    {
        total += "5";
        txtDisplay.Text = total;
    }

    protected void btnSix_Click(object sender, EventArgs e)
    {
        total += "6";
        txtDisplay.Text = total;
    }

    protected void btnSeven_Click(object sender, EventArgs e)
    {
        total += "7";
        txtDisplay.Text = total;
    }

    protected void btnEight_Click(object sender, EventArgs e)
    {
        total += "8";
        txtDisplay.Text = total;
    }

    protected void btnNine_Click(object sender, EventArgs e)
    {
        total += "9";
        txtDisplay.Text = total;
    }

    protected void btnZero_Click(object sender, EventArgs e)
    {
        total += "0";
        txtDisplay.Text = total;
    }

    protected void btnDot_Click(object sender, EventArgs e)
    {
        if (!total.Contains("."))
        {
            total += ".";
            txtDisplay.Text = total;
        }
    }

    protected void btnCE_Click(object sender, EventArgs e)
    {
        total = "";
        txtDisplay.Text = "";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (sign.Length == 1)
        {
            Count();
            num1 = txtDisplay.Text;
            sign = "+";
        }
        else
        {
            num1 = txtDisplay.Text;
            txtDisplay.Text = "";
            total = "";
            sign = "+";
        }
    }

    protected void btnSubtract_Click(object sender, EventArgs e)
    {
        if (sign.Length == 1)
        {
            Count();
            num1 = txtDisplay.Text;
            sign = "-";
        }
        else
        {
            num1 = txtDisplay.Text;
            txtDisplay.Text = "";
            total = "";
            sign = "-";
        }
    }

    protected void btnMultiply_Click(object sender, EventArgs e)
    {
        if (sign.Length == 1)
        {
            Count();
            num1 = txtDisplay.Text;
            sign = "×";
        }
        else
        {
            num1 = txtDisplay.Text;
            txtDisplay.Text = "";
            total = "";
            sign = "×";
        }
    }

    protected void btnDivide_Click(object sender, EventArgs e)
    {
        if (sign.Length == 1)
        {
            Count();
            num1 = txtDisplay.Text;
            sign = "÷";
        }
        else
        {
            num1 = txtDisplay.Text;
            txtDisplay.Text = "";
            total = "";
            sign = "÷";
        }
    }

    protected void btnSin_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtDisplay.Text)) return;
        double val = double.Parse(txtDisplay.Text);
        double result = Math.Sin(val * Math.PI / 180);
        txtDisplay.Text = result.ToString();
        total = result.ToString();
    }

    protected void btnSquare_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtDisplay.Text)) return;
        double val = double.Parse(txtDisplay.Text);
        double result = val * val;
        txtDisplay.Text = result.ToString();
        total = result.ToString();
    }

    protected void btnEqual_Click(object sender, EventArgs e)
    {
        Count();
    }

    protected void Count()
    {
        num2 = txtDisplay.Text;
        if (num2 == "")
        {
            num2 = "0";
        }

        double n1 = double.Parse(num1);
        double n2 = double.Parse(num2);
        double res = 0;

        switch (sign)
        {
            case "+":
                res = n1 + n2;
                break;
            case "-":
                res = n1 - n2;
                break;
            case "×":
                res = n1 * n2;
                break;
            case "÷":
                res = n1 / n2;
                break;
        }

        txtDisplay.Text = res.ToString();
        num1 = "0";
        num2 = "0";
        total = "";
        sign = "";
    }
}