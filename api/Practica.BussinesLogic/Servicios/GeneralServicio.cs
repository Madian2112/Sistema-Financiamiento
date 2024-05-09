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
    public class GeneralServicio
    {
        private readonly DepartamentoRepositorio _departamentoRepositorio;
        private readonly EstadoCivilRepositorio _estadoCivilRepositorio;
        private readonly MunicipioRepositorio _municipioRepositorio;
        private readonly CargoRepositorio _cargoRepositorio;
        private readonly ClienteRepositorio _clienteRepositorio;
        private readonly EmpleadoRepositorio _empleadoRepositorio;
        private readonly SucursalRepositorio _sucursalRepositorio;
        public GeneralServicio(DepartamentoRepositorio departamentoRepositorio, EstadoCivilRepositorio estadoCivilRepositorio, MunicipioRepositorio municipioRepositorio
            , CargoRepositorio cargoRepositorio, ClienteRepositorio clienteRepositorio, EmpleadoRepositorio empleadoRepositorio, SucursalRepositorio sucursalRepositorio)
        {
            _departamentoRepositorio = departamentoRepositorio;
            _estadoCivilRepositorio = estadoCivilRepositorio;
            _municipioRepositorio = municipioRepositorio;
            _cargoRepositorio = cargoRepositorio;
            _clienteRepositorio = clienteRepositorio;
            _empleadoRepositorio = empleadoRepositorio;
            _sucursalRepositorio = sucursalRepositorio;
        }
        #region Departamentos
        public ServiceResult ListDepto()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _departamentoRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public IEnumerable<tbMunicipios> ListMaster(string id)
        {
            return _departamentoRepositorio.ListMaster(id);
        }
        public ServiceResult ObtenerDeptoID(string Dept_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _departamentoRepositorio.ObtenerDeptoID(Dept_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult InsertarDepto(tbDepartamentos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _departamentoRepositorio.Insertar(item);
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
        public ServiceResult ActualizarDepto(tbDepartamentos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _departamentoRepositorio.Actualizar(item);
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
        public ServiceResult EliminarDepto(string id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _departamentoRepositorio.Eliminarr(id);
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
       
        public IEnumerable<tbDepartamentos> Detalles(string id)
        {
            return _departamentoRepositorio.Detalle(id);
        }
        #endregion

        #region Municipios
        public ServiceResult ListMuni()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _municipioRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ObtenerMuniID(string Muni_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _municipioRepositorio.ObtenerMuniID(Muni_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult InsertarMuni(tbMunicipios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _municipioRepositorio.Insertar(item);
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
        public ServiceResult ActualizarMuni(tbMunicipios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _municipioRepositorio.Actualizar(item);
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
        public ServiceResult EliminarMuni(string id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _municipioRepositorio.Eliminarr(id);
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
        
        public IEnumerable<tbMunicipios> DetallesMuni(string id)
        {
            return _municipioRepositorio.Detalle(id);
        }

        #endregion

        #region Clientes
        public ServiceResult ListClie()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _clienteRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult CargarDNI(string Clie_DNI)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _clienteRepositorio.CargarDNI(Clie_DNI);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult InsertarClie(tbClientes item, out int clieId)
        {
            var result = new ServiceResult();
            clieId = 0;
            try
            {
                var (lost, idGenerado) = _clienteRepositorio.Insertar(item);
                if (lost.CodeStatus > 0)
                {
                    clieId = idGenerado;
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
        public ServiceResult ActualizarClie(tbClientes item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _clienteRepositorio.Actualizar(item);
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
        public ServiceResult EliminarClie(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _clienteRepositorio.Eliminar(id);
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
        public ServiceResult ObtenerClienID(int Clie_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _clienteRepositorio.ObtenerClienID(Clie_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }
        public ServiceResult ObtenerVehiClientes(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _clienteRepositorio.ListClieXVehi(id);
                return new ServiceResult().Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public IEnumerable<tbClientes> DetallesClien(int id)
        {
            return _clienteRepositorio.Detalle(id);
        }
        #endregion

        #region Empleados

        public ServiceResult ListEmpl()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _empleadoRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarEmpl(tbEmpleados item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _empleadoRepositorio.Insertar(item);
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
        public ServiceResult ActualizarEmpl(tbEmpleados item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _empleadoRepositorio.Actualizar(item);
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
        public ServiceResult ObtenerEmpleID(int Empl_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _empleadoRepositorio.ObtenerEmpleID(Empl_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }
        public ServiceResult EliminarEmpl(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _empleadoRepositorio.Eliminar(id);
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

       
        public IEnumerable<tbEmpleados> DetallesEmple(int id)
        {
            return _empleadoRepositorio.Detalle(id);
        }
        #endregion

        #region Estados Civiles
       

        public ServiceResult EstadoList()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _estadoCivilRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ObtenerEstadoID(int Esta_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _estadoCivilRepositorio.ObtenerEstadoID(Esta_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }
        public ServiceResult InsertarEstado(tbEstadosCiviles item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _estadoCivilRepositorio.Insertar(item);
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
        public ServiceResult ActualizarEstado(tbEstadosCiviles item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _estadoCivilRepositorio.Actualizar(item);
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
        public ServiceResult EliminarEstado(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _estadoCivilRepositorio.Eliminar(id);
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
      
        public IEnumerable<tbEstadosCiviles> Detalles(int id)
        {
            return _estadoCivilRepositorio.Detalle(id);
        }

        public ServiceResult ListaMunicipiosID(string id)
        {
            var result = new ServiceResult();
            try
            {
                //var lost = _coloniasRepositorio.List();
                var lost = _departamentoRepositorio.ListaMunicipiosID(id);

                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }
        #endregion

        #region Sucursales

        public ServiceResult ListSucu()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _sucursalRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarSucu(tbSucursales item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _sucursalRepositorio.Insertar(item);
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
        public ServiceResult ActualizarSucu(tbSucursales item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _sucursalRepositorio.Actualizar(item);
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
        public ServiceResult EliminarSucu(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _sucursalRepositorio.Eliminar(id);
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

        public IEnumerable<tbSucursales> DetallesSucu(int id)
        {
            return _sucursalRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerSucuID(int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _sucursalRepositorio.ObtenerSucuID(Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion

        #region Cargos

        public ServiceResult ListCarg()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _cargoRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarCarg(tbCargos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _cargoRepositorio.Insertar(item);
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
        public ServiceResult ActualizarCarg(tbCargos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _cargoRepositorio.Actualizar(item);
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
        public ServiceResult EliminarCarg(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _cargoRepositorio.Eliminar(id);
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
      
        public IEnumerable<tbCargos> DetallesCargo(int id)
        {
            return _cargoRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerCargID(int Carg_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _cargoRepositorio.ObtenerCargoID(Carg_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion
    }
}
