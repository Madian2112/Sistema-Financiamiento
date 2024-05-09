using Dapper;
using Microsoft.Data.SqlClient;
using Practica.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.DataAcces.Repositorio
{
    public class PlanPagoClienteRepositorio : IRepository<tbPlanesPagosClientes>
    {
        public RequestStatus Actualizar(tbPlanesPagosClientes item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Pacl_Id", item.Pacl_Id);
                parametro.Add("Papa_Id", item.Papa_Id);
                parametro.Add("Pacl_Monto_Pago", item.Pacl_Monto_Pago);
                parametro.Add("Pacl_Fecha_Emision", item.Pacl_Fecha_Emision);
                parametro.Add("Sucu_Id", item.Sucu_Id);
                parametro.Add("Pacl_Usua_Modi", item.Pacl_Usua_Modi);
                parametro.Add("Pacl_Fecha_Modi", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Pacl_Actualizar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public RequestStatus Eliminar(int? id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Pacl_Id", id);
                var result = db.Execute(ScriptBaseDatos.Pacl_Eliminar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbPlanesPagosClientes Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbPlanesPagosClientes item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Papa_Id", item.Papa_Id);
                parametro.Add("Pacl_Monto_Pago", item.Pacl_Monto_Pago);
                parametro.Add("Pacl_Fecha_Emision", item.Pacl_Fecha_Emision);
                parametro.Add("Sucu_Id", item.Sucu_Id);
                parametro.Add("Pacl_Usua_Creacion", item.Pacl_Usua_Creacion);
                parametro.Add("Pacl_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Pacl_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }
        public IEnumerable<tbPlanesPagosClientes> ObtenerPlanPagoClienteID(int Pacl_Id)
        {

            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Pacl_Id = Pacl_Id };
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbPlanesPagosClientes> List()
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_Mostrar, commandType: CommandType.Text).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorMes()
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorMes, commandType: CommandType.Text).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorMesFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorMesFiltro, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorEstadoFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
   
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorEstadoFiltro, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbPlanesPagosClientes> ReportePrestamoPorMes(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Repo_PrestamoPorMes, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ReportePrestamoPorModelo(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Repo_PrestamoPorModelo, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ReportePrestamoPorEstado(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Repo_PrestamoPorEstado, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbPlanesPagosClientes> ReportePrestamoPorSexo(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Repo_PrestamoPorSexo, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorSexoFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorSexoFiltro, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorModeloFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FechaInicio", FechaInicio);
                parametro.Add("@FechaFin", FechaFinal);
                parametro.Add("@SucursalId", Sucu_Id);
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorModeloFiltro, parametro, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorEstado()
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorEstado , commandType: CommandType.Text).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorSexo()
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorSexo, commandType: CommandType.Text).ToList();
                return result;
            }
        }

        public IEnumerable<tbPlanesPagosClientes> ObtenerPrestamoPorModelo()
        {
            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_PrestamoPorModelo, commandType: CommandType.Text).ToList();
                return result;
            }
        }


        public IEnumerable<tbPlanesPagosClientes> Detalle(int Pacl_Id)
        {


            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Pacl_Id = Pacl_Id };
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        
                public IEnumerable<tbPlanesPagosClientes> DetallePP(int? Papa_Id)
        {


            List<tbPlanesPagosClientes> result = new List<tbPlanesPagosClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Papa_Id = Papa_Id };
                result = db.Query<tbPlanesPagosClientes>(ScriptBaseDatos.Pacl_LlenarPlanPago, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        
    }
}
