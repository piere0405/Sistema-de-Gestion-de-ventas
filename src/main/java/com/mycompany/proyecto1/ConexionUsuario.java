/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proyecto1;

/**
 *
 * @author usuario
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionUsuario{
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String USER = "root";
    private static final String CLAVE = "locura32147";
    private static final String URL = "jdbc:mysql://localhost:3306/ventasdb";
    
    private Connection cnn;
    
    //constructor
    public ConexionUsuario() {
        cnn = null;
    }
    
    //metodo conectar
    public Connection Conectar() {
        try {
            Class.forName(DRIVER);
            cnn = (Connection)DriverManager.getConnection(URL, USER, CLAVE);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return cnn;
    }
    
    //metodo desconectar
  public void Desconectar() {
    try {
        if (cnn != null && !cnn.isClosed()) {
            cnn.close();
            cnn = null; // evita reusar una conexión cerrada
        }
    } catch (SQLException e) {
        System.out.println("Error al cerrar la conexión: " + e.getMessage());
    }
}
}
