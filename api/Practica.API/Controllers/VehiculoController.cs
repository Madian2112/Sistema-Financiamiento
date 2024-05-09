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
    public class VehiculoController : Controller
    {
        private readonly CrediRapidServicio _credirapidServicio;
        private readonly IMapper _mapper;


        public VehiculoController(CrediRapidServicio credirapidServicio, IMapper mapper)
        {

            _mapper = mapper;
            _credirapidServicio = credirapidServicio;


        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _credirapidServicio.ListVehi();
            return Ok(list.Data);
        }

        [HttpGet("ListVC")]
        public IActionResult ListVehiculoC()
        {
            var list = _credirapidServicio.ListVehiVC();
            return Ok(list.Data);
        }

        [HttpGet("VehiculoPlaca/{Vehi_Placa}")]
        public IActionResult CargarDniCliente(string Vehi_Placa)
        {
            var modelo = _credirapidServicio.CargarVehiculo(Vehi_Placa);

            return Json(modelo.Data);
        }


        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _credirapidServicio.DetallesVehi(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _credirapidServicio.ObtenerVehiID(id);
            return Json(modelo.Data);
        }
        [HttpPost("Create")]
        public IActionResult Create(VehiculoViewModel item)
        {
            //var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbVehiculos()
            {
                Vehi_Placa = item.Vehi_Placa,
                Vehi_Descripcion = item.Vehi_Descripcion,
                Vehi_Color = item.Vehi_Color,
                Vehi_Anio = item.Vehi_Anio,
                Mode_Id = item.Mode_Id,
                Vehi_Usua_Creacion = item.Vehi_Usua_Creacion,

            };
            var listado = _credirapidServicio.ListVehi();

            var prueba = _credirapidServicio.InsertarVehi(modelo);
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
        public IActionResult Edit(int id, VehiculoViewModel item)
        {
                var model = _mapper.Map<tbVehiculos>(item);
                var modelo = new tbVehiculos()
                {
                    Vehi_Id = item.Vehi_Id,
                    Vehi_Placa = item.Vehi_Placa,
                    Vehi_Descripcion = item.Vehi_Descripcion,
                    Vehi_Color = item.Vehi_Color,
                    Vehi_Anio = item.Vehi_Anio,
                    Mode_Id = item.Mode_Id,
                    Vehi_Usua_Modifica = item.Vehi_Usua_Modifica,
                };
                var listado =  _credirapidServicio.ActualizarVehi(modelo);
                return Ok(listado);
           
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado = _credirapidServicio.EliminarVehi(id);
                return Ok(listado);
          
        }
    }
}
