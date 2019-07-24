Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class UpdateDetails
    Inherits System.Web.UI.Page
    Dim EmpID As Integer
    Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        EmpID = Session("StaffID")


        Dim query As String = "Select * from tblStaff Where StaffID=@ID"
        Try
            Image1.ImageUrl = "~/ShowImage.ashx?id=" & EmpID


            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.Add("ID", SqlDbType.Int).Value = EmpID
                    conn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader
                        If dr.HasRows Then
                            dr.Read()

                            txtUser.Text = dr.Item("Username")
                            txtFName.Text = dr.Item("Firstname")
                            txtMName.Text = dr.Item("MiddleName")
                            txtLName.Text = dr.Item("Surname")
                            drpGender.Text = dr.Item("Gender")
                            txtBirth.Text = Format(dr.Item("DOB"), "Short Date")
                            txtenlisted.Text = Format(dr.Item("StartDate"), "Short Date")
                            drpEntryQual.Text = dr.Item("EntryQualification")
                            txtPhone.Text = dr.Item("ContactNo")
                            txtAddress.Text = dr.Item("ContactAddress")
                            txtKin.Text = dr.Item("NextKin")
                            '  Dim GetDate As Date = Format(dr.Item("StartDate"), "Short Date")
                            '  lblService.Text = (Now.Year - GetDate.Year).ToString + "years"
                            txtNat.Text = dr.Item("Nationality")
                            txtState.Text = dr.Item("State")
                            txtLGA.Text = dr.Item("LGA")
                            txtStudy.Text = dr.Item("FieldSt")
                        End If
                    End Using
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim str As String = "Update tblStaff Set Username =@User, Firstname=@FName,MiddleName=@MName, " & _
                "Surname =@SName,Gender=@Gender,DOB=@DOB, StartDate=@SDate,EntryQualification=@Entry, " & _
                "ContactNo=@Phone,ContactAddress=@Address,NextKin=@Kin,Nationality=@Nat,State=@Sta,LGA=@LGA, " & _
                "FieldSt=@Field,Password=@pass " & _
                "Where StaffID=@ID"

            Dim DOB As DateTime = DateTime.Parse(Request.Form(txtBirth.UniqueID))
            Dim DOE As DateTime = DateTime.Parse(Request.Form(txtenlisted.UniqueID))

            'Dim fi As FileInfo = New FileInfo(FileUpload1.FileName)
            'Dim FileSize As Integer = FileUpload1.PostedFile.ContentLength
            'Dim FileExt As String = fi.Extension


            'Dim img As FileUpload = CType(FileUpload1, FileUpload)
            'Dim imgByte As Byte() = Nothing
            'If img.HasFile AndAlso Not img.PostedFile Is Nothing Then
            '    ' Create a posted file
            '    Dim file As HttpPostedFile = FileUpload1.PostedFile
            '    ' create byte array with file length
            '    imgByte = New Byte(file.ContentLength - 1) {}
            '    ' force the control to load the data in array
            '    file.InputStream.Read(imgByte, 0, file.ContentLength)
            'End If


            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand(str, conn)
                    cmd.Parameters.AddWithValue("User", txtUser.Text)
                    cmd.Parameters.AddWithValue("FName", txtFName.Text)
                    cmd.Parameters.AddWithValue("MName", txtMName.Text)
                    cmd.Parameters.AddWithValue("SName", txtLName.Text)
                    cmd.Parameters.AddWithValue("Gender", drpGender.SelectedValue.ToString)
                    cmd.Parameters.AddWithValue("DOB", DOB)
                    cmd.Parameters.AddWithValue("SDate", DOE)
                    cmd.Parameters.AddWithValue("Entry", drpEntryQual.Text)
                    cmd.Parameters.AddWithValue("Phone", txtPhone.Text)
                    cmd.Parameters.AddWithValue("Address", txtAddress.Text)
                    cmd.Parameters.AddWithValue("Kin", txtKin.Text)
                    cmd.Parameters.AddWithValue("Nat", txtNat.Text)
                    cmd.Parameters.AddWithValue("Sta", txtState.Text)
                    cmd.Parameters.AddWithValue("LGA", txtLGA.Text)
                    cmd.Parameters.AddWithValue("field", txtStudy.Text)
                    cmd.Parameters.AddWithValue("Pass", txtPass.Text)
                    'cmd.Parameters.AddWithValue("passport", imgByte)
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
