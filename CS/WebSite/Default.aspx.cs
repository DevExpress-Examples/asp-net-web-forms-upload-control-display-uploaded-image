using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

public partial class _Default : Page
{
    protected void Upload_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        e.CallbackData = String.Format("Images\\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));
        string path = Page.MapPath("~/") + e.CallbackData;
        e.UploadedFile.SaveAs(path);
    }
}