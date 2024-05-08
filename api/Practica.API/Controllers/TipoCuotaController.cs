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
    public class TipoCuotaController : Controller
    {
        private readonly CrediRapidServicio _credirapidServicio;
        private readonly IMapper _mapper;


        public TipoCuotaController(CrediRapidServicio credirapidServicio, IMapper mapper)
        {

            _mapper = mapper;
            _credirapidServicio = credirapidServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _credirapidServicio.ListCuota();
            return Ok(list.Data);
        }


        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _credirapidServicio.DetallesTipoCuota(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _credirapidServicio.ObtenerTipoCuotaID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(TipoCuotaViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbTipoCuotas()
            {
                Ticu_Descripcion = item.Ticu_Descripcion,
                Ticu_Usua_Creacion = item.Ticu_Usua_Creacion,

            };
            var listado = _credirapidServicio.ListCuota();

            var prueba = _credirapidServicio.InsertarTipoCuota(modelo);
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
        public IActionResult Edit(int id, TipoCuotaViewModel item)
        {
           
                var model = _mapper.Map<tbTipoCuotas>(item);
                var modelo = new tbTipoCuotas()
                {
                    Ticu_Id = id,
                    Ticu_Descripcion = item.Ticu_Descripcion,
                    Ticu_Usua_Modi = item.Ticu_Usua_Modi
                };
                var listado = _credirapidServicio.ActualizarTipoCuota(modelo);
                return Ok(listado);
            
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado =  _credirapidServicio.EliminarTipoCuota(id);
                return Ok(listado);
           
        }
    }
}
