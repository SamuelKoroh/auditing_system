Imports System.Data.SqlClient
Imports System.Data

Partial Class VerifyStatus
    Inherits System.Web.UI.Page
    Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
    Dim EmpID As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        EmpID = Session("StaffID")

        Dim query As String = "Select tblStaff.FieldSt,tblStaff.StaffID,tblStaff.Username,tblStaff.ContactAddress,tblStaff.ContactNo,tblStaff.NextKin,tblStaff.Firstname,tblStaff.MiddleName,tblStaff.Surname,tblStaff.Gender, " & _
                                            "tblStaff.DOB,tblStaff.StartDate,tblStaff.EntryQualification,tblStaff.Status,tblDept.Names as Department,tblLevel.Names as GradeLevel, " & _
                                            "tblStaff.Nationality,tblStaff.State,tblStaff.LGA from tblStaff INNER JOIN  tblDept ON tblStaff.Department = tblDept.ID INNER JOIN  tblLevel ON tblStaff.GradeLevel = tblLevel.Id Where StaffID=@ID"
        Try
            Image1.ImageUrl = "~/ShowImage.ashx?id=" & EmpID


            Using conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.Add("ID", SqlDbType.Int).Value = EmpID
                    conn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader
                        If dr.HasRows Then
                            dr.Read()
                            lblID.Text = dr.Item("StaffID")
                            lblUsername.Text = dr.Item("Username")
                            lblFirst.Text = dr.Item("Firstname")
                            lblMiddle.Text = dr.Item("MiddleName")
                            lblSurname.Text = dr.Item("Surname")
                            lblGender.Text = dr.Item("Gender")
                            lblDOB.Text = Format(dr.Item("DOB"), "Short Date")
                            lblDOE.Text = Format(dr.Item("StartDate"), "Short Date")
                            lblEntryQua.Text = dr.Item("EntryQualification")
                            lblStatus.Text = dr.Item("Status")
                            lblGrade.Text = dr.Item("GradeLevel")
                            lblDepart.Text = dr.Item("Department")
                            lblPhone.Text = dr.Item("ContactNo")
                            lblAddress.Text = dr.Item("ContactAddress")
                            lblNextK.Text = dr.Item("NextKin")
                            Dim GetDate As Date = Format(dr.Item("StartDate"), "Short Date")
                            lblService.Text = (Now.Year - GetDate.Year).ToString + "years"
                            lblNation.Text = dr.Item("Nationality")
                            lblState.Text = dr.Item("State")
                            lblLGA.Text = dr.Item("LGA")
                            lblField.Text = dr.Item("FieldSt")
                        End If
                    End Using
                End Using

                Using cmd As New SqlCommand("select status from tblverify where staffid=@id", conn)
                    cmd.Parameters.Add("id", SqlDbType.Int).Value = EmpID
                    Using ds As SqlDataReader = cmd.ExecuteReader
                        Dim sta As String
                        If ds.HasRows = True Then
                            ds.Read()
                            sta = ds.Item("Status")

                            If sta = "Verified" Then
                                lblVStatus.Text = sta
                                lblVStatus.ForeColor = Drawing.Color.Green
                            Else
                                lblVStatus.Text = sta
                                lblVStatus.ForeColor = Drawing.Color.Red
                            End If
                        Else
                            lblVStatus.Text = "Not yet Verified"
                            lblVStatus.ForeColor = Drawing.Color.Red
                        End If
                    End Using
                End Using

            End Using

        Catch ex As Exception
            '  Response.Redirect("Default.aspx")
        End Try
    End Sub

End Class
