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
    public class EmpleadoController : Controller
    {
        private readonly GeneralServicio _generalServicio;
        private readonly IMapper _mapper;


        public EmpleadoController(GeneralServicio generalServicio, IMapper mapper)
        {

            _mapper = mapper;
            _generalServicio = generalServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _generalServicio.ListEmpl();
            return Ok(list.Data);
        }
        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _generalServicio.DetallesEmple(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _generalServicio.ObtenerEmpleID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(EmpleadoViewModel item)
        {
            var model = _mapper.Map<tbEmpleados>(item);
            var modelo = new tbEmpleados()
            {
                Empl_DNI = item.Empl_DNI,
                Empl_Nombre = item.Empl_Nombre,
                Empl_Apellido = item.Empl_Apellido,
                Empl_Sexo = item.Empl_Sexo,
                Carg_Id = item.Carg_Id,
                Empl_Usua_Creacion = 1,
                Esta_Id = item.Esta_Id,
                Muni_Id = item.Muni_Id,
                Empl_Fecha_Creacion = DateTime.Now,
                Empl_Estado = true

            };
            var listado =  _generalServicio.InsertarEmpl(modelo);
            return Ok(listado);
        }
        [HttpPut("Edit/{id}")]
        public IActionResult Edit(int id, EmpleadoViewModel item)
        {
            
                var model = _mapper.Map<tbEmpleados>(item);
                var modelo = new tbEmpleados()
                {
                    Empl_Id = item.Empl_Id,
                    Empl_DNI = item.Empl_DNI,
                    Empl_Nombre = item.Empl_Nombre,
                    Empl_Apellido = item.Empl_Apellido,
                    Empl_Sexo = item.Empl_Sexo,
                    Carg_Id = item.Carg_Id,
                    Esta_Id = item.Esta_Id,
                    Muni_Id = item.Muni_Id,
                    Empl_Usua_Modifica = item.Empl_Usua_Modifica,
                    Empl_Fecha_Modifica = item.Empl_Fecha_Modifica

                };
                var listado =  _generalServicio.ActualizarEmpl(modelo);
                return Ok(listado);
           
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
           
                var listado = _generalServicio.EliminarEmpl(id);
                return Ok(listado);
            
        }
    }
}
