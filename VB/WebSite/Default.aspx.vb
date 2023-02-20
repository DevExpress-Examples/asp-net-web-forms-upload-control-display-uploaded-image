Imports Microsoft.VisualBasic
Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web.UI

Partial Public Class _Default
	Inherits Page
	Protected Sub Upload_FileUploadComplete(ByVal sender As Object, ByVal e As FileUploadCompleteEventArgs)
		' Assign a relative path to the 'CallbackData' property
        ' Relative path: "Images\Picture2023-02-17 10-19-58.jpg"
		e.CallbackData = String.Format("Images\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"))
		
		' Pass a full path to the 'SaveAs' method as the 'path' parameter
        ' Full path: "C:\WebSite\Images\Picture2023-02-17 10-19-58.jpg"
		Dim path As String = Page.MapPath("~/") + e.CallbackData
		e.UploadedFile.SaveAs(path)
	End Sub
End Class
