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
    public class PantallaPorRolRepositorio : IRepository<tbPantallasPorRoles>

    {
        public RequestStatus Insert(tbPantallasPorRoles item)
        {
            const string sql = "[Acce].[SP_PantallasPorRoles_Insertar]";



            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Rol_Id", item.Rol_Id);
                parametro.Add("@Pant_Id ", item.Pant_Id);
                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbPantallasPorRoles> List()
        {
            const string sql = "[Acce].[SP_PantallasPorRoles_Mostrar] ";

            List<tbPantallasPorRoles> result = new List<tbPantallasPorRoles>();

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPantallasPorRoles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public IEnumerable<tbPantallasPorRoles> Fill(int id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Rol_Id", id);
                return db.Query<tbPantallasPorRoles>(ScriptBaseDatos.PantallasRolesllenar, parameter, commandType: CommandType.StoredProcedure);
            }
        }

        public IEnumerable<tbRoles> Fill2(int id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Rol_Id", id);
                return db.Query<tbRoles>(ScriptBaseDatos.PantallasRolesllenar2, parameter, commandType: CommandType.StoredProcedure);
            }
        }


        public RequestStatus Update(tbPantallasPorRoles item)
        {
            string sql = ScriptBaseDatos.PantallasRolesActualizar;

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Paro_Id", item.Paro_Id);
                parameter.Add("@Rol_Id", item.Rol_Id);
                parameter.Add("@Pant_Id", item.Pant_Id);

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

                var result = db.QueryFirst(ScriptBaseDatos.PantallasRolesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }











        //public IEnumerable<tbPantallasPorRoles> ValidarReestablecer(string usuario)
        //{


        //    List<tbPantallasPorRoles> result = new List<tbPantallasPorRoles>();
        //    using (var db = new SqlConnection(PracticaContext.ConnectionString))
        //    {
        //        var parameters = new { Usua_Usuario = usuario };
        //        result = db.Query<tbPantallasPorRoles>(ScriptBaseDatos.Usuarios_ValidarReestablecer, parameters, commandType: CommandType.StoredProcedure).ToList();
        //        return result;
        //    }
        //}
        public RequestStatus Actualizar(tbPantallasPorRoles item)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Eliminar(int? id)
        {
            throw new NotImplementedException();
        }

        public tbPantallasPorRoles Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbPantallasPorRoles item)
        {
            throw new NotImplementedException();
        }

    
    }
}
