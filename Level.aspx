<%@ Page Title="" Language="VB" MasterPageFile="~/AdminHome.master" AutoEventWireup="false" CodeFile="Level.aspx.vb" Inherits="Level" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
     <h2>New Level</h2>
<div id="Div1" class="form-horizontal" ">
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" 
                    Text="Level"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" 
                    Text="Salary"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtReq" CssClass="form-control" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" 
                    Text="Allowance"></asp:Label>
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
        <h2>All Level</h2>
        <hr />
        <div class="panel panel-default">
            <!-- default panel contents -->
            <div class="panel-heading">All Level</div>

            <asp:GridView ID="GridView1" CssClass="table table-responsive" GridLines="None" 
                runat="server" AutoGenerateColumns="False" DataKeyNames="Id" 
                DataSourceID="SqlDataSource1" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Names" HeaderText="Levels" SortExpression="Names" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" 
                        SortExpression="Salary" />
                    <asp:BoundField DataField="Allowance" HeaderText="Allowance" 
                        SortExpression="Allowance" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:Staff_AuditConnectionString %>" 
                DeleteCommand="DELETE FROM [tblLevel] WHERE [Id] = @original_Id AND (([Names] = @original_Names) OR ([Names] IS NULL AND @original_Names IS NULL)) AND (([Salary] = @original_Salary) OR ([Salary] IS NULL AND @original_Salary IS NULL)) AND (([Allowance] = @original_Allowance) OR ([Allowance] IS NULL AND @original_Allowance IS NULL))" 
                InsertCommand="INSERT INTO [tblLevel] ([Names], [Salary], [Allowance]) VALUES (@Names, @Salary, @Allowance)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [tblLevel]" 
                UpdateCommand="UPDATE [tblLevel] SET [Names] = @Names, [Salary] = @Salary, [Allowance] = @Allowance WHERE [Id] = @original_Id AND (([Names] = @original_Names) OR ([Names] IS NULL AND @original_Names IS NULL)) AND (([Salary] = @original_Salary) OR ([Salary] IS NULL AND @original_Salary IS NULL)) AND (([Allowance] = @original_Allowance) OR ([Allowance] IS NULL AND @original_Allowance IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Names" Type="String" />
                    <asp:Parameter Name="original_Salary" Type="Int32" />
                    <asp:Parameter Name="original_Allowance" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Names" Type="String" />
                    <asp:Parameter Name="Salary" Type="Int32" />
                    <asp:Parameter Name="Allowance" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Names" Type="String" />
                    <asp:Parameter Name="Salary" Type="Int32" />
                    <asp:Parameter Name="Allowance" Type="Int32" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Names" Type="String" />
                    <asp:Parameter Name="original_Salary" Type="Int32" />
                    <asp:Parameter Name="original_Allowance" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>

