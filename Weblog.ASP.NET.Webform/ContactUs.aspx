<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Weblog.ASP.NET.Webform.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">ارتباط با ما

                        </h3>
                    </div>
                    <div class="panel-body">
                        <div role="form">
                            <div class="form-group">
                                <asp:TextBox ID="txtFullName" required placeholder="نام خود را وارد کنید" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" required ID="txtEmail"
                                    TextMode="Email" placeholder="ایمیل خود را وارد کنید"
                                    CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtNote" required placeholder="پیام خود را بنویسید" TextMode="MultiLine" Height="60px" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="bntSendContactUS" CssClass="btn btn-lg btn-success btn-block" OnClick="bntSendContactUS_Click" runat="server" Text="ارسال پیام" />
                            </div>

                            <br />
                            <div class="alert alert-success btn-block" runat="server" id="divAlertSuccess">
                                پیام با موفقیت ارسال شد.
                            </div>
                            <div class="alert alert-danger btn-block" runat="server" id="divAlertNotFount">
                                پیام ارسال نشد لطف مجددا تلاش کنید

                            </div>
                        </div>

                        <div class="col-md-4">
                            <a href="/Login.aspx" class="btn btn-primary  btn-block">ورود به سایت</a>
                        </div>
                        <div class="col-md-4">
                            <a href="/Register.aspx" class="btn btn-danger  btn-block">عضویت</a>
                        </div>
                        <div class="col-md-4">
                            <a href="/Reactivating.aspx" class="btn btn-warning  btn-block">فعال سازی مجدد</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
