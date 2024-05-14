using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
    public class DepartamentoController : Controller
    {
        private readonly GeneralServicio _generalServicio;
        private readonly IMapper _mapper;


        public DepartamentoController(GeneralServicio generalServicio, IMapper mapper)
        {

            _mapper = mapper;
            _generalServicio = generalServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _generalServicio.ListDepto();
            return Ok(list.Data);
        }

        [HttpGet("ListMaster/{Dept_Id}")]
        public IActionResult ListMaster(string Dept_Id)
        {
            var list = _generalServicio.ListMaster(Dept_Id);

            return Ok(list);
        }

        [HttpGet("Details/{id}")]
        public IActionResult Details(string id)
        {
            var modelo = _generalServicio.Detalles(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(string id)
        {
            var modelo = _generalServicio.ObtenerDeptoID(id);
            return Json(modelo.Data);
        }
        [HttpGet("Municipios/{id}")]
        public IActionResult Municipios(string id)
        {
            var list = _generalServicio.ListaMunicipiosID(id);
            var drop = list.Data as List<tbMunicipios>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Muni_Descripcion,
                Value = x.Muni_Id
            }).ToList();

            rol.Insert(0, new SelectListItem { Text = "Seleccione", Value = "0" });
            return Ok(rol.ToList());
        }

        [HttpPost("Create")]
        public IActionResult Create(DepartamentoViewModel item)
        {
            var model = _mapper.Map<tbDepartamentos>(item);
            var modelo = new tbDepartamentos()
            {
                Dept_Id = item.Dept_Id,
                Dept_Descripcion = item.Dept_Descripcion,
                Dept_Usua_Creacion = item.Dept_Usua_Creacion
            };
            var listado = _generalServicio.ListDepto();

            var prueba = _generalServicio.InsertarDepto(modelo);

            RequestStatus request = new RequestStatus();

            request = prueba.Data;

            DateTime fechaprueba = DateTime.Today.Date;
            int x = 1;
            int y = 0;

            for (int i = 1; i < 4 ; i++)
            {
                int fechaactual = fechaprueba.Month;

                DateTime actual1 = fechaprueba.AddMonths(x);
                DateTime actual2 = fechaprueba.AddMonths(y);

                x += 1;
                y += 1;
            }

            if (prueba.Code == 200)
            {
                return Ok (new { success = true,message = prueba.Message });
            }

            else
            {
                return BadRequest();
            }
        }

        [HttpPut("Edit/{id}")]
        public IActionResult Edit(string id, DepartamentoViewModel item)
        {

            var model = _mapper.Map<tbDepartamentos>(item);
            var modelo = new tbDepartamentos()
            {
                Dept_Id = item.Dept_Id,
                Dept_Descripcion = item.Dept_Descripcion,
                Dept_Usua_Modifica = item.Dept_Usua_Modifica
            };
            var listado = _generalServicio.ListDepto();

            var prueba = _generalServicio.ActualizarDepto(modelo);
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
        public IActionResult Delete(string id)
        {

            var listado =  _generalServicio.EliminarDepto(id);
            if(listado.Code == 200)
            {
                return Ok(listado);
            }
            else
            {
                return BadRequest();
            }

        }

    }
}
