Imports Microsoft.VisualBasic
Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web.UI

Partial Public Class _Default
	Inherits Page
	Protected Sub Upload_FileUploadComplete(ByVal sender As Object, ByVal e As FileUploadCompleteEventArgs)
		e.CallbackData = String.Format("Images\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"))
		Dim path As String = Page.MapPath("~/") + e.CallbackData
		e.UploadedFile.SaveAs(path)
	End Sub
End Class