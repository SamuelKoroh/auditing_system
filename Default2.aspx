<%@ Page Title="" Language="VB" MasterPageFile="~/Audit.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
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
                                    CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="Descrip" HeaderText="Description" />
                    </Columns>
                </asp:GridView></div>
</asp:Content>

