<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Master/MainMaster.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Weblog.ASP.NET.Webform.AdminPanel.News" %>

<%@ Register TagPrefix="CKEditor" Namespace="CKEditor.NET" Assembly="CKEditor.NET, Version=3.6.4.0, Culture=neutral, PublicKeyToken=e379cdf2f8354999" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainAdmin" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <h3>مدیریت پست های وبلاگ </h3>
                        </header>
                    </section>
                    <asp:MultiView runat="server" ID="mvShowNews" ActiveViewIndex="0">
                        <asp:View runat="server" ID="vwShowListNews">
                            <asp:LinqDataSource runat="server" ID="dsShowNews" OnSelecting="dsShowNews_OnSelecting"></asp:LinqDataSource>
                            <asp:Button ID="btnNewsNew" runat="server" CssClass="btn btn-success" OnClick="btnNewsNew_Click" Text="افزودن خبر" />
                            <hr />
                            <asp:GridView ID="gvListNews" EmptyDataText="خبری ثبت نشده است" OnRowCommand="gvListNews_RowCommand" runat="server" DataSourceID="dsShowNews" CssClass="table table-bordered table-hover table-responsive" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="تصویر">
                                        <ItemTemplate>
                                            <img src='/Image/Blog/Images/Thumb/<%#Eval("NewsImage") %> ' style="width: 75px; height: 60px;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="NewsTitle" HeaderText="عنوان خبر" />
                                    <asp:BoundField DataField="TitleGroup" HeaderText="عنوان خبر" />
                                    <asp:BoundField DataField="Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="عنوان خبر" />
                                    <asp:TemplateField HeaderText="دستورات">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbEdit" CssClass="btn btn-info" CommandArgument='<%#Eval("NewsID") %>' CommandName="DoEdit">ویرایش</asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="hlDelete" CssClass="btn btn-danger" CommandArgument='<%#Eval("NewsID") %>' CommandName="DoDelete">حذف</asp:LinkButton>
                                            <asp:HyperLink runat="server" ID="hlShow" CssClass="btn btn-default" NavigateUrl='<%# string.Format("/post/{0}/{1}",Eval("NewsID"),Eval("NewsTitle")).Replace(" ","-").Replace("?","-").Replace("؟","")  %>'>نمایش خبر</asp:HyperLink>
                                            <asp:LinkButton ID="lbIsActive" runat="server" CssClass='<%# bool.Parse(Eval("IsActive").ToString()) ?"btn btn-danger btn-sm":"btn btn-success btn-sm" %>' CommandName="DoActive" CommandArgument='<%#Eval("NewsID") %>' Text='<%# bool.Parse(Eval("IsActive").ToString()) ?"نمایش نده":"نمایش بده" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>



                        </asp:View>
                        <asp:View runat="server" ID="vwAddNews">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <asp:Label runat="server" ID="lblTitleNews" Text="عنوان خبر:"></asp:Label>
                                            <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                           <%--         <div class="clearfix"></div>
                                    <div class="col-sm-10">
                                        <asp:Label ID="lblNote" runat="server" Text="توضیحات ابتدایی"></asp:Label>
                                        <input name="txtNote" runat="server" id="txtNote" class="form-control" type="text" onkeyup="textCounter2(this, 'subtitlecount_lbl', 150)" onchange="textCounter2(this, 'subtitlecount_lbl', 150)" /><br />
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Label ID="lblCountCharacter" runat="server" Text="تعداد باقی مانده"></asp:Label>
                                        <span id="subtitlecount_lbl" class="well well-sm"></span>
                                    </div>--%>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <asp:Label runat="server" ID="lbltext" Text=":توضیحات خبر"></asp:Label>
                                            <CKEditor:CKEditorControl ID="ckDexription" runat="server"></CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <asp:Label runat="server" ID="Label1" Text="'گروه خبری:"></asp:Label>
                                            <asp:LinqDataSource ID="dsListGrpup" runat="server" OnSelecting="dsListGrpup_Selecting"></asp:LinqDataSource>
                                            <asp:DropDownList runat="server" ID="ddlShowGroup" CssClass="form-control" DataSourceID="dsListGrpup" DataTextField="TitleGroup" DataValueField="NewsGroupID" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <asp:Label runat="server" ID="lblImage" Text="'تصویر خبر:"></asp:Label>
                                            <asp:FileUpload runat="server" ID="fuNewsImage" />
                                            <br />
                                            <asp:Image runat="server" ID="imgShowimgeNews" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <asp:Button runat="server" ID="btnAddNews" Text="ثبت خبر" CssClass="btn btn-success" OnClick="btnAddNews_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text="انصراف" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </asp:View>
                    </asp:MultiView>

                </div>
            </div>
        </section>
    </section>
<%--    <script>
        function textCounter2(field, counter, maxlimit) {
            if (field.value.length > maxlimit) {
                field.value = field.value.substring(0, maxlimit);
            } else {
                document.getElementById(counter).innerText = maxlimit - field.value.length;
            }
        }
    </script>--%>
</asp:Content>
