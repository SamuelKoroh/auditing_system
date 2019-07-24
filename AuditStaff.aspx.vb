Imports System.Data.SqlClient
Imports System.Data

Partial Class AuditStaff
    Inherits System.Web.UI.Page
    Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
    Dim EmpID As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        EmpID = Convert.ToInt32(Request.QueryString("StaffID"))

        If EmpID = Nothing Then
            Response.Redirect("Default.aspx")

        End If

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
                            ' lblStatus.Text = dr.Item("Status")
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

                            If Convert.ToInt32((Now.Year - GetDate.Year)) >= 35 Then
                                lblStatus.Text = "Due for retirement"
                            Else
                                lblStatus.Text = "In Service"
                            End If
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
                                btnStatus.Text = "Unverify"
                            Else
                                lblVStatus.Text = sta
                                lblVStatus.ForeColor = Drawing.Color.Red
                                btnStatus.Text = "Verify"
                            End If
                        Else
                            lblVStatus.Text = "Not yet Verified"
                            lblVStatus.ForeColor = Drawing.Color.Red
                            btnStatus.Text = "Verify"
                        End If
                    End Using
                End Using

            End Using
            If Not Page.IsPostBack Then
                FillData()
            End If

        Catch ex As Exception
            '  Response.Redirect("Default.aspx")
        End Try
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("AuditHome.aspx")
    End Sub

    Protected Sub btnStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStatus.Click
        Try
            Using conn As New SqlConnection(conStr)
                If btnStatus.Text = "Verify" Then
                    Using cmd As New SqlCommand("Select * from tblVerify where StaffID=@SID", conn)
                        cmd.Parameters.Add("SID", SqlDbType.Int).Value = EmpID
                        conn.Open()

                        Dim dt As New DataTable
                        Dim da As New SqlDataAdapter(cmd)
                        da.Fill(dt)

                        If dt.Rows.Count > 0 Then
                            Dim oCmd As New SqlCommand("Update tblVerify SET Status='Verified' Where StaffID=@SID", conn)
                            oCmd.Parameters.Add("SID", SqlDbType.Int).Value = EmpID
                            oCmd.ExecuteNonQuery()

                        Else
                            Using oCmd As New SqlCommand("INSERT INTO tblVerify (StaffID,Status,VerifyDate) Values(@SID,'Verified'," & Now.Date & ")", conn)
                                oCmd.Parameters.Add("SID", SqlDbType.Int).Value = EmpID
                                oCmd.ExecuteNonQuery()
                            End Using
                        End If

                    End Using

                Else
                    Using cmd As New SqlCommand("Update tblVerify SET Status='Not Verified' Where StaffID=@SID", conn)
                        cmd.Parameters.Add("SID", SqlDbType.Int).Value = EmpID
                        conn.Open()
                        cmd.ExecuteNonQuery()
                    End Using
                End If
            End Using
            Response.Redirect("AuditHome.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub FillData()
        Try
            Dim dt As New DataTable
            Using Conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("GetStaffDocuments", Conn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add("@StaffID", SqlDbType.Int).Value = EmpID
                    Conn.Open()
                    Dim dr As SqlDataReader = cmd.ExecuteReader
                    dt.Load(dr)
                    If dt.Rows.Count > 0 Then
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    End If
                End Using
            End Using
        Catch ex As Exception
            Response.Redirect("AuditHome.aspx")
        End Try
    End Sub

    Protected Sub OpenDocument(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim id As Integer = Integer.Parse(TryCast(sender, LinkButton).CommandArgument)
            'lblStatus.Text = id
            Download(id)
        Catch ex As Exception

        End Try
    End Sub
    Private Sub Download(ByVal ID As Integer)
        Try

            Dim bytes As Byte()
            Dim fileName As String, contentType As String


            Using Conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("GetStaffDocument", Conn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID
                    Conn.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        sdr.Read()
                        bytes = DirectCast(sdr("Content"), Byte())
                        contentType = sdr("FileExtension").ToString()
                        fileName = sdr("Document").ToString()
                    End Using
                    Conn.Close()

                End Using
            End Using
            Response.Clear()
            Response.Buffer = True
            Response.Charset = ""
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.ContentType = contentType
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
            Response.BinaryWrite(bytes)
            Response.Flush()
            Response.End()


        Catch ex As Exception

        End Try
    End Sub
End Class
