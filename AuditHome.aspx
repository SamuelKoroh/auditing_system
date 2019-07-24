<%@ Page Title="" Language="VB" MasterPageFile="~/Audit.master" AutoEventWireup="false" CodeFile="AuditHome.aspx.vb" Inherits="AuditHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
    <h1>Audit Personnel</h1><br /><br /><br />

    <div class="row">
        <div class="col-md-6">
            <asp:Label ID="Label1" CssClass="col-md-4" runat="server" Text="Sort by Department"></asp:Label>
            <div class="col-md-6">
                <asp:DropDownList ID="DropDownList1" CssClass="form-control col-md-8" 
                    runat="server" AppendDataBoundItems="True" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="Names" DataValueField="ID">
                    <asp:ListItem Value="">--- select ---</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
                    SelectCommand="SELECT [Names], [ID] FROM [tblDept]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-6">
            <asp:Label ID="Label2" CssClass="col-md-4" runat="server" Text="Sort by Level"></asp:Label>
            <div class="col-md-6">
                <asp:DropDownList ID="DropDownList2" CssClass="form-control col-md-8" 
                    runat="server" AppendDataBoundItems="True" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="Names" DataValueField="Id">
                    <asp:ListItem Value="">--- select ---</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
                    SelectCommand="SELECT [Names], [Id] FROM [tblLevel]"></asp:SqlDataSource>
            </div>
        </div>
    </div>


        <hr />
        <div class="panel panel-default">
            <!-- default panel contents -->
            <div class="panel-heading">Personnel</div>

            <asp:repeater id="rptrStaff" runat="server">
                <headertemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Names</th>
                                <th>Department</th>
                                <th>Level</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                </headertemplate>
                <itemtemplate>
                    <tr>
                        <th><%# Eval("StaffID")%></th>
                        <td><%# Eval("Firstname")%></td>
                        <td><%# Eval("Department")%></td>
                        <td><%# Eval("GradeLevel")%></td>
                        <td><a href="AuditStaff.aspx?StaffID=<%# Eval("StaffID")%>">View</a></td>
                    </tr>
                </itemtemplate>
                <footertemplate>
                    </tbody>
            </table>
                </footertemplate>
            </asp:repeater>
        </div>

</asp:Content>

