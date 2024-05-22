using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Practica.BussinesLogic.Servicios;
using Practica.Common.Models;
using Practica.Entities.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Practica.API.Controllers
{
    [ApiController]
    [Route("API/[Controller]")]
    public class ImagenClienteController : Controller
    {
        private readonly CrediRapidServicio _credirapidServicio;
        private readonly IMapper _mapper;


        public ImagenClienteController(CrediRapidServicio credirapidServicio, IMapper mapper)
        {
            _mapper = mapper;
            _credirapidServicio = credirapidServicio;
        }

        [HttpGet("List")]
        public IActionResult List()
        {
            var fecha = DateTime.Today.Date;
            var list = _credirapidServicio.ListVehiculoImagen();
            return Ok(list.Data);
        }

        [HttpGet("ListadoVehiculos")]
        public IActionResult ListadoVehiculos()
        {
            var fecha = DateTime.Today.Date;
            var list = _credirapidServicio.ListVehiculoImagen();
            return Ok(list.Data);
        }

        [HttpPost("Create")]
        public IActionResult Create(ImagenesClientesViewModel item)
        {
            var model = _mapper.Map<tbImagenesPorClientes>(item);
            var modelo = new tbImagenesPorClientes()
            {
                Imcl_Imagen =  item.Imcl_Imagen, 
                Vecl_Id = item.Vecl_Id,

            };
            var listado = _credirapidServicio.ListVehiculoImagen();

            var prueba = _credirapidServicio.InsertarVehiculoiImagen(modelo);
            if (prueba.Code == 200)
            {
                return Ok(prueba);
            }
            else
            {
                return BadRequest("Error");
            }
        }

        [HttpPut("Edit")]
        public IActionResult Edit(ImagenesClientesViewModel item)
        {

            var model = _mapper.Map<tbImagenesPorClientes>(item);
            var modelo = new tbImagenesPorClientes()
            {
                Imcl_Id = item.Imcl_Id,
                Imcl_Imagen = item.Imcl_Imagen,
                Vecl_Id = item.Vecl_Id,
                Imcl_Usua_Modifica = item.Imcl_Usua_Modifica,
            };
            var listado = _credirapidServicio.ActualizarImagenPorVehiculo(modelo);
            return Ok(listado);

        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var listado = _credirapidServicio.EliminarImagenPorCliente(id);
            return Ok(listado);
        }

        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _credirapidServicio.DetallesImagenesPorVehiculo(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpPost("Subir")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {

            var allowedExtensions = new HashSet<string> { ".png", ".jpeg", ".svg", ".jpg", ".gif" };
            var fileExtension = Path.GetExtension(file.FileName).ToLower();
            if (!allowedExtensions.Contains(fileExtension))
            {
                return Ok(new { message = "Error", detail = "Extensión de archivo no permitida." });
            }


            var uploadsFolderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");


            if (!Directory.Exists(uploadsFolderPath))
            {
                Directory.CreateDirectory(uploadsFolderPath);
            }
            var filePath = Path.Combine(uploadsFolderPath, file.FileName);

            try
            {

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                return Ok(new { message = "Exito" });
            }
            catch (Exception e)
            {

                return StatusCode(500, $"General error: {e.ToString()}");
            }

        }
    }
}
