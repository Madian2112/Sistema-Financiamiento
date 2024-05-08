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
    public class TipoCuotaRepositorio : IRepository<tbTipoCuotas>
    {
        public RequestStatus Actualizar(tbTipoCuotas item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Ticu_Id", item.Ticu_Id);
                parametro.Add("Ticu_Descripcion", item.Ticu_Descripcion);
                parametro.Add("Ticu_Usua_Modi", item.Ticu_Usua_Modi);
                parametro.Add("Ticu_Fecha_Modi", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Ticu_Actualizar,
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
                parametro.Add("Ticu_Id", id);
                var result = db.Execute(ScriptBaseDatos.Ticu_Eliminar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbTipoCuotas Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbTipoCuotas item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Ticu_Descripcion", item.Ticu_Descripcion);
                parametro.Add("Ticu_Usua_Creacion", item.Ticu_Usua_Creacion);
                parametro.Add("Ticu_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Ticu_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }
        public IEnumerable<tbTipoCuotas> ObtenerTipoCuotaID(int Ticu_Id)
        {

            List<tbTipoCuotas> result = new List<tbTipoCuotas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Ticu_Id = Ticu_Id };
                result = db.Query<tbTipoCuotas>(ScriptBaseDatos.Ticu_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbTipoCuotas> List()
        {
            List<tbTipoCuotas> result = new List<tbTipoCuotas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbTipoCuotas>(ScriptBaseDatos.Ticu_Mostrar, commandType: CommandType.Text).ToList();
                return result;
            }
        }
        public IEnumerable<tbTipoCuotas> Detalle(int Ticu_Id)
        {


            List<tbTipoCuotas> result = new List<tbTipoCuotas>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Ticu_Id = Ticu_Id };
                result = db.Query<tbTipoCuotas>(ScriptBaseDatos.Ticu_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

    }
}
