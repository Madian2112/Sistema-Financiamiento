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
    public class SucursalRepositorio : IRepository<tbSucursales>
    {
        public RequestStatus Actualizar(tbSucursales item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Sucu_Id", item.Sucu_Id);
                parametro.Add("Sucu_Calle", item.Sucu_Calle);
                parametro.Add("Sucu_Direccion", item.Sucu_Direccion);
                parametro.Add("Muni_Id", item.Muni_Id);
                parametro.Add("Sucu_Usua_Modi", item.Sucu_Usua_Modi);
                parametro.Add("Sucu_Fecha_Modi", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Sucu_Actualizar,
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
                parametro.Add("Sucu_Id", id);
                var result = db.Execute(ScriptBaseDatos.Sucu_Eliminar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbEstadosCiviles Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbSucursales item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Sucu_Calle", item.Sucu_Calle);
                parametro.Add("Sucu_Direccion", item.Sucu_Direccion);
                parametro.Add("Muni_Id", item.Muni_Id);
                parametro.Add("Sucu_Usua_Creacion", item.Sucu_Usua_Creacion);
                parametro.Add("Sucu_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Sucu_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }
        public IEnumerable<tbSucursales> ObtenerSucuID(int Sucu_Id)
        {

            List<tbSucursales> result = new List<tbSucursales>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Sucu_Id = Sucu_Id };
                result = db.Query<tbSucursales>(ScriptBaseDatos.Sucu_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbSucursales> List()
        {
            List<tbSucursales> result = new List<tbSucursales>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbSucursales>(ScriptBaseDatos.Sucu_Mostrar, commandType: CommandType.Text).ToList();
                return result;
            }
        }
        public IEnumerable<tbSucursales> Detalle(int Sucu_Id)
        {


            List<tbSucursales> result = new List<tbSucursales>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Sucu_Id = Sucu_Id };
                result = db.Query<tbSucursales>(ScriptBaseDatos.Sucu_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        tbSucursales IRepository<tbSucursales>.Find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
