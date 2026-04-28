using System;
using System.Linq;
// 必须添加这个命名空间，GridView 相关事件参数才会生效
using System.Web.UI.WebControls;

public partial class ProShow : System.Web.UI.Page
{
    MyPetShopEntities db = new MyPetShopEntities();

    private void Bind()
    {
        int categoryId = int.Parse(ddlCategory.SelectedValue);
        //在Product中查找满足条件的商品
        var products = db.Product.Where(p => p.CategoryId == categoryId).ToList();
        //将查找到的商品绑定到gvProduct
        gvProduct.DataSource = products;
        gvProduct.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //页面首次载入时填充ddlCategory下拉列表框
        if (!IsPostBack)
        {
            var categories = db.Category.ToList();
            ddlCategory.DataSource = categories;
            ddlCategory.DataBind();
            Bind(); //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
        }
    }

    protected void DdlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind(); //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
    }

    protected void GvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvProduct.PageIndex = e.NewPageIndex; //设置当前页索引值为新的页面索引值
        Bind(); //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
    }
}