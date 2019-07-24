<%@ Page Title="" Language="VB" MasterPageFile="~/Audit.master" AutoEventWireup="false" CodeFile="AllStaffRept.aspx.vb" Inherits="AllStaffRept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
<h2>All Staff</h2>
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" GridLines="None" Width="908px" CssClass="table table-striped">
        <Columns>
        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                               <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
            <asp:BoundField DataField="Staff" HeaderText="Staff" ReadOnly="True" 
                SortExpression="Staff" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:BoundField DataField="Dept" HeaderText="Department" 
                SortExpression="Dept" />
            <asp:BoundField DataField="GradeLevel" HeaderText="Grade Level" 
                SortExpression="GradeLevel" />
            <asp:BoundField DataField="StartDate" HeaderText="Date Employed" 
                SortExpression="StartDate" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Retire Years" HeaderText="Retirement Year" 
                ReadOnly="True" SortExpression="Retire Years" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
        SelectCommand="SELECT tblStaff.Firstname + ' ' + tblStaff.MiddleName + ' ' + tblStaff.Surname AS Staff, tblStaff.Gender, tblDept.Names AS Dept, tblLevel.Names AS GradeLevel, tblStaff.StartDate,CONVERT (varchar(10),  DATEPART(Year, tblStaff.StartDate) + 35, 103)  AS [Retire Years] FROM tblStaff INNER JOIN tblLevel ON tblStaff.GradeLevel = tblLevel.Id INNER JOIN tblDept ON tblStaff.Department = tblDept.ID">
    </asp:SqlDataSource>
</asp:Content>

