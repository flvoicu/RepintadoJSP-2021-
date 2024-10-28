<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.Map, java.util.HashMap, java.util.SortedMap, java.util.TreeMap, java.util.Arrays, java.text.SimpleDateFormat, 
	java.time.LocalDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8"/>
<script type="text/javascript" src="js/funciones.js"></script>
<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	<h1>Formulario JSLT</h1>

	<form action="Repintar" method="post">
	
	<span class= "rojo">*</span><span class="negrita">Tipo de repintado</span>
    <c:forEach var="t" items="${tipoRepintado}">
	<input type="radio" id="rep" value="${t.key}" ${t.key == tipo ? 'checked="checked"' : ''}>${t.value}</input>
	</c:forEach>
  	<br>
  	
	<span class= "rojo">*</span><span class="negrita">Nombre</span> 
	<input type="text" name="nombre" value="${nombre}"/> 
 	<span class= "rojo"><c:out value="${listaErrores['nombre']}"></c:out></span>
	<br>
 
	<input type="hidden" value="${oculto}"/> 
	<span class= "rojo">*</span><span class="negrita">Clave</span><input type="password" name="clave" value="${clave}"/> 
	<span class= "rojo"><c:out value="${listaErrores['clave']}"></c:out></span>
	<br>
	
	<span class= "rojo">*</span><span class="negrita">Fecha de Nacimiento</span>
	<input type="text" name="fechanac" value="${fechanac}"/>
    <span class= "rojo"><c:out value="${listaErrores['fechMal']}"></c:out></span>
    <span class= "rojo"><c:out value="${listaErrores['fechDesp']}"></c:out></span>
	<span class= "rojo"><c:out value="${listaErrores['fecha']}"></c:out></span>
	<br>
		
	<span class= "rojo">*</span><span class="negrita">Edad</span> 
	<input type="text" name="edad" value="${edad}"/>
	<span class= "rojo"><c:out value="${listaErrores['edad']}"></c:out></span>
	<span class= "rojo"><c:out value="${listaErrores['edadNoInt']}"></c:out></span>
	<br>
	  
	<span class="negrita">Edad calculada :</span><span>${edadReal}</span>
	<br>
	
	<span class= "rojo">*</span><span class="negrita">Género</span>
	<c:forEach var="genero" items="${listaGenerosOrdenados}">
		<input type="radio" id="sexo" value="${genero.key}" ${genero.key == sexo ? 'checked="checked"' : ''}>${genero.value}</input>
	</c:forEach>
	<span class= "rojo"><c:out value="${listaErrores['sexo']}"></c:out></span>
	<br>
	<input type="button" name="deseleccionaRadio"	onclick="deSelectSexo();" value="Deseleccionar género" />
	<br>
	
	<span class= "rojo">*</span><span class="negrita">País</span>
	<select name="pais">
	<c:forEach var="pais" items="${listaPaisesOrdenada}">
	<option value="${pais.key}" ${pais.key == siglasPais ? 'selected="selected"' : ''}>${pais.value}</option>
	</c:forEach>
	</select>
	<span class= "rojo"><c:out value="${listaErrores['pais']}"></c:out></span>
	<br>
	
	<span class= "rojo">*</span><span class="negrita">Aficiones</span>
    <c:forEach var="aficion" items="${listaAficiones}" >
    	<c:set var="presente" value="false"/>
   		<c:forEach var="afi" items="${aficionesSeleccionadas}">
    		<c:if test="${aficion.key == afi}">
    			<c:set var="presente" value="true"/>
    		</c:if>
   		 </c:forEach>
		<input type="checkbox" name="aficiones" value="${aficion.key}" ${presente == true ? 'checked="checked"' : ''}>${aficion.value}</input>
	</c:forEach>
	<span class= "rojo"><c:out value="${listaErrores['aficiones']}"></c:out></span>
	<br>
	<input type="button" onclick="selectAficiones();" value="Seleccionar todas las aficiones" />
	<input type="button" onclick="deSelectAficiones();" value="Deseleccionar las aficiones" />
	<br>
	
	<span class= "rojo">*</span><span class="negrita">Música favorita</span>
	<br> 
	<select name="musicas" id="musicas" size="5" multiple="multiple">
	<c:forEach var="musica" items="${listaMusicas}">
		<c:set var="presente" value="false"/>
		<c:forEach var="mus" items="${musicasSeleccionadas}">
    		<c:if test="${musica.key == mus}">
    			<c:set var="presente" value="true"/>
   			</c:if>
   		</c:forEach>
		<option name="musica" value="${musica.key}" ${presente == true ? 'selected="selected"' : ''}>${musica.value}</option>
		<c:out value="${musica}"></c:out>
	</c:forEach>
	</select>
	<span class= "rojo"><c:out value="${listaErrores['musicaes']}"></c:out></span><br>
	<input type="button" onclick="selectMusica();" value="Seleccionar todas las músicas" />
	<input type="button" onclick="deSelectMusica();" value="Deseleccionar las músicas" />
	<br>

	<span class="negrita">Comentarios</span>
	<br>
	<textarea name="comentario" rows="5" cols="50" value="">${comentario}</textarea>
	<br>
		
	<span class="negrita">Contador de parámetros recibidos:</span><span>${contadorParametros}</span>
	<br>
	
	<br>
	<input type="reset" value="Resetear formulario"/> 
	<input type="submit" value="Enviar formulario"/> 
	<input type="button" onclick="limpiar()" value="Limpiar todos los campos"/>
	<br>
	<input type="image" src="img/enviar.jpg" alt="Enviar formulario" width="100" height="100" />
	
	</form>
</body>
</html>