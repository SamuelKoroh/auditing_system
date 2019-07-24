Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class UploadCredential
    Inherits System.Web.UI.Page
    Dim conStr As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
   

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
                    cmd.Parameters.Add("@StaffID", SqlDbType.Int).Value = Session("StaffID")
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
            ' Response.Redirect("Default.aspx")
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

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Try
            lblStatus.Text = ""

            Dim fi As FileInfo = New FileInfo(FileUpload1.FileName)
            'Dim Doc As Byte() = FileUpload1.FileBytes
            'Dim FileName As String = fi.Name

            Dim FileExt As String = fi.Extension

            Dim filename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            Dim contentType As String = FileUpload1.PostedFile.ContentType
            If FileExt.ToLower = ".jpg" Or FileExt.ToLower = ".png" Or FileExt.ToLower = ".doc" Or FileExt.ToLower = ".docx" Or FileExt.ToLower = ".jpeg" Then

                Using fs As Stream = FileUpload1.PostedFile.InputStream
                    Using br As New BinaryReader(fs)
                        Dim bytes As Byte() = br.ReadBytes(DirectCast(fs.Length, Long))
                        Using conn As New SqlConnection(conStr)
                            Dim query As String = "insert into tblUpload(StaffID,DocName,DContent,FileExt,UploadDate,Descrip,AwardDate,CredentialName)" & _
                                " values (@StaffID,@DocName,@DContent, @FileExt, @Date,@FileDes,@ADate,@CredName)"
                            Using cmd As New SqlCommand(query, conn)
                                'cmd.CommandType = CommandType.StoredProcedure
                                cmd.Parameters.Add("@StaffID", SqlDbType.Int).Value = Session("StaffID")
                                cmd.Parameters.Add("@DocName", SqlDbType.NVarChar).Value = filename
                                cmd.Parameters.Add("@DContent", SqlDbType.Binary).Value = bytes
                                cmd.Parameters.Add("@FileExt", SqlDbType.NVarChar).Value = contentType
                                cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Now.Date
                                cmd.Parameters.Add("@FileDes", SqlDbType.NVarChar).Value = txtDescription.Text.Trim
                                cmd.Parameters.AddWithValue("ADate", txtDate.Text.Trim)
                                cmd.Parameters.AddWithValue("CredName", txtName.Text.Trim)
                                conn.Open()
                                cmd.ExecuteNonQuery()
                                txtDescription.Text = ""
                                Response.Redirect("UploadCredential.aspx")
                            End Using
                        End Using
                    End Using
                End Using

            Else
                lblStatus.Text = "The file is not supported"
            End If
            
        Catch ex As Exception
            lblStatus.Text = ex.Message
        End Try
    End Sub
End Class
