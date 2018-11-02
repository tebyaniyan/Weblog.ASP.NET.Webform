<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Master/MainMaster.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="Weblog.ASP.NET.Webform.AdminPanel.User.Role" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">سطح های دسترسی</h1>
        </div>
    </div>

    <asp:LinqDataSource runat="server" ID="dsShowListRole" OnSelecting="dsShowListRole_OnSelecting"></asp:LinqDataSource>

    <asp:GridView ID="gvShowRole" runat="server" DataSourceID="dsShowListRole" AutoGenerateColumns="false" AllowPaging="True" CssClass="table table-striped table-bordered table-hover">
        <Columns>
            <asp:BoundField DataField="RoleName" HeaderText="نوع دسترسی" />
            <asp:BoundField DataField="RoleTiitlee" HeaderText="نام دسترسی" />
        </Columns>
    </asp:GridView>

</asp:Content>
