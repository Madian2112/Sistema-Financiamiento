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
    public class RoleController : Controller
    {
        private readonly AccesoServicio _accesoServicio;
        private readonly IMapper _mapper;


        public RoleController(AccesoServicio accesoServicio, IMapper mapper)
        {

            _mapper = mapper;
            _accesoServicio = accesoServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _accesoServicio.ListRole();
            return Ok(list.Data);
        }

        [HttpGet("ListPantallas")]
        public IActionResult ListPantallas()
        {
            var list = _accesoServicio.ListPanta();
            return Ok(list.Data);
        }

        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _accesoServicio.DetallesRol(id);

            return Ok(modelo.Data);
        }
        [HttpGet("ListRoles/{Pant_ID}")]
        public IActionResult ListRoles(int Pant_ID)
        {
            var list = _accesoServicio.Listpant(Pant_ID);

            return Ok(list);
        }
        [HttpGet("ListPantXRole/{Rol_Id}")]
        public IActionResult ListPantXRole(int Rol_Id)
        {
            var list = _accesoServicio.ObtenerPantallasPorRol(Rol_Id);

            return Ok(list);


        }
        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _accesoServicio.ObtenerRolID(id);
            return Json(modelo.Data);
        }

        [HttpPost("Create")]
        public IActionResult Create(RolViewModel item)
        {
            //var model = _mapper.Map<tbRoles>(item);
            var modelo = new tbRoles()
            {
                Rol_Descripcion = item.Rol_Descripcion,
                Rol_Usua_Creacion = item.Rol_Usua_Creacion,

            };
         
            int rolId;
            var prueba = _accesoServicio.InsertarRol(modelo,out rolId);
            prueba.Message = rolId.ToString();
            return Ok(prueba);
        }
        [HttpPut("Edit/{id}")]
        public IActionResult Edit(int id, RolViewModel item)
        {
            
                var model = _mapper.Map<tbRoles>(item);
                var modelo = new tbRoles()
                {
                    Rol_Id = item.Rol_Id,
                    Rol_Descripcion = item.Rol_Descripcion,
                    Rol_Usua_Modifica = item.Rol_Usua_Modifica,
                    Rol_Fecha_Modifica = item.Rol_Fecha_Modifica
                };
                var listado = _accesoServicio.ActualizarRole(modelo);
                return Ok(listado);
           
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado = _accesoServicio.EliminarRole(id);
                return Ok(listado);
          
        }

        [HttpGet("Agregarpant/{pantid}/{rolId}/{Usua_Id}")]
        public IActionResult Agregarpant(int pantid, int rolId,int Usua_Id)
        {
            var result = _accesoServicio.InsertarPAntxROle(pantid, rolId, Usua_Id);
            return Ok(result);
        }

        [HttpDelete("DeletePanRol/{Pant_Id}/{Rol_Id}")]
        public IActionResult EliminarPantxRole(int Pant_Id, int Rol_Id) 
        {
            var list =  _accesoServicio.EliminarPantXRole(Pant_Id, Rol_Id);
            return Ok(list.Data);
        }


    }
}
