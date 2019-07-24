<%@ Page Title="" Language="VB" MasterPageFile="~/AdminHome.master" AutoEventWireup="false" CodeFile="Staff.aspx.vb" Inherits="Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
      <h2>New User</h2><hr />
<div id="Div1" class="form-horizontal">
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="First Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Middle Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtMName" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label18" runat="server" CssClass="col-md-2 control-label" Text="Last Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList CssClass="form-control" ID="drpGender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Nationality"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtNat" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="State"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="L.G.A"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtLGA" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Date of Birth"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtBirth" CssClass="form-control datepicker " runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Phone Number"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Address"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label11" runat="server" CssClass="col-md-2 control-label" Text="Field of Study"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtStudy" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label12" runat="server" CssClass="col-md-2 control-label" Text="Next of Kin"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtKin" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label13" runat="server" CssClass="col-md-2 control-label" Text="Date Enlisted"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtenlisted" CssClass="form-control datepicker"  
                        runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label14" runat="server" CssClass="col-md-2 control-label" Text="Entry Qualification"></asp:Label>
                <div class="col-md-3">
                     <asp:DropDownList CssClass="form-control" ID="drpEntryQual" runat="server">
                        <asp:ListItem>FLSC</asp:ListItem>
                     <asp:ListItem>SSCE</asp:ListItem>
                     <asp:ListItem>OND</asp:ListItem>
                     <asp:ListItem>NCE</asp:ListItem>
                     <asp:ListItem>HND</asp:ListItem>
                     <asp:ListItem>Bsc/ B tech / B Eng</asp:ListItem>
                     <asp:ListItem>M Sc</asp:ListItem>
                     <asp:ListItem>Phd</asp:ListItem>
                    </asp:DropDownList>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label15" runat="server" CssClass="col-md-2 control-label" Text="Department"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList CssClass="form-control" ID="drpDepart" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Names" 
                        DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
                        SelectCommand="SELECT [Names], [ID] FROM [tblDept]"></asp:SqlDataSource>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label16" runat="server" CssClass="col-md-2 control-label" Text="Current Level"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList CssClass="form-control" ID="drpLevel" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="Names" 
                        DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
                        SelectCommand="SELECT [Id], [Names] FROM [tblLevel]"></asp:SqlDataSource>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label17" runat="server" CssClass="col-md-2 control-label" Text="Passport"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload1"  runat="server" />
              </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" Width="150" runat="server" Text="Add" CssClass="btn btn-success btn-lg" />
                </div>
            </div>
        </div>
</asp:Content>

