using System;
using System.Collections.Generic;
using System.Text;

namespace VisapLine.Model
{
    class secrest
    {
        public string id { get; set; }
        public string name { get; set; }
        public string service { get; set; }
        public string caller_id { get; set; }
        public string password { get; set; }
        public string profile { get; set; }
        public string local_address { get; set; }
        public string remote_address { get; set; }
        public string rutes { get; set; }
        public string limit_bytes_in { get; set; }
        public string limit_bytes_out { get; set; }
        public string last_logges_out { get; set; }
        public bool disable { get; set; }

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
                for (int i = 1; i < parts.Length; i += 2)
                {
                    if (parts[i].Equals(".id"))
                    {
                        sec.id = parts[i + 1];
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
                        sec.caller_id = parts[i + 1];
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
        public bool userdesctivar(string user, string equipo)
        {
            MK mikrotik = new MK(equipo);
            if (!mikrotik.Login())
            {
                mikrotik.Close();
                return false;
            }
            bool x = false;
            mikrotik.Send("/ppp/secret/disable");
            mikrotik.Send("=numbers=" + user, true);
            foreach (string h in mikrotik.Read())
            {
                string[] parts = h.Split('=');
                foreach (string linea in parts)
                {
                    if (linea.Equals("!done"))
                    {
                        x = true;
                        break;
                    }
                    else
                    {
                        x = false;
                        break;
                    }
                }
            }
            return x;
        }
        public bool useractivar(string user, string equipo)
        {
            MK mikrotik = new MK(equipo);
            if (!mikrotik.Login())
            {
                mikrotik.Close();
                return false;
            }
            bool x = false;
            mikrotik.Send("/ppp/secret/enable");
            mikrotik.Send("=numbers=" + user, true);
            foreach (string h in mikrotik.Read())
            {
                string[] parts = h.Split('=');
                foreach (string linea in parts)
                {
                    if (linea.Equals("!done"))
                    {
                        x = true;
                        break;
                    }
                    else
                    {
                        x = false;
                        break;
                    }
                }
            }
            return x;
        }
        public secrest consultarsecretsbyip(string equipo,string ip)
        {
            secrest sec = new secrest();
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
                for (int i = 1; i < parts.Length; i += 2)
                {
                    if (parts[i].Equals(".id"))
                    {
                        sec.id = parts[i + 1];
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
                        sec.caller_id = parts[i + 1];
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
                if (sec.remote_address.Equals(ip))
                {
                    break;
                }
            }            
            return sec;
        }
    }
}
