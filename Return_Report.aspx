<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Return_Report.aspx.cs" Inherits="Return_Report" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .scrollcss {
            height: 800px;
            overflow: auto;
            width: 100%;
        }

        .order {
            color: red;
            background-color: lightblue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="contentpanel">
        <div class="row">

             <div class="col-md-12">
                <div id="Form1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times" form-group></i></a>
                            </div>
                            <!-- panel-btns -->
                            <h2 class="panel-title">Search</h2>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label" style="margin: 8px -9px 0 8px; padding: 0 0 1px 3px;">Order From : <span class="asterisk"></span></label>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddl_Order_From1" runat="server" class="form-control" DataTextField="ecommerce_name" DataValueField="intglcode">
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-sm-1 control-label" style="margin: 8px -9px 0 8px; padding: 0 0 1px 3px;">OrderId : <span class="asterisk"></span></label>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txt_OrderId1" runat="server" class="form-control" placeholder="OrderId"></asp:TextBox>
                                    </div>
                                    <label class="col-sm-1 control-label" style="margin: 8px -9px 0 8px; padding: 0 0 1px 3px;">
                                        Sku Id : <span class="asterisk"></span>
                                    </label>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddl_Sku_Id5" runat="server" class="form-control" DataTextField="sku_id" DataValueField="intglcode">
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-sm-1 control-label" style="margin: 8px -9px 0 8px; padding: 0 0 1px 3px;">Buy From : <span class="asterisk"></span></label>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddl_BuyFrom1" runat="server" class="form-control" DataTextField="buyfrom" DataValueField="intglcode">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" style="margin: 8px -46px 0 5px; padding: 0 0 1px 2px;">
                                        From : <span class="asterisk"></span>
                                    </label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_from" runat="server" class="form-control" placeholder="From"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_from"
                                            Format="MMMM d, yyyy"
                                            PopupButtonID="Image1">
                                        </cc1:CalendarExtender>
                                    </div>
                                    <label class="col-sm-2 control-label" style="margin: 8px -50.4px 0 5px; padding: 0 0 1px 2px;">
                                        To : <span class="asterisk"></span>
                                    </label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_to" runat="server" class="form-control" placeholder="To"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txt_to"
                                            Format="MMMM d, yyyy"
                                            PopupButtonID="Image1">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-5 col-sm-offset-5">
                                    <asp:Button ID="btn_search" runat="server" Text="Search" ValidationGroup="btnsubmit" class="btn btn-primary mr5" OnClick="btn_search_Click"></asp:Button>
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="btnsubmit" ShowMessageBox="true" ShowSummary="false" />
                                    <asp:Button ID="btn_reset" runat="server" Text="Reset" class="btn btn-dark" OnClick="btn_reset_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <!-- panel-footer -->
                    </div>
                    <!-- panel -->
                </div>

            </div>
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="scrollcss">
                        <table class="table table-primary mb30 scrollcss" style="font-size: 11px; text-align: center;">
                            <thead>
                                <tr>
                                    <td>
                                        <asp:GridView ID="grd_admin" runat="server" OnRowDataBound="grd_admin_RowDataBound" AutoGenerateColumns="false" Width="500%"
                                            DataKeyNames="Code" AllowPaging="true" CssClass="table table-primary mb30" GridLines="None" OnPageIndexChanging="grd_admin_PageIndexChanging" OnRowDeleting="grd_admin_RowDeleting" >
                                            <Columns>
                                                <asp:BoundField DataField="date" HeaderText="DateTime" />
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddl_status" runat="server" CommandArgument='<%#Eval("code") %>' CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Style="padding: 0;">
                                                            <asp:ListItem>Select Status</asp:ListItem>
                                                            <asp:ListItem>Insert</asp:ListItem>
                                                            <asp:ListItem>Buy Done</asp:ListItem>
                                                            <asp:ListItem>Done</asp:ListItem>
                                                            <asp:ListItem>Return</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Order Id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:HiddenField ID="hiden_code" runat="server" Value='<%#Eval("code") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Order Id">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_order" runat="server" CommandArgument='<%#Eval("code") %>' Text='<%#Eval("orderid")%>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="OrderFrom" HeaderText="Order From" ItemStyle-Wrap="false" />
                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:Image ID="image" runat="server" ImageUrl='<%#Eval("img") %>' Height="50px" Width="50px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="KRTCode" HeaderText="KRT Code" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="SkuId" HeaderText="Sku Id" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="BuyerName" HeaderText="Buyer Name" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="Buyerfrom" HeaderText="Buyer From" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="ContactNo" HeaderText="Contact No" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="Qty" HeaderText="Qty" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="BuyPrice" HeaderText="Buy Price" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="SellPrice" HeaderText="Sell Price" ItemStyle-Wrap="false" />
                                                <asp:TemplateField HeaderText="BuyTotal">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_buytotal" runat="server" CommandArgument='<%#Eval("code") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SellTotal">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_SellTotal" runat="server" CommandArgument='<%#Eval("code") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="EcommerceCharge" HeaderText="Ecommerce Charge" ItemStyle-Wrap="false" />
                                                <asp:BoundField DataField="Shipping" HeaderText="Shipping" ItemStyle-Wrap="false" />
                                                <asp:TemplateField HeaderText="Profit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_Profit" runat="server" CommandArgument='<%#Eval("code") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                                <asp:CommandField ButtonType="Link" ShowDeleteButton="true" HeaderText="Delete" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                <!-- table-responsive -->
            </div>

            </div>
         </div>
</asp:Content>

