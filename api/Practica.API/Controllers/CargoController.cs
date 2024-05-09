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
    public class CargoController : Controller
    {
        private readonly GeneralServicio _generalServicio;
        private readonly IMapper _mapper;


        public CargoController(GeneralServicio generalServicio, IMapper mapper)
        {

            _mapper = mapper;
            _generalServicio = generalServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _generalServicio.ListCarg();
            return Ok(list.Data);
        }




        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _generalServicio.DetallesCargo(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _generalServicio.ObtenerCargID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(CargoViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbCargos()
            {
                Carg_Descripcion = item.Carg_Descripcion,
                Carg_Usua_Creacion = 1,

            };
            var listado = _generalServicio.ListCarg();

            var prueba = _generalServicio.InsertarCarg(modelo);
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
        public IActionResult Edit(int id, CargoViewModel item)
        {
            
                var model = _mapper.Map<tbCargos>(item);
                var modelo = new tbCargos()
                {
                    Carg_Id = id,
                    Carg_Descripcion = item.Carg_Descripcion,
                    Carg_Usua_Modifica = item.Carg_Usua_Modifica
                };
                var listado =   _generalServicio.ActualizarCarg(modelo);
                return Ok(listado);
            
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado =  _generalServicio.EliminarCarg(id);
                return Ok(listado);
          
        }

    }
}
