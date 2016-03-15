using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Add_master : System.Web.UI.Page
{
    DataClassesDataContext linq_obj = new DataClassesDataContext();
    admin_login_mst login_obj = new admin_login_mst();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        fill_grid();
        fill_grid2();
        fill_grid3();
        fill_ecommerce();
        fill_commision();
    }
    private string base64Encode(string sData)
    {
        try
        {
            byte[] encData_byte = new byte[sData.Length];

            encData_byte = System.Text.Encoding.UTF8.GetBytes(sData);

            string encodedData = Convert.ToBase64String(encData_byte);

            return encodedData;

        }
        catch (Exception ex)
        {
            throw new Exception("Error in base64Encode" + ex.Message);
        }
    }
    private void fill_grid()
    {
        try
        {
            var id = (from a in linq_obj.Ecommerce_msts
                      select new
                      {
                          code = a.intglcode,
                          ecommerce_name = a.ecommerce_name,
                      }).ToList();
            grd_admin.DataSource = id;
            grd_admin.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    private void fill_grid2()
    {
        try
        {
            var id = (from a in linq_obj.category_msts
                      select new
                      {
                          code = a.intglcode,
                          Category = a.Category,
                      }).ToList();
            GridView1.DataSource = id;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    private void fill_grid3()
    {
        try
        {
            var id = (from a in linq_obj.buyfrom_msts
                      select new
                      {
                          code = a.intglcode,
                          BuyFrom = a.buyfrom,
                      }).ToList();
            GridView2.DataSource = id;
            GridView2.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    private void fill_commision()
    {
        var id = (from a in linq_obj.commision_msts
                  join b in linq_obj.Ecommerce_msts on a.order_from equals b.intglcode
                  select new
                  {
                      code = a.intglcode,
                      OrderFrom=b.ecommerce_name,
                      Comission=a.commision,
                      Shipping=a.shipping
                  }).ToList();
        grd_commision.DataSource = id;
        grd_commision.DataBind();
    }
    private void fill_ecommerce()
    {
        var id = (from a in linq_obj.Ecommerce_msts
                  select a).ToList();
        ddl_orderfrom.DataSource = id;
        ddl_orderfrom.DataBind();
        ddl_orderfrom.Items.Insert(0, "-- Select Order From --");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        linq_obj.insert_ecommerce(txtEcommerce.Text);
        linq_obj.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='Add_master.aspx';</script>'");
        
        clear();
        fill_grid();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    private void clear()
    {
        txtEcommerce.Text = "";
    }
    protected void grd_admin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_admin.PageIndex = e.NewPageIndex;
        fill_grid();
    }
    protected void grd_admin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        linq_obj.delete_ecommerce(Convert.ToInt32(grd_admin.DataKeys[e.RowIndex].Value.ToString()));
        linq_obj.SubmitChanges();
        fill_grid();
        Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Delete Successfully **')</script>");
    }
    protected void grd_admin_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int code = Convert.ToInt32(grd_admin.DataKeys[e.NewEditIndex].Value.ToString());
        ViewState["code"] = code;
        var id = (from a in linq_obj.Ecommerce_msts
                  where a.intglcode == code
                  select a).Single();

        txtEcommerce.Text = id.ecommerce_name;
        btn_submit_ecommerce.Visible = false;
        btn_update_ecommerce.Visible = true;
    }
    protected void btn_update_ecommerce_Click(object sender, EventArgs e)
    {
        linq_obj.update_ecommerce(Convert.ToInt32(ViewState["code"].ToString()), txtEcommerce.Text);
        linq_obj.SubmitChanges();
        Response.Redirect("Add_master.aspx");
    }
    protected void btn_submit_ecommerce_Click(object sender, EventArgs e)
    {
        linq_obj.insert_ecommerce(txtEcommerce.Text);
        linq_obj.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='Add_master.aspx';</script>'");
        clear();
        fill_grid();
    }
    protected void btn_submit_category_Click(object sender, EventArgs e)
    {
        linq_obj.insert_category(txt_Category.Text);
        linq_obj.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='Add_master.aspx';</script>'");
        clear();
        fill_grid2();
    }
    protected void btn_update_category_Click(object sender, EventArgs e)
    {
        linq_obj.update_category(Convert.ToInt32(ViewState["code"].ToString()), txt_Category.Text);
        linq_obj.SubmitChanges();
        fill_grid2();
        Response.Redirect("Add_master.aspx");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int code = Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value.ToString());
        ViewState["code"] = code;
        var id = (from a in linq_obj.category_msts
                  where a.intglcode == code
                  select a).Single();

        txt_Category.Text = id.Category;
        btn_submit_category.Visible = false;
        btn_update_category.Visible = true;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill_grid2();
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        fill_grid3();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        linq_obj.delete_category_mst(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        linq_obj.SubmitChanges();
        Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Delete Successfully **')</script>");
        fill_grid2();
    }
    protected void btn_submit_buy_form_Click(object sender, EventArgs e)
    {
        linq_obj.insert_buyfrom(txt_Buy_From.Text);
        linq_obj.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='Add_master.aspx';</script>'");
        clear();
        fill_grid3();
    }
    protected void btn_update_buy_form_Click(object sender, EventArgs e)
    {
        linq_obj.update_buyfrom(Convert.ToInt32(ViewState["code"].ToString()), txt_Buy_From.Text);
        linq_obj.SubmitChanges();
        fill_grid3();
        Response.Redirect("Add_master.aspx");
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        linq_obj.delete_buyfrom(Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString()));
        linq_obj.SubmitChanges();
        Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Delete Successfully **')</script>");
        fill_grid3();
    }
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int code = Convert.ToInt32(GridView2.DataKeys[e.NewEditIndex].Value.ToString());
        ViewState["code"] = code;
        var id = (from a in linq_obj.buyfrom_msts
                  where a.intglcode == code
                  select a).Single();

        txt_Buy_From.Text = id.buyfrom;
        btn_submit_buy_form.Visible = false;
        btn_update_buy_form.Visible = true;
    }
    protected void btn_submit_commision_Click(object sender, EventArgs e)
    {
        linq_obj.insert_commision(Convert.ToInt32(ddl_orderfrom.SelectedValue), txt_comission.Text, txt_Shipping.Text);
        linq_obj.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='Add_master.aspx';</script>'");
        clear();
        fill_commision();
    }
    protected void btn_update_commision_Click(object sender, EventArgs e)
    {
        linq_obj.update_commision(Convert.ToInt32(ViewState["code"].ToString()),Convert.ToInt32(ddl_orderfrom.SelectedValue),txt_comission.Text,txt_Shipping.Text);
        linq_obj.SubmitChanges();
        fill_commision();
        Response.Redirect("Add_master.aspx");
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Update Successfully **');window.location='Add_master.aspx';</script>'");
    }
    protected void grd_commision_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int code = (Convert.ToInt32(grd_admin.DataKeys[e.NewEditIndex].Value.ToString()));
        ViewState["code"] = code;
        var id = (from a in linq_obj.commision_msts
                  where a.intglcode == code
                  select a).Single();

        ddl_orderfrom.SelectedValue = id.order_from.ToString();
        txt_comission.Text = id.commision;
        txt_Shipping.Text = id.shipping;

        btn_submit_commision.Visible = false;
        btn_update_commision.Visible = true;
    }
    protected void grd_commision_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_commision.PageIndex = e.NewPageIndex;
        fill_commision();
    }
    protected void grd_commision_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        linq_obj.delete_commision(Convert.ToInt32(grd_commision.DataKeys[e.RowIndex].Value.ToString()));
        linq_obj.SubmitChanges();
        fill_commision();
        Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Delete Successfully **')</script>");
    }
}