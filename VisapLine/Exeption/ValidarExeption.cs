using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace VisapLine.Exeption
{
    [Serializable]
    public class ValidarExeption : Exception
    {
        public ValidarExeption(string message) : base(message)
        {
            Console.WriteLine(message);
        }

        public ValidarExeption(string message, Exception innerException) : base(message, innerException)
        {
        }

        ValidarExeption() : base()
        {

        }

        ValidarExeption(SerializationInfo info, StreamingContext context) : base(info, context)
        {

        }

    }
}