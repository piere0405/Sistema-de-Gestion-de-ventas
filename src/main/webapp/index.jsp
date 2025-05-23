<%-- 
    Document   : index
    Created on : 21 may. 2025, 14:30:06
    Author     : usuario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login | Tienda de Cementos</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Estilos personalizados -->
    <style>
        body {
            background: linear-gradient(145deg, #2c3e50, #34495e);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background-color: #fff;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            padding: 3rem 2.5rem;
            width: 100%;
            max-width: 420px;
            text-align: center;
        }

        .login-card img.logo {
            width: 100px;
            margin-bottom: 1rem;
        }

        .login-card h4 {
            font-weight: bold;
            color: #2c3e50;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control:focus {
            border-color: #2980b9;
            box-shadow: 0 0 0 0.2rem rgba(41, 128, 185, 0.25);
        }

        .btn-custom {
            background-color: #2c3e50;
            color: white;
            border: none;
            font-weight: bold;
        }

        .btn-custom:hover {
            background-color: #1a252f;
        }

        .form-text {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-card">
        <img src="https://mir-s3-cdn-cf.behance.net/projects/404/62e50b56076327.Y3JvcCw0OTIsMzg1LDE0MTIsNDY3.png" alt="Logo Cementos" class="logo">
        <h4 class="mb-3">Tienda de Cementos</h4>
        <p class="text-muted mb-4">Inicia sesión con tus credenciales</p>

        <!-- Mensaje de error Bootstrap -->
        <div id="error-message" class="alert alert-danger d-none" role="alert">
            Credenciales incorrectas. Por favor, verifica tu DNI y contraseña.
        </div>

        <form method="post" action="procesoLogin.jsp" novalidate class="text-start needs-validation">
            <div class="mb-3">
                <label for="dni" class="form-label">DNI</label>
                <input type="text" class="form-control" id="dni" name="dni" required placeholder="Ingrese su DNI">
                <div class="invalid-feedback">Por favor, ingrese su DNI.</div>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required placeholder="Ingrese su contraseña">
                <div class="invalid-feedback">Por favor, ingrese su contraseña.</div>
            </div>
            <button type="submit" class="btn btn-custom w-100 py-2">Ingresar</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Validación Bootstrap -->
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

<script>
    function getQueryParam(param) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }
    const error = getQueryParam('error');
    if (error === '1') {
        // Mostrar mensaje de error (quita la clase d-none)
        document.getElementById('error-message').classList.remove('d-none');
    }
</script>
</body>
</html>
