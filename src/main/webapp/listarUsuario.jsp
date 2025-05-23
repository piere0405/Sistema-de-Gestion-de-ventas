<%-- 
    Document   : listarUsuario
    Created on : 20 may. 2025, 23:28:35
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
    <title>Lista de Ventas</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar-custom {
            background-color: #2c3e50;
        }
        .navbar-custom .nav-link, .navbar-custom .navbar-brand {
            color: #ecf0f1;
            transition: color 0.3s ease;
        }
        .navbar-custom .nav-link:hover {
            color: #ffffff;
            text-decoration: underline;
        }
        .navbar-text {
            color: #ecf0f1;
        }
        .table-responsive {
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            background-color: #fff;
            padding: 15px;
        }
        table {
            border-collapse: separate !important;
            border-spacing: 0 10px !important;
        }
        thead tr th {
            border-bottom: none !important;
            vertical-align: middle !important;
            font-weight: 600;
            font-size: 0.95rem;
            background-color: #0d6efd;
            color: #fff;
            border-radius: 8px 8px 0 0;
        }
        tbody tr {
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgb(0 0 0 / 0.07);
            transition: background-color 0.2s ease;
            border-radius: 8px;
        }
        tbody tr:hover {
            background-color: #e9f0ff;
        }
        tbody tr td {
            vertical-align: middle !important;
            padding: 12px 10px !important;
            border: none !important;
            font-size: 0.9rem;
        }
        .card-custom {
            border: none;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .card-header {
            border-radius: 12px 12px 0 0;
        }
        .text-danger:hover {
            color: #c82333 !important;
        }
    </style>
</head>
<body>

<%
    String dni_usuario = (String) session.getAttribute("dni");
    if (dni_usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String nombre_usuario = "";
    ConexionUsuario cnnn = new ConexionUsuario();
    Connection con = cnnn.Conectar();
    PreparedStatement ps = null;

    try {
        String SQL_SELECT = "SELECT nombre FROM usuarios WHERE dni = ?";
        ps = con.prepareStatement(SQL_SELECT);
        ps.setString(1, dni_usuario);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            nombre_usuario = rs.getString("nombre");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Error al obtener el nombre: " + e.getMessage());
    }
%>

<!-- Navegación superior -->
<nav class="navbar navbar-expand-lg navbar-custom sticky-top shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">Sistema de Ventas</a>
        <div class="d-flex align-items-center">
            <span class="navbar-text me-4">👋 Bienvenido, <strong><%= nombre_usuario %></strong></span>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="registroUsuario.jsp"><i class="bi bi-person-plus"></i> Crear Usuarios</a></li>
                <li class="nav-item"><a class="nav-link" href="tablaComisiones.jsp"><i class="bi bi-cash-coin"></i> Comisiones</a></li>
                <li class="nav-item"><a class="nav-link" href="emergencia.html"><i class="bi bi-file-earmark-arrow-down"></i> Descargar Reporte</a></li>
                <li class="nav-item"><a class="nav-link text-danger fw-semibold" href="index.jsp"><i class="bi bi-box-arrow-right"></i> Salir</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contenido principal -->
<div class="container py-5">
    <div class="card card-custom">
        <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">📋 Lista de Ventas Registradas</h4>
        </div>
        <div class="card-body bg-light">
            <div class="table-responsive">
                <table class="table table-hover table-bordered align-middle text-center bg-white rounded shadow-sm overflow-hidden">
                    <thead class="table-primary">
                        <tr class="align-middle">
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>DNI</th>
                            <th>Correo</th>
                            <th>Dirección</th>
                            <th>Referencia</th>
                            <th>Distrito</th>
                            <th>Departamento</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Cantidad</th>
                            <th>Tipo</th>
                            <th>Precio</th>
                            <th>Trabajador</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ConexionBD cnn;
                            String SQL_SELECT = "SELECT * FROM ventas";
                            ResultSet registros;
                            PreparedStatement sentencia;

                            try {
                                cnn = new ConexionBD();
                                sentencia = cnn.Conectar().prepareStatement(SQL_SELECT);
                                registros = sentencia.executeQuery();

                                while (registros.next()) {
                        %>
                        <tr>
                            <td><%= registros.getInt("id") %></td>
                            <td><%= registros.getString("nombre") %></td>
                            <td><%= registros.getString("dni") %></td>
                            <td><%= registros.getString("correo") %></td>
                            <td><%= registros.getString("direccion") %></td>
                            <td><%= registros.getString("referencia") %></td>
                            <td><%= registros.getString("distrito") %></td>
                            <td><%= registros.getString("departamento") %></td>
                            <td><%= registros.getString("fecha") %></td>
                            <td><%= registros.getString("hora") %></td>
                            <td><%= registros.getInt("cantidad") %></td>
                            <td><%= registros.getString("tipo") %></td>
                            <td>S/ <%= String.format("%.2f", registros.getDouble("precio")) %></td>
                            <td><%= registros.getInt("dni_usuario") %></td>
                        </tr>
                        <%
                                }
                                registros.close();
                                sentencia.close();
                            } catch (Exception e) {
                                out.println("<tr><td colspan='14' class='text-danger text-center'>❌ Error al recuperar datos: " + e.getMessage() + "</td></tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
