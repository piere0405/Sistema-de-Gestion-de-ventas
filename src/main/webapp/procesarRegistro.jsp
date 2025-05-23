<%-- 
    Document   : procesarRegistro
    Created on : 20 may. 2025, 18:37:58
    Author     : usuario
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.mycompany.proyecto1.ConexionBD" %>  <%-- Cambia "tu.paquete" si usas uno --%>
<%
    
    String nombre = request.getParameter("nombre");
    String dni = request.getParameter("dni2");
    String correo = request.getParameter("correo");
    String direccion = request.getParameter("direccion");
    String referencia = request.getParameter("referencia");
    String distrito = request.getParameter("distrito");
    String departamento = request.getParameter("departamento");
    String fecha = request.getParameter("fecha");
    String hora = request.getParameter("hora");
    String cantidad = request.getParameter("cantidad");
    String tipo = request.getParameter("tipo");
    String precio = request.getParameter("precio");
    String dni_usuario = (String) session.getAttribute("dni");
    
    ConexionBD cnn = new ConexionBD();
    Connection con = cnn.Conectar();
    PreparedStatement ps = null;

    try {
        if (con == null) {
            out.println("Error: no se pudo conectar a la base de datos.");
        } else {
            String SQL_INSERT = "INSERT INTO ventas (nombre, dni, correo, direccion, referencia, distrito, departamento, fecha, hora, cantidad, tipo, precio, dni_usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
ps = con.prepareStatement(SQL_INSERT);
ps.setString(1, nombre);
ps.setString(2, dni);
ps.setString(3, correo);
ps.setString(4, direccion);
ps.setString(5, referencia);
ps.setString(6, distrito);
ps.setString(7, departamento);
ps.setString(8, fecha);
ps.setString(9, hora);
ps.setInt(10, Integer.parseInt(cantidad));
ps.setString(11, tipo);
ps.setDouble(12, Double.parseDouble(precio));
ps.setString(13, dni_usuario);
             
            int filas = ps.executeUpdate();
            if (filas > 0) {
                response.sendRedirect("registroVenta.jsp");
                return;
            } else {
                out.println("❌ No se pudo guardar el registro.");
            }
        }
    } catch (Exception e) {
        out.println("⚠️ Error: " + e.getMessage());
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { cnn.Desconectar(); } catch (Exception e) {}
    }
%>
