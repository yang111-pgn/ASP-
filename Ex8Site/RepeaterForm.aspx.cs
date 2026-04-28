using System;
using System.Linq;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer; // 引入 AspNetPager 命名空间

public partial class RepeaterForm : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    private void BindDataToRepeater()
    {
        // 1. 获取所有商品数据作为原始数据源
        var allProducts = db.Product.OrderByDescending(p => p.ProductId).ToList();

        // 2. 使用 PagedDataSource 封装数据源，并设置分页属性
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = allProducts;
        pds.AllowPaging = true;
        pds.PageSize = AspNetPager1.PageSize;  
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1; 

        // 3. 将分页后的数据绑定到 Repeater 控件
        rptProduct.DataSource = pds;
        rptProduct.DataBind();

        // 4. 配置 AspNetPager 控件的总记录数
        AspNetPager1.RecordCount = allProducts.Count;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 页面首次加载时，设置当前页码为第 1 页
            AspNetPager1.CurrentPageIndex = 1;
            // 调用绑定数据方法
            BindDataToRepeater();
        }
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindDataToRepeater();
    }
}