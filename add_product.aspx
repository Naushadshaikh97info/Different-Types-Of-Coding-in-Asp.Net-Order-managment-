<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="Admin_add_product" %>

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
                    <li>Add Product</li>
                </ul>
                <h4>Add Product</h4>
            </div>
        </div>
        <!-- media -->
    </div>
    <!-- pageheader -->
    <div class="contentpanel">
        <div class="row">
            <div class="col-md-12">
                <div id="basicForm">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="#" class="panel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                                <a href="#" class="panel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times" form-group></i></a>
                            </div>
                            <!-- panel-btns -->
                            <h4 class="panel-title">Add Product</h4>
                        </div>
                        <!-- panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px;">
                                    <label class="col-sm-2 control-label">Category <span class="asterisk"></span></label>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_category" runat="server" class="form-control" DataTextField="Category" DataValueField="intglcode">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px;">
                                    <label class="col-sm-2 control-label">Sku ID <span class="asterisk"></span></label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txt_SkuID" runat="server" class="form-control" placeholder="Category"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                            ControlToValidate="txt_SkuID" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>

                                </div>
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px;">
                                    <label class="col-sm-2 control-label">Dress Name <span class="asterisk"></span></label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txt_dressname" runat="server" class="form-control" placeholder="Dress Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                            ControlToValidate="txt_dressname" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group" style="background-color: #eee; border: 1px solid #ccc; margin-bottom: 0; margin-left: 9px;">
                                    <label class="col-sm-2 control-label">Image <span class="asterisk"></span></label>
                                    <div class="col-sm-4">
                                        <asp:FileUpload ID="file_Student_Image" runat="server" class="form-control" Style="margin: -1px 0 8px; padding: 0;"></asp:FileUpload>
                                    </div>

                                </div>
                            </div>
                            <!-- row -->
                        </div>
                        <!-- panel-body -->
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-3 col-sm-offset-1" style="margin: 0 4px 0 111px;">
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-primary mr5" OnClick="btn_submit_Click"></asp:Button>
                                    <asp:Button ID="btn_update" runat="server" Visible="false" Text="Update" class="btn btn-primary mr5" OnClick="btn_update_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <!-- panel-footer -->
                    </div>
                    <!-- panel -->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-primary mb30">
                        <thead>
                            <tr>
                                <td>
                                    <asp:GridView ID="grd_admin" runat="server" AutoGenerateColumns="false" Width="500%"
                                        DataKeyNames="Code" AllowPaging="true" CssClass="table table-primary mb30" GridLines="None" PageSize="30" OnRowEditing="grd_admin_RowEditing" OnPageIndexChanging="grd_admin_PageIndexChanging1" OnRowDeleting="grd_admin_RowDeleting">
                                        <Columns>
                                            <asp:CommandField ButtonType="Link" ShowDeleteButton="true" HeaderText="Delete" />
                                            <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderText="Edit" />
                                            <asp:BoundField DataField="Category" HeaderText="Category" />
                                            <asp:BoundField DataField="SkuID" HeaderText="Sku ID" />
                                            <asp:BoundField DataField="Dressname" HeaderText="Dress Name" />
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="image" runat="server" ImageUrl='<%#Eval("img") %>' Height="46px" Width="87px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
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



