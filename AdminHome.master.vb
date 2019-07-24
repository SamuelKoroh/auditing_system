
Partial Class AdminHome
    Inherits System.Web.UI.MasterPage

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
        Session("AdminUser") = Nothing
        Response.Redirect("Default.aspx")
    End Sub
End Class

