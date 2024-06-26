﻿using Dapper;
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
    public class ClienteRepositorio : IRepository<tbClientes>
    {
        public RequestStatus Actualizar(tbClientes item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Clie_Id", item.Clie_Id);
                parametro.Add("Clie_DNI", item.Clie_DNI);
                parametro.Add("Clie_Nombre", item.Clie_Nombre);
                parametro.Add("Clie_Apellido", item.Clie_Apellido);
                parametro.Add("Clie_Sexo", item.Clie_Sexo);
                parametro.Add("Clie_Telefono", item.Clie_Telefono);
                parametro.Add("Esta_Id", item.Esta_Id);
                parametro.Add("Muni_Id", item.Muni_Id);
                parametro.Add("Clie_Usua_Modifica", item.Clie_Usua_Modifica);
                parametro.Add("Clie_Fecha_Modifica", DateTime.Now);

                var resutl = db.Execute(ScriptBaseDatos.Clie_Actualizar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (resutl == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = resutl, MessageStatus = mensaje };
            }
        }

        public RequestStatus Eliminar(int? id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Clie_Id", id);
                var result = db.Execute(ScriptBaseDatos.Clie_Eliminar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbClientes Find(int? id)
        {
            throw new NotImplementedException();
        }

        public (RequestStatus, int) Insertar(tbClientes item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();

                parametro.Add("Clie_DNI", item.Clie_DNI);
                parametro.Add("Clie_Nombre", item.Clie_Nombre);
                parametro.Add("Clie_Apellido", item.Clie_Apellido);
                parametro.Add("Clie_Sexo", item.Clie_Sexo);
                parametro.Add("Clie_Telefono", item.Clie_Telefono);
                parametro.Add("Esta_Id", item.Esta_Id);
                parametro.Add("Muni_Id", item.Muni_Id);

                parametro.Add("Clie_Usua_Creacion", item.Clie_Usua_Creacion);
                parametro.Add("Clie_Fecha_Creacion", DateTime.Now);
                parametro.Add("Clie_Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

                var result = db.Execute(ScriptBaseDatos.Clie_Insertar,
                 parametro,
                  commandType: CommandType.StoredProcedure
                 );

                int clieId = 0;
                if (result > 0)
                {
                    clieId = parametro.Get<int>("Clie_Id");
                }


                string mensaje = (result == 1) ? "Exito" : "Error";
                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje }, clieId);
            }
        }

        public IEnumerable<tbClientes> List()
        {
            List<tbClientes> result = new List<tbClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbClientes>(ScriptBaseDatos.Clie_Mostrar, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbClientes> CargarDNI(string Clie_DNI)
        {


            List<tbClientes> result = new List<tbClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Clie_DNI = Clie_DNI };
                result = db.Query<tbClientes>(ScriptBaseDatos.Clie_IngresarDNI, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbClientes> ObtenerClienID(int Clie_Id)
        {


            List<tbClientes> result = new List<tbClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Clie_Id = Clie_Id };
                result = db.Query<tbClientes>(ScriptBaseDatos.Clie_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbClientes> Detalle(int Clie_Id)
        {

            List<tbClientes> result = new List<tbClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Clie_Id = Clie_Id };
                result = db.Query<tbClientes>(ScriptBaseDatos.Clie_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbVehiculosPorClientes> ListClieXVehi(int Clie_Id)
        {


            List<tbVehiculosPorClientes> result = new List<tbVehiculosPorClientes>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Clie_Id = Clie_Id };
                result = db.Query<tbVehiculosPorClientes>(ScriptBaseDatos.Vecl_Mostrar, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        RequestStatus IRepository<tbClientes>.Insertar(tbClientes item)
        {
            throw new NotImplementedException();
        }
    }
}
