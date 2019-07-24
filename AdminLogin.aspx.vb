Imports System.Data.SqlClient
Imports System.Data

Partial Class AdminLogin
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs) Handles btnLogin.Click
        Try
            Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("select * from tblAdmin where username=@User AND password=@Pass", conn)
                    cmd.Parameters.Add("User", Data.SqlDbType.NVarChar).Value = UserName.Text.Trim
                    cmd.Parameters.Add("Pass", Data.SqlDbType.NVarChar).Value = Password.Text.Trim
                    conn.Open()
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If (dt.Rows.Count <> 0) Then

                        Session("AdminUser") = dt.Rows(0)(1)
                        Response.Redirect("Level.aspx")
                    Else
                        Response.Redirect("Default.aspx")
                    End If
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Sub
End Class
