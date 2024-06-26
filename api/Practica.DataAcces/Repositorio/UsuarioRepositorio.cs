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
    public class UsuarioRepositorio : IRepository<tbUsuarios>
    {
        public RequestStatus Actualizar(tbUsuarios item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Usua_Id", item.Usua_Id);
                parametro.Add("Usua_Usuario", item.Usua_Usuario);
                parametro.Add("Usua_Admin", item.Usua_Admin);
                parametro.Add("Empl_Id", item.Empl_Id);
                parametro.Add("Rol_Id", item.Rol_Id);
                parametro.Add("Usua_Usua_Modifica", item.Usua_Usua_Modifica);
                parametro.Add("Usua_Fecha_Modifica", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Usua_Actualizar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public RequestStatus EditPerfil(tbUsuarios item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Usuario", item.Usuario);
                parametro.Add("Usua_Usuario", item.Usua_Usuario);
                parametro.Add("Usua_Color", item.Usua_Color);

                var result = db.QuerySingle<int>("Acce.SP_PerfilUsuarios_Actualizar", parametro, commandType: CommandType.StoredProcedure);

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }


        public RequestStatus Eliminar(int? id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Usua_Id", id);
                var result = db.Execute(ScriptBaseDatos.Usua_Eliminar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbUsuarios Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbUsuarios item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();

                parametro.Add("Usua_Usuario", item.Usua_Usuario);
                parametro.Add("Usua_Contra", item.Usua_Contra);
                parametro.Add("Usua_Admin", item.Usua_Admin);
                parametro.Add("Empl_Id", item.Empl_Id);
                parametro.Add("Rol_Id", item.Rol_Id);
             

                parametro.Add("Usua_Usua_Creacion", item.Usua_Usua_Creacion);
                parametro.Add("Usua_Fecha_Creacion", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Usua_Insertar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbUsuarios> Login(string usuario, string contra)
        {

            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Usuario", usuario);
                parameter.Add("Contra", contra);

                result = db.Query<tbUsuarios>(ScriptBaseDatos.Usua_Inicio, parameter, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }

        }
        public IEnumerable<tbUsuarios> List()
        {

            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbUsuarios>(ScriptBaseDatos.Usua_Mostrar, commandType: CommandType.Text).ToList();
                return result;
            }
        }
        public IEnumerable<tbUsuarios> ObtenerUsuaID(int Usua_Id)
        {


            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Usua_Id = Usua_Id };
                result = db.Query<tbUsuarios>(ScriptBaseDatos.Usua_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbUsuarios> Detalle(int Usua_Id)
        {


            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Usua_Id = Usua_Id };
                result = db.Query<tbUsuarios>(ScriptBaseDatos.Usua_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbUsuarios> Detalle(string Usua_Usuario)
        {


            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Usua_Usuario = Usua_Usuario };
                result = db.Query<tbUsuarios>(ScriptBaseDatos.Usua_DetallesPerfil, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }


        public RequestStatus RestablecerContra(tbUsuarios item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Usua_Id", item.Usua_Id);
                parametro.Add("Usua_Contra", item.Usua_Contra);
                parametro.Add("Usua_Usua_Modifica", item.Usua_Fecha_Modifica);
                parametro.Add("Usua_Fecha_Modifica", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Usua_Reestablecer,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbUsuarios> ValidarCodigo(string codigo)
        {
            string sql = ScriptBaseDatos.UsuariosValidarCodigo;

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Usua_VerificarCorreo", codigo);
                result = db.Query<tbUsuarios>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public RequestStatus RestablecerContra2(tbUsuarios item)
        {
            string sql = ScriptBaseDatos.UsuariosRestablecerContra;

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Usua_VerificarCorreo", item.Usua_VerificarCorreo);
                parametro.Add("@Usua_Contra", item.Usua_Contra);
                parametro.Add("@Usua_Usua_Modifica", item.Usua_Usua_Modifica);
                parametro.Add("@Usua_Fecha_Modifica", item.Usua_Fecha_Modifica);
                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);

                return new RequestStatus { CodeStatus = result, MessageStatus = "" };
            }
        }

        public IEnumerable<tbUsuarios> EnviarCodigo(string Usuario)
        {
            string sql = ScriptBaseDatos.UsuariosEnviarCodigo;

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@UsuarioCorreo", Usuario);
                result = db.Query<tbUsuarios>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }


        public IEnumerable<tbUsuarios> IngresarCodigo(string codigo, int usua_id)
        {
            string sql = ScriptBaseDatos.UsuariosIngresarCodigo;

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Usua_Id", usua_id);
                parameters.Add("@Usua_VerificarCorreo", codigo);
                result = db.Query<tbUsuarios>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
    }
}
