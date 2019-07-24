<%@ Page Title="" Language="VB" MasterPageFile="~/Staff.master" AutoEventWireup="false" CodeFile="UpdatePass.aspx.vb" Inherits="UpdatePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
    <h2>Update Passport</h2>
    <hr />
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <asp:Image ID="Image1" CssClass="img-responsive" runat="server" Height="160px" /></div>
    </div>
    <br />
    <div class="row">
     <div class="form-group">
                <asp:Label ID="Label17" runat="server" CssClass="col-md-2 control-label" Text="Passport"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload1"  runat="server" />
              </div>
            </div>
            </div><br /><br />
           <div class="row">
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" Width="100" runat="server" Text="Update" CssClass="btn btn-success" />
                </div>
                </div>
            </div>
</asp:Content>

