
Partial Class Staff
    Inherits System.Web.UI.MasterPage

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
        Session("StaffID") = Nothing
        Session("Username") = Nothing
        Response.Redirect("Default.aspx")
    End Sub
End Class

