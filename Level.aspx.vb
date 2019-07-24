Imports System.Data.SqlClient
Imports System.Data

Partial Class Level
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("Insert into tblLevel(Names,Salary,Allowance) values(@Names,@Salary,@Allow)", conn)
                    cmd.Parameters.Add("Names", SqlDbType.NVarChar).Value = txtName.Text.Trim
                    cmd.Parameters.Add("Salary", SqlDbType.Int).Value = txtReq.Text.Trim
                    cmd.Parameters.Add("Allow", SqlDbType.Int).Value = txtDescrip.Text.Trim
                    conn.Open()
                    cmd.ExecuteNonQuery()
                    Response.Redirect("Level.aspx")
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Sub
End Class
