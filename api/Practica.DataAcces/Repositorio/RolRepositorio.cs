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
        public int Insert(tbRoles item)
        {
            const string sql = "[Acce].[SP_Roles_Insertar]";



            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Rol_Descripcion", item.Rol_Descripcion);
                parametro.Add("@Role_UsuarioCreacion", item.Rol_Usua_Creacion);
                parametro.Add("@Role_FechaCreacion", item.Rol_Fecha_Creacion);
                parametro.Add("@ID", DbType.Int32, direction: ParameterDirection.Output);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                int id = parametro.Get<int>("@ID");


                return id;
            }
        }

        public IEnumerable<tbRoles> List()
        {
            const string sql = "[Acce].[SP_Roles_Mostrar]";

            List<tbRoles> result = new List<tbRoles>();

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbRoles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbRoles Fill(int id)
        {

            tbRoles result = new tbRoles();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Rol_Id", id);
                result = db.QueryFirst<tbRoles>(ScriptBaseDatos.Rol_Detalles, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbRoles item)
        {
            string sql = ScriptBaseDatos.Rol_Actualizar;

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Rol_Id", item.Rol_Id);
                parameter.Add("@Rol_Descripcion", item.Rol_Descripcion);
                parameter.Add("@Role_UsuarioModificacion", item.Rol_Usua_Modifica);
                parameter.Add("@Role_FechaModificacion", item.Rol_Fecha_Modifica);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Rol_Id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Rol_Id", Rol_Id);

                var result = db.QueryFirst(ScriptBaseDatos.Rol_Eliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }







        public IEnumerable<tbRoles> Listpantallas()
        {
            const string sql = "[Acce].[SP_Pantallas_Mostrar2]";

            List<tbRoles> result = new List<tbRoles>();

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbRoles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }


        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbRoles Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbRoles find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbRoles item)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Actualizar(tbRoles item)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Eliminar(int? id)
        {
            throw new NotImplementedException();
        }

        public tbRoles Find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}