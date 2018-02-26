<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="Point.aspx.cs" Inherits="VisapLine.View.Private.Point" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div style="position: absolute; width: 80%; height: 700px;" id="map"></div>
    </div>
    <script>
        var map;

        function initMap() {
            var myLatLng = { lat: 1.620249416453961, lng: -75.61037882799843 };
            var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                mapTypeId: 'satellite',
                center: myLatLng
            });

            var icons = {
                Radio: {
                    icon: 'http://191.102.85.252:30000/Contenido/radio.png'
                },
                Fibra: {
                    icon: 'http://191.102.85.252:30000/Contenido/fibra.png'
                },
                Indefinido: {
                    icon: 'http://191.102.85.252:30000/Contenido/indefinido.png'
                }
            };


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
                    icon: icons['<%=item["tipo"].ToString()%>'].icon,
                    title: '<%=item["nombre"].ToString()%>'<%cot++;%>
                }).addListener('click', function () {
                    map.setZoom(18);
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
