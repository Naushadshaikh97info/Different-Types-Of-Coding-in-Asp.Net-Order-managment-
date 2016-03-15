using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Return_Report : System.Web.UI.Page
{
    DataClassesDataContext linq_obj = new DataClassesDataContext();
    static int abc;
    static int ddl_Dress_Name1 = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        fill_order_from();
     
        fill_buyfrom();
        fill_order();
      
        fill_ddl_status();
        fill_skuid5();
    }
    private void fill_order_from()
    {
        var id = (from a in linq_obj.Ecommerce_msts
                  select a).ToList();
     

        ddl_Order_From1.DataSource = id;
        ddl_Order_From1.DataBind();
        ddl_Order_From1.Items.Insert(0, "-- Select OrderFrom --");
    }
   
    private void fill_buyfrom()
    {
        var id = (from a in linq_obj.buyfrom_msts
                  select a).ToList();
     

        ddl_BuyFrom1.DataSource = id;
        ddl_BuyFrom1.DataBind();
        ddl_BuyFrom1.Items.Insert(0, "-- Select Buy From --");

    }
   
    private void fill_skuid5()
    {
        var id = (from a in linq_obj.product_msts
                  select a).ToList();

        ddl_Sku_Id5.DataSource = id;
        ddl_Sku_Id5.DataBind();
        ddl_Sku_Id5.Items.Insert(0, "-- Select Buy Sku Id --");
    }
   
    private void fill_ddl_status()
    {
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        try
        {
            fill_order();
        }
        catch (Exception)
        {

        }
    }
    private void fill_order()
    {
        int orderfrom = 0, skuid = 0, buyrfom = 0;

        DateTime from1 = DateTime.Now;

        DateTime To1 = DateTime.Now;

        if (ddl_Order_From1.SelectedIndex == 0)
        {
            orderfrom = 0;
        }
        else
        {
            orderfrom = Convert.ToInt32(ddl_Order_From1.SelectedValue);
        }
        if (ddl_Sku_Id5.SelectedIndex == 0)
        {
            skuid = 0;
        }
        else if (ddl_Sku_Id5.SelectedValue != "")
        {
            skuid = Convert.ToInt32(ddl_Sku_Id5.SelectedValue);
        }
        if (ddl_BuyFrom1.SelectedIndex == 0)
        {
            buyrfom = 0;
        }
        else
        {
            buyrfom = Convert.ToInt32(ddl_BuyFrom1.SelectedValue);
        }
        if (txt_from.Text == "")
        {

        }
        else
        {
            from1 = Convert.ToDateTime(txt_from.Text);
        }

        if (txt_to.Text == "")
        {

        }
        else
        {
            To1 = Convert.ToDateTime(txt_to.Text);
        }

        //where a.date >= Convert.ToDateTime(txt_from.Text) && a.date <= Convert.ToDateTime(txt_to.Text)
        var id = (from a in linq_obj.order_msts
                  join b in linq_obj.Ecommerce_msts on a.Orderfrom_id equals b.intglcode
                  join c in linq_obj.product_msts on a.skuid equals c.intglcode
                  join d in linq_obj.buyfrom_msts on a.bayfrom_id equals d.intglcode
                  join e in linq_obj.commision_msts on a.Orderfrom_id equals e.intglcode
                  where a.status == "Return" && (a.datetime >= from1 || txt_from.Text == "") && (a.datetime <= To1 || txt_to.Text == "") && (a.Orderfrom_id == orderfrom || orderfrom == 0) && (a.Order_id == txt_OrderId1.Text || txt_OrderId1.Text == "") && (a.skuid == skuid || skuid == 0) && (a.bayfrom_id == buyrfom || buyrfom == 0)
                  select new
                  {
                      code = a.intglcode,
                      date = a.datetime.Value.ToShortDateString(),
                      OrderFrom = b.ecommerce_name,
                      OrderId = a.Order_id,
                      KRTCode = a.krtcode,
                      SkuId = c.sku_id,
                      BuyerName = a.bayername,
                      ContactNo = a.bayercontact,
                      Qty = a.qty,
                      BuyPrice = a.bayerprice,
                      SellPrice = a.sellprice,
                      EcommerceCharge = e.commision,
                      Shipping = e.shipping,
                      Profit = "00",
                      img = "../upload/" + c.image,
                      Buyerfrom = d.buyfrom,
                      orderid = a.Order_id
                  }).ToList();
        grd_admin.DataSource = id;
        grd_admin.DataBind();

        if (id.Count == 0)
        {
            Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Result Not Found **')</script>");
        }

        foreach (GridViewRow row in grd_admin.Rows)
        {
            LinkButton lnk = row.FindControl("lnk_order") as LinkButton;
            LinkButton buytotal = row.FindControl("lnk_buytotal") as LinkButton;
            LinkButton SellTotal = row.FindControl("lnk_SellTotal") as LinkButton;
            LinkButton Profit = row.FindControl("lnk_Profit") as LinkButton;
            HiddenField hiden_code = row.FindControl("hiden_code") as HiddenField;
            DropDownList ddl_status = row.FindControl("ddl_status") as DropDownList;

            var id2 = (from a in linq_obj.order_msts
                       join e in linq_obj.commision_msts on a.Orderfrom_id equals e.intglcode
                       where a.intglcode == Convert.ToInt32(hiden_code.Value)
                       select a).Single();

            //ddl_status.SelectedItem.Text = id2.status;

            double qty = Convert.ToDouble(id2.qty);

            double buyprice2 = Convert.ToDouble(id2.bayerprice);
            double buytotal2 = (qty * buyprice2);
            buytotal.Text = Convert.ToString(buytotal2);


            double Sellprice2 = Convert.ToDouble(id2.sellprice);
            double SellTotal2 = (qty * Sellprice2);
            SellTotal.Text = Convert.ToString(SellTotal2);

            double ecoomerccharge = Convert.ToDouble(id[0].EcommerceCharge);

            double Shipping = Convert.ToDouble(id[0].Shipping);

            double ecoomerccharge2 = (SellTotal2 * ecoomerccharge / 100);

            double profit2 = (SellTotal2 - buytotal2 + ecoomerccharge2 + Shipping);

            Profit.Text = Convert.ToString(profit2);


            //if (id2.status == "Return")
            //{
            //    lnk.ForeColor = System.Drawing.Color.Red;
            //}
            //else if (id2.status == "Return2")
            //{
            //    lnk.ForeColor = System.Drawing.Color.Green;
            //    ddl_status.SelectedValue = "Return";
            //}

            //if (id2.retrun_out == "Returnout")
            //{
            //    lnk.ForeColor = System.Drawing.Color.Green;
            //    if (id2.status == "Return")
            //    {
            //        lnk.ForeColor = System.Drawing.Color.Red;
            //    }
            //}
        }

        ddl_Order_From1.SelectedIndex = 0;
        txt_OrderId1.Text = "";
        ddl_Sku_Id5.SelectedIndex = 0;
        ddl_BuyFrom1.SelectedIndex = 0;
        txt_from.Text = "";
        txt_to.Text = "";
    }
    protected void grd_admin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_admin.DataSource = e.NewPageIndex;
        fill_order();
    }
    protected void grd_admin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        linq_obj.delete_order(Convert.ToInt32(grd_admin.DataKeys[e.RowIndex].Value.ToString()));
        linq_obj.SubmitChanges();
        fill_order();
        Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Delete Successfully **')</script>");
    }
    
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add_Order.aspx");
    }
   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < grd_admin.Rows.Count; i++)
            {

                DropDownList btnsubmit = sender as DropDownList;
                GridViewRow gRow = (GridViewRow)btnsubmit.NamingContainer;

                abc = Convert.ToInt32(grd_admin.DataKeys[gRow.RowIndex].Value.ToString());

                DropDownList ddl_status = (DropDownList)grd_admin.Rows[i].FindControl("ddl_status");

                var id = (from a in linq_obj.order_msts
                          where a.intglcode == abc
                          select a).Single();

                if (ddl_status.SelectedValue == "Insert")
                {
                    id.status = "Insert";
                    linq_obj.SubmitChanges();
                }
                if (ddl_status.SelectedValue == "Buy Done")
                {
                    id.status = "Buy Done";
                    linq_obj.SubmitChanges();
                }
                if (ddl_status.SelectedValue == "Done")
                {
                    id.status = "Done";
                    linq_obj.SubmitChanges();
                }
                if (ddl_status.SelectedValue == "Return")
                {
                    id.status = "Return";
                    linq_obj.SubmitChanges();
                }
                ddl_status.SelectedValue = null;
                fill_order();
                break;

            }
        }
        catch (Exception)
        {
            
           
        }
    }
    protected void grd_admin_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            DataRowView drview = e.Row.DataItem as DataRowView;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl_status = (DropDownList)e.Row.FindControl("ddl_status");
                string strId = grd_admin.DataKeys[e.Row.RowIndex].Values[0].ToString();

                HiddenField hiden_code = (HiddenField)e.Row.FindControl("hiden_code");

                var id = (from a in linq_obj.order_msts
                          where a.intglcode == Convert.ToInt32(hiden_code.Value)
                          select a).Single();

                ddl_status.SelectedValue = id.status.ToString();
            }
        }
        catch (Exception)
        {
            
           
        }
    }   
}