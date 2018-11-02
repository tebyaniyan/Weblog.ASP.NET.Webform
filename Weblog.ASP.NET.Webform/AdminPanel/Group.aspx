<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Master/MainMaster.Master" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="Weblog.ASP.NET.Webform.AdminPanel.Group" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainAdmin" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <h3>مدیریت گروه های خبری</h3>
                        </header>
                        <asp:Button ID="btnAddGroup" runat="server" CssClass="btn btn-success" OnClick="btnAddGroup_Click" Text="افزودن دسته وبلاگ" />
                        <br />
                        <asp:MultiView runat="server" ID="mvShowListNewsGroup" ActiveViewIndex="0">
                            <asp:View runat="server" ID="mvwShowListNewsGroup">
                                <asp:LinqDataSource runat="server" ID="dsShowListNewsGroup" OnSelecting="dsShowListNewsGroup_OnSelecting"></asp:LinqDataSource>

                                <asp:GridView ID="gvListGroup" CssClass="table table-bordered table-hover table-responsive" AutoGenerateColumns="false" OnRowCommand="gvListGroup_RowCommand" runat="server" DataSourceID="dsShowListNewsGroup">
                                    <Columns>
                                        <asp:BoundField DataField="TitleGroup" HeaderText="نام گروه"></asp:BoundField>
                                        <asp:TemplateField HeaderText="دستورات">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server"
                                                    CommandArgument='<%# Eval("NewsGroupID") %>' CommandName="DoEdit" CssClass="btn btn-warning btn-xs">ویرایش</asp:LinkButton>

                                                <asp:LinkButton ID="lbtnDelete" runat="server"
                                                    CommandArgument='<%# Eval("NewsGroupID") %>' CommandName="DoDelete" CssClass="btn btn-danger btn-xs" OnClientClick="return confirm('آیا برای حذف مطمن هستید ؟');">حذف</asp:LinkButton>

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>

                            </asp:View>
                            <asp:View runat="server" ID="vwAddGroup">
                                    <br />
                                    <br />
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblNamgroup" Text="نام گروه "></asp:Label>
                                        <asp:TextBox runat="server" ID="txtNameGroup" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnSaveGroup" CssClass="btn btn-success" OnClick="btnSaveGroup_OnClick" Text="ثبت گروه" />
                                    <asp:Button runat="server" ID="btnCancell" CssClass="btn btn-danger" OnClick="btnCancell_OnClick" Text="انصراف" />
                                </div>
                            </asp:View>
                        </asp:MultiView>

                    </section>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
