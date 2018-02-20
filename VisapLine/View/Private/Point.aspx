<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Point.aspx.cs" Inherits="VisapLine.View.Private.Point" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content"><div  style="width:100%; height:100%;" id="map" ></div></div>
    
    <script>

        function initMap() {
            var myLatLng = { lat: -25.363, lng: 131.044 };

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 4,

                center: myLatLng
            });

            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                title: 'Hello World!'
            });
        }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcz4b9tiKDFIuSFnaGlU7YpsBpfzPu7to&callback=initMap">
    </script>
</asp:Content>
