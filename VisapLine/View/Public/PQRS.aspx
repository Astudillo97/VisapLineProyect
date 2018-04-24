<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PQRS.aspx.cs" Inherits="VisapLineWeb.PQRS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PQRS</title>
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
        <div class="h1">
            <label>Formulario de registro de petición, queja, reclamo, sugerencias, felicitaciones (PQRSF)</label>
                
        </div>
            <div class="col-md-8 list-group-item">
              
                  <div class="row">
                     <div class="col-md-6">
                          <label class="item">¿Cuál es el nombre de su operador?</label>
                     </div> 
                      <div class="col-md-4 ">
                             <asp:TextBox runat="server" CssClass="form-control" Text="VisapLine" Enabled="false"></asp:TextBox> </div>
                      </div>
                <br /> 
                   <div class="row">
                       <div class="col-md-6">
                           <label >¿Usted quiere presentar una petición, queja/reclamo o recurso?<br />    * 
                         Puede hacerlo directamente aquí:<br />
                        (seleccione de acuerdo al requerimiento que desea presentar)</label></div>

                       <div class="col-md-4 ">
                            <asp:DropDownList CssClass="form-control" runat="server" ID="REQUERIMIENTO">
                                <asp:ListItem Text="Seleccione una opcion" Selected="True"></asp:ListItem>
                              
                            </asp:DropDownList>              
                       </div>        
                   </div>
                <br />

                <div class="row"> 
                    <div class="col-md-6">
                        <label>¿Cual es su nombre o la razón social de su empresa? *</label>
                    </div>
                    <div class="col-md-4">
                          <asp:TextBox runat="server" CssClass="form-control" id="NombreEmisor"></asp:TextBox>             
                    </div>
                </div>
                <br />
                  <div class="row"> 
                    <div class="col-md-6">
                        <label>¿Cuáles son sus apellidos? *</label>
                    </div>
                    <div class="col-md-4">
                          <asp:TextBox runat="server" CssClass="form-control" ID="ApellidoEmisor" ></asp:TextBox>             
                    </div>
                </div>
                <br />
                     <div class="row"> 
                    <div class="col-md-6">
                        <label>¿Cuál es el tipo de su documento de identidad o el de su empresa?*</label>
                    </div>
                    <div class="col-md-4">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="TIPODOC">
                                 <asp:ListItem Text="Seleccione una opcion" Selected="True"></asp:ListItem>
                        </asp:DropDownList>    
                    </div>
                </div>

                    <div class="row"> 
                    <div class="col-md-6">
                        <label> ¿Cuál es el número de su documento de identidad o el de su empresa?*</label>
                    </div>
                    <div class="col-md-4">
                          <asp:TextBox runat="server" CssClass="form-control" id="documentoEmisor"></asp:TextBox>             
                    </div>
                </div>

                   <div class="row"> 
                    <div class="col-md-6">
                        <label> ¿Cuál es el correo electrónico al cual quiere llegue la respuesta? <span class="danger">*</span></label>
                    </div>
                    <div class="col-md-4">
                          <asp:TextBox runat="server" CssClass="form-control" ID="CorreoEmisor" ></asp:TextBox>             
                    </div>
                </div>

                 <div class="row"> 
                    <div class="col-md-6">
                        <label>¿Cuál es el número de telefono de contacto ?</label>
                    </div>
                    <div class="col-md-4">
                          <asp:TextBox runat="server" CssClass="form-control" id="telefonoEmisor"></asp:TextBox>             
                    </div>
                </div>
                <br />
                   <div class="row"> 
                    <div class="col-md-6">
                        <label>   ¿Servicio objeto de la queja/reclamo ?*</label>
                    </div>
                    <div class="col-md-4">
                       <asp:DropDownList runat="server" CssClass="form-control" Enabled="false" ID="TipoServicio"> 
                           <asp:ListItem Text="Internet" Value="1">INTERNET</asp:ListItem>

                       </asp:DropDownList>        
                    </div>
                </div>
                <br />
                 <div class="row"> 
                    <div class="col-md-6">
                        <label>   ¿Cuál es el objeto de su petición, queja/reclamo o recurso?*</label>
                    </div>
                    <div class="col-md-4">
                       <asp:DropDownList runat="server" CssClass="form-control" ID="TIPORECLAMO"> 
                        <asp:ListItem Text="Seleccione una opcion" Selected="True"></asp:ListItem>

                       </asp:DropDownList>        
                    </div>
                </div>
                <br />
                 <div class="row"> 
                    <div class="col-md-6">
                        <label>    ¿Cuáles son los hechos en que se fundamenta la petición, queja/reclamo o recurso?*</label>
                    </div>
                    <div class="col-md-4">
                        <textarea runat="server" class="form-control" id="Descripcion"></textarea>
                                
                    </div>
                </div>
            </div>
          <br />
            <div class="row">
                <div class="col-md-5">
                     <asp:Button  runat="server" CssClass="btn btn-success" Text="Enviar" OnClick="Enviar"/>
                </div>
               
            </div>


        </div>

       <footer>
			<div class="container">
				<p>&#169; 2018 VisapLine,  All Rights Reserved</p>
				
			</div>
		</footer>
    </form>
</body>
</html>
