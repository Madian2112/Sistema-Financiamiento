using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Practica.BussinesLogic.Servicios;
using Practica.Common.Models;
using Practica.Entities.Entities;
using System;
using System.Collections.Generic;
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

        [HttpGet("ReportePorMes/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult RepoPorMes(string FechaInicio, string FechaFinal, int Sucu_Id)
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


        [HttpGet("ReportePorEstado/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult RepoPorEstado(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ReportePrestamoPorEstado(FechaInicio, FechaFinal, Sucu_Id);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorSexo/{FechaInicio}/{FechaFinal}/{Sucu_Id}")]
        public IActionResult RepoPorSexo(string FechaInicio, string FechaFinal, int Sucu_Id)
        {
            var list = _credirapidServicio.ReportePrestamoPorSexo(FechaInicio, FechaFinal, Sucu_Id);
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
        [HttpPut("Edit/{id}")]
        public IActionResult Edit(int id, PlanesPagosClientesViewModel item)
        {

            var modelo = new tbPlanesPagosClientes()
            {
                Pacl_Id = id,
                Papa_Id = item.Papa_Id,
                Pacl_Monto_Pago = item.Pacl_Monto_Pago,
                Pacl_Fecha_Emision = item.Pacl_Fecha_Creacion,
                Sucu_Id = item.Sucu_Id,
                Pacl_Usua_Modi = item.Pacl_Usua_Modi,
            };
            var listado = _credirapidServicio.ActualizarPlanPagoClientes(modelo);
            return Ok(listado);

        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado = _credirapidServicio.EliminarPlanPagoClientes(id);
                return Ok(listado);
           
        }
    }
}
