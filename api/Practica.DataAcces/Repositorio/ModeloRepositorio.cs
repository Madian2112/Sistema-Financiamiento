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
    public class ModeloRepositorio : IRepository<tbModelos>
    {
        public RequestStatus Actualizar(tbModelos item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Mode_Id", item.Mode_Id);
                parametro.Add("Mode_Descripcion", item.Mode_Descripcion);
                parametro.Add("Marc_Id", item.Marc_Id);
                parametro.Add("Mode_Usua_Modifica", item.Mode_Usua_Modifica);
                parametro.Add("Mode_Fecha_Modifica", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Mode_Actualizar,
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
                parametro.Add("Mode_Id", id);
                var result = db.Execute(ScriptBaseDatos.Mode_Eliminar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbCargos Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbModelos item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Mode_Descripcion", item.Mode_Descripcion);
                parametro.Add("Marc_Id", item.Marc_Id);
                parametro.Add("Mode_Usua_Creacion", item.Mode_Usua_Creacion);
                parametro.Add("Mode_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Mode_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbModelos> List()
        {
            List<tbModelos> resul = new List<tbModelos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                resul = db.Query<tbModelos>(ScriptBaseDatos.Mode_Mostrar, commandType: CommandType.StoredProcedure).ToList();
                return resul;
            }
        }
        public IEnumerable<tbModelos> Detalle(int Mode_Id)
        {


            List<tbModelos> result = new List<tbModelos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Mode_Id = Mode_Id };
                result = db.Query<tbModelos>(ScriptBaseDatos.Mode_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbModelos> ObtenerModeID(int Mode_Id)
        {


            List<tbModelos> result = new List<tbModelos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Mode_Id = Mode_Id };
                result = db.Query<tbModelos>(ScriptBaseDatos.Mode_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }


        IEnumerable<tbModelos> IRepository<tbModelos>.List()
        {
            throw new NotImplementedException();
        }

        tbModelos IRepository<tbModelos>.Find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
