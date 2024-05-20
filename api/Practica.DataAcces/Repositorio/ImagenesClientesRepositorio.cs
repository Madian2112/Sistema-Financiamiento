using Dapper;
using Microsoft.Data.SqlClient;
using Practica.Entities.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.DataAcces.Repositorio
{
    public class ImagenesClientesRepositorio : IRepository<tbImagenesPorClientes>
    {
        public RequestStatus Actualizar(tbImagenesPorClientes item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbImagenesPorClientes> List()
        {
            string sql = "Cred.sp_ImagenesPorVehiculos_Mostrar";
            List<tbImagenesPorClientes> result = new List<tbImagenesPorClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbImagenesPorClientes>(sql, commandType: CommandType.Text).ToList();
                return result;
            }
        }

        public IEnumerable<tbImagenesPorClientes> ListVehiculos()
        {
            string sql = "Cred.sp_Vehiculo_ImagenPorCliente";
            List<tbImagenesPorClientes> result = new List<tbImagenesPorClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbImagenesPorClientes>(sql, commandType: CommandType.Text).ToList();
                return result;
            }
        }

        public RequestStatus Eliminar(int? id)
        {
            string sql = "Cred.sp_ImagenesPorVehiculos_Eliminar";
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Imcl_Id", id);
                var result = db.Execute(sql,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbImagenesPorClientes Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbImagenesPorClientes item)
        {
            string sql = "Cred.sp_ImagenesPorVehiculos_Insertar";
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Vecl_Id", item.Vecl_Id);
                parametro.Add("Imcl_Imagen", item.Imcl_Imagen);
                parametro.Add("Imcl_Usua_Creacion", 1);
                parametro.Add("Imcl_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(sql,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result != -1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
            
        }
    }
}
