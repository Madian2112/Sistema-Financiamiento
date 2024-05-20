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
    public class CrediRapidServicio
    {
        private readonly MarcaRepositorio _marcaRepositorio;
        private readonly ModeloRepositorio _modeloRepositorio;
        private readonly VehiculoRepositorio _vehiculoRepositorio;
        private readonly TipoCuotaRepositorio _tipocuotaRepositorio;
        private readonly PlanPagoRepositorio _planpagoRepositorio;
        private readonly PlanPagoClienteRepositorio _planpagoclienteRepositorio;
        private readonly ImagenesClientesRepositorio _imagenesClienresRepositorio;

        public CrediRapidServicio(MarcaRepositorio marcaRepositorio, ModeloRepositorio modeloRepositorio,
            VehiculoRepositorio vehiculoRepositorio, TipoCuotaRepositorio tipoCuotaRepositorio, PlanPagoRepositorio planPagoRepositorio,
            PlanPagoClienteRepositorio planPagoClienteRepositorio, ImagenesClientesRepositorio imagenesClienresRepositorio)
        {
            _marcaRepositorio = marcaRepositorio;
            _modeloRepositorio = modeloRepositorio;
            _vehiculoRepositorio = vehiculoRepositorio;
            _tipocuotaRepositorio = tipoCuotaRepositorio;
            _planpagoRepositorio = planPagoRepositorio;
            _planpagoclienteRepositorio = planPagoClienteRepositorio;
            _imagenesClienresRepositorio = imagenesClienresRepositorio;
        }

        #region Tipos Cuotas

        public ServiceResult ListCuota()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _tipocuotaRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarTipoCuota(tbTipoCuotas item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _tipocuotaRepositorio.Insertar(item);
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
        public ServiceResult ActualizarTipoCuota(tbTipoCuotas item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _tipocuotaRepositorio.Actualizar(item);
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
        public ServiceResult EliminarTipoCuota(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _tipocuotaRepositorio.Eliminar(id);
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

        public IEnumerable<tbTipoCuotas> DetallesTipoCuota(int id)
        {
            return _tipocuotaRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerTipoCuotaID(int Ticu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _tipocuotaRepositorio.ObtenerTipoCuotaID(Ticu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion

        #region Plan Pagos

        public ServiceResult ListPlanPago()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult Listar(string Usua_Usuario)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoRepositorio.Listar(Usua_Usuario);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }


        public ServiceResult InsertarPlanPago(tbPlanesPagos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoRepositorio.Insertar(item);
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
        public ServiceResult ActualizarPlanPago(tbPlanesPagos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoRepositorio.Actualizar(item);
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
        public ServiceResult EliminarPlanPago(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoRepositorio.Eliminar(id);
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

        public IEnumerable<tbPlanesPagos> DetallesPlanPago(int id)
        {
            return _planpagoRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerPlanPagoID(int Papa_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoRepositorio.ObtenerPlanPagoID(Papa_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion

        #region Plan Pagos Clientes

        public ServiceResult ListPlanPagoClientes()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
      
        public IEnumerable<tbPlanesPagosClientes> DetallesPP(int? id)
        {
            return _planpagoclienteRepositorio.DetallePP(id);
        }

        public IEnumerable<tbPlanesPagosClientes> ValidarCliente(int? id)
        {
            return _planpagoclienteRepositorio.ValidarCiente(id);
        }

        public IEnumerable<tbPlanesPagosClientes> BuscarDNI(string id)
        {
            return _planpagoclienteRepositorio.BuscarDNI(id);
        }

        public IEnumerable<tbPlanesPagosClientes> BuscarPapaID(string id)
        {
            return _planpagoclienteRepositorio.BuscarDNI(id);
        }

        public IEnumerable<tbPlanesPagos> BuscarInteresRestar(int id)
        {
            return _planpagoclienteRepositorio.BuscarInteresRestante(id);
        }

        public ServiceResult SaberMora(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.SaberMora(id);
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

        public ServiceResult InsertarVFechaPrevia(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.InsertarFechaPrevia(id);
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

        public IEnumerable<tbPlanesPagosClientes> BuscarFechaPrevia(string id)
        {
            return _planpagoclienteRepositorio.BuscarVFechaPrevia(id);
        }
        public ServiceResult ObtenerPresaPorMes()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorMes();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ObtenerPrestaPorEstado()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorEstado();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ObtenerPrestaPorModeloFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorModeloFiltro(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ObtenerPrestaPorSexoFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorSexoFiltro(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ReportePrestamoPorMes(string FechaInicio, string FechaFinal, int? Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ReportePrestamoPorMes(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ReportePrestamoPorModelo(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ReportePrestamoPorModelo(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ReportePrestamoPorEmpleado(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ReportePrestamoPorEmpleado(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ReporteClientePorMora(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ReporteClientePorMora(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }


        public ServiceResult ObtenerPrestaPorMesFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorMesFiltro(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ObtenerPrestaPorEstadoFiltro(string FechaInicio,string FechaFinal, int Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorEstadoFiltro(FechaInicio, FechaFinal, Sucu_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ObtenerPrestaPorSexo()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorSexo();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ObtenerPrestaPorModelo()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPrestamoPorModelo();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult InsertarPlanPagoCliente(tbPlanesPagosClientes item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.Insertar(item);
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
        public ServiceResult InsertarCuota(tbPlanesPagosClientes item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.InsertarCuota(item);
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
        public ServiceResult EliminarPlanPagoClientes(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.Eliminar(id);
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

        public ServiceResult InsertarFechas(int id, string fechafin, string fechapreview)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.InsertarFechas(id, fechafin, fechapreview);
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

        public IEnumerable<tbPlanesPagosClientes> DetallesPlanPagoCliente(int id)
        {
            return _planpagoclienteRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerPlanPagoClienteID(int Pacl_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _planpagoclienteRepositorio.ObtenerPlanPagoClienteID(Pacl_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion

        #region Marcas

        public ServiceResult ListMarc()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _marcaRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarMarc(tbMarcas item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _marcaRepositorio.Insertar(item);
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
        public ServiceResult ActualizarMarc(tbMarcas item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _marcaRepositorio.Actualizar(item);
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
        public ServiceResult EliminarMarc(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _marcaRepositorio.Eliminar(id);
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

        public IEnumerable<tbMarcas> DetallesMarcas(int id)
        {
            return _marcaRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerMarcID(int Marc_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _marcaRepositorio.ObtenerCargoID(Marc_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion

        #region Modelos

        public ServiceResult ListMode()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _modeloRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarMode(tbModelos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _modeloRepositorio.Insertar(item);
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
        public ServiceResult ActualizarMode(tbModelos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _modeloRepositorio.Actualizar(item);
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
        public ServiceResult EliminarMode(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _modeloRepositorio.Eliminar(id);
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

        public IEnumerable<tbModelos> DetallesMode(int id)
        {
            return _modeloRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerModeID(int Mode_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _modeloRepositorio.ObtenerModeID(Mode_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion

        #region Vehiculos

        public ServiceResult ListVehi()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ListVehiVC()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.ListCV();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarVehi(tbVehiculos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.Insertar(item);
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

        public ServiceResult InsertarVehiCliebte(int? Vehi_Id, int? Clie_Id, int Usua)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.InsertarVehiculoCliente(Vehi_Id,Clie_Id,Usua);
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

        public ServiceResult ActualizarVehi(tbVehiculos item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.Actualizar(item);
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
        public ServiceResult EliminarVehi(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.Eliminar(id);
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

        public ServiceResult EliminarVehiCliente(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.EliminarVehiculoCliebte(id);
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

        public IEnumerable<tbVehiculos> DetallesVehi(int id)
        {
            return _vehiculoRepositorio.Detalle(id);
        }
        public ServiceResult ObtenerVehiID(int Vehi_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.ObtenerVehiID(Vehi_Id);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult CargarVehiculo(string Vehi_Placa)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _vehiculoRepositorio.CargarVehiculo(Vehi_Placa);
                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        #endregion

        #region ImagenesClientes 
        public ServiceResult ListVehiculoImagen()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _imagenesClienresRepositorio.List();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarVehiculoiImagen(tbImagenesPorClientes item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _imagenesClienresRepositorio.Insertar(item);
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

        public ServiceResult ListadoVehiculos()
        {
            var result = new ServiceResult();
            try
            {
                var lost = _imagenesClienresRepositorio.ListVehiculos();
                return result.Ok(lost);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult EliminarImagenPorCliente(int id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _imagenesClienresRepositorio.Eliminar(id);
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

        #endregion
    }
}
