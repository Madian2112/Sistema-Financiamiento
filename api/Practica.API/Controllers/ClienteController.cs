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
    public class ClienteController : Controller
    {
        private readonly GeneralServicio _generalServicio;
        private readonly CrediRapidServicio _credirapidServicio;

        private readonly IMapper _mapper;


        public ClienteController(GeneralServicio generalServicio, CrediRapidServicio credirapidServicio, IMapper mapper)
        {

            _mapper = mapper;
            _generalServicio = generalServicio;
            _credirapidServicio = credirapidServicio;

        }
        [HttpGet("List")]
        public IActionResult List()
        {
            var list = _generalServicio.ListClie();
            return Ok(list.Data);
        }
        [HttpGet("ClienteDNI/{Clie_DNI}")]
        public IActionResult CargarDniCliente(string Clie_DNI)
        {
            var modelo = _generalServicio.CargarDNI(Clie_DNI);

            return Json(modelo.Data);
        }
        [HttpGet("Details/{id}")]
        public IActionResult Details(int id)
        {
            var modelo = _generalServicio.DetallesClien(id);
            var detail = modelo.First();
            return Ok(detail);
        }

        [HttpGet("Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var modelo = _generalServicio.ObtenerClienID(id);
            return Json(modelo.Data);
        }

        [HttpGet("ListClientesPorVehiculos/{Clie_Id}")]
        public IActionResult ListCliePorVehi(int Clie_Id)
        {
            var list = _generalServicio.ObtenerVehiClientes(Clie_Id);
            return Ok(list);
        }

        [HttpPost("AgregarVehiculos/{Vehi_Id}/{Clie_Id}/{Usua}")]
        public IActionResult AgregarVehiculos (int Vehi_Id, int Clie_Id, int Usua)
        {
            var result = _credirapidServicio.InsertarVehiCliebte(Vehi_Id, Clie_Id, Usua);
            return Ok(result);

        }

        [HttpPost("Create")]
        public IActionResult Create(ClienteViewModel item)
        {
            var model = _mapper.Map<tbClientes>(item);
            var modelo = new tbClientes()
            {
                Clie_DNI = item.Clie_DNI,
                Clie_Nombre = item.Clie_Nombre,
                Clie_Apellido = item.Clie_Apellido,
                Clie_Sexo = item.Clie_Sexo,
                Clie_Telefono = item.Clie_Telefono,
                Clie_Usua_Creacion = item.Clie_Usua_Creacion,
                Esta_Id = item.Esta_Id,
                Muni_Id = item.Muni_Id,

            };

            int clieId;
            var listado = _generalServicio.InsertarClie(modelo, out clieId);
            listado.Message = clieId.ToString();
            return Ok(listado);
        }

        [HttpPut("Edit/{id}")]
        public IActionResult Edit(int id, ClienteViewModel item)
        {
            
                var model = _mapper.Map<tbClientes>(item);
                var modelo = new tbClientes()
                {
                    Clie_Id = item.Clie_Id,
                    Clie_DNI = item.Clie_DNI,
                    Clie_Nombre = item.Clie_Nombre,
                    Clie_Apellido = item.Clie_Apellido,
                    Clie_Sexo = item.Clie_Sexo,
                    Clie_Usua_Modifica = item.Clie_Usua_Modifica,
                    Clie_Telefono = item.Clie_Telefono,
                    Esta_Id = item.Esta_Id,
                    Muni_Id = item.Muni_Id

                };
                var listado =  _generalServicio.ActualizarClie(modelo);
                return Ok(listado);
           
        }

        [HttpDelete("Eliminar/{id}")]
        public IActionResult Delete(int id)
        {
            
                var listado = _generalServicio.EliminarClie(id);
                return Ok(listado);
            
        }


        [HttpDelete("EliminarVehiCliente/{id}")]
        public IActionResult DeleteVehiCliente(int id)
        {
            
                var listado = _credirapidServicio.EliminarVehiCliente(id);
                return Ok(listado);
         
        }
    }
}
