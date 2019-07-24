Imports System.Data.SqlClient
Imports System.Data

Partial Class Default2
    Inherits System.Web.UI.Page
    Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString1").ConnectionString


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            FillData()
        End If
    End Sub

    Private Sub FillData()
        Try
            Dim dt As New DataTable
            Using Conn As New SqlConnection(conStr)
                Using cmd As New SqlCommand("GetStaffDocuments", Conn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add("@StaffID", SqlDbType.Int).Value = 1
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
            Response.Redirect("Default.aspx")
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
