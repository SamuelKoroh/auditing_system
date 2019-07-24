Imports System.Data.SqlClient
Imports System.Data

Partial Class StaffLogin
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs) Handles btnLogin.Click
        Try
            Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("select * from tblStaff where Username=@User AND Password=@Pass", conn)
                    cmd.Parameters.Add("User", Data.SqlDbType.NVarChar).Value = UserName.Text.Trim
                    cmd.Parameters.Add("Pass", Data.SqlDbType.NVarChar).Value = Password.Text.Trim
                    conn.Open()
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If (dt.Rows.Count <> 0) Then
                        If CheckBox1.Checked = True Then
                            Response.Cookies("Username").Value = UserName.Text
                            Response.Cookies("PWD").Value = Password.Text
                            Response.Cookies("Username").Expires = Date.Now.AddDays(7)
                            Response.Cookies("PWD").Expires = Date.Now.AddDays(7)

                        Else
                            Response.Cookies("Username").Expires = Date.Now.AddDays(-1)
                            Response.Cookies("PWD").Expires = Date.Now.AddDays(-1)
                        End If
                        Session("StaffID") = dt.Rows(0)(0)
                        Session("Username") = dt.Rows(0)(1).ToString + " " + dt.Rows(0)(2).ToString + " " + dt.Rows(0)(3).ToString

                        Response.Redirect("UpdateDetails.aspx")
            
                    End If
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Sub
End Class
