<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Using ASPxUploadControl for pass file from server to client</title>
</head>
<body>
	<script type="text/javascript">
		function OnFileUploadComplete(s, e) {
			console.log('123');
			document.images['image'].src = e.callbackData;
			console.log('asd');
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