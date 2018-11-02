<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NestedMasterPageSaidbarBlog.master" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="Weblog.ASP.NET.Webform.Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubMasterContent" runat="server">
    <!-- Blog Entries Column -->
    <div class="col-md-8">

        <h1 class="page-header hide">وبلاگ vs2 کوتاه کننده لینک
                    <small>کوتاه کننده لینک</small>
        </h1>
        <asp:LinqDataSource runat="server" ID="dsShowNews" OnSelecting="dsShowListGroup_OnSelecting"></asp:LinqDataSource>
        <asp:ListView runat="server" ID="lvShowNews" DataSourceID="dsShowNews">
            <ItemTemplate>
                <!-- First Blog Post -->
                <h2>
                    <a rel="bookmark" title="<%#Eval("NewsTitle") %>" href='<%# string.Format("/post/{0}/{1}",Eval("NewsID"),Eval("NewsTitle")).Replace(" ","-").Replace("?","").Replace("؟","")  %>' target="_blank"><%#Eval("NewsTitle") %> </a>
                </h2>
                <hr />
                <!-- Author -->
                <p class="lead">
                    نوشته شده در دسته : <a href='<%# string.Format("/group/{0}/{1}",Eval("NewsGroupID"),Eval("TitleGroup")).Replace(" ","-").Replace("?","").Replace("؟","") %>' target="_blank">
                        <%#Eval("TitleGroup")%>

                    </a>
                </p>

                <hr />
                <div class="glyphicon glyphicon-calendar">
                    <label class="badge">
                        <span>منتشر شده در<%# string.Format("{0:dddd, dd MMMM yyyy}",Eval("Date" +"")) %> </span>
                    </label>
                </div>
                <hr />
                <a href='<%# string.Format("/post/{0}/{1}",Eval("NewsID"),Eval("NewsTitle")).Replace(" ","-").Replace("?","").Replace("؟","") %>' target="_blank">
                    <img class="img-responsive text-center" alt="<%#Eval("NewsTitle") %>" src='<%#"/Image/Blog/Images/Image/"+Eval("NewsImage") %>' />
                </a>
                <hr>
                <p>
                    <%#Eval("Description") %>
                </p>
                <a class="btn btn-primary" href='<%# string.Format("/News/{0}/{1}",Eval("NewsID"),Eval("NewsTitle")).Replace(" ","-").Replace("?","").Replace("؟","") %>' target="_blank">مشاهده کامل پست <span class="glyphicon glyphicon-chevron-right"></span></a>
                <hr />
            </ItemTemplate>
        </asp:ListView>

        <center>
                <asp:DataPager ID="dataPagarLv" runat="server" class="btn-group btn-group-sm" PageSize="5" PagedControlID="lvShowNews">
                    <Fields>
                        <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="اولین" ShowPreviousPageButton="true"
                            ShowFirstPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false"
                            ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                        <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-primary disabled" RenderNonBreakingSpacesBetweenControls="false"
                            NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
                        <asp:NextPreviousPagerField NextPageText=">" LastPageText="آخرین" ShowNextPageButton="true"
                            ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                            ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                    </Fields>
                </asp:DataPager>
                </center>

    </div>





    <hr />
</asp:Content>
