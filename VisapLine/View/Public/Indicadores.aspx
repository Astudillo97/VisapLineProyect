<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Indicadores.aspx.cs" Inherits="VisapLine.View.Public.Indicadores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Indicadores</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
            <header>
            <div class="navbar navbar-default navbar-static-top">
				<div class="innher-header">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#"><img height="50px" src="../../Content/images/imgvisap.png"/></a>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">

							<li><a class="active" href="Index.aspx">Volver al inicio</a></li>
							

						</ul>
					</div>
				</div>
			</div>

        </header>


        
        <div class="container">
            <h1> INDICADORES DE CALIDAD DEL SERVICIO</h1>

            <div class="row">
                <div class="col-md-8">
                   <div class="panel-group" >
                          <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: #fff">
                    <asp:Repeater runat="server" ID="AÑOS" OnItemDataBound="AÑOS_ItemDataBound">
                        <ItemTemplate>
                          
                          
                           <asp:Label class="list-group-item" ID="añoind" runat="server" href='<%#  "#"+Convert.ToString(Eval("pr_consultaranioindicador")) %>' data-toggle="collapse"  Text=<%# Eval("pr_consultaranioindicador")%>></asp:Label>
                           
                            <asp:Repeater runat="server" ID="trimestres" OnItemDataBound="trimestres_ItemDataBound">
                              
                                    <itemtemplate>
                                        <div id='<%# Eval("anio") %>' class="panel-collapse collapse">
                                            <div class="panel-body">

                                                <div class="cta-desc">   
                                                    
                                                    <a  href="'<%# Eval("ruta") %>'"><span>TRIMESTRE <%# Eval("trimestre") %></span>  <%# Eval("nombredoc") %></a>

                                                </div>
                                            </div>

                                        </div>




                                   
                               
                                        </itemtemplate>

                                
                             
                            </asp:Repeater>
                        </ItemTemplate>

                    </asp:Repeater>
                    </div>
                    </div>
                       </div>
                </div>


            </div>
        </div>
    </form>
</body>
</html>
