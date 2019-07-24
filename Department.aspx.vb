Imports System.Data.SqlClient
Imports System.Data

Partial Class Department
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("Insert into tblDept(Names,Descrip,RequiredStaff) values(@Cert,@Des,@Req)", conn)
                    cmd.Parameters.Add("Cert", SqlDbType.NVarChar).Value = txtName.Text.Trim
                    cmd.Parameters.Add("Des", SqlDbType.NVarChar).Value = txtDescrip.Text.Trim
                    cmd.Parameters.Add("Req", SqlDbType.Int).Value = txtReq.Text.Trim
                    conn.Open()
                    cmd.ExecuteNonQuery()
                    Response.Redirect("Department.aspx")
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Sub
End Class
