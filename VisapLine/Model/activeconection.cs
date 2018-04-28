using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VisapLine.Model
{
    public class activeconection
    {
        public string id { get; set; }
        public string name { get; set; }
        public string service { get; set; }
        public string caller_id { get; set; }
        public string addres { get; set; }
        public string uptime { get; set; }
        public string encoding { get; set; }
        public string session_id { get; set; }
        public string limit_bytes_in { get; set; }
        public string limit_bytes_out { get; set; }
        public string radius { get; set; }

        public activeconection consultaractive(string equipo, string nombresecret)
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
                else
                {
                    activec = null;
                }
            }
            return activec;
        }
        public bool removeactive(string idactive, string equipo)
        {
            string striidactive = consultaractive(equipo, idactive).id;
            MK mikrotik = new MK(equipo);
            if (!mikrotik.Login())
            {
                mikrotik.Close();
                return false;
            }
            bool x = false;
            mikrotik.Send("/ppp/active/remove");
            mikrotik.Send("=numbers=" + striidactive, true);
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
    }
}