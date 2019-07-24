<%@ Page Title="" Language="VB" MasterPageFile="~/Audit.master" AutoEventWireup="false" CodeFile="WorkStrength.aspx.vb" Inherits="WorkStrength" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
<h2>Working Strength</h2>
 <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" 
        style="margin-bottom: 56px" Width="701px">
        <Columns>
        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                               <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
            <asp:BoundField DataField="Department" HeaderText="Department" />
            <asp:BoundField DataField="CurrentStaff" HeaderText="Current Staff" />
            <asp:BoundField DataField="ExpectedStaff" HeaderText="Expected Staff" />
            <asp:BoundField DataField="RequiredStaff" HeaderText="Required Staff" />
        </Columns>
    </asp:GridView>
</asp:Content>

