<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>
<div class="container">
	<h3>Consulta de Empleado</h3>
	<div class="row" style="margin-top: 4%">  
		<div class="col-md-6" >
			<label class="control-label" for="id_nombres">Nombres y Apellidos</label>
			<input class="form-control" id="id_nombres" name="nombres" type="text" maxlength="20"/>
		</div>	
		<div class="col-md-6" >
			<label class="control-label" for="id_estado">Estado</label>
			<input class="form-control" id="id_estado" name="estado" type="checkbox" checked="checked" />
		</div>	  
	</div>
	<div class="row" style="margin-top: 1%">
		<div class="col-md-6" >
			<label class="control-label" for="id_fecha_desde">Fecha Nacimiento:  Desde</label>
			<input class="form-control" id="id_fecha_desde" name="fechaNacimientoDesde" type="date"/>
		</div>
		<div class="col-md-6" >
			<label class="control-label" for="id_fecha_hasta"> Hasta </label>
			<input class="form-control" id="id_fecha_hasta" name="fechaNacimientoHasta" type="date"/>
		</div>
	</div>	
	<div class="row" style="margin-top: 1%">		
		<div class="col-md-6" >
			<label class="control-label" for="id_pais">País</label>
			<select id="id_pais" name="pais" class='form-control'>
		           <option value=" ">[Seleccione]</option>    
			</select>
		</div>
	</div>
	<div class="row" style="margin-top: 4%">  
		<div class="col-md-12" align="center">
			<button type="button" class="btn btn-primary" id="id_btn_filtra">FILTRA</button>
		</div>	
	</div>
	<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-striped table-bordered" >
				<thead>
						<tr>
							<th style="width: 5%" >ID</th>
							<th style="width: 22%">Nombre</th>
							<th style="width: 23%">Apellidos</th>
							<th style="width: 15%">Fecha Nacimiento</th>
							<th style="width: 15%">País</th>
							<th style="width: 10%">Estado</th>
						</tr>
				</thead>
				<tbody></tbody>
			</table>
	</div>
	
</div>
<script type="text/javascript">
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

$("#id_btn_filtra").click(function(){
	var valEsActivo = $("#id_estado").is(":checked");
	var valEstado = valEsActivo ? '1': '0';
	
	console.log(">>> valEstado >>> " + valEstado);
	
	$.getJSON("consultaEmpleado", {"valEstado":valEstado}, function(lista){
		agregarGrilla(lista);
	});
});

function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idEmpleado"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "fechaNacimiento"},
				{data: "pais.nombre"},
				{data: function(row, type, val, meta){
				    var salida = (row.estado == 1) ? 'Activo' : 'Inactvo' ;
					return salida;
				},className:'text-center'},	
			]                                     
	 });
}

</script>

</body>
</html>







