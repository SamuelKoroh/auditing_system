Imports System.Data.SqlClient
Imports System.IO

Partial Class UpdatePass
    Inherits System.Web.UI.Page
    Dim EmpID As Integer
    Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        EmpID = Session("StaffID")


        Dim query As String = "Select * from tblStaff Where StaffID=@ID"
        Try
            Image1.ImageUrl = "~/ShowImage.ashx?id=" & EmpID
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim str As String = "Update tblStaff Set Passport=@Passport " & _
                "Where StaffID=@ID"


            Dim fi As FileInfo = New FileInfo(FileUpload1.FileName)
            Dim FileSize As Integer = FileUpload1.PostedFile.ContentLength
            Dim FileExt As String = fi.Extension


            Dim img As FileUpload = CType(FileUpload1, FileUpload)
            Dim imgByte As Byte() = Nothing
            If img.HasFile AndAlso Not img.PostedFile Is Nothing Then
                ' Create a posted file
                Dim file As HttpPostedFile = FileUpload1.PostedFile
                ' create byte array with file length
                imgByte = New Byte(file.ContentLength - 1) {}
                ' force the control to load the data in array
                file.InputStream.Read(imgByte, 0, file.ContentLength)
            End If


            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand(str, conn)
                    cmd.Parameters.AddWithValue("passport", imgByte)
                    cmd.Parameters.AddWithValue("ID", EmpID)
                    conn.Open()
                    cmd.ExecuteNonQuery()
                    Response.Redirect("UpdateDetails.aspx")
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Sub
End Class
