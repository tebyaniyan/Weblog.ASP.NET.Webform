<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Master/MainMaster.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Weblog.ASP.NET.Webform.AdminPanel.User.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">مدیریت کاربران</h1>
        </div>
    </div>

    <asp:Button runat="server" ID="btnAddUser" CssClass="btn btn-success" Text="افزودن کاربر" OnClick="btnAddUser_Click" />
    <br />
    <div class="clearfix"></div>
    <asp:MultiView runat="server" ID="mvShowListUser" ActiveViewIndex="0">
        <asp:View runat="server" ID="vwListUser">
            <asp:LinqDataSource runat="server" ID="dsShowListUser" OnSelecting="dsShowListUser_OnSelecting" ></asp:LinqDataSource>

            <asp:GridView ID="gvListUser" OnRowCommand="gvListUser_RowCommand" runat="server" DataSourceID="dsShowListUser" AutoGenerateColumns="False" AllowPaging="True" CellSpacing="-1" CssClass="table table-striped table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="RoleTiitle" HeaderText="سطح دسترسی" />
                    <asp:BoundField DataField="FullName" HeaderText="نام" />
                    <asp:BoundField DataField="Email" HeaderText="ایمیل" />
                    <asp:BoundField DataField="Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="تاریخ عضویت" />
                    <asp:BoundField DataField="IsActive" HeaderText="وضعیت کاربر" />
                    <asp:TemplateField HeaderText="دستورات">
                                                    <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbEdit" CommandArgument='<%#Eval("UserID")%>' CommandName="DoEdit"><i class="btn btn-warning btn-circle glyphicon glyphicon-edit"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lbDelete" CommandArgument='<%#Eval("UserID")%>' CommandName="DoDelet"><i class="btn btn-info btn-circle glyphicon glyphicon-remove"></i></asp:LinkButton>
                                <asp:LinkButton ID="btnIsActiveComment" runat="server" CssClass='<%# bool.Parse(Eval("IsActive").ToString()) ?"btn btn-danger btn-circle glyphicon glyphicon-thumbs-down":"btn btn-success btn-circle glyphicon glyphicon-thumbs-up" %>' CommandName="DoActive" CommandArgument='<%#Eval("UserID") %>' Text='<%# bool.Parse(Eval("IsActive").ToString()) ?"":"" %>' />
                            </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                 
        </asp:View>
        <asp:View runat="server" ID="vwAddUser">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblRole" Text="سطح دسترسی"></asp:Label>
                    <asp:LinqDataSource ID="edShowListRolee" runat="server" OnSelecting="edShowListRole_Selecting"></asp:LinqDataSource>
                    <asp:DropDownList runat="server" ID="ddlListRole" CssClass="form-control" DataSourceID="edShowListRolee" DataTextField="RoleTiitle" DataValueField="RoleID" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblEmail" Text="ایمیل"></asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblPassword" Text="کلمه عبور"></asp:Label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblFuulName" Text="نام"></asp:Label>
                    <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-success" Text="ثبت" OnClick="btnSave_OnClick" />
                </div>
            </div>
        </asp:View>
    </asp:MultiView>

</asp:Content>
