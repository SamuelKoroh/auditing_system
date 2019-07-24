<%@ Page Title="" Language="VB" MasterPageFile="~/Audit.master" AutoEventWireup="false" CodeFile="StaffQual.aspx.vb" Inherits="StaffQual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
<h2>Staff Qualification</h2>
<asp:GridView ID="GridView1" runat="server" GridLines="None" Width="908px" CssClass="table table-striped" AutoGenerateColumns="False" 
        DataKeyNames="StaffID" DataSourceID="SqlDataSource1" >
        <Columns>
        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                               <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
            <asp:BoundField DataField="FullName" HeaderText="Names" ReadOnly="True" 
                SortExpression="FullName" />
            <asp:BoundField DataField="Dept" HeaderText="Department" 
                SortExpression="Dept" />
            <asp:BoundField DataField="FieldSt" HeaderText="Field of Study" 
                SortExpression="FieldSt" ControlStyle-Width="2220px" />
            <asp:BoundField DataField="EntryQualification" HeaderText="Entry Qualification" 
                SortExpression="EntryQualification" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" SelectCommand="SELECT        tblStaff.Firstname + ' ' + tblStaff.MiddleName + ' ' + tblStaff.Surname AS FullName, tblDept.Names As Dept, tblStaff.FieldSt, tblStaff.EntryQualification, tblStaff.StaffID
FROM            tblStaff INNER JOIN
                         tblDept ON tblStaff.Department = tblDept.ID">
    </asp:SqlDataSource>
</asp:Content>

