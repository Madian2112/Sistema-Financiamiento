using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Practica.BussinesLogic.Servicios;
using Practica.Common.Models;
using Practica.Entities.Entities;
using System;
using Practica.API.Servicios;
using System.Collections.Generic;
using System.Linq;


namespace Practica.API.Controllers
{
    [ApiController]
    [Route("API/[Controller]")]
    public class UsuarioController : Controller
    {
        private readonly AccesoServicio _accesoServicio;
        private readonly IMapper _mapper;
        private readonly IMailService _mailService;


        public UsuarioController(AccesoServicio accesoServicio, IMapper mapper, IMailService mailService)
        {

            _mapper = mapper;
            _accesoServicio = accesoServicio;
            _mailService = mailService;


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

        [HttpGet("PerfilDetails/{usuario}")]
        public IActionResult PerfilDetails(string usuario)
        {
            var modelo = _accesoServicio.DetallePerfil(usuario);
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
                return Ok(list.Data);
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

        [HttpPut("EditPerfil/{Usuario}")]
        public IActionResult EditPerfil(string Usuario, [FromBody] UsuarioViewModel item)
        {
            var modelo = new tbUsuarios()
            {
                Usuario = Usuario,
                Usua_Usuario = item.Usua_Usuario,
                Usua_Color = item.Usua_Color
            };
            var result = _accesoServicio.ActualizarUsuaPerfil(modelo);

            if (result.Success)
            {
                return Ok(new { success = true, message = "Perfil actualizado correctamente" });
            }
            else
            {
                return StatusCode(500, new { success = false, message = result.Message, data = result.Data });
            }
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


        [HttpGet("EnviarCorreo/{correo_usuario}")]
        public IActionResult EnviarCorreo(string correo_usuario)
        {
            Random random = new Random();
            int randomNumber = random.Next(100000, 1000000);
            var estado = _accesoServicio.EnviarCodigo(correo_usuario);
            var lista = estado.Data;
            if (lista.Count > 0)
            {
                var datos = estado.Data as List<tbUsuarios>;
                var first = datos.FirstOrDefault();
                _accesoServicio.Implementarcodigo(randomNumber.ToString(), first.Usua_Id);
                MailData mailData = new MailData();
                mailData.EmailToId = first.correo;
                mailData.EmailToName = "Usuario";
                mailData.EmailSubject = "Codigo de Verificacion";
                mailData.EmailBody = "" + randomNumber.ToString();
                _mailService.SendMail(mailData);
                return Ok(estado);
            }
            else
            {
                return Problem();
            }
        }

        [HttpGet("ValidarCodigo/{usua_verificarCorreo}")]
        public IActionResult restablecer(string usua_verificarCorreo)
        {

            var lista = _accesoServicio.ValidarCodigo(usua_verificarCorreo);

            if (lista.Success == true)
            {
                return Ok(lista);
            }
            else
            {
                return Problem();
            }
        }

        [HttpPut("RestablecerContra2")]
        public IActionResult restablecer(UsuarioViewModel item)
        {

            var modelo = new tbUsuarios()
            {
                Usua_VerificarCorreo = item.Usua_VerificarCorreo,
                Usua_Contra = item.Usua_Contra,
                Usua_Usua_Modifica = 1,
                Usua_Fecha_Modifica = DateTime.Now,
            };
            var list = _accesoServicio.RestablecerContrasenia(modelo);
            if (list.Success == true)
            {
                return Ok(list);
            }
            else
            {
                return Problem();
            }

        }


    }
}
