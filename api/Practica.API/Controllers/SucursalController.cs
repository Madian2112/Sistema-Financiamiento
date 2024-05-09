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
    public class SucursalController : Controller
    {
        private readonly GeneralServicio _generalServicio;
        private readonly IMapper _mapper;


        public SucursalController(GeneralServicio generalServicio, IMapper mapper)
        {

            _mapper = mapper;
            _generalServicio = generalServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _generalServicio.ListSucu();
            return Ok(list.Data);
        }




        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _generalServicio.DetallesSucu(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _generalServicio.ObtenerSucuID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(SucursalViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbSucursales()
            {
                Sucu_Calle = item.Sucu_Calle,
                Sucu_Direccion = item.Sucu_Direccion,
                Muni_Id = item.Muni_Id,
                Sucu_Usua_Creacion = item.Sucu_Usua_Creacion,

            };
            var listado = _generalServicio.ListSucu();

            var prueba = _generalServicio.InsertarSucu(modelo);
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
        public IActionResult Edit(int id, SucursalViewModel item)
        {
            
                var model = _mapper.Map<tbSucursales>(item);
                var modelo = new tbSucursales()
                {
                    Sucu_Id = id,
                    Sucu_Calle = item.Sucu_Calle,
                    Sucu_Direccion = item.Sucu_Direccion,
                    Muni_Id = item.Muni_Id,
                    Sucu_Usua_Modi = item.Sucu_Usua_Modi
                };
                var listado =  _generalServicio.ActualizarSucu(modelo);
                return Ok(listado);
          
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
                var listado = _generalServicio.EliminarSucu(id);
                return Ok(listado);
           
        }
    }
}
