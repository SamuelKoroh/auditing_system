Imports System.Data.SqlClient
Imports System.Data

Partial Class WorkStrength
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString)
            Dim dt As New DataTable


            dt.Columns.Add("Department", GetType(String))
            dt.Columns.Add("CurrentStaff", GetType(String))
            dt.Columns.Add("ExpectedStaff", GetType(String))
            dt.Columns.Add("RequiredStaff", GetType(String))
            conn.Open()

            Dim da As New SqlDataAdapter
            Dim dta As New DataSet

            Dim cmd As New SqlCommand("Select * from tblDept", conn)
            da.SelectCommand = cmd
            da.Fill(dta, "JJ")

            Dim cnt As Integer = dta.Tables(0).Rows.Count - 1
            For i = 0 To cnt
                cmd = New SqlCommand("Select Count(StaffID) as CurrentStaff from tblStaff where Department = " & dta.Tables(0).Rows(i).Item("ID"), conn)

                Dim ds As New DataSet
                Dim dsa As New SqlDataAdapter
                dsa.SelectCommand = cmd
                dsa.Fill(ds, "SS")
                Dim CurrentStaff As Integer = ds.Tables(0).Rows(0)(0)

                dt.Rows.Add(dta.Tables(0).Rows(i)("Names"), CurrentStaff, dta.Tables(0).Rows(i)("RequiredStaff"), dta.Tables(0).Rows(i)("RequiredStaff") - CurrentStaff)
            Next

            GridView1.DataSource = dt
            GridView1.DataBind()
        End Using

    End Sub
End Class
