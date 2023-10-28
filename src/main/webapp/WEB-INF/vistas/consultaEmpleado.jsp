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
<h3>Consulta Empleado</h3>

	<div class="row" style="margin-top: 2%">
		<div class="col-sm-6">
			<label class="control-label" for="id_nombre">Nombre y Apellidos</label>
			<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
		</div>
		<div class="col-sm-6">
			<label class="control-label" for="id_estado">Estado</label>
			<input class="form-control" type="checkbox" id="id_estado" name="estado"  checked="checked">
		</div>
	</div>
	
	<div class="row" style="margin-top: 2%">
		<div class="col-sm-6">
			<label class="control-label" for="id_fecha_desde">Fecha Nacimiento (Desde)</label>
			<input class="form-control" type="date" id="id_fecha_desde" name="desde" >
		</div>
		<div class="col-sm-6">
			<label class="control-label" for="id_fecha_hasta">Fecha Nacimiento (Hasta)</label>
			<input class="form-control" type="date" id="id_fecha_hasta" name="hasta" >
		</div>
	</div>
	
	<div class="row" style="margin-top: 2%">
			<div class="col-sm-6">
				<label class="col-lg-3 control-label" for="id_pais">País</label>
		        <select id="id_pais" name="pais" class='form-control'>
				   	<option value=" ">[Seleccione]</option>    
				</select>
			</div>
	</div>
	
	<div class="row" style="margin-top: 2%" align="center">
		<button id="id_filtro" type="button" class="btn btn-primary" >Filtrar</button>
	</div>
	
	<div class="row" style="margin-top: 5%">
				<table id="id_table" class="table table-striped table-bordered" >
					<thead>
						<tr>
							<th style="width: 5%" >ID</th>
							<th style="width: 22%">Nombre</th>
							<th style="width: 23%">Apellidos</th>
							<th style="width: 15%">Fecha Nacimiento</th>
							<th style="width: 15%">País</th>
							<th style="width: 15%">Estado</th>
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

$("#id_filtro").click(function(){
	var var_estado = $('#id_estado').is(":checked") ? '1' : '0';
	
	$.getJSON("consultaEmpleado", {"estado":var_estado}, function(data){
		agregarGrilla(data);
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
					var salida= (row.estado == 1) ? "Activo" : "Inactivo";
					return salida;
				},className:'text-center'},
			]                                     
	    });
}

</script>

</body>
</html>










