using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class ProductQuery : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 首次加载不自动查询，显示空白
        }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        // 从输入框获取条件
        string containsStr = txtContains.Text.Trim();
        string minPriceText = txtMinPrice.Text.Trim();
        string maxPriceText = txtMaxPrice.Text.Trim();

        // 价格解析（允许为空）
        decimal? minPrice = null;
        decimal? maxPrice = null;
        if (!string.IsNullOrEmpty(minPriceText))
        {
            if (!decimal.TryParse(minPriceText, out decimal min))
            {
                lblMsg.Text = "最低价格格式错误，请输入数字。";
                return;
            }
            minPrice = min;
        }
        if (!string.IsNullOrEmpty(maxPriceText))
        {
            if (!decimal.TryParse(maxPriceText, out decimal max))
            {
                lblMsg.Text = "最高价格格式错误，请输入数字。";
                return;
            }
            maxPrice = max;
        }
        var query = db.Product.AsQueryable(); 

        // 条件1：名称包含指定字符（不区分大小写）
        if (!string.IsNullOrEmpty(containsStr))
        {
            string lowerContains = containsStr.ToLower();
            query = query.Where(p => p.Name.ToLower().Contains(lowerContains));
        }

        // 条件2：价格区间
        if (minPrice.HasValue)
        {
            query = query.Where(p => p.ListPrice >= minPrice.Value);
        }
        if (maxPrice.HasValue)
        {
            query = query.Where(p => p.ListPrice <= maxPrice.Value);
        }

        // 执行查询并投影
        var results = query.Select(p => new
        {
            p.ProductId,
            p.Name,
            Price = p.ListPrice,
            p.CategoryId
        }).ToList();

        gvProduct.DataSource = results;
        gvProduct.DataBind();

        // 显示结果统计
        if (results.Count == 0)
        {
            lblMsg.Text = "没有找到满足条件的商品。";
        }
        else
        {
            lblMsg.Text = $"共找到 {results.Count} 件商品。";
        }
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("DataManage.aspx");
    }
}