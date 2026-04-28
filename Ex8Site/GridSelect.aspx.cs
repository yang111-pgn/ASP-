using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class GridSelect : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    // 绑定数据的方法
    private void BindData()
    {
        var products = db.Product.OrderBy(p => p.ProductId).ToList();
        gvProduct.DataSource = products;
        gvProduct.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    // 全选/全不选（当前页）
    protected void chkAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkAll = (CheckBox)sender;
        bool isChecked = chkAll.Checked;

        foreach (GridViewRow row in gvProduct.Rows)
        {
            CheckBox chkItem = row.FindControl("chkItem") as CheckBox;
            if (chkItem != null)
            {
                chkItem.Checked = isChecked;
            }
        }
    }

    // 分页事件
    protected void gvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvProduct.PageIndex = e.NewPageIndex;
        BindData();
    }

    protected void gvProduct_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    }

    protected void gvProduct_DataBound(object sender, EventArgs e)
    {
        if (gvProduct.HeaderRow == null) return;

        CheckBox chkAll = gvProduct.HeaderRow.FindControl("chkAll") as CheckBox;
        if (chkAll == null) return;

        bool allChecked = true;
        foreach (GridViewRow row in gvProduct.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkItem = row.FindControl("chkItem") as CheckBox;
                if (chkItem != null && !chkItem.Checked)
                {
                    allChecked = false;
                    break;
                }
            }
        }
        chkAll.Checked = allChecked;
    }
}