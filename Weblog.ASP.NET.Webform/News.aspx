<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NestedMasterPageSaidbarBlog.master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Weblog.ASP.NET.Webform.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubMasterContent" runat="server">
    <div class="container">
        <div class="row">
            <!-- Blog Post Content Column -->
            <div class="col-lg-8">
                <!-- Blog Post -->
                <asp:LinqDataSource ID="dsShowNews" runat="server" OnSelecting="dsShowNews_Selecting"></asp:LinqDataSource>
                <asp:ListView ID="lvShowNews" runat="server" DataSourceID="dsShowNews">
                    <ItemTemplate>
                        <h1>
                            <a rel="bookmark" title="<%#Eval("NewsTitle") %>" href='<%# string.Format("/post/{0}/{1}",Eval("NewsID"),Eval("NewsTitle")).Replace(" ","-").Replace("?","").Replace("؟","")  %>' target="_blank"><%#Eval("NewsTitle") %> </a>
                        </h1>
                        <!-- Author -->
                        <p class="lead">
                            نوشته شده در دسته : <a href='<%# string.Format("/group/{0}/{1}",Eval("NewsGroupID"),Eval("TitleGroup")).Replace(" ","-").Replace("?","").Replace("؟","") %>' target="_blank">
                                <%#Eval("TitleGroup")%>
                            </a>
                        </p>
                        <hr />
                        <!-- Date/Time -->
                        <p>
                            <span class="glyphicon glyphicon-time"></span>
                            <span class="fontyekan">منتشر شده در<%# string.Format("{0:dddd, dd MMMM yyyy}",Eval("Date" +"")) %> </span>
                        </p>
                        <hr />
                        <!-- Preview Image -->
                        <a href='<%# string.Format("/post/{0}/{1}",Eval("NewsID"),Eval("NewsTitle")).Replace(" ","-").Replace("?","").Replace("؟","") %>' target="_blank">
                            <img class="img-responsive text-center" alt="<%#Eval("NewsTitle") %>" src='<%#"/Image/Blog/Images/Image/"+Eval("NewsImage") %>' />
                        </a>
                        <hr/>
                        <!-- Post Content -->
                        <p>
                            <%#Eval("Description") %>
                        </p>
                    </ItemTemplate>
                </asp:ListView>
                <!-- Title -->
                <hr />
                <!-- Blog Comments -->
                <!-- Comments Form -->
                <div class="well">
                    <h4>ثبت نظر :</h4>
                    <div role="form">
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox ID="txtComment" required runat="server" TextMode="MultiLine" Height="100px" CssClass="form-control" Rows="3"></asp:TextBox>
                            </div>
                            <br />
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="lblName" runat="server" Text="نام:"></asp:Label>
                                    <asp:TextBox ID="txtName" required runat="server" CssClass="form-control" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="lblEmail" runat="server" Text="ایمیل:"></asp:Label>
                                    <asp:TextBox ID="txtEmail" TextMode="Email" required runat="server" CssClass="form-control" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="btnSubmitCommnett" runat="server" OnClick="btnSubmitCommnet_ServerClick" CssClass="btn btn-primary btn-block" Text="ثبت نظر" />
                    </div>
                    <hr />
                    <!-- Posted Comments -->
                    <!-- Comment -->
                    <asp:LinqDataSource ID="dsListCommnet" runat="server" OnSelecting="dsList_Selecting"></asp:LinqDataSource>
                    <h4>لیست نظرات</h4>
                    <asp:Repeater runat="server" ID="rptListComment" DataSourceID="dsListCommnet">
                        <ItemTemplate>
                            <div class="media">
                                <a class="pull-right" href="#">
                                    <img class="media-object" src="/Image/1495479747_boy.png" alt="">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><%#Eval("FullName") %>
                                        <small><%# string.Format("{0:dddd, dd MMMM yyyy}",Eval("Date" +"")) %></small>
                                    </h4>
                                    <%#Eval("NewsCommentText") %>
                                </div>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</asp:Content>
