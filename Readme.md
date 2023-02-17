<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128565528/13.2.8%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E5197)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Upload Control for ASP.NET Web Forms - How to upload an image and display it on a web page

This example demonstrates how to use the [Upload Control](https://docs.devexpress.com/AspNet/8298/components/file-management/file-upload) to upload an image to the server and display the uploaded image on a web page.

![Upload and Display an Image](upload-image.png)

## Overview

Follow the steps below to display an image on a web page once a user uploads the image to the server:

1. Create the *Images* folder in the root folder of your project. In the newly created folder, place an image you want to display initially.

2. Add the [HTML \<img\> tag](https://www.w3schools.com/tags/tag_img.asp) to a page. Use the tag's **id** attribute to specify the tag identifier. Assign the path to the initially displayed image to the tag's **src** attribute. The **alt** attribute allows you to specify an alternate text for the image.

    ```aspx
    <img src="Images/DefaultImage.jpg" id="image" alt="Please load image" />
    ```

3. Add the [ASPxUploadControl](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxUploadControl?p=netframework) to the page. Set the control's [ShowUploadButton](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxUploadControl.ShowUploadButton?p=netframework) property to `true` to allow users to upload files. Use the [ValidationSettings.AllowedFileExtensions](https://docs.devexpress.com/AspNet/DevExpress.Web.UploadControlValidationSettings.AllowedFileExtensions?p=netframework) property to prevent users from uploading files other than images.

    ```aspx
    <dx:ASPxUploadControl ID="Upload" runat="server" OnFileUploadComplete="Upload_FileUploadComplete" 
        ShowUploadButton="True" >
        <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe,.gif">
        </ValidationSettings>
        <ClientSideEvents FileUploadComplete="OnFileUploadComplete" />
    </dx:ASPxUploadControl>
    ```

4. Handle the Upload Control's server-side [FileUploadComplete](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxUploadControl.FileUploadComplete?p=netframework) event. The [UploadedFile](https://docs.devexpress.com/AspNet/DevExpress.Web.FileUploadCompleteEventArgs.UploadedFile?p=netframework) event argument contains the uploaded image. Call the image's [SaveAs](https://docs.devexpress.com/AspNet/DevExpress.Web.UploadedFile.SaveAs(System.String)) method to save the image on the server. Set the [CallbackData](https://docs.devexpress.com/AspNet/DevExpress.Web.FileUploadCompleteEventArgs.CallbackData) property to the relative image path to pass it to the client.

    ```csharp
    protected void Upload_FileUploadComplete(object sender, FileUploadCompleteEventArgs e) {
        // Assign a relative path to the 'CallbackData' property
        // Relative path: "Images\Picture2023-02-17 10-19-58.jpg"
        e.CallbackData = String.Format("Images\\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));
        
        // Pass a full path to the 'SaveAs' method as the 'path' parameter
        // Full path: "C:\WebSite\Images\Picture2023-02-17 10-19-58.jpg"
        string path = Page.MapPath("~/") + e.CallbackData;
        e.UploadedFile.SaveAs(path);
    }
    ```

5. Handle the Upload Control's client-side [FileUploadComplete](https://docs.devexpress.com/AspNet/js-ASPxClientUploadControl.FileUploadComplete?p=netframework) event. In the event handler, call the [getElementById](https://developer.mozilla.org/en-US/docs/web/api/document/getelementbyid) method to access the `<img>` tag by its identifier. The [callbackData](https://docs.devexpress.com/AspNet/js-ASPxClientUploadControlFileUploadCompleteEventArgs.callbackData) event argument contains the path passed from the server. Assign this path to the **src** attribute of the image tag to display the uploaded image.

    ```js
    function OnFileUploadComplete(s, e) {
        document.getElementById('image').src = e.callbackData;
    }
    ```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
