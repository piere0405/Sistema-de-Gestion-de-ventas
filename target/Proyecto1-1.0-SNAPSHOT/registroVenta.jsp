<%-- 
    Document   : registroVenta
    Created on : 20 may. 2025, 18:35:08
    Author     : usuario
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.mycompany.proyecto1.ConexionUsuario" %> 
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Registro de Venta | Cementos Sólidos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Iconos Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
      body {
  background-color: #e9f0f7; /* azul grisáceo claro profesional */
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}


    main {
      max-width: 800px;
      margin: 50px auto;
      background: #fff;
      padding: 40px 50px;
      border-radius: 15px;
      box-shadow: 0 0 25px rgba(0, 0, 0, 0.08);
    }

    header nav a {
      margin-left: 10px;
    }

    h2 {
      font-weight: bold;
      color: #0d6efd;
    }

    .form-label {
      font-weight: 600;
      color: #343a40;
    }

    .form-control, .form-select {
      border-radius: 8px;
    }

    .btn-primary {
      background-color: #0d6efd;
      border: none;
      font-weight: 600;
    }

    .btn-outline-primary {
      font-weight: 500;
    }

    footer {
      text-align: center;
      font-size: 0.9rem;
      color: #6c757d;
      margin-top: 40px;
    }

    .section-divider {
      border-top: 1px solid #dee2e6;
      margin: 30px 0;
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
    ConexionUsuario cnn = new ConexionUsuario();
    Connection con = cnn.Conectar();
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

<main>
  <header class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <p class="mb-0 text-secondary">Bienvenido, <strong><%= nombre_usuario %></strong></p>
    </div>
    <nav>
      <a href="ventasPersonales.jsp" class="btn btn-outline-primary btn-sm"><i class="bi bi-bag-check"></i> Mis ventas</a>
      <a href="tablaComisiones.jsp" class="btn btn-outline-primary btn-sm"><i class="bi bi-cash-coin"></i> Comisiones</a>
      <a href="index.jsp" class="btn btn-outline-danger btn-sm"><i class="bi bi-box-arrow-right"></i> Salir</a>
    </nav>
  </header>

  <h2 class="text-center mb-4">Registro de Venta</h2>

  <form action="procesarRegistro.jsp" method="post" class="needs-validation" novalidate>
    <!-- Datos personales -->
    <div class="section-divider"></div>
    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="nombre" class="form-label">Nombre completo</label>
        <input type="text" class="form-control" id="nombre" name="nombre" required>
        <div class="invalid-feedback">Ingrese el nombre completo.</div>
      </div>
      <div class="col-md-6 mb-3">
        <label for="dni" class="form-label">DNI</label>
        <input type="text" class="form-control" id="dni" name="dni2" required>
        <div class="invalid-feedback">Ingrese el DNI.</div>
      </div>
    </div>

    <div class="mb-3">
      <label for="correo" class="form-label">Correo electrónico</label>
      <input type="email" class="form-control" id="correo" name="correo" required>
      <div class="invalid-feedback">Ingrese un correo válido.</div>
    </div>

    <!-- Dirección -->
    <div class="section-divider"></div>
    <div class="mb-3">
      <label for="direccion" class="form-label">Dirección</label>
      <input type="text" class="form-control" id="direccion" name="direccion" required>
      <div class="invalid-feedback">Ingrese la dirección.</div>
    </div>

    <div class="mb-3">
      <label for="referencia" class="form-label">Referencia</label>
      <input type="text" class="form-control" id="referencia" name="referencia">
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="distrito" class="form-label">Distrito</label>
        <input type="text" class="form-control" id="distrito" name="distrito" required>
        <div class="invalid-feedback">Ingrese el distrito.</div>
      </div>
      <div class="col-md-6 mb-3">
        <label for="departamento" class="form-label">Departamento</label>
        <input type="text" class="form-control" id="departamento" name="departamento" required>
        <div class="invalid-feedback">Ingrese el departamento.</div>
      </div>
    </div>

    <!-- Entrega -->
    <div class="section-divider"></div>
    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="fecha" class="form-label">Fecha de entrega</label>
        <input type="date" class="form-control" id="fecha" name="fecha" required>
        <div class="invalid-feedback">Seleccione la fecha.</div>
      </div>
      <div class="col-md-6 mb-3">
        <label for="hora" class="form-label">Hora de entrega</label>
        <input type="time" class="form-control" id="hora" name="hora" required>
        <div class="invalid-feedback">Seleccione la hora.</div>
      </div>
    </div>

    <!-- Detalles del producto -->
    <div class="section-divider"></div>
    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="cantidad" class="form-label">Cantidad</label>
        <input type="number" class="form-control" id="cantidad" name="cantidad" min="1" required>
        <div class="invalid-feedback">Ingrese una cantidad válida.</div>
      </div>
      <div class="col-md-6 mb-3">
        <label for="tipo" class="form-label">Tipo de cemento</label>
        <select id="tipo" name="tipo" class="form-select" required>
          <option value="">-- Seleccionar --</option>
          <option>Cementos resistentes a los sulfatos</option>
          <option>Cementos de Fraguado Rápido</option>
          <option>Cemento con alto contenido de alúmina</option>
          <option>Cementos de escoria de alto horno</option>
          <option>Microcemento</option>
        </select>
        <div class="invalid-feedback">Seleccione un tipo de cemento.</div>
      </div>
    </div>

    <div class="mb-4">
      <label for="precio" class="form-label">Precio final (S/.)</label>
      <input type="number" class="form-control" id="precio" name="precio" step="0.01" min="0" required>
      <div class="invalid-feedback">Ingrese un precio válido.</div>
    </div>

    <button type="submit" class="btn btn-primary w-100">
      <i class="bi bi-send"></i> Registrar Venta
    </button>
  </form>

  <footer class="mt-5">
    Cementos Sólidos &copy; 2025 · Todos los derechos reservados
  </footer>
</main>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  (() => {
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  })();
</script>

</body>
</html>

