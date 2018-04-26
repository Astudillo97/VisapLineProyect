using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using VisapLine.Model;

namespace VisapLine.Model
{
    class comando
    {
        public List<secrest> consultarsecrets(string equipo)
        {
            var listsecre = new List<secrest>();
            MK mikrotik = new MK(equipo);
            if (!mikrotik.Login())
            {
                mikrotik.Close();
                return null;
            }
            mikrotik.Send("/ppp/secret/print", true);
            foreach (string h in mikrotik.Read())
            {
                string[] parts = h.Split('=');
                secrest sec = new secrest();
                for (int i = 1; i < parts.Length; i+=2)
                {
                    if (parts[i].Equals(".id")) {
                        sec.id = parts[i+1];
                    }
                    if (parts[i].Equals("name"))
                    {
                        sec.name = parts[i + 1];
                    }
                    if (parts[i].Equals("service"))
                    {
                        sec.service = parts[i + 1];
                    }
                    if (parts[i].Equals("caller-id"))
                    {
                        sec.caller_id= parts[i + 1];
                    }
                    if (parts[i].Equals("password"))
                    {
                        sec.password = parts[i + 1];
                    }
                    if (parts[i].Equals("profile"))
                    {
                        sec.profile = parts[i + 1];
                    }
                    if (parts[i].Equals("local-address"))
                    {
                        sec.local_address = parts[i + 1];
                    }
                    if (parts[i].Equals("remote-address"))
                    {
                        sec.remote_address = parts[i + 1];
                    }
                    if (parts[i].Equals("rutes"))
                    {
                        sec.rutes = parts[i + 1];
                    }
                    if (parts[i].Equals("limit-bytes-in"))
                    {
                        sec.limit_bytes_in = parts[i + 1];
                    }
                    if (parts[i].Equals("limit-bytes-out"))
                    {
                        sec.limit_bytes_out = parts[i + 1];
                    }
                    if (parts[i].Equals("last-logges-out"))
                    {
                        sec.last_logges_out = parts[i + 1];
                    }
                    if (parts[i].Equals("disable"))
                    {
                        sec.disable = Convert.ToBoolean(parts[i + 1]);
                    }                   
                }
                listsecre.Add(sec);
            }
            return listsecre;
        }

        public activeconection consultaractive(string equipo,string nombresecret)
        {
            activeconection activec = new activeconection();
            MK mikrotik = new MK(equipo);
            if (!mikrotik.Login())
            {
                mikrotik.Close();
                return null;
            }
            mikrotik.Send("/ppp/active/print", true);
            foreach (string h in mikrotik.Read())
            {
                string[] parts = h.Split('=');
                
                for (int i = 1; i < parts.Length; i += 2)
                {
                    if (parts[i].Equals(".id"))
                    {
                        activec.id = parts[i + 1];
                    }
                    if (parts[i].Equals("name"))
                    {
                        activec.name = parts[i + 1];
                    }
                    if (parts[i].Equals("service"))
                    {
                        activec.service = parts[i + 1];
                    }
                    if (parts[i].Equals("caller-id"))
                    {
                        activec.caller_id = parts[i + 1];
                    }
                    if (parts[i].Equals("addres"))
                    {
                        activec.addres = parts[i + 1];
                    }
                    if (parts[i].Equals("uptime"))
                    {
                        activec.uptime = parts[i + 1];
                    }
                    if (parts[i].Equals("encoding"))
                    {
                        activec.encoding = parts[i + 1];
                    }
                    if (parts[i].Equals("session-id"))
                    {
                        activec.session_id = parts[i + 1];
                    }
                    if (parts[i].Equals("limit-bytes-in"))
                    {
                        activec.limit_bytes_in = parts[i + 1];
                    }
                    if (parts[i].Equals("limit-bytes-out"))
                    {
                        activec.limit_bytes_out = parts[i + 1];
                    }
                    if (parts[i].Equals("radius"))
                    {
                        activec.radius = parts[i + 1];
                    }
                }
                if (activec.name.Equals(nombresecret))
                {
                    break;
                }
                else {
                    activec = null;
                }
            }
            return activec;
        }



        public bool userdesctivar(string user,string equipo) {
            MK mikrotik = new MK(equipo);
            if (!mikrotik.Login())
            {
                mikrotik.Close();
                return false;
            }
            bool x=false;
            mikrotik.Send("/ppp/secret/disable");
            mikrotik.Send("=numbers="+user, true);
            foreach (string h in mikrotik.Read())
            {
                string[] parts = h.Split('=');
                foreach (string linea in parts)
                {
                    if (linea.Equals("!done"))
                    {
                        x= true;
                        break;
                    }
                    else {
                        x= false;
                        break;
                    }

                }
            }


            return x;
        }
    }
}
