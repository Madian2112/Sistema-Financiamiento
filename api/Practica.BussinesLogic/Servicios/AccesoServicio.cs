using Practica.DataAcces.Repositorio;
using Practica.Entities.Entities;
using SistemaAsilos.BussinesLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.BussinesLogic.Servicios
{
    public class AccesoServicio
    {
        private readonly UsuarioRepositorio _usuarioRepositorio;
        private readonly RolRepositorio _roleRepositorio;
        private readonly PantallaPorRolRepositorio _pantallaRepositorio;

        public AccesoServicio(UsuarioRepositorio usuarioRepositorio, RolRepositorio roleRepositorio ,PantallaPorRolRepositorio pantallaRepositorio)
        {
            _usuarioRepositorio = usuarioRepositorio;
            _roleRepositorio = roleRepositorio;
            _pantallaRepositorio = pantallaRepositorio;
        }


        #region Usuario

        public ServiceResult ListUsua()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult Insertarusua(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.Insertar(item);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    lost.MessageStatus = (lost.CodeStatus == 0) ? "401 Error de Consulta" : lost.MessageStatus;
                    return result.Error(lost);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ValidarUsuario(string usua, string contra)
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepositorio.Login(usua, contra);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }
        public ServiceResult ActualizarUsua(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.Actualizar(item);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    lost.MessageStatus = (lost.CodeStatus == 0) ? "401 Error de Consulta" : lost.MessageStatus;
                    return result.Error(lost);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ActualizarUsuaPerfil(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.EditPerfil(item);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    lost.MessageStatus = (lost.CodeStatus == 0) ? "401 Error de Consulta" : lost.MessageStatus;
                    return result.Error(lost);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult restablecer(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.RestablecerContra(item);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    lost.MessageStatus = (lost.CodeStatus == 0) ? "401 Error de Consulta" : lost.MessageStatus;
                    return result.Error(lost);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult Eliminarusua(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.Eliminar(id);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    lost.MessageStatus = (lost.CodeStatus == 0) ? "401 Error de Consulta" : lost.MessageStatus;
                    return result.Error(lost);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
     
        public ServiceResult Login(string usuario, string contra)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.Login(usuario, contra);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }
        public IEnumerable<tbUsuarios> DetallesUsua(int id)
        {
            return _usuarioRepositorio.Detalle(id);
        }

        public IEnumerable<tbUsuarios> DetallePerfil(string usuario)
        {
            return _usuarioRepositorio.Detalle(usuario);
        }


        public ServiceResult ObtenerUsuaID(int Usua_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepositorio.ObtenerUsuaID(Usua_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }
        #endregion
        #region Role

        public ServiceResult ListadoRol()
        {
            var result = new ServiceResult();
            try
            {
                var list = _roleRepositorio.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }




        public ServiceResult EditarRol(tbRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _roleRepositorio.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok("okis", list);
                }
                else
                {
                    return result.Error("Y existe un registro con ese nombre");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }
        public ServiceResult EliminarRol(string Role_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _roleRepositorio.Delete(Role_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"La accion ha sido existosa", list);
                }
                else
                {
                    return result.Error("No se pudo realizar la accion");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }








        public string InsertarRol(tbRoles item)
        {
            string error = "";
            try
            {
                int result = _roleRepositorio.Insert(item);
                if (result == 0)
                    error = "el codigo no es valido";
                else error = result.ToString();
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }
            return error;
        }



        public ServiceResult obterRol(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _roleRepositorio.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }







        public ServiceResult ListadoPantallas()
        {
            var result = new ServiceResult();
            try
            {
                var list = _roleRepositorio.Listpantallas();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        #endregion


        #region RolesPantalla







        public ServiceResult ListadoPantallaRoles()
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRepositorio.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }




        public ServiceResult EditarRolesPantalla(tbPantallasPorRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRepositorio.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok("okis", list);
                }
                else
                {
                    return result.Error("Y existe un registro con ese nombre");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }
        public ServiceResult EliminarRolesPantalla(string Role_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRepositorio.Delete(Role_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"La accion ha sido existosa", list);
                }
                else
                {
                    return result.Error("No se pudo realizar la accion");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }








        public ServiceResult InsertarRolesPantalla(tbPantallasPorRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRepositorio.Insert(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error(list);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }



        public ServiceResult obterRolesPantalla(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRepositorio.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }


        public ServiceResult ObtenerRoles(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRepositorio.Fill2(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }

        public ServiceResult PantallasdeRoles(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _roleRepositorio.PantallasdeRoles(id);
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }










        #endregion
    }
}
