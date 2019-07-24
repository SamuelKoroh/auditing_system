<%@ Page Title="" Language="VB" MasterPageFile="~/AdminHome.master" AutoEventWireup="false" CodeFile="Department.aspx.vb" Inherits="Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
    <h2>New Department</h2>
<div id="Div1" class="form-horizontal" ">
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Department Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Required Staff"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtReq" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtDescrip" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" Width="150" runat="server" Text="Add" CssClass="btn btn-success btn-lg" />
                </div>
            </div>
        </div>
        <h2>All Department</h2>
        <hr />
        <div class="panel panel-default">
            <!-- default panel contents -->
            <div class="panel-heading">All Department</div>

            <asp:GridView ID="GridView1" CssClass="table table-responsive" GridLines="None" 
                runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Names" HeaderText="Names" SortExpression="Names" />
                    <asp:BoundField DataField="Descrip" HeaderText="Description" 
                        SortExpression="Descrip" />
                    <asp:BoundField DataField="RequiredStaff" HeaderText="Required Staff" 
                        SortExpression="RequiredStaff" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
                DeleteCommand="DELETE FROM [tblDept] WHERE [ID] = @original_ID AND (([Names] = @original_Names) OR ([Names] IS NULL AND @original_Names IS NULL)) AND (([Descrip] = @original_Descrip) OR ([Descrip] IS NULL AND @original_Descrip IS NULL)) AND (([RequiredStaff] = @original_RequiredStaff) OR ([RequiredStaff] IS NULL AND @original_RequiredStaff IS NULL))" 
                InsertCommand="INSERT INTO [tblDept] ([Names], [Descrip], [RequiredStaff]) VALUES (@Names, @Descrip, @RequiredStaff)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [tblDept]" 
                UpdateCommand="UPDATE [tblDept] SET [Names] = @Names, [Descrip] = @Descrip, [RequiredStaff] = @RequiredStaff WHERE [ID] = @original_ID AND (([Names] = @original_Names) OR ([Names] IS NULL AND @original_Names IS NULL)) AND (([Descrip] = @original_Descrip) OR ([Descrip] IS NULL AND @original_Descrip IS NULL)) AND (([RequiredStaff] = @original_RequiredStaff) OR ([RequiredStaff] IS NULL AND @original_RequiredStaff IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Names" Type="String" />
                    <asp:Parameter Name="original_Descrip" Type="String" />
                    <asp:Parameter Name="original_RequiredStaff" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Names" Type="String" />
                    <asp:Parameter Name="Descrip" Type="String" />
                    <asp:Parameter Name="RequiredStaff" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Names" Type="String" />
                    <asp:Parameter Name="Descrip" Type="String" />
                    <asp:Parameter Name="RequiredStaff" Type="Int32" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Names" Type="String" />
                    <asp:Parameter Name="original_Descrip" Type="String" />
                    <asp:Parameter Name="original_RequiredStaff" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

</asp:Content>

