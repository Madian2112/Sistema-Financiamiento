using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Practica.BussinesLogic.Servicios;
using Practica.Common.Models;
using Practica.DataAcces.Repositorio;
using Practica.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Practica.API.Controllers
{
    [ApiController]
    [Route("API/[Controller]")]
    public class PlanPagoController : Controller
    {

        private readonly CrediRapidServicio _credirapidServicio;
        private readonly IMapper _mapper;


        public PlanPagoController(CrediRapidServicio credirapidServicio, IMapper mapper)
        {

            _mapper = mapper;
            _credirapidServicio = credirapidServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var fecha = DateTime.Today.Date;
            var list = _credirapidServicio.ListPlanPago();
            return Ok(list.Data);
        }

        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _credirapidServicio.DetallesPlanPago(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _credirapidServicio.ObtenerPlanPagoID(id);
            return Json(modelo.Data);
        }

        [HttpGet("ValidarCliente/{id}")]
        public IActionResult ValidarCliente(int id)
        {
            RequestStatus status = new RequestStatus();
            var ValidarCliente = _credirapidServicio.ValidarCliente(id);

            if (ValidarCliente.ToList().Count >= 1)
            {
                status.MessageStatus = "error";
                return Ok(status);
            }

            else
            {
                status.MessageStatus = "exito";
            }

            return Ok(status);
        }

        [HttpPost("Create")]
        public IActionResult Create(PlanesPagosViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);

            RequestStatus request = new RequestStatus();

            RequestStatus status = new RequestStatus();

            var ValidarCliente = _credirapidServicio.ValidarCliente(item.Vecl_Id);

            if (ValidarCliente.ToList().Count >= 1)
            {
                status.MessageStatus = "error";
                return Ok(status);
            }

            else 
            {
                status.MessageStatus = "exito";
            }
            
            var modelo = new tbPlanesPagos()
            {
                Papa_Financiamiento = item.Papa_Financiamiento,
                Papa_Precio_Mercado = item.Papa_Precio_Mercado,
                Vecl_Id = item.Vecl_Id,
                Papa_Numero_Cuota = item.Papa_Numero_Cuota,
                Papa_Fecha_Emision = DateTime.Now , 
                Papa_Usua_Creacion = item.Papa_Usua_Creacion 
            };

            var listado = _credirapidServicio.ListPlanPago();
            var prueba = _credirapidServicio.InsertarPlanPago(modelo);

            
            request = prueba.Data;
            var valor = request.CodeStatus;
            var fecha = request.Fecha;

            var detalle = _credirapidServicio.DetallesPP(valor);
            DateTime FechaActual = DateTime.Today.Date;
            int x = 1;
            int y = 0;

            foreach (var i in detalle)
            {
                DateTime fechafin = FechaActual.AddMonths(x);
                DateTime fechapreview = FechaActual.AddMonths(y);
                var insertarfechas = _credirapidServicio.InsertarFechas(i.Pacl_Id, fechafin.ToString(), fechapreview.ToString());
                x += 1;
                y += 1;
            }

            var detalles = _credirapidServicio.DetallesPP(valor);

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
        public IActionResult Edit(int id, PlanesPagosViewModel item)
        {
            
                var modelo = new tbPlanesPagos()
                {
                    Papa_Id = id,
                    Papa_Financiamiento = item.Papa_Financiamiento,
                    Papa_Precio_Mercado = item.Papa_Precio_Mercado,
                    Vecl_Id = item.Vecl_Id,
                    Ticu_Id = item.Ticu_Id,
                    Pap_Intereses_Porcentaje = item.Pap_Intereses_Porcentaje,
                    Papa_Estado_PlanesPagos = item.Papa_Estado_PlanesPagos,
                    Papa_Numero_Cuota = item.Papa_Numero_Cuota,
                    Papa_Fecha_Emision = item.Papa_Fecha_Emision,
                    Papa_Fecha_Finalizacion = item.Papa_Fecha_Finalizacion,
                    Papa_Usua_Modi = item.Papa_Usua_Modi,
                };
                var listado = _credirapidServicio.ActualizarPlanPago(modelo);
                return Ok(listado);
           
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
           
                var listado =  _credirapidServicio.EliminarPlanPago(id);
                return Ok(listado);
           
        }
    }
}
