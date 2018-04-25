﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
namespace VisapLine.Model
{
    public class CargoAdicional
    {
        IData data = new Data();
        public string idcargoadicional { get; set; }
        public string descripcion { get; set; }
        public string valor { get; set; }
        public string fecha { get; set; }
        public string inventario_idinventario { get; set; }
        public string incidensias_idincidensias { get; set; }
        public string terceros_idterceroregistra { get; set; }
        public string contrato_idcontrato_cargo { get; set; }
        public string estadoca { get; set; }
        public string aplicaiva { get; set; }

        public DataTable ConsultarCargosIdContrato(CargoAdicional ca)
        {
            return data.ConsultarDatos("select * from pr_consultarcargoadicional(" + ca.contrato_idcontrato_cargo + ")");
        }

        public DataTable ConsultarCargosIdContratoporefect(CargoAdicional ca)
        {
            return data.ConsultarDatos("select * from pr_consultarcargoadicionalporefect(" + ca.contrato_idcontrato_cargo + ")");
        }

        public bool RegistrarCargoContrato(CargoAdicional ca)
        {
            return data.OperarDatos("select * from pr_insertarcargoadicional('" + ca.descripcion + "'," + ca.valor + ",'12-12-2018'," + ca.terceros_idterceroregistra + "," + ca.contrato_idcontrato_cargo + ")");
        }

        public bool Actualizarestadocargo(string idcargoadicional, string descripcion, string valor, string varfactura)
        {
            return data.OperarDatos("select* from pr_actualizarcargoadicionalestadoefect('"+ idcargoadicional +  "','"+ varfactura + "','"+ descripcion + "','"+ valor + "')");
        }

    }
}