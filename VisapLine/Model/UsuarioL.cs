using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Connection;
using VisapLine.DataAccess.Data;

namespace VisapLine.Model
{
    public class UsuarioL
    {
        IData data = new Data();
        public string idusuario { get; set; }
        public string usuauser { get; set; }
        public string usuapassw { get; set; }
        public string persona_idpersona { get; set; }

        public DataTable ValidarUsuario(UsuarioL usu)
        {
            return data.ConsultarDatos("select * from persona p inner join tipousuario tu on p.tipousuario_idusuario=tu.idtipousuario inner join usuario u on u.persona_idpersona=p.idpersona where u.usuauser='"+usu.usuauser+"' and usuapassw='"+usu.usuapassw+"'; ");
        }
    }
}