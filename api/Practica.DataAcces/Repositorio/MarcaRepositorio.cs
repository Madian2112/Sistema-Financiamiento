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
    public class MarcaRepositorio : IRepository<tbMarcas>
    {
        public RequestStatus Actualizar(tbMarcas item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Marc_Id", item.Marc_Id);
                parametro.Add("Marc_Descripcion", item.Marc_Descripcion);
                parametro.Add("Marc_Usua_Modifica", item.Marc_Usuario_Modificiacion);
                parametro.Add("Marc_Fecha_Modifica", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Marc_Actualizar,
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
                parametro.Add("Marc_Id", id);
                var result = db.Execute(ScriptBaseDatos.Marc_Eliminar,
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

        public RequestStatus Insertar(tbMarcas item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Marc_Descripcion", item.Marc_Descripcion);
                parametro.Add("Marc_Usua_Creacion", item.Marc_Usua_Creacion);
                parametro.Add("Marc_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Marc_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbMarcas> List()
        {
            List<tbMarcas> resul = new List<tbMarcas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                resul = db.Query<tbMarcas>(ScriptBaseDatos.Marc_Mostrar, commandType: CommandType.StoredProcedure).ToList();
                return resul;
            }
        }
        public IEnumerable<tbMarcas> Detalle(int Marc_Id)
        {


            List<tbMarcas> result = new List<tbMarcas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Marc_Id = Marc_Id };
                result = db.Query<tbMarcas>(ScriptBaseDatos.Marc_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbMarcas> ObtenerCargoID(int Marc_Id)
        {


            List<tbMarcas> result = new List<tbMarcas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Marc_Id = Marc_Id };
                result = db.Query<tbMarcas>(ScriptBaseDatos.Marc_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        IEnumerable<tbMarcas> IRepository<tbMarcas>.List()
        {
            throw new NotImplementedException();
        }    

        tbMarcas IRepository<tbMarcas>.Find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
