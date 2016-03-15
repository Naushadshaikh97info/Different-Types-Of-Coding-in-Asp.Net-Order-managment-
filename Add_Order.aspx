<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Order.aspx.cs" Inherits="Admin_Add_Order" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="pageheader">
        <div class="media">
            <div class="pageicon pull-left">
                <i class="fa fa-pencil"></i>
            </div>
            <div class="media-body">
                <h4>Add Order</h4>
                <ul class="breadcrumb">
                    <li><a href="Welcome.aspx"><i class="glyphicon glyphicon-home"></i></a></li>
                    <li>Add Order</li>
                </ul>
            </div>
        </div>
        <!-- media -->
    </div>
    <!-- pageheader -->
    <div class="contentpanel">
        <div class="row">
            <div class="col-md-12">
                <div id="basicForm">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <asp:Panel ID="Panel1" runat="server">
                                            <div class="form-group">
                                                <div>
                                                    <div class="col-sm-3" style="float: right;">
                                                        <asp:TextBox ID="txt_ordeoid" runat="server" class="form-control" placeholder="Order Id"></asp:TextBox>
                                                    </div>
                                                    <label class="col-sm-1 control-label" style="margin: 0 -6px 0 5px; padding: 9px 1px 0 0; width: 90px; float: right;">
                                                        Order Id : <span class="asterisk"></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <!-- row -->
                                </div>
                                <div class="panel-heading">
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <asp:Panel ID="pnl_form" runat="server">
                                            <div class="form-group">
                                                <label class="col-sm-1 control-label" style="padding: 0 0 0 7px;">Order From : <span class="asterisk"></span></label>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_order_from" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_order_from_SelectedIndexChanged" DataTextField="ecommerce_name" DataValueField="intglcode">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Order From" ControlToValidate="ddl_order_from" ValidationGroup="btnsubmit1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </div>
                                                <label class="col-sm-1 control-label" style="margin: 0 -6px 0 5px; padding: 9px 1px 0 0; width: 90px;">
                                                    Category : <span class="asterisk"></span>
                                                </label>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_category" runat="server" class="form-control" DataTextField="Category" DataValueField="intglcode">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="btnsubmit1" ControlToValidate="ddl_category" runat="server" ErrorMessage="Select Category"></asp:RequiredFieldValidator>
                                                </div>
                                                <label class="col-sm-1 control-label" style="margin: 0 -6px 0 5px; padding: 9px 1px 0 0; width: 90px;">
                                                    Sku Id : <span class="asterisk"></span>
                                                </label>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_SkuId" runat="server" class="form-control" DataTextField="sku_id" DataValueField="intglcode">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="btnsubmit1" ControlToValidate="ddl_SkuId" runat="server" ErrorMessage="Select Sku Id"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <!-- row -->
                                </div>
                                <!-- panel-heading -->
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                Buyer Name : <span class="asterisk"></span>
                                            </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_BuyerName" runat="server" class="form-control" placeholder="Buyer Name"></asp:TextBox>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                Buyer Contact No : <span class="asterisk"></span>
                                            </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_BuyerContactNo" runat="server" class="form-control" placeholder="Buyer Contact No"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                Buy Price : <span class="asterisk"></span>
                                            </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_BuyPrice" runat="server" class="form-control" placeholder="Buy Price"></asp:TextBox>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                Buy From : <span class="asterisk"></span>
                                            </label>
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="ddl_Buy_From" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_Buy_From_SelectedIndexChanged" DataTextField="buyfrom" DataValueField="intglcode">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                Sell Price : <span class="asterisk"></span>
                                            </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_SellPrice" runat="server" class="form-control" placeholder="Sell Price"></asp:TextBox>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                Return Id : <span class="asterisk"></span>
                                            </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_Return_Id" runat="server" class="form-control" placeholder="Return Id"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">
                                                Qty : <span class="asterisk"></span>
                                            </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_Qty" runat="server" class="form-control" placeholder="Qty"></asp:TextBox>
                                            </div>
                                            <asp:Panel ID="pnl_krtcode" runat="server" Visible="false">
                                                <label class="col-sm-1 control-label">
                                                    KRT Code : <span class="asterisk"></span>
                                                </label>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_KRTCode" runat="server" class="form-control" placeholder="KRT Code"></asp:TextBox>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnl_dressname" runat="server" Visible="false">
                                                <label class="col-sm-1 control-label" style="padding: 0 0 0 8px;">
                                                    Dress Name : <span class="asterisk"></span>
                                                </label>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_Dress_Name" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_Buy_From_SelectedIndexChanged" DataTextField="dressname" DataValueField="intglcode">
                                                    </asp:DropDownList>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <!-- row -->
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-sm-5 col-sm-offset-5">
                                            <asp:Button ID="btn_submit" runat="server" Text="Submit" ValidationGroup="btnsubmit1" OnClick="btn_submit_Click" class="btn btn-primary mr5"></asp:Button>
                                            <asp:Button ID="btn_update" runat="server" Text="Update" ValidationGroup="btnsubmit1" OnClick="btn_update_Click" class="btn btn-primary mr5" Visible="false"></asp:Button>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="btnsubmit1" ShowMessageBox="true" ShowSummary="false" />
                                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click" class="btn btn-dark"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                                <!-- panel-footer -->
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddl_order_from" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddl_Buy_From" EventName="SelectedIndexChanged" />
                            <asp:PostBackTrigger ControlID="btn_submit" />
                            <asp:PostBackTrigger ControlID="btn_update" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
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

                                        <asp:GridView ID="grd_admin" runat="server" PageSize="30" AutoGenerateColumns="false" Width="500%"
                                            DataKeyNames="Code" AllowPaging="true" CssClass="table table-primary mb30" GridLines="None" OnPageIndexChanging="grd_admin_PageIndexChanging" OnRowDeleting="grd_admin_RowDeleting" OnRowEditing="grd_admin_RowEditing">
                                            <Columns>
                                                <asp:BoundField DataField="date" HeaderText="DateTime" />
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddl_status" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Style="padding: 0;">
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
                                                <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderText="Edit" />
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
            <!-- col-md-6 -->
        </div>

    </div>
</asp:Content>


