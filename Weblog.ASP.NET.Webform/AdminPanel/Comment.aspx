<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Master/MainMaster.Master" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="Weblog.ASP.NET.Webform.AdminPanel.Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainAdmin" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <h3>مدیریت نظرات ارسالی</h3>
                        </header>
                    </section>
                    <asp:LinqDataSource runat="server" ID="dsShowListComment" OnSelecting="dsShowListComment_OnSelecting"></asp:LinqDataSource>
                    <asp:MultiView runat="server" ID="mvShowListcomment" ActiveViewIndex="0">
                        <asp:View runat="server" ID="vwShowListComment">

                            <asp:GridView ID="gvListComment" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-responsive" OnRowCommand="gvListComment_RowCommand" DataSourceID="dsShowListComment" runat="server">
                                <Columns>
                                    <asp:BoundField Headertext="موضوع خبر" DataField="NewsTitle" />
                                    <asp:BoundField Headertext="تاریخ نظر" DataField="Date" dataformatstring="{0:yyyy/MM/dd}" />
                                    <asp:BoundField Headertext="نام کامل" DataField="FullName"  />
                                    <asp:BoundField Headertext="ایمیل" DataField="Email"  />
                                    <asp:BoundField Headertext="وب سایت" DataField="webSite" />
                                    <asp:BoundField HeaderText="متن نظر" DataField="NewsCommentText" />
                                    <asp:TemplateField HeaderText="دستورات">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass='<%# bool.Parse(Eval("IsActive").ToString()) ?"btn btn-success btn-xs":"btn btn-warning btn-xs" %>' CommandName="DoActive" CommandArgument='<%#Eval("NewsComment") %>' Text='<%# bool.Parse(Eval("IsActive").ToString()) ?"نمایشش نده":"نمایش بده" %>' />
                                                <asp:LinkButton runat="server" ID="LinkButton2" CssClass="btn btn-warning btn-xs" CommandArgument='<%#Eval("NewsComment") %>' CommandName="DoEdit">ویرایش</asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="LinkButton3" CssClass="btn btn-danger btn-xs" CommandArgument='<%#Eval("NewsComment") %>' CommandName="DoDelete">حذف</asp:LinkButton>
                                                <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl='<%# string.Format("/post/{0}/{1}",Eval("NewsID"),Eval("NewsTitle")).Replace(" ","-")  %>' CssClass="btn btn-default btn-xs">نمایش</asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                                                      
               
                        </asp:View>
                        <asp:View runat="server" ID="vwEditComent">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblFullName" Text="نام کامل"></asp:Label>
                                    <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblEmail" Text="ایمیل"></asp:Label>
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblWebsite" Text="وب سایت"></asp:Label>
                                    <asp:TextBox runat="server" ID="txtWebsite" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblcomment" Text="متن نظر"></asp:Label>
                                    <asp:TextBox runat="server" ID="txtcomment" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-success btn-xs" Text="ویرایش" OnClick="btnSave_OnClick" />
                                    <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-success btn-xs" Text="انصراف" OnClick="btnCancel_OnClick" />
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
