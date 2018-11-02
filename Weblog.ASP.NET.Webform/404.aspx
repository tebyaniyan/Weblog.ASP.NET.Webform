<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="Weblog.ASP.NET.Webform._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
       <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                   <img src="/Image/error-img.png" alt="خطای 404" class="img-responsive topmargin" />
                    <hr />
                    <h2>صفحه مورد نظر یافت نشد </h2>
                    <a href="/Default.aspx" class="btn btn-warning btn-block">بازگشت به صفحه اصلی</a>
                </div>
            </div>
        </div>
</asp:Content>
