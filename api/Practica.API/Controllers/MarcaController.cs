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
    public class MarcaController : Controller
    {
        private readonly CrediRapidServicio _credirapidServicio;
        private readonly IMapper _mapper;


        public MarcaController(CrediRapidServicio credirapidServicio, IMapper mapper)
        {

            _mapper = mapper;
            _credirapidServicio = credirapidServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _credirapidServicio.ListMarc();
            return Ok(list.Data);
        }


        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _credirapidServicio.DetallesMarcas(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _credirapidServicio.ObtenerMarcID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(MarcaViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbMarcas()
            {
                Marc_Descripcion = item.Marc_Descripcion,
                Marc_Usua_Creacion = item.Marc_Usua_Creacion,

            };
            var listado = _credirapidServicio.ListMarc();

            var prueba = _credirapidServicio.InsertarMarc(modelo);
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
        public IActionResult Edit(int id, MarcaViewModel item)
        {
            
                var model = _mapper.Map<tbMarcas>(item);
                var modelo = new tbMarcas()
                {
                    Marc_Id = item.Marc_Id,
                    Marc_Descripcion = item.Marc_Descripcion,
                    Marc_Usuario_Modificiacion = item.Marc_Usuario_Modificiacion
                };
                var listado = _credirapidServicio.ActualizarMarc(modelo);
                return Ok(listado);
          
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
           
                var listado =  _credirapidServicio.EliminarMarc(id);
                return Ok(listado);
            
        }
    }
}
