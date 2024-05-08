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
    public class EstadosCivilController : Controller
    {
        private readonly GeneralServicio _generalServicio;
        private readonly IMapper _mapper;


        public EstadosCivilController(GeneralServicio generalServicio, IMapper mapper)
        {

            _mapper = mapper;
            _generalServicio = generalServicio;


        }
        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServicio.EstadoList();
            return Ok(list.Data);
        }
        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _generalServicio.ObtenerEstadoID(id);
            return Json(modelo.Data);
        }

        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _generalServicio.Detalles(id);
            var detail = modelo.First();

            return Ok(detail);
        }


        [HttpPost("Create")]
        public IActionResult Create(EstadoCivilViewModel item)
        {
            var model = _mapper.Map<tbEstadosCiviles>(item);
            var modelo = new tbEstadosCiviles()
            {
                Esta_Descripcion = item.Esta_Descripcion,
                Esta_Usua_Creacion = item.Esta_Usua_Creacion


            };
            var listado = _generalServicio.EstadoList();

            var prueba = _generalServicio.InsertarEstado(modelo);
            if (prueba.Code == 200)
            {
                return Ok(prueba);
            }

            else
            {
                return BadRequest();
            }
        }
        [HttpPut("Edit/{id}")]
        public IActionResult Edit(int id, EstadoCivilViewModel item)
        {

            var model = _mapper.Map<tbEstadosCiviles>(item);
            var modelo = new tbEstadosCiviles()
            {
                Esta_Id = item.Esta_Id,
                Esta_Descripcion = item.Esta_Descripcion,
                Esta_Usua_Modifica = item.Esta_Usua_Modifica


            };
            var listado = _generalServicio.EstadoList();

            var prueba = _generalServicio.ActualizarEstado(modelo);
            if (prueba.Code == 200)
            {
                return Ok(prueba);
            }
            else
            {
                return BadRequest();
            }

        }
        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado = _generalServicio.EliminarEstado(id);
                return Ok(listado);
           
        }
    }
}
