<%@ Page Title="" Language="VB" MasterPageFile="~/Staff.master" AutoEventWireup="false" CodeFile="UploadCredential.aspx.vb" Inherits="UploadCredential" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
    <h2>Upload Credentials</h2>
    <hr />
   
    
    <div class="row">
        <div class="col-md-6">
            <div id="Div1" class="form-horizontal">
             <div class="form-group">
                <asp:Label ID="lblName" runat="server" CssClass="col-md-4 control-label" Text="Credential Name"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label17" runat="server" CssClass="col-md-4 control-label" Text="Credential"></asp:Label>
                <div class="col-md-8">
                    <asp:FileUpload ID="FileUpload1"  runat="server" />
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblM" runat="server" CssClass="col-md-4 control-label" Text="Award Date"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtDate" CssClass="form-control datepicker" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="Decription"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
             <div class="form-group">
                <div class="col-md-4"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" Width="150" runat="server" Text="Submit" CssClass="btn btn-default btn-lg" />
                </div>
            </div>
        </div>
    </div>
    </div>
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label><br /><br />
    <div class="container">
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID"  GridLines="None" CssClass="table table-responsive">
                    <Columns>
                    <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                               <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CredentialName" HeaderText="Credential" />
                        <asp:BoundField DataField="AwardDate" HeaderText="Awarded Date" />
                        <asp:TemplateField HeaderText="Document">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" OnClick="OpenDocument" runat="server" CommandName="DownloadFile" Text='<%# Eval("DocName") %>' 
                                    CommandArgument='<%# Eval("SN") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="Descrip" HeaderText="Description" />
                    </Columns>
                </asp:GridView></div><br /><br />
</asp:Content>

