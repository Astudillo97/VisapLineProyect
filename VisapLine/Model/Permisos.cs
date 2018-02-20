using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Permisos
    {
        IData data = new Data();
        public string idpermisos { get; set; }
        public string rol_idrol { get; set; }
        public string permisos { get; set; }
        public string menu_idmenu { get; set; }
        Menu men = new Menu();
        public DataTable ConsultarPermisos()
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPermisos(Permisos per)
        {
            return data.OperarDatos("select * from public.pr_insertarpermiso(" + per.rol_idrol + ",'" + per.permisos + "'," + per.menu_idmenu + ")");
        }
        public DataTable ConsultarRolPermisos(string rol)
        {
            return data.ConsultarDatos("select * from pr_consularmenu(" + rol + ")");
        }

        public bool ValidarPermisos(string url, DataTable entrada)
        {
            return ValidacionPagina(entrada.Rows[0]["idrol"].ToString(), url);
        }
        public bool ValidacionPagina(string rol, string url)
        {

            if(data.ConsultarDatos("select * from permisos p inner join menu m on p.menu_idmenu=m.idmenu inner join menu sm on sm.menu_idmenusub=m.idmenu where p.rol_idrol="+rol+" and m.href='" + url + "' or  sm.href='" + url+"'").Rows.Count>0)
            {
                men.menu_idmenusub = dat.Rows[i]["idmenu"].ToString();
                DataTable sub = men.ConsultarMenuSubmenu(men);
                for (int j = 0; j < sub.Rows.Count && ret == false; j++)
                {
                    if (dat.Rows[i]["href"].ToString().Equals(url))
                    {
                        ret = true;
                    }
                }
            }

        }
    }
}