<%-- 
    Document   : ventasPersonales
    Created on : 21 may. 2025, 17:52:34
    Author     : usuario
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.proyecto1.ConexionBD" %>
<%@ page import="com.mycompany.proyecto1.ConexionUsuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Lista de Ventas - Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table thead th {
            vertical-align: middle;
            text-align: center;
        }
        .table td, .table th {
            text-align: center;
        }
        .card {
            box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.1);
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
    Connection con = null;
    PreparedStatement ps = null;

    try {
        ConexionUsuario cnnn = new ConexionUsuario();
        con = cnnn.Conectar();
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
%>
    <div class="alert alert-danger text-center mt-3">
        Error al obtener el nombre: <%= e.getMessage() %>
    </div>
<%
    }
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#"><i class="bi bi-bar-chart-fill"></i> Sistema de Ventas</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item me-3">
                    <span class="nav-link text-light">👤 <strong><%= nombre_usuario %></strong></span>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light me-2" href="registroVenta.jsp"><i class="bi bi-plus-circle"></i> Registrar Venta</a>
                    <a class="btn btn-outline-warning" href="index.jsp"><i class="bi bi-box-arrow-right"></i> Salir</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container py-5">
    <div class="card border-0">
        <div class="card-header bg-primary text-white text-center fs-4 fw-bold">
            <i class="bi bi-clipboard-data"></i> Detalle de Ventas Registradas
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover table-bordered table-striped align-middle">
                    <thead class="table-dark">
                        <tr>
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
                            <th>Precio (S/.)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                ConexionBD cnn = new ConexionBD();
                                Connection conn = cnn.Conectar();
                                String SQL_SELECT2 = "SELECT * FROM ventas WHERE dni_usuario = ?";
                                PreparedStatement sentencia = conn.prepareStatement(SQL_SELECT2);
                                sentencia.setString(1, dni_usuario);
                                ResultSet registros = sentencia.executeQuery();

                                while (registros.next()) {
                        %>
                        <tr>
                            <td><%= registros.getString("nombre") %></td>
                            <td><%= registros.getString("dni") %></td>
                            <td><%= registros.getString("correo") %></td>
                            <td><%= registros.getString("direccion") %></td>
                            <td><%= registros.getString("referencia") %></td>
                            <td><%= registros.getString("distrito") %></td>
                            <td><%= registros.getString("departamento") %></td>
                            <td><span class="badge bg-info"><%= registros.getString("fecha") %></span></td>
                            <td><span class="badge bg-secondary"><%= registros.getString("hora") %></span></td>
                            <td><%= registros.getInt("cantidad") %></td>
                            <td>
                                <span class="badge bg-success"><%= registros.getString("tipo") %></span>
                            </td>
                            <td><strong>S/ <%= String.format("%.2f", registros.getDouble("precio")) %></strong></td>
                        </tr>
                        <%
                                }
                                registros.close();
                                sentencia.close();
                                conn.close();
                            } catch (Exception e) {
                        %>
                        <tr>
                            <td colspan="12">
                                <div class="alert alert-danger text-center">
                                    ❌ Error al recuperar datos: <%= e.getMessage() %>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
