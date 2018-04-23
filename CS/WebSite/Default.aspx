<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxImageSlider" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Using ASPxUploadControl for pass file from server to client</title>
</head>
<body>
    <script type="text/javascript">
        function OnFileUploadComplete(s, e) {
            document.getElementById('image').src = e.callbackData;
        }
    </script>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxUploadControl ID="Upload" runat="server" ShowUploadButton="True" OnFileUploadComplete="Upload_FileUploadComplete">
                <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe,.gif">
                </ValidationSettings>
                <ClientSideEvents FileUploadComplete="OnFileUploadComplete" />
            </dx:ASPxUploadControl>
            <img src="Images/DefaultPicture.jpg" id="image" alt="Please load image" />
        </div>
    </form>
</body>
</html>
