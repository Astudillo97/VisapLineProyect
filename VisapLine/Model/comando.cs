using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using VisapLine.Model;

namespace pruebamikrotic
{
    class comando
    {
        public List<secrest> consultarsecrets()
        {
            var listsecre = new List<secrest>();
            MK mikrotik = new MK("192.168.1.1");
            if (!mikrotik.Login("visap", "v1s4p67"))
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
    }
}
