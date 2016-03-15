using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Add_Order : System.Web.UI.Page
{
    DataClassesDataContext linq_obj = new DataClassesDataContext();
    static int abc;
    static int ddl_Dress_Name1 = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        fill_order_from();
        fill_category();
        fill_buyfrom();
        fill_order();
        fill_skuid();
        fill_dressname();
        fill_ddl_status();
        fill_skuid5();
    }
    private void fill_order_from()
    {
        try
        {
            var id = (from a in linq_obj.Ecommerce_msts
                      select a).ToList();
            ddl_order_from.DataSource = id;
            ddl_order_from.DataBind();
            ddl_order_from.Items.Insert(0, "-- Select OrderFrom --");

            ddl_Order_From1.DataSource = id;
            ddl_Order_From1.DataBind();
            ddl_Order_From1.Items.Insert(0, "-- Select OrderFrom --");
        }
        catch (Exception)
        {


        }
    }
    private void fill_category()
    {
        try
        {
            var id = (from a in linq_obj.category_msts
                      select a).ToList();
            ddl_category.DataSource = id;
            ddl_category.DataBind();
            ddl_category.Items.Insert(0, "-- Select Category --");
        }
        catch (Exception)
        {


        }
    }
    private void fill_buyfrom()
    {
        try
        {
            var id = (from a in linq_obj.buyfrom_msts
                      select a).ToList();
            ddl_Buy_From.DataSource = id;
            ddl_Buy_From.DataBind();
            ddl_Buy_From.Items.Insert(0, "-- Select Buy From --");

            ddl_BuyFrom1.DataSource = id;
            ddl_BuyFrom1.DataBind();
            ddl_BuyFrom1.Items.Insert(0, "-- Select Buy From --");
        }
        catch (Exception)
        {


        }

    }
    private void fill_skuid()
    {
        try
        {
            var id = (from a in linq_obj.product_msts
                      select a).ToList();
            ddl_SkuId.DataSource = id;
            ddl_SkuId.DataBind();
            ddl_SkuId.Items.Insert(0, "-- Select Buy Sku Id --");
        }
        catch (Exception)
        {


        }


    }
    private void fill_skuid5()
    {
        try
        {
            var id = (from a in linq_obj.product_msts
                      select a).ToList();

            ddl_Sku_Id5.DataSource = id;
            ddl_Sku_Id5.DataBind();
            ddl_Sku_Id5.Items.Insert(0, "-- Select Buy Sku Id --");
        }
        catch (Exception)
        {


        }
    }
    private void fill_dressname()
    {
        try
        {
            var id = (from a in linq_obj.product_msts
                      select a).ToList();
            ddl_Dress_Name.DataSource = id;
            ddl_Dress_Name.DataBind();
            ddl_Dress_Name.Items.Insert(0, "-- Select Dress Name --");
        }
        catch (Exception)
        {


        }
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
                  where (a.datetime >= from1 || txt_from.Text == "") && (a.datetime <= To1 || txt_to.Text == "") && (a.Orderfrom_id == orderfrom || orderfrom == 0) && (a.Order_id == txt_OrderId1.Text || txt_OrderId1.Text == "") && (a.skuid == skuid || skuid == 0) && (a.bayfrom_id == buyrfom || buyrfom == 0)
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
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var id = (from a in linq_obj.order_msts
                      where a.Order_id == (txt_ordeoid.Text)
                      orderby a.intglcode descending
                      select a).ToList();

            if (id.Count == 0)
            {
                int ddl_Buy_From1 = 0;

                int ddl_order_from1 = 0;

                int ddl_category1 = 0;

                int ddl_SkuId1 = 0;

                if (ddl_Dress_Name.SelectedIndex == 0)
                {
                    ddl_Dress_Name1 = 0;
                }
                else
                {
                    ddl_Dress_Name1 = Convert.ToInt32(ddl_Dress_Name.SelectedValue);
                }

                if (ddl_Buy_From.SelectedIndex == 0)
                {
                    ddl_Buy_From1 = 0;
                }
                else
                {
                    ddl_Buy_From1 = Convert.ToInt32(ddl_Buy_From.SelectedValue);
                }

                if (ddl_order_from.SelectedIndex == 0)
                {
                    ddl_order_from1 = 0;
                }
                else
                {
                    ddl_order_from1 = Convert.ToInt32(ddl_order_from.SelectedValue);
                }

                if (ddl_category.SelectedIndex == 0)
                {
                    ddl_category1 = 0;
                }
                else
                {
                    ddl_category1 = Convert.ToInt32(ddl_category.SelectedValue);
                }

                if (ddl_SkuId.SelectedIndex == 0)
                {
                    ddl_SkuId1 = 0;
                }
                else
                {
                    ddl_SkuId1 = Convert.ToInt32(ddl_SkuId.SelectedValue);
                }

                var id2 = (from a in linq_obj.order_msts
                           where a.return_id == txt_Return_Id.Text && a.bayfrom_id == Convert.ToInt32(ddl_Buy_From.SelectedValue)
                           orderby a.intglcode descending
                           select a).ToList();

                if (id2.Count == 0)
                {
                    string status = "";

                    if (txt_BuyPrice.Text == "" && ddl_Buy_From.SelectedIndex == 0)
                    {
                        status = "Insert";
                    }
                    else if (txt_BuyPrice.Text != "" && ddl_Buy_From.SelectedIndex == 0)
                    {
                        status = "Buy Done";
                    }
                    else if (txt_BuyPrice.Text == "" && ddl_Buy_From.SelectedIndex != 0)
                    {
                        status = "Buy Done";
                    }
                    else
                    {
                        status = "Done";
                    }


                    linq_obj.insert_order(txt_ordeoid.Text, ddl_order_from1, ddl_category1, ddl_SkuId1, txt_BuyerName.Text, txt_BuyerContactNo.Text
                                          , txt_BuyPrice.Text, ddl_Buy_From1, txt_SellPrice.Text, txt_Return_Id.Text, txt_Qty.Text, txt_KRTCode.Text, ddl_Dress_Name1, Convert.ToDateTime(System.DateTime.Now.ToString()), "", status);
                    linq_obj.SubmitChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='Add_Order.aspx';</script>'");

                }
                else
                {
                    var id3 = (from a in linq_obj.order_msts
                               where a.return_id == txt_Return_Id.Text && a.bayfrom_id == Convert.ToInt32(ddl_Buy_From.SelectedValue)
                               select a).ToList();

                    if (id3[0].return_id == txt_Return_Id.Text && id3[0].bayfrom_id == Convert.ToInt32(ddl_Buy_From.SelectedValue))
                    {
                        var id4 = (from a in linq_obj.order_msts
                                   where a.return_id == txt_Return_Id.Text && a.bayfrom_id == Convert.ToInt32(ddl_Buy_From.SelectedValue)
                                   select a).ToList();

                        id4[0].status = "Return2";
                        linq_obj.SubmitChanges();
                    }
                    if (id3[0].return_id == txt_Return_Id.Text && id3[0].bayfrom_id == Convert.ToInt32(ddl_Buy_From.SelectedValue))
                    {

                        string status = "";

                        if (txt_BuyPrice.Text == "" && ddl_Buy_From.SelectedIndex == 0)
                        {
                            status = "Insert";
                        }
                        else if (txt_BuyPrice.Text != "" && ddl_Buy_From.SelectedIndex == 0)
                        {
                            status = "Buy Done";
                        }
                        else if (txt_BuyPrice.Text == "" && ddl_Buy_From.SelectedIndex != 0)
                        {
                            status = "Buy Done";
                        }
                        else
                        {
                            status = "Done";
                        }


                        linq_obj.insert_order(txt_ordeoid.Text, ddl_order_from1, ddl_category1, ddl_SkuId1, txt_BuyerName.Text, txt_BuyerContactNo.Text
                                              , txt_BuyPrice.Text, ddl_Buy_From1, txt_SellPrice.Text, txt_Return_Id.Text, txt_Qty.Text, txt_KRTCode.Text, ddl_Dress_Name1, Convert.ToDateTime(System.DateTime.Now.ToString()), "Returnout", status);
                        linq_obj.SubmitChanges();
                        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Submit Successfully **');window.location='Add_Order.aspx';</script>'");

                    }
                }
            }
            else
            {
                Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Order Id already exists. Please enter different Order Id **')</script> ");
            }

        }
        catch (Exception)
        {


        }
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        try
        {
            int ddl_Buy_From1 = 0;

            int ddl_order_from1 = 0;

            int ddl_category1 = 0;

            int ddl_SkuId1 = 0;

            if (ddl_Dress_Name.SelectedIndex == 0)
            {
                ddl_Dress_Name1 = 0;
            }
            else
            {
                ddl_Dress_Name1 = Convert.ToInt32(ddl_Dress_Name.SelectedValue);
            }

            if (ddl_Buy_From.SelectedIndex == 0)
            {
                ddl_Buy_From1 = 0;
            }
            else
            {
                ddl_Buy_From1 = Convert.ToInt32(ddl_Buy_From.SelectedValue);
            }

            if (ddl_order_from.SelectedIndex == 0)
            {
                ddl_order_from1 = 0;
            }
            else
            {
                ddl_order_from1 = Convert.ToInt32(ddl_order_from.SelectedValue);
            }

            if (ddl_category.SelectedIndex == 0)
            {
                ddl_category1 = 0;
            }
            else
            {
                ddl_category1 = Convert.ToInt32(ddl_category.SelectedValue);
            }

            if (ddl_SkuId.SelectedIndex == 0)
            {
                ddl_SkuId1 = 0;
            }
            else
            {
                ddl_SkuId1 = Convert.ToInt32(ddl_SkuId.SelectedValue);
            }

            string status = "";
            if (txt_BuyPrice.Text == "" && ddl_Buy_From.SelectedIndex == 0)
            {
                status = "Insert";
            }
            else if (txt_BuyPrice.Text != "" && ddl_Buy_From.SelectedIndex == 0)
            {
                status = "Buy Done";
            }
            else if (txt_BuyPrice.Text == "" && ddl_Buy_From.SelectedIndex != 0)
            {
                status = "Buy Done";
            }
            else
            {
                status = "Done";
            }


          
                linq_obj.update_order(Convert.ToInt32(ViewState["code"].ToString()), txt_ordeoid.Text, ddl_order_from1, ddl_category1, ddl_SkuId1, txt_BuyerName.Text, txt_BuyerContactNo.Text
                                      , txt_BuyPrice.Text, ddl_Buy_From1, txt_SellPrice.Text, txt_Return_Id.Text, txt_Qty.Text, txt_KRTCode.Text, ddl_Dress_Name1, Convert.ToDateTime(System.DateTime.Now.ToString()), status);
                linq_obj.SubmitChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Update Successfully **');window.location='Add_Order.aspx';</script>'");
           
        }
        catch (Exception)
        {


        }
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Add_Order.aspx");
        }
        catch (Exception)
        {


        }
    }

    protected void grd_admin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            grd_admin.DataSource = e.NewPageIndex;
            fill_order();
        }
        catch (Exception)
        {


        }
    }
    protected void grd_admin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            linq_obj.delete_order(Convert.ToInt32(grd_admin.DataKeys[e.RowIndex].Value.ToString()));
            linq_obj.SubmitChanges();
            fill_order();
            Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Delete Successfully **')</script>");
        }
        catch (Exception)
        {

        }
    }
    protected void grd_admin_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {

            int code = Convert.ToInt32(grd_admin.DataKeys[e.NewEditIndex].Value.ToString());
            ViewState["code"] = code;
            var id = (from a in linq_obj.order_msts
                      where a.intglcode == code
                      select a).Single();

            txt_BuyerContactNo.Text = id.bayercontact;
            txt_BuyerName.Text = id.bayername;
            txt_BuyPrice.Text = id.bayerprice;
            txt_KRTCode.Text = id.krtcode;
            txt_ordeoid.Text = id.Order_id;
            txt_Qty.Text = id.qty;
            txt_Return_Id.Text = id.return_id;
            txt_SellPrice.Text = id.sellprice;
            ddl_Buy_From.SelectedValue = id.bayfrom_id.ToString();
            ddl_category.SelectedValue = id.cetegory.ToString();
            ddl_order_from.SelectedValue = id.Orderfrom_id.ToString();
            ddl_SkuId.SelectedValue = id.skuid.ToString();

            if (txt_KRTCode.Text != "")
            {
                pnl_krtcode.Visible = true;
            }
            else
            {
                pnl_krtcode.Visible = false;
            }
            if (ddl_Dress_Name.SelectedIndex != 0)
            {
                pnl_dressname.Visible = true;

            }
            else
            {
                pnl_dressname.Visible = false;
            }

            btn_submit.Visible = false;
            btn_update.Visible = true;
        }
        catch (Exception)
        {


        }
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add_Order.aspx");
    }
    protected void ddl_order_from_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddl_order_from.SelectedItem.Text == "Voonik")
            {
                pnl_krtcode.Visible = true;
            }
            else
            {
                pnl_krtcode.Visible = false;
            }
        }
        catch (Exception)
        {

        }
    }
    protected void ddl_Buy_From_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddl_Buy_From.SelectedItem.Text == "Femina")
            {
                pnl_dressname.Visible = true;
                pnl_krtcode.Visible = true;
            }
            else
            {
                pnl_dressname.Visible = false;
            }
        }
        catch (Exception)
        {

        }
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
                id.status = "Insert";
                fill_order();
                break;
            }
        }
        catch (Exception)
        {

        }
    }

}