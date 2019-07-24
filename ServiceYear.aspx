<%@ Page Title="" Language="VB" MasterPageFile="~/Audit.master" AutoEventWireup="false" CodeFile="ServiceYear.aspx.vb" Inherits="ServiceYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
<h2>Services Year</h2>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" GridLines="None" Width="908px" CssClass="table table-striped">
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                               <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Staff" HeaderText="Staff" ReadOnly="True" 
                            SortExpression="Staff" />
                        <asp:BoundField DataField="GradeLevel" HeaderText="Grade Level" 
                            SortExpression="GradeLevel" />
                        <asp:BoundField DataField="Dept" HeaderText="Department" 
                            SortExpression="Dept" />
                        <asp:BoundField DataField="Salary" HeaderText="Salary" 
                            SortExpression="Salary" />
                        <asp:BoundField DataField="Allowance" HeaderText="Allowance" 
                            SortExpression="Allowance" />
                        <asp:BoundField DataField="Service Years" HeaderText="Service Years" 
                            ReadOnly="True" SortExpression="Service Years" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
                    SelectCommand="SELECT tblStaff.Firstname + ' ' + tblStaff.MiddleName + ' ' + tblStaff.Surname AS Staff, tblLevel.Names AS GradeLevel, tblDept.Names AS Dept, tblLevel.Salary, tblLevel.Allowance, CONVERT (varchar(10), DATEPART(Year, GETDATE()) - DATEPART(Year, tblStaff.StartDate), 103) + ' years' AS [Service Years] FROM tblStaff INNER JOIN tblLevel ON tblStaff.GradeLevel = tblLevel.Id INNER JOIN tblDept ON tblStaff.Department = tblDept.ID">
                </asp:SqlDataSource>

</asp:Content>

