using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Practica.BussinesLogic.Servicios;
using Practica.Common.Models;
using Practica.Entities.Entities;
using SistemaEsmeralda.API.Clases;
using SistemaAsilos.BussinesLogic;

namespace Practica.API.Controllers
{
    [ApiController]
    [Route("API/[controller]")]
    public class RolController : Controller
    {
        private readonly AccesoServicio _accesoServicio;

        private readonly IMapper _mapper;
        public RolController(AccesoServicio AccesoServicio, IMapper mapper)
        {
            _accesoServicio = AccesoServicio;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _accesoServicio.ListadoRol();
            return Ok(list.Data);
        }

        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _accesoServicio.ListadoRol();
            var drop = list.Data as List<tbRoles>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Rol_Descripcion,
                Value = x.Rol_Id.ToString()
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }





        [HttpPost("Create")]

        public IActionResult Insert(FormData formData)
        {


            var msj = new ServiceResult();
            string txtRol = formData.txtRol;
            List<int> pantallasSeleccionadas = formData.pantallasSeleccionadas;

            var modelo = new tbRoles()
            {
                Rol_Descripcion = txtRol,
                Rol_Usua_Creacion = 1,
                Rol_Fecha_Creacion = DateTime.Now
            };
            var list = _accesoServicio.InsertarRol(modelo);


            int idRol = Int32.Parse(list);

            foreach (var pantalla in pantallasSeleccionadas)
            {
                var modelo2 = new tbPantallasPorRoles()
                {
                    Pant_Id = pantalla,
                    Rol_Id = idRol,
                };

                msj = _accesoServicio.InsertarRolesPantalla(modelo2);

            }


            return Ok(new { success = true, message = msj.Message });
        }



        [HttpGet("Fill/{id}")]
        public IActionResult Llenar(int id)
        {
            var list = _accesoServicio.obterRolesPantalla(id);
            if (list.Success)
            {
                return Ok(list.Data);
            }
            else
            {
                return BadRequest(list.Message);
            }
        }


        [HttpGet("FillDetalles/{id}")]
        public IActionResult FillDetalles(int id)
        {
            var list = _accesoServicio.ObtenerRoles(id);
            if (list.Success)
            {
                return Ok(list.Data);
            }
            else
            {
                return BadRequest(list.Message);
            }
        }




        [HttpPut("Edit")]
        public IActionResult Update(FormData formData)
        {

            var msj = new ServiceResult();
            List<int> pantallasSeleccionadas = formData.pantallasSeleccionadas;


            var modelo = new tbRoles()
            {
                Rol_Id = formData.Rol_Id,
                Rol_Descripcion = formData.txtRol,
                Rol_Usua_Modifica = 1,
                Rol_Fecha_Modifica = DateTime.Now

            };
            var list = _accesoServicio.EditarRol(modelo);

            var idRol = formData.Rol_Id;

            var res = _accesoServicio.EliminarRolesPantalla(idRol.ToString());

            foreach (var pantalla in pantallasSeleccionadas)
            {
                var modelo2 = new tbPantallasPorRoles()
                {
                    Pant_Id = pantalla,
                    Rol_Id = idRol,
                };

                msj = _accesoServicio.InsertarRolesPantalla(modelo2);

            }


            return Ok(new { success = true, message = msj.Message });

        }








        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _accesoServicio.EliminarRolesPantalla(id);
            var list2 = _accesoServicio.EliminarRol(id);

            return Ok(new { success = true, message = list2.Message });
        }





    }
}
