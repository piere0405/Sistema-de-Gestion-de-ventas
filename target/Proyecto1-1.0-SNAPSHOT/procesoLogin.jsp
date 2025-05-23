<%-- 
    Document   : procesoLogin
    Created on : 21 may. 2025, 14:47:48
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

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    ConexionUsuario conexion = new ConexionUsuario(); // instancia
    conn = conexion.Conectar(); // obtiene la conexión

    String query = "SELECT rol FROM usuarios WHERE dni = ? AND password = ?";
    ps = conn.prepareStatement(query);
    ps.setString(1, dni);
    ps.setString(2, password);
    rs = ps.executeQuery();

    if (rs.next()) {
        String rol = rs.getString("rol");
        session.setAttribute("dni", dni);
        if ("trabajador".equals(rol)) {
            response.sendRedirect("registroVenta.jsp");
        } else if ("supervisor".equals(rol)) {
            response.sendRedirect("listarUsuario.jsp");
        }
    } else {
        response.sendRedirect("index.jsp?error=1");
    }
} catch (Exception e) {
    out.println("Error al iniciar sesión: " + e.getMessage());
} finally {
    try { if (rs != null) rs.close(); } catch (SQLException e) {}
    try { if (ps != null) ps.close(); } catch (SQLException e) {}
    if (conn != null) {
        ConexionUsuario c = new ConexionUsuario();
        c.Desconectar();
    }
}
%>
