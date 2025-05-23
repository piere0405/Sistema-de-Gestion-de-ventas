<%-- 
    Document   : tablaComisiones
    Created on : 21 may. 2025, 18:55:03
    Author     : usuario
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.proyecto1.ConexionBD" %>
<%@ page import="com.mycompany.proyecto1.ConexionUsuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%
    String dni_usuario = (String) session.getAttribute("dni");
    if (dni_usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String nombre_usuario = "";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        ConexionUsuario cnnn = new ConexionUsuario();
        con = cnnn.Conectar();
        String SQL_SELECT = "SELECT nombre FROM usuarios WHERE dni = ?";
        ps = con.prepareStatement(SQL_SELECT);
        ps.setString(1, dni_usuario);
        rs = ps.executeQuery();

        if (rs.next()) {
            nombre_usuario = rs.getString("nombre");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("❌ Error al obtener el nombre: " + e.getMessage());
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container-fluid">
        <span class="navbar-brand"><i class="fas fa-user-circle"></i> Bienvenido, <strong><%= nombre_usuario %></strong></span>
        <div class="d-flex">
            <a class="btn btn-outline-light" href="#" onclick="history.back(); return false;"><i class="fas fa-sign-out-alt"></i> Salir</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="card shadow-sm">
        <div class="card-header bg-success text-white">
            <h5 class="mb-0"><i class="fas fa-chart-line"></i> Reporte de Ventas por Trabajador</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Nombre del Trabajador</th>
                            <th>DNI</th>
                            <th>Cantidad de Ventas</th>
                            <th>Dinero Generado (S/)</th>
                            <th>Comisión (S/)</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            ConexionBD cnn = new ConexionBD();
                            con = cnn.Conectar();

                            String sql = "SELECT u.nombre, v.dni_usuario, COUNT(*) AS cantidad_ventas, " +
                                         "SUM(v.precio) AS dinero_generado, " +
                                         "(COUNT(*)*15) AS comision " +
                                         "FROM ventasdb.ventas v " +
                                         "JOIN ventasdb.usuarios u ON v.dni_usuario = u.dni " +
                                         "GROUP BY v.dni_usuario, u.nombre";

                            ps = con.prepareStatement(sql);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getString("nombre") %></td>
                            <td><%= rs.getString("dni_usuario") %></td>
                            <td><%= rs.getInt("cantidad_ventas") %></td>
                            <td><%= String.format("%.2f", rs.getDouble("dinero_generado")) %></td>
                            <td><%= String.format("%.2f", rs.getDouble("comision")) %></td>
                        </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='5' class='text-danger'>❌ Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (con != null) con.close();
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS y FontAwesome -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>