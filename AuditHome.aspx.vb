Imports System.Data.SqlClient
Imports System.Data

Partial Class AuditHome
    Inherits System.Web.UI.Page
    Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindStaffRepeater()
        End If
    End Sub
    Private Sub BindStaffRepeater()
        Dim query As String = "Select B.Names as Department,C.Names as GradeLevel, " & _
                "A.* from tblStaff A INNER JOIN  tblDept B ON A.Department = B.ID INNER JOIN  tblLevel C ON A.GradeLevel = C.Id" ' Where StaffID=@ID"
        Using conn As New SqlConnection(conStr)
            Using da As New SqlDataAdapter(query, conn)
                Using dt As New DataTable
                    da.Fill(dt)
                    rptrStaff.DataSource = dt
                    rptrStaff.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        Dim query As String = "Select B.Names as Department,C.Names as GradeLevel, " & _
               "A.* from tblStaff A INNER JOIN  tblDept B ON A.Department = B.ID INNER JOIN  tblLevel C ON A.GradeLevel = C.Id Where C.ID='" & DropDownList2.SelectedValue.ToString + "'"
        If DropDownList2.SelectedValue = "" Then
            BindStaffRepeater()
        Else
            Using conn As New SqlConnection(conStr)
                Using da As New SqlDataAdapter(query, conn)
                    Using dt As New DataTable
                        da.Fill(dt)
                        rptrStaff.DataSource = dt
                        rptrStaff.DataBind()
                    End Using
                End Using
            End Using
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim query As String = "Select B.Names as Department,C.Names as GradeLevel, " & _
              "A.* from tblStaff A INNER JOIN  tblDept B ON A.Department = B.ID INNER JOIN  tblLevel C ON A.GradeLevel = C.Id Where B.ID='" & DropDownList1.SelectedValue.ToString + "'"
        If DropDownList1.SelectedValue = "" Then
            BindStaffRepeater()
        Else
            Using conn As New SqlConnection(conStr)
                Using da As New SqlDataAdapter(query, conn)
                    Using dt As New DataTable
                        da.Fill(dt)
                        rptrStaff.DataSource = dt
                        rptrStaff.DataBind()
                    End Using
                End Using
            End Using
        End If
    End Sub

End Class
