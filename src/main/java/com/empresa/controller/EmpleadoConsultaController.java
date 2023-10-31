package com.empresa.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Empleado;
import com.empresa.service.EmpleadoService;

@Controller
public class EmpleadoConsultaController {

	@Autowired
	private EmpleadoService empleadoService;

	@GetMapping("/verConsultaEmpleado")
	public String verInicio() {
		return "consultaEmpleado";
	}
	
	@GetMapping("/consultaEmpleado")
	@ResponseBody
	public List<Empleado> listaEmpleado(int estado, int idPais, String nomApe, String fecDesde, String fecHasta){
		List<Empleado> lstSalida = empleadoService.listaConsultaEmpleado(
									estado, 
									idPais, 
									"%"+nomApe+"%", 
									Date.valueOf(fecDesde),
									Date.valueOf(fecHasta));
		return lstSalida;
	}
	
	
}
