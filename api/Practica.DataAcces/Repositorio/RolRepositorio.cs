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
    public class RolRepositorio : IRepository<tbRoles>
    {
        public RequestStatus Actualizar(tbRoles item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Rol_Id", item.Rol_Id);
                parametro.Add("Rol_Descripcion", item.Rol_Descripcion);

                parametro.Add("Rol_Usua_Modifica", item.Rol_Usua_Modifica);
                parametro.Add("Rol_Fecha_Modifica", DateTime.Now);

                var result = db.QueryFirst(ScriptBaseDatos.Rol_Actualizar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                return result;
            }
        }

        public RequestStatus Eliminar(int? id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Rol_Id", id);
                var result = db.Execute(ScriptBaseDatos.Rol_Eliminar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }
        public IEnumerable<tbRoles> ObtenerRoleID(int Rol_Id)
        {


            List<tbRoles> result = new List<tbRoles>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Rol_Id = Rol_Id };
                result = db.Query<tbRoles>(ScriptBaseDatos.Rol_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }


        public tbRoles Find(int? id)
        {
            throw new NotImplementedException();
        }

        public (RequestStatus,int) Insertar(tbRoles item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();

                parametro.Add("Rol_Descripcion", item.Rol_Descripcion);

                parametro.Add("Rol_Usua_Creacion", 1);
                parametro.Add("Rol_Fecha_Creacion", DateTime.Now);
               
                parametro.Add("role_id", dbType: DbType.Int32, direction: ParameterDirection.Output);

                var result = db.Execute(ScriptBaseDatos.Rol_Insertar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                int proyId = 0;
                if (result > 0)
                {
                    proyId = parametro.Get<int>("role_id");
                }

                string mensaje = (result == 1) ? "Exito" : "Error";
                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje },proyId);
            }
        }
       
        public IEnumerable<tbPantallas> Listpant(int RoleId)
        {

            List<tbPantallas> result = new List<tbPantallas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { RoleId = RoleId };
                result = db.Query<tbPantallas>(ScriptBaseDatos.Pant_Mostrar, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public RequestStatus InsertarPor(int Pant_Id, int Rol_Id,int usuaCreacion)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Rol_Id", Rol_Id);
                parametro.Add("Pant_Id", Pant_Id);
                parametro.Add("Paro_Usua_Creacion", usuaCreacion);
                parametro.Add("Paro_Fecha_Creacion", DateTime.Now);
               
                var result = db.Execute(ScriptBaseDatos.PantXRol_Insertar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public RequestStatus Eliminarpant(int Pant_Id, int Rol_Id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Rol_Id", Rol_Id);
                parametro.Add("Pant_Id", Pant_Id);
                var result = db.Execute(ScriptBaseDatos.PantXRol_Eliminar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbRoles> Detalle(int Rol_Id)
        {


            List<tbRoles> result = new List<tbRoles>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Rol_Id = Rol_Id };
                result = db.Query<tbRoles>(ScriptBaseDatos.Rol_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbPantallasPorRoles> ListpantxRoles(int Rol_Id)
        {


            List<tbPantallasPorRoles> result = new List<tbPantallasPorRoles>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Rol_Id = Rol_Id };
                result = db.Query<tbPantallasPorRoles>(ScriptBaseDatos.PantxRoles_Mostrar, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }   
        }
        public IEnumerable<tbRoles> List()
        {

            List<tbRoles> result = new List<tbRoles>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbRoles>(ScriptBaseDatos.Rol_Mostrar, commandType: CommandType.Text).ToList();
                return result;
            }
        }

        public IEnumerable<tbPantallas> ListPanta()
        {

            List<tbPantallas> result = new List<tbPantallas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPantallas>(ScriptBaseDatos.Pant_Mostrar2, commandType: CommandType.Text).ToList();
                return result;
            }
        }


        RequestStatus IRepository<tbRoles>.Insertar(tbRoles item)
        {
            throw new NotImplementedException();
        }
    }
}
