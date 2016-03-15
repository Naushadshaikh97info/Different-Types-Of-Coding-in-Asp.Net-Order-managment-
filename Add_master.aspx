<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Add_master.aspx.cs" Inherits="Admin_Add_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pageheader">
        <div class="media">
            <div class="pageicon pull-left">
                <i class="fa fa-pencil"></i>
            </div>
            <div class="media-body">
                <ul class="breadcrumb">
                    <li><a href="Welcome.aspx"><i class="glyphicon glyphicon-home"></i></a></li>
                    <li>Add Master</li>
                </ul>
                <h4>Add Master</h4>
            </div>
        </div>
        <!-- media -->
    </div>
    <!-- pageheader -->
    <div class="contentpanel">
        <div class="row">
            <div class="col-md-4">
                <div id="basicForm">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times" form-group></i></a>
                            </div>
                            <!-- panel-btns -->
                            <h4 class="panel-title">Add Master</h4>
                        </div>
                        <!-- panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px; width: 348px;">
                                    <label class="col-sm-4 control-label">Category <span class="asterisk"></span></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtEcommerce" runat="server" class="form-control" placeholder="Ecommerce"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtEcommerce" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <!-- row -->
                        </div>
                        <!-- panel-body -->
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-3 col-sm-offset-1" style="margin: 0 4px 0 111px;">
                                    <asp:Button ID="btn_submit_ecommerce" runat="server" Text="Submit" OnClick="btn_submit_ecommerce_Click" class="btn btn-primary mr5"></asp:Button>
                                    <asp:Button ID="btn_update_ecommerce" runat="server" Visible="false" Text="Update" class="btn btn-primary mr5" OnClick="btn_update_ecommerce_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <!-- panel-footer -->
                    </div>
                    <!-- panel -->
                </div>
            </div>
            <div class="col-md-4">
                <div id="Div1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times" form-group></i></a>
                            </div>
                            <!-- panel-btns -->
                            <h4 class="panel-title">Add Category Name</h4>

                        </div>
                        <!-- panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px; width: 348px;">
                                    <label class="col-sm-4 control-label">Category <span class="asterisk"></span></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txt_Category" runat="server" class="form-control" placeholder="Category"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                            ControlToValidate="txt_Category" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <!-- row -->
                        </div>
                        <!-- panel-body -->
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-3 col-sm-offset-1" style="margin: 0 4px 0 111px;">

                                    <asp:Button ID="btn_submit_category" runat="server" Text="Submit" OnClick="btn_submit_category_Click" class="btn btn-primary mr5"></asp:Button>
                                    <asp:Button ID="btn_update_category" runat="server" Visible="false" Text="Update" class="btn btn-primary mr5" OnClick="btn_update_category_Click"></asp:Button>
                                </div>

                            </div>
                        </div>
                        <!-- panel-footer -->
                    </div>
                    <!-- panel -->
                </div>
            </div>
            <div class="col-md-4">
                <div id="Div2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times" form-group></i></a>
                            </div>
                            <!-- panel-btns -->
                            <h4 class="panel-title">Add Buy From</h4>
                        </div>
                        <!-- panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px; width: 348px;">
                                    <label class="col-sm-4 control-label">Buy From <span class="asterisk"></span></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txt_Buy_From" runat="server" class="form-control" placeholder="Buy From"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                            ControlToValidate="txt_Buy_From" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <!-- row -->
                        </div>
                        <!-- panel-body -->
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-3 col-sm-offset-1" style="margin: 0 4px 0 111px;">
                                    <asp:Button ID="btn_submit_buy_form" runat="server" Text="Submit" OnClick="btn_submit_buy_form_Click" class="btn btn-primary mr5"></asp:Button>
                                    <asp:Button ID="btn_update_buy_form" runat="server" Visible="false" Text="Update" class="btn btn-primary mr5" OnClick="btn_update_buy_form_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <!-- panel-footer -->
                    </div>
                    <!-- panel -->
                </div>
            </div>
            <!-- col-md-6 -->
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="table-responsive">
                    <table class="table table-primary mb30">
                        <thead>
                            <tr>
                                <td>
                                    <asp:GridView ID="grd_admin" runat="server" AutoGenerateColumns="false" Width="500%"
                                        DataKeyNames="Code" AllowPaging="true" CssClass="table table-primary mb30" GridLines="None" OnRowEditing="grd_admin_RowEditing" OnPageIndexChanging="grd_admin_PageIndexChanging" OnRowDeleting="grd_admin_RowDeleting">
                                        <Columns>
                                            <asp:CommandField ButtonType="Link" ShowDeleteButton="true" HeaderText="Delete" />
                                            <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderText="Edit" />
                                            <asp:BoundField DataField="ecommerce_name" HeaderText="Ecommerce Name" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </thead>
                    </table>
                </div>
                <!-- table-responsive -->
            </div>
            <div class="col-md-4">
                <div class="table-responsive">
                    <table class="table table-primary mb30">
                        <thead>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="500%"
                                        DataKeyNames="Code" AllowPaging="true" CssClass="table table-primary mb30" GridLines="None" OnRowEditing="GridView1_RowEditing" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting">
                                        <Columns>
                                            <asp:CommandField ButtonType="Link" ShowDeleteButton="true" HeaderText="Delete" />
                                            <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderText="Edit" />
                                            <asp:BoundField DataField="Category" HeaderText="Category" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </thead>
                    </table>
                </div>
                <!-- table-responsive -->
            </div>
            <div class="col-md-4">
                <div class="table-responsive">
                    <table class="table table-primary mb30">
                        <thead>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="500%"
                                        DataKeyNames="Code" AllowPaging="true" CssClass="table table-primary mb30" GridLines="None" OnRowEditing="GridView2_RowEditing" OnPageIndexChanging="GridView2_PageIndexChanging" OnRowDeleting="GridView2_RowDeleting">
                                        <Columns>
                                            <asp:CommandField ButtonType="Link" ShowDeleteButton="true" HeaderText="Delete" />
                                            <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderText="Edit" />
                                            <asp:BoundField DataField="BuyFrom" HeaderText="Buy From" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </thead>
                    </table>
                </div>
                <!-- table-responsive -->
            </div>
        </div>
        <div class="row">
            <div class="col-md-4" style="float: left;">
                <div id="Div3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times" form-group></i></a>
                            </div>
                            <!-- panel-btns -->
                            <h4 class="panel-title">Add Comission</h4>
                        </div>
                        <!-- panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px; width: 348px;">
                                    <label class="col-sm-4 control-label">Order From <span class="asterisk"></span></label>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddl_orderfrom" runat="server" class="form-control" DataTextField="ecommerce_name" DataValueField="intglcode"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                            ControlToValidate="ddl_orderfrom" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px; width: 348px;">
                                    <label class="col-sm-4 control-label">Comission<span class="asterisk"></span></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txt_comission" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                            ControlToValidate="ddl_orderfrom" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px; width: 348px;">
                                    <label class="col-sm-4 control-label">Shipping<span class="asterisk"></span></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txt_Shipping" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                            ControlToValidate="txt_Shipping" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- row -->
                    </div>
                    <!-- panel-body -->
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-sm-3 col-sm-offset-1" style="margin: 0 4px 0 111px;">
                                <asp:Button ID="btn_submit_commision" runat="server" Text="Submit" OnClick="btn_submit_commision_Click" class="btn btn-primary mr5"></asp:Button>
                                <asp:Button ID="btn_update_commision" runat="server" Visible="false" Text="Update" class="btn btn-primary mr5" OnClick="btn_update_commision_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                    <!-- panel-footer -->
                </div>
                <!-- panel -->
            </div>
        </div>
        <div class="col-md-4">
            <div class="table-responsive">
                <table class="table table-primary mb30">
                    <thead>
                        <tr>
                            <td>
                                <asp:GridView ID="grd_commision" runat="server" AutoGenerateColumns="false" Width="500%"
                                    DataKeyNames="Code" AllowPaging="true" CssClass="table table-primary mb30" GridLines="None" OnRowEditing="grd_commision_RowEditing" OnPageIndexChanging="grd_commision_PageIndexChanging" OnRowDeleting="grd_commision_RowDeleting">
                                    <Columns>
                                        <asp:CommandField ButtonType="Link" ShowDeleteButton="true" HeaderText="Delete" />
                                        <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderText="Edit" />
                                        <asp:BoundField DataField="OrderFrom" HeaderText="Order From" />
                                        <asp:BoundField DataField="Comission" HeaderText="Comission" />
                                        <asp:BoundField DataField="Shipping" HeaderText="Shipping" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </thead>
                </table>
            </div>
            <!-- table-responsive -->
        </div>
    </div>
    </div>

</asp:Content>

