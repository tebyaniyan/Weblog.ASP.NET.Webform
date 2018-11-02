<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Weblog.ASP.NET.Webform.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
           <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">ورود به صفحه پروفایل</h3>
                        </div>
                        <div class="panel-body">
                            <div role="form">
                                <fieldset>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtEmail" placeholder="ایمیل را وارد کنید" type="email" autofocus CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtPassword" placeholder="کلمه عبور را وارد کنید" type="password" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:CheckBox ID="ckSave" runat="server" Text="مرا به خاطر بسپار" />
                                    </div>
                                    <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-lg btn-success btn-block" OnClick="btnLogin_OnClick" Text="ورود" />
                                </fieldset>
                            </div>
                            <br />
                            <asp:CustomValidator runat="server" ID="cuValidator" OnServerValidate="cuValidator_OnServerValidate" ErrorMessage="اطلاعات کاربری یافت نشد" CssClass="alert alert-danger btn-block"></asp:CustomValidator>
                            <div class="alert alert-danger btn-block" runat="server" id="divError">
                                .اطلاعات کاربری یافت نشد و یا اینکه لینک فعال سازی را تایید نکردید
                            </div>
                            <hr />
                              <div class="col-md-4">
                            <a href="/ForgetPassword.aspx" class="btn btn-danger  btn-block">فراموشی رمز</a>
                        </div>
                                 <div class="col-md-4">
                            <a href="/Register.aspx" class="btn btn-warning  btn-block">عضویت</a>
                        </div>
                             <div class="col-md-4">
                            <a href="/Reactivating.aspx" class="btn btn-primary  btn-block">فعال سازی ایمیل</a>
                        </div>
                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>



