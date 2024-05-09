﻿using Practica.DataAcces.Repositorio;
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
        //private readonly PantallaRepositorio _pantallaRepositorio;

        public AccesoServicio(UsuarioRepositorio usuarioRepositorio, RolRepositorio roleRepositorio /*PantallaRepositorio pantallaRepositorio*/)
        {
            _usuarioRepositorio = usuarioRepositorio;
            _roleRepositorio = roleRepositorio;
            //_pantallaRepositorio = pantallaRepositorio;
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

        public ServiceResult ListRole()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ListPanta()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.ListPanta();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ObtenerRolID(int Rol_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.ObtenerRoleID(Rol_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }
        public ServiceResult InsertarRol(tbRoles item, out int ingrId)
        {
            var result = new ServiceResult();
            ingrId = 0;
            try
            {
                var (lost, idGenerado) = _roleRepositorio.Insertar(item);
                if (lost.CodeStatus > 0)
                {
                    ingrId = idGenerado;
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
        public ServiceResult ActualizarRole(tbRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.Actualizar(item);
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
        public ServiceResult EliminarRole(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.Eliminar(id);
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
        public ServiceResult Listpant(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.Listpant(id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult InsertarPAntxROle(int Pant_Id, int Rol_Id,int usuaModifica)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.InsertarPor(Pant_Id, Rol_Id,usuaModifica);
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
        public ServiceResult EliminarPantXRole(int Pant_Id, int Rol_Id)
        {
            var result = new ServiceResult();
            var lost = _roleRepositorio.Eliminarpant(Pant_Id, Rol_Id);
            if (lost.CodeStatus > 0)
            {
                return result.Ok(lost);
            }
            else
            {
                return result.Error(lost);
            }
        }
        public ServiceResult ObtenerPantallasPorRol(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.ListpantxRoles(id);
                return new ServiceResult().Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult DetallesRol(int id)
        {
            var resul = new ServiceResult();
            try
            {
                var lost = _roleRepositorio.Detalle(id);
                  return resul.Ok(lost);


            }
             catch (Exception ex)
             {
                 return resul.Error(ex.Message);
             }
        }
        #endregion

    }
}
