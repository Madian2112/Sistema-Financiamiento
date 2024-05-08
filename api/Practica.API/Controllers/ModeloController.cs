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
    public class ModeloController : Controller
    {
        private readonly CrediRapidServicio _credirapidServicio;
        private readonly IMapper _mapper;


        public ModeloController(CrediRapidServicio credirapidServicio, IMapper mapper)
        {

            _mapper = mapper;
            _credirapidServicio = credirapidServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _credirapidServicio.ListMode();
            return Ok(list.Data);
        }




        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _credirapidServicio.DetallesMode(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _credirapidServicio.ObtenerModeID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(ModeloViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbModelos()
            {
                Mode_Descripcion = item.Mode_Descripcion,
                Marc_Id = item.Marc_Id,
                Mode_Usua_Creacion = item.Mode_Usua_Creacion,

            };
            var listado = _credirapidServicio.ListMode();

            var prueba = _credirapidServicio.InsertarMode(modelo);
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
        public IActionResult Edit(int id, ModeloViewModel item)
        {
            
                var model = _mapper.Map<tbModelos>(item);
                var modelo = new tbModelos()
                {
                    Mode_Id = item.Mode_Id,
                    Mode_Descripcion = item.Mode_Descripcion,
                    Marc_Id = item.Marc_Id,
                    Mode_Usua_Modifica = item.Mode_Usua_Modifica
                };
                var listado =  _credirapidServicio.ActualizarMode(modelo);
                return Ok(listado);
          
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
           
                var listado =  _credirapidServicio.EliminarMode(id);
                return Ok(listado);
           
        }
    }
}
