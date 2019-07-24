
Partial Class AuditLogin
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs) Handles btnLogin.Click
        If UserName.Text = "aud" And Password.Text = "aud123" Then
            Response.Redirect("AuditHome.aspx")
        Else
            lblError.Text = "wrong pass"
        End If
    End Sub
End Class
