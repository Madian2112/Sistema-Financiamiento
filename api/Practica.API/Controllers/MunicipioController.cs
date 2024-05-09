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
    public class MunicipioController : Controller
    {
        private readonly GeneralServicio _generalServicio;
        private readonly IMapper _mapper;


        public MunicipioController(GeneralServicio generalServicio, IMapper mapper)
        {

            _mapper = mapper;
            _generalServicio = generalServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _generalServicio.ListMuni();
            return Ok(list.Data);
        }
        [HttpGet("Details/{id}")]
        public IActionResult Details(string id)
        {
            var modelo = _generalServicio.DetallesMuni(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(string id)
        {
            var modelo = _generalServicio.ObtenerMuniID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(MunicipioViewModel item)
        {
            var model = _mapper.Map<tbMunicipios>(item);
            var modelo = new tbMunicipios()
            {
                Muni_Id = item.Muni_Id,
                Muni_Descripcion = item.Muni_Descripcion,
                Dept_Id = item.Dept_Id,
                Muni_Usua_Creacion = item.Muni_Usua_Creacion,
                Muni_Fecha_Creacion = item.Muni_Fecha_Creacion,

            };
            var listado = _generalServicio.ListMuni();

            var prueba = _generalServicio.InsertarMuni(modelo);
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
        public IActionResult Edit(int id, MunicipioViewModel item)
        {
            
                var model = _mapper.Map<tbMunicipios>(item);
                var modelo = new tbMunicipios()
                {
                    Muni_Id = item.Muni_Id,
                    Muni_Descripcion = item.Muni_Descripcion,
                    Dept_Id = item.Dept_Id,
                    Muni_Usua_Modifica = item.Muni_Usua_Modifica,
                    Muni_Fecha_Modifica = item.Muni_Fecha_Modifica,

                };
                var listado = _generalServicio.ActualizarMuni(modelo);

                return Ok(listado);
            
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            
                var listado = _generalServicio.EliminarMuni(id);
                return Ok(listado);
            
        }

    }
}
