<%@ WebHandler Language="VB" Class="ShowImage" %>

Imports System
Imports System.Web
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data


Public Class ShowImage : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim empno As Int32
        If Not context.Request.QueryString("id") Is Nothing Then
            empno = Convert.ToInt32(context.Request.QueryString("id"))
        Else
            Throw New ArgumentException("No parameter specified")
        End If

        context.Response.ContentType = "image/jpeg"
        Dim strm As Stream = ShowEmpImage(empno)
        Dim buffer As Byte() = New Byte(4095) {}
        Dim byteSeq As Integer = strm.Read(buffer, 0, 4096)

        Do While byteSeq > 0
            context.Response.OutputStream.Write(buffer, 0, byteSeq)
            byteSeq = strm.Read(buffer, 0, 4096)
        Loop
        'context.Response.BinaryWrite(buffer);
    End Sub

    Public Function ShowEmpImage(ByVal empno As Integer) As Stream
        Dim conn As String = ConfigurationManager.ConnectionStrings("Staff_AuditConnectionString").ConnectionString
        Dim connection As SqlConnection = New SqlConnection(conn)
        Dim sql As String = "SELECT Passport FROM tblStaff WHERE StaffID = @ID"
        Dim cmd As SqlCommand = New SqlCommand(sql, connection)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@ID", empno)
        connection.Open()
        Dim img As Object = cmd.ExecuteScalar()
        Try
            Return New MemoryStream(CType(img, Byte()))
        Catch
            Return Nothing
        Finally
            connection.Close()
        End Try
    End Function

 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class