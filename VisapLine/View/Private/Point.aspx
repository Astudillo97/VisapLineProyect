<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Point.aspx.cs" Inherits="VisapLine.View.Private.Point" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <section class="content-header">
        <h1>ACTIVOS: <label id="activos"></label></h1> Latitud: <asp:TextBox type="text" runat="server" id="latitud" value="" /> longitud: <asp:TextBox type="text" runat="server" id="longitud" value="" />
    </section>
        <div style="position: absolute; width: 80%; height: 700px;" id="map"></div>
    </div>
    <script>
        var markers;
        var map;
        function addMarker(location) {
            markers = new google.maps.Marker({
                position: location,
                map: map
            });
            document.getElementById('<%=latitud.ClientID%>').value = this.getPosition().toString();
            document.getElementById('<%=longitud.ClientID%>').value = markers.lng;
        }

        function initMap() {
            var myLatLng = { lat: 1.620249416453961, lng: -75.61037882799843 };
            var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                mapTypeId: 'satellite',
                center: myLatLng
            });
            document.getElementById('activos').innerHTML = '<%=punt.Rows.Count.ToString()%>';


            map.addListener('click', function (event) {
                addMarker(event.latLng);
            });


            var marker = [
                <%if (punt != null)
        {
            int cont = punt.Rows.Count;
            int cot = 0;
            foreach (System.Data.DataRow item in punt.Rows)
            {
                %>
                new google.maps.Marker({
                    position: { lat: <%=item["coordenaday"].ToString().Replace(',','.')%>, lng: <%=item["coordenadax"].ToString().Replace(',','.')%> },
                    map: map,
                    icon: image,
                    title: '<%=item["nombre"].ToString()%>'<%cot++;%>
                }).addListener('click', function () {
                    map.setZoom(15);
                    map.setCenter({ lat: <%=item["coordenaday"].ToString().Replace(',','.')%>, lng: <%=item["coordenadax"].ToString().Replace(',','.')%> });
                }) <%if (cot == cont) { Response.Write(""); } else { Response.Write(","); }%>               
                <%
            }
        }
                  %>
            ];
           
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcz4b9tiKDFIuSFnaGlU7YpsBpfzPu7to&callback=initMap">
    </script>
</asp:Content>
