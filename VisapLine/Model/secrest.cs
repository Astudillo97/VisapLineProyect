using System;
using System.Collections.Generic;
using System.Text;

namespace pruebamikrotic
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

        //public secrest(string id, string name, string service, string caller_id, string password, string profile, string local_address, string remote_address, string rutes, string limit_bytes_in, string limit_bytes_out, string last_logges_out, string disable)
        //{
        //    this.id = id;
        //    this.name = name;
        //    this.service = service;
        //    this.caller_id = caller_id;
        //    this.password = password;
        //    this.profile = profile;
        //    this.local_address = local_address;
        //    this.remote_address = remote_address;
        //    this.rutes = rutes;
        //    this.limit_bytes_in = limit_bytes_in;
        //    this.limit_bytes_out = limit_bytes_out;
        //    this.last_logges_out = last_logges_out;
        //    this.disable = Convert.ToBoolean(disable);
        //}
    }
}
