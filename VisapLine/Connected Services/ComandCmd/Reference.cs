﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VisapLine.ComandCmd {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ComandCmd.ExecuteCmdSoap")]
    public interface ExecuteCmdSoap {
        
        // CODEGEN: Se está generando un contrato de mensaje, ya que el nombre de elemento ExcelSIIGO del espacio de nombres http://tempuri.org/ no está marcado para aceptar valores nil.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ExecuteCommand", ReplyAction="*")]
        VisapLine.ComandCmd.ExecuteCommandResponse ExecuteCommand(VisapLine.ComandCmd.ExecuteCommandRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ExecuteCommand", ReplyAction="*")]
        System.Threading.Tasks.Task<VisapLine.ComandCmd.ExecuteCommandResponse> ExecuteCommandAsync(VisapLine.ComandCmd.ExecuteCommandRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ExecuteCommandRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ExecuteCommand", Namespace="http://tempuri.org/", Order=0)]
        public VisapLine.ComandCmd.ExecuteCommandRequestBody Body;
        
        public ExecuteCommandRequest() {
        }
        
        public ExecuteCommandRequest(VisapLine.ComandCmd.ExecuteCommandRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class ExecuteCommandRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string ExcelSIIGO;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string RutaEmpresa;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public string Año;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=3)]
        public string PUSHMOV;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=4)]
        public string Norma;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=5)]
        public string Usuario;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=6)]
        public string Clave;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=7)]
        public string NombreLog;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=8)]
        public string NombreArchivoExcelEntrada;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=9)]
        public string encrypt;
        
        public ExecuteCommandRequestBody() {
        }
        
        public ExecuteCommandRequestBody(string ExcelSIIGO, string RutaEmpresa, string Año, string PUSHMOV, string Norma, string Usuario, string Clave, string NombreLog, string NombreArchivoExcelEntrada, string encrypt) {
            this.ExcelSIIGO = ExcelSIIGO;
            this.RutaEmpresa = RutaEmpresa;
            this.Año = Año;
            this.PUSHMOV = PUSHMOV;
            this.Norma = Norma;
            this.Usuario = Usuario;
            this.Clave = Clave;
            this.NombreLog = NombreLog;
            this.NombreArchivoExcelEntrada = NombreArchivoExcelEntrada;
            this.encrypt = encrypt;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ExecuteCommandResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ExecuteCommandResponse", Namespace="http://tempuri.org/", Order=0)]
        public VisapLine.ComandCmd.ExecuteCommandResponseBody Body;
        
        public ExecuteCommandResponse() {
        }
        
        public ExecuteCommandResponse(VisapLine.ComandCmd.ExecuteCommandResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class ExecuteCommandResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string ExecuteCommandResult;
        
        public ExecuteCommandResponseBody() {
        }
        
        public ExecuteCommandResponseBody(string ExecuteCommandResult) {
            this.ExecuteCommandResult = ExecuteCommandResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ExecuteCmdSoapChannel : VisapLine.ComandCmd.ExecuteCmdSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ExecuteCmdSoapClient : System.ServiceModel.ClientBase<VisapLine.ComandCmd.ExecuteCmdSoap>, VisapLine.ComandCmd.ExecuteCmdSoap {
        
        public ExecuteCmdSoapClient() {
        }
        
        public ExecuteCmdSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ExecuteCmdSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ExecuteCmdSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ExecuteCmdSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        VisapLine.ComandCmd.ExecuteCommandResponse VisapLine.ComandCmd.ExecuteCmdSoap.ExecuteCommand(VisapLine.ComandCmd.ExecuteCommandRequest request) {
            return base.Channel.ExecuteCommand(request);
        }
        
        public string ExecuteCommand(string ExcelSIIGO, string RutaEmpresa, string Año, string PUSHMOV, string Norma, string Usuario, string Clave, string NombreLog, string NombreArchivoExcelEntrada, string encrypt) {
            VisapLine.ComandCmd.ExecuteCommandRequest inValue = new VisapLine.ComandCmd.ExecuteCommandRequest();
            inValue.Body = new VisapLine.ComandCmd.ExecuteCommandRequestBody();
            inValue.Body.ExcelSIIGO = ExcelSIIGO;
            inValue.Body.RutaEmpresa = RutaEmpresa;
            inValue.Body.Año = Año;
            inValue.Body.PUSHMOV = PUSHMOV;
            inValue.Body.Norma = Norma;
            inValue.Body.Usuario = Usuario;
            inValue.Body.Clave = Clave;
            inValue.Body.NombreLog = NombreLog;
            inValue.Body.NombreArchivoExcelEntrada = NombreArchivoExcelEntrada;
            inValue.Body.encrypt = encrypt;
            VisapLine.ComandCmd.ExecuteCommandResponse retVal = ((VisapLine.ComandCmd.ExecuteCmdSoap)(this)).ExecuteCommand(inValue);
            return retVal.Body.ExecuteCommandResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<VisapLine.ComandCmd.ExecuteCommandResponse> VisapLine.ComandCmd.ExecuteCmdSoap.ExecuteCommandAsync(VisapLine.ComandCmd.ExecuteCommandRequest request) {
            return base.Channel.ExecuteCommandAsync(request);
        }
        
        public System.Threading.Tasks.Task<VisapLine.ComandCmd.ExecuteCommandResponse> ExecuteCommandAsync(string ExcelSIIGO, string RutaEmpresa, string Año, string PUSHMOV, string Norma, string Usuario, string Clave, string NombreLog, string NombreArchivoExcelEntrada, string encrypt) {
            VisapLine.ComandCmd.ExecuteCommandRequest inValue = new VisapLine.ComandCmd.ExecuteCommandRequest();
            inValue.Body = new VisapLine.ComandCmd.ExecuteCommandRequestBody();
            inValue.Body.ExcelSIIGO = ExcelSIIGO;
            inValue.Body.RutaEmpresa = RutaEmpresa;
            inValue.Body.Año = Año;
            inValue.Body.PUSHMOV = PUSHMOV;
            inValue.Body.Norma = Norma;
            inValue.Body.Usuario = Usuario;
            inValue.Body.Clave = Clave;
            inValue.Body.NombreLog = NombreLog;
            inValue.Body.NombreArchivoExcelEntrada = NombreArchivoExcelEntrada;
            inValue.Body.encrypt = encrypt;
            return ((VisapLine.ComandCmd.ExecuteCmdSoap)(this)).ExecuteCommandAsync(inValue);
        }
    }
}
