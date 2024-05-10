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
    public class VehiculoRepositorio : IRepository<tbVehiculos>
    {
        public RequestStatus Actualizar(tbVehiculos item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Vehi_Id", item.Vehi_Id);
                parametro.Add("Vehi_Placa", item.Vehi_Placa);
                parametro.Add("Vehi_Descripcion", item.Vehi_Descripcion);
                parametro.Add("Vehi_Color", item.Vehi_Color);
                parametro.Add("Vehi_Anio", item.Vehi_Anio);
                parametro.Add("Mode_Id", item.Mode_Id);
                parametro.Add("Vehi_Usua_Modifica", item.Vehi_Usua_Modifica);
                parametro.Add("Vehi_Fecha_Modifica", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Vehi_Actualizar,
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
                parametro.Add("Vehi_Id", id);
                var result = db.Execute(ScriptBaseDatos.Vehi_Eliminar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

       

        public RequestStatus Insertar(tbVehiculos item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Vehi_Placa", item.Vehi_Placa);
                parametro.Add("Vehi_Descripcion", item.Vehi_Descripcion);
                parametro.Add("Vehi_Color", item.Vehi_Color);
                parametro.Add("Vehi_Anio", item.Vehi_Anio);
                parametro.Add("Mode_Id", item.Mode_Id);
                parametro.Add("Vehi_Usua_Creacion", item.Vehi_Usua_Creacion);
                parametro.Add("Vehi_Fecha_Creacion", DateTime.Now);
                parametro.Add("@UltimoID", dbType: DbType.Int32, direction: ParameterDirection.Output); // Agrega el parámetro de salida

                var result = db.Execute(ScriptBaseDatos.Vehi_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );

                int planpago = parametro.Get<int>("@UltimoID");
                string mensaje = (result != -1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = planpago, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbVehiculos> List()
        {
            List<tbVehiculos> resul = new List<tbVehiculos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                resul = db.Query<tbVehiculos>(ScriptBaseDatos.Vehi_Mostrar, commandType: CommandType.StoredProcedure).ToList();
                return resul;
            }
        }

        public IEnumerable<tbVehiculos> ListCV()
        {
            List<tbVehiculos> resul = new List<tbVehiculos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                resul = db.Query<tbVehiculos>(ScriptBaseDatos.Vehi_ListCV, commandType: CommandType.StoredProcedure).ToList();
                return resul;
            }
        }
        public IEnumerable<tbVehiculos> Detalle(int Vehi_Id)
        {


            List<tbVehiculos> result = new List<tbVehiculos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Vehi_Id = Vehi_Id };
                result = db.Query<tbVehiculos>(ScriptBaseDatos.Vehi_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public RequestStatus InsertarVehiculoCliente(int? Vehi_Id, int? Clie_Id, int Usua)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Vehi_Id", Vehi_Id);
                parametro.Add("Clie_Id", Clie_Id);
                parametro.Add("Vecl_Usua_Creacion", Usua);
                parametro.Add("Vecl_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Vecl_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }


        public RequestStatus EliminarVehiculoCliebte(int id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Vecl_Id", id);
                var result = db.Execute(ScriptBaseDatos.Vecl_Eliminar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }


        public IEnumerable<tbVehiculos> ObtenerVehiID(int Vehi_Id)
        {


            List<tbVehiculos> result = new List<tbVehiculos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Vehi_Id = Vehi_Id };
                result = db.Query<tbVehiculos>(ScriptBaseDatos.Vehi_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbVehiculos> CargarVehiculo(string Vehi_Placa)
        {


            List<tbVehiculos> result = new List<tbVehiculos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Vehi_Placa = Vehi_Placa };
                result = db.Query<tbVehiculos>(ScriptBaseDatos.Vehi_IngresarVehi, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public tbVehiculos Find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
