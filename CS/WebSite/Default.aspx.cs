using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

public partial class _Default : Page
{
    protected void Upload_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        // Assign a relative path to the 'CallbackData' property
        // Relative path: "Images\Picture2023-02-17 10-19-58.jpg"
        e.CallbackData = String.Format("Images\\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));

        // Pass a full path to the 'SaveAs' method as the 'path' parameter
        // Full path: "C:\WebSite\Images\Picture2023-02-17 10-19-58.jpg"
        string path = Page.MapPath("~/") + e.CallbackData;
        e.UploadedFile.SaveAs(path);
    }
}
