using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_add_product : System.Web.UI.Page
{
    DataClassesDataContext linq_obj = new DataClassesDataContext();
    static string imagename2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        fill_category();
        fill_product();
    }
    private void fill_product()
    {
        var id = (from a in linq_obj.product_msts
                  join b in linq_obj.category_msts on a.category equals b.intglcode
                  select new
                  {
                      code = a.intglcode,
                      Category = b.Category,
                      SkuID = a.sku_id,
                      Dressname =a.dressname,
                      img = "../upload/" + a.image,
                  }).ToList();
        grd_admin.DataSource = id;
        grd_admin.DataBind();
    }
    protected void grd_admin_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int code = Convert.ToInt32(grd_admin.DataKeys[e.NewEditIndex].Value.ToString());
        ViewState["code"] = code;
        var id = (from a in linq_obj.product_msts
                  where a.intglcode == code
                  select a).Single();
        txt_SkuID.Text = id.sku_id;
        ddl_category.SelectedValue = id.category.ToString();
        txt_dressname.Text = id.dressname;
        imagename2 = id.image;

        btn_submit.Visible = false;
        btn_update.Visible = true;
    }
   
    protected void grd_admin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        linq_obj.delete_product(Convert.ToInt32(grd_admin.DataKeys[e.RowIndex].Value.ToString()));
        linq_obj.SubmitChanges();
        Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Delete Successfully **')</script>");
        fill_product();
    }
    private void fill_category()
    {
        var id = (from a in linq_obj.category_msts
                  select a).ToList();
        ddl_category.DataSource = id;
        ddl_category.DataBind();
        ddl_category.Items.Insert(0, "-- Select Category --");
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (file_Student_Image.PostedFile.FileName != "")
        {
            file_Student_Image.SaveAs(Request.PhysicalApplicationPath + "/upload/" + file_Student_Image.FileName);
        }

        linq_obj.insert_product(Convert.ToInt32(ddl_category.SelectedValue), txt_SkuID.Text, file_Student_Image.FileName,txt_dressname.Text);
        linq_obj.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='add_product.aspx';</script>'");
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        if (file_Student_Image.PostedFile.FileName != "")
        {
            file_Student_Image.SaveAs(Request.PhysicalApplicationPath + "/upload/" + file_Student_Image.FileName);
            imagename2 = file_Student_Image.FileName;
        }

        linq_obj.update_product(Convert.ToInt32(ViewState["code"]),Convert.ToInt32(ddl_category.SelectedValue), txt_SkuID.Text, file_Student_Image.FileName,txt_dressname.Text);
        linq_obj.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Update Successfully **');window.location='add_product.aspx';</script>'");
    }
    protected void grd_admin_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        grd_admin.DataSource = e.NewPageIndex;
        fill_product();
    }
}