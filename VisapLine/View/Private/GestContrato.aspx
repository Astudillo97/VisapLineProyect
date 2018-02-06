<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="GestContrato.aspx.cs" Inherits="VisapLine.View.Private.GestContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function botonmodalgesti() {
            document.getElementById("botonmodalcontr").click();
        }



    </script>
    <style>
        textarea {
            resize: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Contenido/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        function deletealert() {
            swal("SE REGISTRO CON EXITO!", "Se ha registrado con exito ", "success");
        }
        function alerterror() {
            swal("NO SE REGISTRO!", "No se registro el formulario", "error");
        }
    </script>


    <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="col-12 alert alert-success alert-error">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <label class="text-center" runat="server" id="textError"></label>
    </asp:Panel>
    <section class="content-header">
        <h1>Gestionar Contratos</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
            <li class="breadcrumb-item"><a href="#">Clientes</a></li>
            <li class="breadcrumb-item active">Gestinar Contratos</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Buscar Contrato</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label">CC o Nit:</label>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" type="number" CssClass="form-control" ID="texboxdni" Style="text-transform: uppercase"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <asp:Button runat="server" class="btn btn-block btn-success btn-lg" ID="Button1" Text="Consultar" OnClick="Button1_Click" Width="146px" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
        </div>
        <!-- /.row -->

        <!-- /.box-header -->
        <div class="row" id="divtablagestcontr" runat="server" visible="false">
            <div class="box box-primary">
                <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="false" class="table table-bordered table-striped table-responsive" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" SelectText="" ControlStyle-CssClass="glyphicon glyphicon-edit" />
                        <asp:BoundField HeaderText="Codg" DataField="codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="nombreter" />
                        <asp:BoundField HeaderText="Fecha" DataFormatString="{0:d}" DataField="fechacontrato" />
                        <asp:BoundField HeaderText="Estado" DataField="estadoc" />
                        <asp:BoundField HeaderText="Direccion" DataField="direnviofactura" />
                        <asp:BoundField HeaderText="Envio Factura" DataField="enviofactura" />
                        <asp:BoundField HeaderText="Observacion" DataField="observacion" />
                        <asp:BoundField HeaderText="Valor" DataField="valor" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
        </div>

        <div class="box box-default " id="ideditarcontrat" runat="server" visible="false">
            <div class="box-header with-border">
                <h2 class="box-title">Contrato  N° <asp:Label ID="LabelNumcontra" runat="server" Text=""></asp:Label></h2>
                <div class="box-tools pull-right">
                </div>
            </div>

            <!-- /.box-header -->
            <div class="box-body" style="">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Nombre:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:TextBox ID="TextBox1identificacion" Enabled="false" class="form-control" Style="text-transform: uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Estado:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListestadocontrato" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                        <asp:ListItem>ACTIVO</asp:ListItem>
                                        <asp:ListItem>INACTIVO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Plan:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListplancontrato" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Tipo Contrato:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListtipocontrato" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Direccion de Envio:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <textarea id="TextArea1" cols="20" rows="2" disabled class="form-control" runat="server" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 122px;"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Descuento:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownList2" runat="server" Enabled="false" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>26</asp:ListItem>
                                        <asp:ListItem>27</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>29</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>31</asp:ListItem>
                                        <asp:ListItem>32</asp:ListItem>
                                        <asp:ListItem>33</asp:ListItem>
                                        <asp:ListItem>34</asp:ListItem>
                                        <asp:ListItem>35</asp:ListItem>
                                        <asp:ListItem>36</asp:ListItem>
                                        <asp:ListItem>37</asp:ListItem>
                                        <asp:ListItem>38</asp:ListItem>
                                        <asp:ListItem>39</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>41</asp:ListItem>
                                        <asp:ListItem>42</asp:ListItem>
                                        <asp:ListItem>43</asp:ListItem>
                                        <asp:ListItem>44</asp:ListItem>
                                        <asp:ListItem>45</asp:ListItem>
                                        <asp:ListItem>46</asp:ListItem>
                                        <asp:ListItem>47</asp:ListItem>
                                        <asp:ListItem>48</asp:ListItem>
                                        <asp:ListItem>49</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>51</asp:ListItem>
                                        <asp:ListItem>52</asp:ListItem>
                                        <asp:ListItem>53</asp:ListItem>
                                        <asp:ListItem>54</asp:ListItem>
                                        <asp:ListItem>55</asp:ListItem>
                                        <asp:ListItem>56</asp:ListItem>
                                        <asp:ListItem>57</asp:ListItem>
                                        <asp:ListItem>58</asp:ListItem>
                                        <asp:ListItem>59</asp:ListItem>
                                        <asp:ListItem>60</asp:ListItem>
                                        <asp:ListItem>61</asp:ListItem>
                                        <asp:ListItem>62</asp:ListItem>
                                        <asp:ListItem>63</asp:ListItem>
                                        <asp:ListItem>64</asp:ListItem>
                                        <asp:ListItem>65</asp:ListItem>
                                        <asp:ListItem>66</asp:ListItem>
                                        <asp:ListItem>67</asp:ListItem>
                                        <asp:ListItem>68</asp:ListItem>
                                        <asp:ListItem>69</asp:ListItem>
                                        <asp:ListItem>70</asp:ListItem>
                                        <asp:ListItem>71</asp:ListItem>
                                        <asp:ListItem>72</asp:ListItem>
                                        <asp:ListItem>73</asp:ListItem>
                                        <asp:ListItem>74</asp:ListItem>
                                        <asp:ListItem>75</asp:ListItem>
                                        <asp:ListItem>76</asp:ListItem>
                                        <asp:ListItem>77</asp:ListItem>
                                        <asp:ListItem>78</asp:ListItem>
                                        <asp:ListItem>79</asp:ListItem>
                                        <asp:ListItem>80</asp:ListItem>
                                        <asp:ListItem>81</asp:ListItem>
                                        <asp:ListItem>82</asp:ListItem>
                                        <asp:ListItem>83</asp:ListItem>
                                        <asp:ListItem>84</asp:ListItem>
                                        <asp:ListItem>85</asp:ListItem>
                                        <asp:ListItem>86</asp:ListItem>
                                        <asp:ListItem>87</asp:ListItem>
                                        <asp:ListItem>88</asp:ListItem>
                                        <asp:ListItem>89</asp:ListItem>
                                        <asp:ListItem>90</asp:ListItem>
                                        <asp:ListItem>91</asp:ListItem>
                                        <asp:ListItem>92</asp:ListItem>
                                        <asp:ListItem>93</asp:ListItem>
                                        <asp:ListItem>94</asp:ListItem>
                                        <asp:ListItem>95</asp:ListItem>
                                        <asp:ListItem>96</asp:ListItem>
                                        <asp:ListItem>97</asp:ListItem>
                                        <asp:ListItem>98</asp:ListItem>
                                        <asp:ListItem>99</asp:ListItem>
                                        <asp:ListItem>100</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Label ID="Labelidcontrato" runat="server" Visible="false" Text="Label"></asp:Label>
                    <div class="col-md-6 col-12">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Envio Factura:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownListenviofactura" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                        <asp:ListItem>CORREO</asp:ListItem>
                                        <asp:ListItem>DOMICILIO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Factura:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownList1facuracuni" Enabled="false" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                        <asp:ListItem>UNICA</asp:ListItem>
                                        <asp:ListItem>GRUPAL</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">barrio:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Enabled="false" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Iva:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:TextBox ID="TextBoxivacontrato" class="form-control" Enabled="false" Style="text-transform: uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Observacion:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <textarea id="TextArea2" cols="20" rows="2" disabled class="form-control" runat="server" style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px; height: 122px;"></textarea>
                                </div>
                            </div>
                        </div>
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Wifi:</label>
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <asp:DropDownList ID="DropDownList3" runat="server" Enabled="false" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem>Seleccione</asp:ListItem>
                                                <asp:ListItem>SI</asp:ListItem>
                                                <asp:ListItem>NO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>

            </div>

        </div>

        <center>
            <table>
                <tr>
                    <th>
                          <asp:Button ID="Buttoneditar" runat="server" Visible="false" Text="Editar" class="btn btn-block btn-info btn-lg" Width="143px" Height="30px" OnClick="Buttoneditar_Click" /></th>
                
                    <th>
                        
                        <asp:Button ID="ButtonGuardar" runat="server" Text="Guardar" Visible="false" Enabled="false" class="btn btn-block btn-success btn-lg" Width="143px" Height="30px" OnClick="ButtonGuardar_Click" />
                           
                  
                        </th>
                    <th>
                        <asp:Button ID="Buttoncancelar" runat="server" Visible="false" Enabled="false" Text="Cancelar" class="btn btn-block btn-danger btn-lg" Width="143px" Height="30px" OnClick="Buttoncancelar_Click" /></th>
                </tr>

            </table> 
      </center>


    </section>

</asp:Content>
