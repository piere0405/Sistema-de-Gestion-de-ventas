<%-- 
    Document   : procesoUsuario
    Created on : 21 may. 2025, 14:36:55
    Author     : usuario
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.mycompany.proyecto1.ConexionUsuario" %> 
<%
   
   String dni = request.getParameter("dni");
   String password = request.getParameter("password");
   String rol = request.getParameter("rol");
   String nombre = request.getParameter("nombre").toUpperCase(); 
   
    ConexionUsuario cnn = new ConexionUsuario();
    Connection con = cnn.Conectar();
    PreparedStatement ps = null;

    try {
        if (con == null) {
            out.println("Error: no se pudo conectar a la base de datos.");
        } else {
            String SQL_INSERT = "INSERT INTO usuarios (dni, password, rol , nombre) VALUES (?, ?, ?, ?) ";
            ps = con.prepareStatement(SQL_INSERT);
            ps.setString(1, dni);
            ps.setString(2, password);
            ps.setString(3, rol);
            ps.setString(4, nombre);
            int filas = ps.executeUpdate();
            if (filas > 0) {
             response.sendRedirect("listarUsuario.jsp");
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