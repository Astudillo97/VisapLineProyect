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
    }
}