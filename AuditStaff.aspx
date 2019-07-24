<%@ Page Title="" Language="VB" MasterPageFile="~/Audit.master" AutoEventWireup="false" CodeFile="AuditStaff.aspx.vb" Inherits="AuditStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpContent" Runat="Server">
    <div class="row">
        <div class="col-md-5">
            <table class="table">
        <tr>
            <td class="style1">
                <asp:Image ID="Image1" runat="server" Height="167px" Width="140px" />
            </td>
            
            <td>
                &nbsp;</td>
        </tr>
    
        <tr>
            <td class="style6">
                Staff ID:</td>
            <td class="style7">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td class="style8" rowspan="20">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Username:</td>
            <td>
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                First Name:</td>
            <td>
                <asp:Label ID="lblFirst" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Middle Name:</td>
            <td>
                <asp:Label ID="lblMiddle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Surname:</td>
            <td>
                <asp:Label ID="lblSurname" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Gender:</td>
            <td class="style7">
                <asp:Label ID="lblGender" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Date of Birth:</td>
            <td class="style7">
                <asp:Label ID="lblDOB" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Nationality:</td>
            <td class="style7">
                <asp:Label ID="lblNation" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                State:</td>
            <td class="style7">
                <asp:Label ID="lblState" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Local Govt. Area:</td>
            <td class="style7">
                <asp:Label ID="lblLGA" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Date Enlisted:</td>
            <td>
                <asp:Label ID="lblDOE" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Phone Number:</td>
            <td>
                <asp:Label ID="lblPhone" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Address:</td>
            <td>
                <asp:Label ID="lblAddress" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Next of Kin:</td>
            <td>
                <asp:Label ID="lblNextK" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Field of Study:</td>
            <td>
                <asp:Label ID="lblField" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Entry Qualification:</td>
            <td>
                <asp:Label ID="lblEntryQua" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Department:</td>
            <td>
                <asp:Label ID="lblDepart" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Grade Level:</td>
            <td>
                <asp:Label ID="lblGrade" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Years in Service</td>
            <td>
                <asp:Label ID="lblService" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Status:</td>
            <td>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Verification Status</td>
            <td>
                <asp:Label ID="lblVStatus" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Button ID="btnBack" CssClass="btn btn-default" runat="server" Text="Back" Width="79px" />
            </td>
            <td>
                <asp:Button ID="btnStatus" CssClass="btn btn-default" runat="server" Text="Verify" Width="92px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        </div>
      <div class="col-md-7"> 
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
                </asp:GridView>
                </div> </div> 
</asp:Content>

