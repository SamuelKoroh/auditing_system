Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class Staff
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim DOB As DateTime = DateTime.Parse(Request.Form(txtBirth.UniqueID))
            Dim DOE As DateTime = DateTime.Parse(Request.Form(txtenlisted.UniqueID))

            Dim fi As FileInfo = New FileInfo(FileUpload1.FileName)
            Dim FileSize As Integer = FileUpload1.PostedFile.ContentLength
            Dim FileExt As String = fi.Extension

            'If FileExt.ToLower <> ".jpg" Or FileExt.ToLower <> ".png" Or FileExt.ToLower <> ".jpeg" Then
            '    Label1.Text = "This file is not supported"
            '    Label1.ForeColor = Drawing.Color.Red
            '    Exit Sub
            'End If
            'If FileSize > 1048576 Then
            '    Label1.Text = "The passport must not exceed (1MB)"
            '    Label1.ForeColor = Drawing.Color.Red
            '    Exit Sub
            'End If


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


            Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("Insert into tblStaff(Firstname,MiddleName,Surname,DOB,StartDate,GradeLevel, " & _
                                            "Department,Password,EntryQualification,Passport,Username,Gender,ContactAddress,ContactNo,NextKin,Nationality,[State],LGA,FieldSt,Status) " & _
                                            " values(@FN,@MN,@SN,@DB,@SD,@GL, " & _
                                            " @DP,@PD,@EQ,@PT,@User,@sex,@CAdd,@CNo,@NKin,@Nation,@State,@LGA,@Field,'In Service' )", conn)
                    cmd.Parameters.Add("FN", SqlDbType.NVarChar).Value = txtFName.Text.Trim
                    cmd.Parameters.Add("MN", SqlDbType.NVarChar).Value = txtMName.Text.Trim
                    cmd.Parameters.Add("SN", SqlDbType.NVarChar).Value = txtLName.Text.Trim
                    cmd.Parameters.AddWithValue("DB", DOB)
                    cmd.Parameters.AddWithValue("SD", DOE)
                    cmd.Parameters.Add("GL", SqlDbType.Int).Value = drpLevel.SelectedValue
                    cmd.Parameters.Add("DP", SqlDbType.Int).Value = drpDepart.SelectedValue
                    cmd.Parameters.Add("PD", SqlDbType.NVarChar).Value = "12345"
                    cmd.Parameters.Add("EQ", SqlDbType.NVarChar).Value = drpEntryQual.Text.Trim
                    cmd.Parameters.AddWithValue("@PT", imgByte)
                    cmd.Parameters.Add("User", SqlDbType.NVarChar).Value = txtFName.Text + txtLName.Text
                    cmd.Parameters.Add("sex", SqlDbType.NVarChar).Value = drpGender.Text
                    cmd.Parameters.Add("CAdd", SqlDbType.NVarChar).Value = txtAddress.Text.Trim
                    cmd.Parameters.Add("CNo", SqlDbType.NVarChar).Value = txtPhone.Text.Trim
                    cmd.Parameters.Add("NKin", SqlDbType.NVarChar).Value = txtKin.Text.Trim
                    cmd.Parameters.Add("Nation", SqlDbType.NVarChar).Value = txtNat.Text.Trim
                    cmd.Parameters.Add("State", SqlDbType.NVarChar).Value = txtState.Text.Trim
                    cmd.Parameters.Add("LGA", SqlDbType.NVarChar).Value = txtLGA.Text.Trim
                    cmd.Parameters.Add("Field", SqlDbType.NVarChar).Value = txtStudy.Text.Trim
                    conn.Open()
                    cmd.ExecuteNonQuery()
                    Label1.Text = "Record has been saved successfully"
                    Response.Redirect("Staff.aspx")
                End Using
            End Using
        Catch ex As Exception
            Label1.Text = ex.Message
        End Try
    End Sub
End Class
