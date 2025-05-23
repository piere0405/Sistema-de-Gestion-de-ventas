<%-- 
    Document   : registroUsuario
    Created on : 21 may. 2025, 14:32:05
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Registrar Usuario</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa; /* Gris claro neutro */
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #212529;
            margin: 0;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 20px rgb(0 0 0 / 0.1);
            max-width: 420px;
            width: 100%;
            padding: 2rem 2rem;
            background-color: #ffffff;
        }
        h2 {
            font-weight: 600;
            color: #343a40;
            margin-bottom: 1.75rem;
            text-align: center;
        }
        label {
            font-weight: 500;
            color: #495057;
        }
        input, select {
            border-radius: 6px;
            border: 1px solid #ced4da;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        input:focus, select:focus {
            border-color: #0d6efd;
            outline: none;
            box-shadow: 0 0 0 0.25rem rgb(13 110 253 / 0.25);
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
            font-weight: 600;
            padding: 0.625rem 0;
            width: 100%;
            border-radius: 6px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        .btn-secondary {
            width: 100%;
            margin-top: 0.75rem;
            border-radius: 6px;
            padding: 0.55rem 0;
            font-weight: 500;
        }
        form > div {
            margin-bottom: 1.25rem;
        }
    </style>
</head>
<body>

<div class="card shadow-sm">
    <h2>Registrar Usuario</h2>
    <form method="post" action="procesoUsuario.jsp" novalidate>
        <div>
            <label for="nombre">Nombres</label>
            <input type="text" id="nombre" name="nombre" required placeholder="Ingrese nombres completos" class="form-control" />
        </div>
        <div>
            <label for="dni">DNI</label>
            <input type="text" id="dni" name="dni" required placeholder="Ingrese su DNI" class="form-control" />
        </div>
        <div>
            <label for="password">Contraseña</label>
            <input type="password" id="password" name="password" required placeholder="Ingrese contraseña" class="form-control" />
        </div>
        <div>
            <label for="rol">Rol</label>
            <select id="rol" name="rol" required class="form-select">
                <option value="" disabled selected>Seleccione un rol</option>
                <option value="trabajador">Trabajador</option>
                <option value="supervisor">Supervisor</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Registrar</button>
        <button type="button" class="btn btn-secondary" onclick="window.location.href='listarUsuario.jsp';">Regresar</button>
    </form>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
