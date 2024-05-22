using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Practica.BussinesLogic.Servicios;
using Practica.Common.Models;
using Practica.Entities.Entities;
using SistemaAsilos.BussinesLogic;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace Practica.API.Controllers
{
    [ApiController]
    [Route("API/[Controller]")]
    public class PlanPagoClienteController : Controller
    {
        private readonly CrediRapidServicio _credirapidServicio;
        private readonly IMapper _mapper;


        public PlanPagoClienteController(CrediRapidServicio credirapidServicio, IMapper mapper)
        {

            _mapper = mapper;   
            _credirapidServicio = credirapidServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _credirapidServicio.ListPlanPagoClientes();
            return Ok(list.Data);
        }
        
        [HttpGet("DetailsPP/{id}")]
        public IActionResult DetailsPP(int? id)
         {
            if (id == 0)
            {
                return Ok(id);
            }
            var modelo = _credirapidServicio.DetallesPP(id);
            var fechaActual = DateTime.Now.Date;
            DateTime fechaactual = DateTime.Today.Date;

            foreach (var item in modelo)
            {
                DateTime fechaPago = DateTime.Parse(item.Pacl_Fecha_Pago);
                var holaa = item.Pacl_Fecha_Emision;
                DateTime fechaUnMesAntes = fechaPago.AddMonths(-1);

                if (item.Pacl_Fecha_Pago != null && item.Pacl_Fecha_PreviaPago != null)
                {

                    if (DateTime.Parse(item.Pacl_Fecha_Pago) < fechaactual)
                    {
                        var sabermora = _credirapidServicio.SaberMora(item.Pacl_Id);
                    }

                    if (DateTime.Parse(item.Pacl_Fecha_PreviaPago) <= fechaactual)
                    {
                        var insertarfechaprevia = _credirapidServicio.InsertarVFechaPrevia(item.Pacl_Id);
                    }
                }

                if (item.Pacl_Fecha_Emision != null) 
                {
                    _credirapidServicio.ActualizarEstadoPago(item.Pacl_Id);
                }

                if (fechaActual >= fechaUnMesAntes && fechaActual <= fechaPago)
                {
                    var hola = "hola mundo";
                    _credirapidServicio.ActualizarCuotaActual(item.Pacl_Id);
                }
            }

            var modelo2 = _credirapidServicio.DetallesPP(id);

            return Ok(modelo2);
        }

        [HttpGet("BuscarDNIFecha/{id}")]
        public IActionResult BuscarDNIFecha(string id)
        {
            DateTime fechaactual = DateTime.Today.Date;


            var modelo = _credirapidServicio.BuscarDNI(id);

            ServiceResult serviceResult = new ServiceResult();

            foreach (var item in modelo)
            {
                if (item.Pacl_Fecha_Emision != null)
                {
                    _credirapidServicio.ActualizarEstadoPago(item.Pacl_Id);
                }

                if (item.Pacl_Fecha_Pago != null && item.Pacl_Fecha_PreviaPago != null)
                { 

                    if (DateTime.Parse(item.Pacl_Fecha_Pago) < fechaactual) 
                    {
                       var sabermora = _credirapidServicio.SaberMora(item.Pacl_Id);
                    }
                }
            }

            var final = _credirapidServicio.BuscarFechaPrevia(id);

            return Ok(final);
        }

        [HttpGet("BuscarDNI/{id}")]
        public IActionResult BuscarDNI(string id)
        {
            var modelo = _credirapidServicio.BuscarDNI(id);

            foreach (var item in modelo)
            {
                if (item.Pacl_Fecha_Emision != null)
                {
                    _credirapidServicio.ActualizarEstadoPago(item.Pacl_Id);
                }
            }

            var modelo2 = _credirapidServicio.BuscarDNI(id);

            return Ok(modelo2);
        }

        [HttpGet("BuscarPapaID/{id}")]
        public IActionResult BuscarPapaID(string id)
        {
            var modelo = _credirapidServicio.BuscarPapaID(id);

            foreach (var item in modelo)
            {
                if (item.Pacl_Fecha_Emision != null)
                {
                    _credirapidServicio.ActualizarEstadoPago(item.Pacl_Id);
                }
            }

            var modelo2 = _credirapidServicio.BuscarDNI(id);

            return Ok(modelo2);
        }

        [HttpPut("PagarCuota/")]
        public IActionResult InsertarCuota(PagosClientesViewModel item)
        {
            var data = _credirapidServicio.BuscarInteresRestar(item.Papa_Id);

            decimal interes = 0;

            foreach (var hola in data)
            {
                interes = hola.Papa_Total_Intereses_Restados;
            }

            var modelo = new tbPlanesPagosClientes()
            {
                Papa_Total_Intereses_Restados = interes,
                Pacl_Id = item.Pacl_Id,
                Papa_Id = item.Papa_Id,
                Pacl_Monto_Pago = item.Pacl_Monto_Pago,
                Pacl_NumeroCuota = item.Pacl_NumeroCuota
            };

            var listado = _credirapidServicio.InsertarCuota(modelo);
            return Ok(listado);

        }

        [HttpGet("ObtenerPrestaPorMes")]
        public IActionResult ObtenerPrestaPorMes()
        {
            var list = _credirapidServicio.ObtenerPresaPorMes();
            return Ok(list.Data);
        }
        [HttpGet("ObtenerPrestaPorEstadoCivil")]
        public IActionResult ObtenerPrestaPorEstadoCivil()
        {
            var list = _credirapidServicio.ObtenerPrestaPorEstado();
            return Ok(list.Data);
        }

        

        [HttpGet("ObtenerPrestaPorSexo")]
        public IActionResult ObtenerPrestaPorSexo()
        {
            var list = _credirapidServicio.ObtenerPrestaPorSexo();
            return Ok(list.Data);
        }
        [HttpGet("ObtenerPrestaPorModelo")]
        public IActionResult ObtenerPrestaPorModelo()
        {
            var list = _credirapidServicio.ObtenerPrestaPorModelo();
            return Ok(list.Data);
        }

        [HttpGet("ObtenerPrestaPorEstadoCivilFiltro/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult ObtenerPrestaPorEstadoCivilFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ObtenerPrestaPorEstadoFiltro(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }
        [HttpGet("ObtenerPrestaPorModeloFiltro/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult ObtenerPrestaPorModeloFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ObtenerPrestaPorModeloFiltro(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }
        [HttpGet("ObtenerPrestaPorMesFiltro/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult ObtenerPrestaPorMesFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ObtenerPrestaPorMesFiltro(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }
        [HttpGet("ObtenerPrestaPorSexoFiltro/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult ObtenerPrestaPorSexoFiltro(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ObtenerPrestaPorSexoFiltro(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }

        [HttpGet("ReportePorMes/{FechaInicio}/{FechaFinal}/{Sucu_Id?}")] 
        public IActionResult RepoPorMes(string FechaInicio, string FechaFinal, int? Sucu_Id)
        {
            var list = _credirapidServicio.ReportePrestamoPorMes(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorModelo/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult RepoPorModelo(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ReportePrestamoPorModelo(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorEmpleado/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult RepoPorEstado(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ReportePrestamoPorEmpleado(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }


        [HttpGet("ReporteClientePorMora/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult RepoPorSexo(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ReporteClientePorMora(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }


        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _credirapidServicio.DetallesPlanPagoCliente(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _credirapidServicio.ObtenerPlanPagoClienteID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(PlanesPagosClientesViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbPlanesPagosClientes()
            {
                Papa_Id = item.Papa_Id,
                Pacl_Monto_Pago = item.Pacl_Monto_Pago,
                Pacl_Fecha_Emision = item.Pacl_Fecha_Creacion,
                Sucu_Id = item.Sucu_Id,
                Pacl_Usua_Creacion = item.Pacl_Usua_Creacion,
            };
            var listado = _credirapidServicio.ListPlanPagoClientes();

            var prueba = _credirapidServicio.InsertarPlanPagoCliente(modelo);
            if (prueba.Code == 200)
            {
                return Ok(prueba);
            }
            else
            {
                return BadRequest("Error");
            }

        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado = _credirapidServicio.EliminarPlanPagoClientes(id);
                return Ok(listado);
           
        }
    }
}
