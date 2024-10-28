<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.Map, java.util.HashMap, java.util.SortedMap, java.util.TreeMap, java.util.Arrays, java.text.SimpleDateFormat, 
	java.time.LocalDate"%>
<%
String tipo = (String) request.getAttribute("tipo");
SortedMap<String, String> tipoRepintado = (TreeMap<String, String>) request.getAttribute("tipoRepintado");
String nombre = (String) request.getAttribute("nombre");
String oculto = (String) request.getAttribute("oculto");
String clave = (String) request.getAttribute("clave");
String edad = (String) request.getAttribute("edad");
int edadInt = (int) request.getAttribute("edadInt");
String fechNac = (String) request.getAttribute("fechNac");
LocalDate fecha = (LocalDate) request.getAttribute("fecha");
int edadReal = (int) request.getAttribute("edadReal");
String sexo = (String) request.getAttribute("sexo");
SortedMap<String, String> listaGenerosOrdenados = (TreeMap<String, String>) request.getAttribute("listaGenerosOrdenados");
String siglasPais = (String) request.getAttribute("siglasPais");
SortedMap<String, String> listaPaisesOrdenada = (TreeMap<String, String>) request.getAttribute("listaPaisesOrdenada");
String[] aficionesSeleccionadas = (String[]) request.getAttribute("aficionesSeleccionadas");
SortedMap<String, String> listaAficiones = (TreeMap<String, String>) request.getAttribute("listaAficiones");
SortedMap<String, String> listaMusicas = (TreeMap<String, String>) request.getAttribute("listaMusicas");
String[] musicasSeleccionadas = (String[]) request.getAttribute("musicasSeleccionadas");
String comentario = (String) request.getAttribute("comentario");
int contadorParametros = (int) request.getAttribute("contadorParametros");
Map<String, String> listaErrores = (HashMap<String, String>) request.getAttribute("listaErrores");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript" src="js/funciones.js"></script>
<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	
	<h1>Formulario JSP</h1>

	<form action="Repintar" method="post">
	<span class= "rojo">*</span><span class="negrita">Tipo de Repintado</span>
	
 		<%
		for (Map.Entry<String, String> t : tipoRepintado.entrySet()) {
			if (tipo != null && t.getKey().equals(tipo)) {
				%>
				<input type="radio" name="tipo" id ="rep" value="<%=t.getKey()%>"
					checked="checked" /><%=t.getValue()%>
				<%
			} else {
				%>
				<input type="radio" id = "rep" value="<%=t.getKey()%>" /><%=t.getValue()%>
				<%
			}
		}
		%>
		<br>
		
		<span class= "rojo">*</span><span class="negrita">Nombre</span> 
		<input type="text" name="nombre" value="<%=nombre%>" /> 
		<br>
		<%
		if (listaErrores.get("nombre") != null) {
		%>	
			<span class= "rojo"><%=listaErrores.get("nombre")%></span>
			<br>
		<%
		}
		%>

		<input type="hidden" value="<%=oculto%>" /> 
		
		<span class= "rojo">*</span><span class="negrita">Clave</span>
		<input type="password" name="clave" value="<%=clave%>" /> 
		<br>
		<%
		if (listaErrores.get("clave") != null) {
		%>
		<span class= "rojo"><%=listaErrores.get("clave")%></span><br>
		<%
		}
		%>
		
		<span class= "rojo">*</span><span class="negrita">Fecha de Nacimiento</span>
		<input type="text" name="fechNac" value="<%=fechNac%>" /> <br>
		<%
		if (listaErrores.get("fechMal") != null) {
		%>
		<span class= "rojo"><%=listaErrores.get("fechMal")%></span>
		<br>
		<%
		}
		%>
		
		<%
		if (listaErrores.get("fechDesp") != null) {
		%>
		<span class= "rojo"><%=listaErrores.get("fecha")%></span>
		<br>
		<%
		}
		%>

        <%
		if (listaErrores.get("fecha") != null) {
		%>
		<span class= "rojo"><%=listaErrores.get("fecha")%></span>
		<br>
		<%
		}
		%>

		<%
		if (edadInt == 0 && edad.equals("")) {
			%>
			<span class= "rojo">*</span><span class="negrita">Edad</span> 
			<input type="text" name="edad" value=""/>
			 <br>
			<%
		} else if (edad.matches("[a-zA-Z]+")) {
			%>
			<span class= "rojo">*</span><span class="negrita">Edad</span> 
			<input type="text" name="edad" value="<%=edad%>"/> 
			<br>
			<%
		} else {
			%>
			<span class= "rojo">*</span><span class="negrita">Edad</span> 
			<input type="text" name="edad" value="<%=edadInt%>"/>
			<br>
			<%
				}
			%>	
	
		<%
		if (listaErrores.get("edad") != null) {
			%>
			<span class= "rojo"><%=listaErrores.get("edad")%></span>
			<br>
			<%
		}
		%>
		
		<%
		if (listaErrores.get("edadNoInt") != null) {
			%>
			<span class= "rojo"><%=listaErrores.get("edadNoInt")%></span>
			<br>
			<%
		}
		%>
		
		<span class="negrita">La edad calculada es: </span><%=edadReal%>
		<br>

		<span class= "rojo">*</span><span class="negrita">Género</span>
		<%
		for (Map.Entry<String, String> genero : listaGenerosOrdenados.entrySet()) {
			if (sexo != null && genero.getKey().equals(sexo)) {
				%>
				<input type="radio" id="sexo" name="sexo" value="<%=genero.getKey()%>" checked="checked"/><%=genero.getValue()%>
				<%
			} else {
				%>
				<input type="radio" id="sexo" value="<%=genero.getKey()%>"/><%=genero.getValue()%>
				<%
			}
		}
		%>
		<%
		if (listaErrores.get("sexo") != null) {
			%>
			<span class= "rojo"><%=listaErrores.get("sexo")%></span>
			<%
		}
		%>
		<br>
	 	 <input type="button" name="deseleccionaRadio"	onclick="deSelectSexo();" value="Deseleccionar género" />
		<br>

		<span class= "rojo">*</span><span class="negrita">País</span><select name="pais">
		<%
		for (Map.Entry<String, String> pais : listaPaisesOrdenada.entrySet()) {
			if (pais.getKey().equals(siglasPais)) {
				%>
				<option value="<%=pais.getKey()%>" selected="selected"><%=pais.getValue()%></option>
				<%
			} else {
				%>
				<option value="<%=pais.getKey()%>"><%=pais.getValue()%></option>
				<%
			}
		}
		%>
		</select> 
		<%
		if (listaErrores.get("pais") != null) {
			%>
			<span class= "rojo"><%=listaErrores.get("pais")%></span>
			<%
		}
		%>
		<br> 
		
		<span class= "rojo">*</span><span class="negrita">Aficiones</span>
		<%
		for (Map.Entry<String, String> aficion : listaAficiones.entrySet()) {
			boolean presente = false;
			for(String a : aficionesSeleccionadas){
				if(aficion.getKey().equals(a)){
					presente = true;
				}
			}
			if (presente) {
				%>
				<input type="checkbox" value="<%=aficion.getKey()%>" checked="checked"/><%=aficion.getValue()%>
				<%
			} else {
				%>
				<input type="checkbox" value="<%=aficion.getKey()%>"/><%=aficion.getValue()%>
				<%
			}
		}
		%>
		<%
		if (listaErrores.get("aficiones") != null) {
		%>
		<span class= "rojo"><%=listaErrores.get("aficiones")%></span>
		<%
		}
		%>
		<br>
	    <input type="button" onclick="selectAficiones();" value="Seleccionar todas las aficiones" />
	    <input type="button" onclick="deSelectAficiones();" value="Deseleccionar las aficiones" />
		<br>

		<span class= "rojo">*</span><span class="negrita">Música favorita</span>
		<br>
		<select	name="musicas" id="musicas" size="5" multiple="multiple">
			<%
			for (Map.Entry<String, String> musica : listaMusicas.entrySet()) {
				boolean presente = false;
				for(String a : musicasSeleccionadas){
					if(musica.getKey().equals(a)){
						presente = true;
					}
				}
				if (presente) {
					%>
					<option name="musica" value="<%=musica.getKey()%>"  selected="selected"><%=musica.getValue()%></option>
					<%
				} else {
					%>
					<option name="musica" value="<%=musica.getKey()%>"><%=musica.getValue()%></option>
					<%
				}
			}
			%>
		</select>
		<%
		if (listaErrores.get("canciones") != null) {
		%>
		<span style="color: red;"><%=listaErrores.get("canciones")%></span>
		<%
		}
		%>
		<br>
	    <input type="button" onclick="selectMusica();" value="Seleccionar todas las músicas" />
	    <input type="button" onclick="deSelectMusica();" value="Deseleccionar las músicas" />
		<br>
		
		<span class="negrita">Comentarios</span>
		<br>
		<textarea name="comentario" rows="5" cols="50" value=""><%=comentario%></textarea>
		<br>

		<span class="negrita">Contador de parámetros recibidos:</span><%=contadorParametros%>
		<br>

		<input type="reset" value="Resetear formulario" /> 
		<input type="button" onclick="limpiar()" value="Limpiar todos los campos"/>
		<input type="submit" value="Enviar formulario" /> 
		<br>
		<input type="image" src="img/enviar.jpg" alt="Enviar formulario" width="100" height="100" />
		
	</form>
</body>
</html>