using AutoMapper;
using Practica.Common.Models;
using Practica.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Practica.API.Extensiones
{
    public class MappingProfileExtensions: Profile
    {
        public MappingProfileExtensions()
        {
            CreateMap<DepartamentoViewModel, tbDepartamentos>().ReverseMap();
            CreateMap<CargoViewModel, tbCargos>().ReverseMap();
            CreateMap<ClienteViewModel, tbClientes>().ReverseMap();
            CreateMap<EmpleadoViewModel, tbEmpleados>().ReverseMap();
            CreateMap<UsuarioViewModel, tbUsuarios>().ReverseMap();
            CreateMap<RolViewModel, tbRoles>().ReverseMap();
            CreateMap<MunicipioViewModel, tbMunicipios>().ReverseMap();
            CreateMap<EstadoCivilViewModel, tbEstadosCiviles>().ReverseMap();
            CreateMap<MarcaViewModel, tbMarcas>().ReverseMap();
            CreateMap<ModeloViewModel, tbModelos>().ReverseMap();
            CreateMap<VehiculoViewModel, tbVehiculos>().ReverseMap();
            CreateMap<SucursalViewModel, tbSucursales>().ReverseMap();
            CreateMap<PlanesPagosViewModel, tbPlanesPagos>().ReverseMap();
            CreateMap<PlanesPagosClientesViewModel, tbPlanesPagosClientes>().ReverseMap();
            CreateMap<TipoCuotaViewModel, tbTipoCuotas>().ReverseMap();
            CreateMap<ImagenesClientesViewModel, tbImagenesPorClientes>().ReverseMap();

        }
    }
}



