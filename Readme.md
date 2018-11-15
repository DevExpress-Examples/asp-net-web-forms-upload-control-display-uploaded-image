<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to use ASPxUploadControl to upload an image and display it on a web page


<p>This example demonstrates how to use ASPxUploadControl to upload an image to the server and then show it on the page.<br />
To do this, please follow these steps:<br />
- Place <strong>ASPxUploadControl</strong> on the page<strong> </strong>and set the <strong>ASPxUploadControl.ShowUploadButton</strong> property to true.<br />
- Set the <strong>ASPxUploadControl.ValidationSettings.AllowedFileExtensions </strong>property to <strong>".jpg,.jpeg,.jpe,.gif"</strong>.<br />
- Place an <strong>html image</strong> (<img /> tag) on the page.<br />
- Create the "Images" folder in the root folder of your project.<br />
- Set the <strong>src </strong>property of the <strong>image </strong>to "Images/DefaultImage". You may place there any image. After the first file upload, the <strong>src</strong> property will be changed.<br />
- Set the <strong>image</strong> <strong>alt </strong>property to "Please load image" (or another text that will inform a user that there is no image to be displayed).<br />
- Handle both the client-side and server-side <strong>ASPxUploadControl.FileUploadComplete</strong> events.<br />
- In the server-side event handler, save the uploaded file to the directory "~/Images/". To easily create a unique filename, we recommend using the current date and time (<strong>DateTime.Now()</strong>).<br />
- Set the <strong>FileUploadCompleteEventArgs.CallbackData </strong>property to "Images/<filename>", where <filename> is a full name of the file you saved. Please note that you need to save the file to directory "~/Images/", where "~/" is the root folder of your project, but set the <strong>FileUploadCompleteEventArgs.CallbackData </strong>property to "Images/<filname>" <u>excluding</u> the root folder.<br />
- In the client-side event handler, use the <strong>document.getElementById </strong>method to find your <strong>html image</strong> by the assigned <strong>id</strong>.<br />
- Set the <strong>src </strong>property of the found image to <strong>ASPxClientUploadControlFileUploadCompleteEventHandler.callbackData</strong> received from server. </p>

<br/>


