package com.empresa.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
	public List<Empleado> consulta (int estado, 
									int idPais, 
									String nomApe, 
									@DateTimeFormat(pattern = "yyyy-MM-dd") Date desde,
									@DateTimeFormat(pattern = "yyyy-MM-dd") Date hasta){
		
		List<Empleado> lstSalida = empleadoService.listaConsultaEmpleado(estado, idPais, "%"+nomApe+"%", desde, hasta);
		
		return lstSalida;
	}
	
	
}
