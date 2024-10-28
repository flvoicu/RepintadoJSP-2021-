package repintado.controlador;

import java.io.IOException;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Repintar")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String repintado = "/formulario.html";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(repintado);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, String[]> listadoParametros = request.getParameterMap();
		
		int contadorParametros = 0;
	
		Map<String, String> listaErrores = new HashMap<String, String>();
		
		String tipo = request.getParameter("tipo");
		
		if (tipo == null) {
			tipo="JSP";
		}
		
		String nombre = request.getParameter("nombre");
		
		if (nombre == null || nombre == "") {
			listaErrores.put("nombre", "El campo nombre no puede estar vacio o ser nulo");
		} else {
			contadorParametros++;
		}
		
		String oculto = request.getParameter("oculto");
		
		String clave = request.getParameter("clave");
		
		if (clave == null || clave == "") {
			listaErrores.put("clave", "El campo clave no puede estar vacio o ser nulo");
		}else {
			contadorParametros++;
		}
		
		String edad = request.getParameter("edad");
		
		int edadInt = 0;
		
		if (edad == null || edad == "") {
			listaErrores.put("edad", "El campo edad no puede estar vacio o ser nulo");
		} else {
			contadorParametros++;
			if (edad.matches("[0-9]+")) {
				edadInt = Integer.parseInt(edad);
			} else {
				listaErrores.put("edadNoInt", "El campo edad no puede contener letras");
			}
		}
		
		String fechNac = request.getParameter("fechNac");
		DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate fecha = null;
			
		try {
			fecha = LocalDate.parse(fechNac, format);
		}catch(Exception e){
			listaErrores.put("fechMal", "Fecha no válida");
		}
			
		try {
			if(fecha.isAfter(LocalDate.now())) {
				listaErrores.put("fechDesp", "La fecha de nacimiento no puede ser posterior a la actual");
			}
		} catch (Exception e) {	
			if(fechNac == null || fechNac.equals("") || fecha == null) {
				listaErrores.put("fecha", "El campo fecha de nacimiento no puede estar vacio o ser nulo");
				}
			}
			String sexo = request.getParameter("sexo");
			if (sexo == null || sexo.equals("")) {
				listaErrores.put("sexo", "El campo génerono no puede estar vacio o ser nulo");
			} else {
				contadorParametros++;
			}
			
			LocalDate fechaActual = LocalDate.now();
			int edadReal = 0;
			try {
				if(fechNac !=null && fechaActual !=null) {
					edadReal = Period.between(fecha, fechaActual).getYears();
				} else {
					edadReal = 0;
				}
			}catch (Exception e) {
			}
				
			String siglasPais = request.getParameter("pais");
			if (siglasPais == null|| siglasPais.equals("")) {
				listaErrores.put("pais", "El campo país no puede estar vacio o ser nulo");
			} else {
				contadorParametros++;
			}
							
			String[] aficionesSeleccionadas = request.getParameterValues("aficiones");
			if (aficionesSeleccionadas == null) {
				listaErrores.put("aficiones", "El campo aficiones no puede estar vacio o ser nulo");
			} else {
				contadorParametros++;
			}

			String[] musicasSeleccionadas = request.getParameterValues("musicas");
			if (musicasSeleccionadas == null) {
				listaErrores.put("canciones", "El campo música favorita no puede estar vacio o ser nulo");
			} else {
				contadorParametros++;
			}

			String comentario = request.getParameter("comentario");
			if (comentario != null) {
				contadorParametros++;
			}

			SortedMap<String, String> tipoRepintado = new TreeMap<>();
			tipoRepintado.put("JSP", "JSP");
			tipoRepintado.put("JSTL", "JSTL");
			
			SortedMap<String, String> listaGenerosOrdenados = new TreeMap<>();
			listaGenerosOrdenados.put("h", "Hombre");
			listaGenerosOrdenados.put("m", "Mujer");
			listaGenerosOrdenados.put("o", "Otro");

			SortedMap<String, String> listaPaisesOrdenada = new TreeMap<>();
			listaPaisesOrdenada.put("AN", "Andorra");
			listaPaisesOrdenada.put("ES", "España");
			listaPaisesOrdenada.put("PT", "Portugal");

			SortedMap<String, String> listaAficiones = new TreeMap<>();
			listaAficiones.put("C", "Cine");
			listaAficiones.put("D", "Deporte");
			listaAficiones.put("L", "Lectura");
			listaAficiones.put("M", "Música");

			SortedMap<String, String> listaMusicas = new TreeMap<>();
			listaMusicas.put("E", "Electrónica");
			listaMusicas.put("F", "Funk");
			listaMusicas.put("N", "New age");
			listaMusicas.put("P", "Pop");
			listaMusicas.put("R", "Rock");

			request.setAttribute("tipo",tipo);
			request.setAttribute("tipoRepintado", tipoRepintado);
			request.setAttribute("nombre", nombre);
			request.setAttribute("oculto", oculto);
			request.setAttribute("clave", clave);
			request.setAttribute("edad", edad);
			request.setAttribute("edadInt", edadInt);
			request.setAttribute("fecha", fecha);
			request.setAttribute("fechNac", fechNac);
			request.setAttribute("edadReal", edadReal);
			request.setAttribute("sexo", sexo);
			request.setAttribute("listaGenerosOrdenados", listaGenerosOrdenados);
			request.setAttribute("siglasPais", siglasPais);
			request.setAttribute("listaPaisesOrdenada", listaPaisesOrdenada);
			request.setAttribute("aficionesSeleccionadas", aficionesSeleccionadas);
			request.setAttribute("listaAficiones", listaAficiones);
			request.setAttribute("listaMusicas", listaMusicas);
			request.setAttribute("musicasSeleccionadas", musicasSeleccionadas);
			request.setAttribute("comentario", comentario);
			request.setAttribute("contadorParametros", contadorParametros);
			request.setAttribute("listaErrores", listaErrores);
			String repintado = null;
				
			if (tipo.equals("JSP")) {
				repintado = "/repintar.jsp";
			}else {
				repintado = "/repintarJSTL.jsp";
			}
				
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(repintado);
			dispatcher.forward((ServletRequest) request, (ServletResponse) response);
		}

}
	

