<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Point.aspx.cs" Inherits="VisapLine.View.Private.Point" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <title>Google // Leaflet</title>
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
    <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
    <script src="http://maps.google.com/maps/api/js?v=3&key=AIzaSyD-8ESv0eO8r1DYcuRMq1ZLIfY4m4Q2Snk"></script>
    <script type="text/javascript" src="../../Contenido/data/servicio_2.js"></script>
    <script type="text/javascript" src="../../Contenido/data/Google.js"></script>
    <style>
        .my-div-icon {
            background-image: url('../../Contenido/facturaelectronica.jpg');
            width:20px;
        }
    </style>--%>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conte">
        <div  id="mapa" class="content" style="width:100%; height:100%; overflow:no-content;position:absolute;" ></div>
    </section>
    
    <%--<script type='text/javascript'>
        var map = new L.Map('map', {center: new L.LatLng(1.6, -75.6), zoom: 14});
        var osm = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png');
        var ggl = new L.Google();
        var ggl2 = new L.Google('SATELITE');
        map.addLayer(ggl);
        map.addControl(new L.Control.Layers({ 'OSM': osm, 'Google': ggl, 'Google Terrain': ggl2 }, {}));

        var myIcon = L.divIcon({ className: 'my-div-icon' });


        console.log(json_servicio_2);
        for (var i = 0; i < json_servicio_2.features.length; i++) {
            var coords = json_servicio_2.features[i].geometry.coordinates;
            var tipo = json_servicio_2.features[i].properties.Tipo;
            console.log(tipo);
            L.marker([coords[1], coords[0]], { draggable: false }, { icon: myIcon }).addTo(map).bindPopup(json_servicio_2.features[i].properties.Tipo + "<br />" + json_servicio_2.features[i].properties.Usuario + "<br />" + json_servicio_2.features[i].properties.Identificacion);
            L.circle([coords[1], coords[0]], 30).addTo(map);
        }
        
    </script>--%>

    
    <script type="text/javascript">
        function initMap() {
            // Create a map object and specify the DOM element for display.
            var map = new google.maps.Map(document.getElementById('mapa'), {
                center: { lat: -34.397, lng: 150.644 },
                zoom: 8
            });
        }
    </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCel3MNnyce8acti61RZyix305Fp6SzNKU&callback=initMap"
    async defer></script>
</asp:Content>
