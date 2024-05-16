using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Practica.BussinesLogic.Servicios;
using Practica.Common.Models;
using Practica.Entities.Entities;
using SistemaAsilos.BussinesLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Practica.API.Controllers
{
    [ApiController]
    [Route("API/[Controller]")]
    public class UsuarioController : Controller
    {
        private readonly AccesoServicio _accesoServicio;
        private readonly IMapper _mapper;


        public UsuarioController(AccesoServicio accesoServicio, IMapper mapper)
        {

            _mapper = mapper;
            _accesoServicio = accesoServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _accesoServicio.ListUsua();
            return Ok(list.Data);
        }
        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _accesoServicio.DetallesUsua(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("PerfilDetails/{id}")]
        public IActionResult PerfilDetails(string id)
        {
            var modelo = _accesoServicio.DetallePerfil(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _accesoServicio.ObtenerUsuaID(id);
            return Json(modelo.Data);
        }
        [HttpGet("Login/{usuario},{contra}")]

        public IActionResult Login(string usuario, string contra)
        {



            var list = _accesoServicio.ValidarUsuario(usuario, contra);


            var prueba = list.Data as List<tbUsuarios>;
            if (prueba.Count > 0)
            {
                return Ok(list.Data);
            }
            else
            {
                list.Message = "Error";
                return Ok(list.Message);
            }

            //return Json(list.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(UsuarioViewModel item)
        {
            var model = _mapper.Map<tbUsuarios>(item);
            item.Usua_Usua_Creacion = 1;
            var modelo = new tbUsuarios()
            {
                Usua_Usuario = item.Usua_Usuario,
                Usua_Contra = item.Usua_Contra,
                Usua_Admin = item.Usua_Admin,
                Empl_Id = item.Empl_Id,
               
                Rol_Id = item.Rol_Id,
                Usua_Usua_Creacion = item.Usua_Usua_Creacion,
              


            };
            var listado = _accesoServicio.Insertarusua(modelo);
            return Ok(listado);
        }
        [HttpPut("Edit/{id}")]
        public IActionResult Edit(int id, UsuarioViewModel item)
        {
            
                var model = _mapper.Map<tbUsuarios>(item);
                var modelo = new tbUsuarios()
                {
                    Usua_Id = id,
                    Usua_Usuario = item.Usua_Usuario,
                    Usua_Admin = item.Usua_Admin,
                    Empl_Id = item.Empl_Id,
                    Rol_Id = item.Rol_Id,
                    Usua_Usua_Modifica = item.Usua_Usua_Modifica

                };
                var listado = _accesoServicio.ActualizarUsua(modelo);
                return Ok(listado);
          
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado = _accesoServicio.Eliminarusua(id);
                return Ok(listado);
           
        }

        [HttpPut("restablecer/{id}")]
        public IActionResult restablecer(int id, UsuarioViewModel item)
        {
           
                var model = _mapper.Map<tbUsuarios>(item);
                var modelo = new tbUsuarios()
                {
                    Usua_Id = id,
                    Usua_Contra = item.Usua_Contra,


                };
                var listado = _accesoServicio.restablecer(modelo);
                return Ok(listado);
           
        }


    }
}
