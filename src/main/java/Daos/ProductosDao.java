package Daos;

import Beans.Bproductos;

import java.sql.*;
import java.util.ArrayList;


public class ProductosDao {
    public ArrayList<Bproductos> obtenerListaProductos(){
        ArrayList<Bproductos> listaProductos = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("select nombreProducto, descripcion,cantidad,precio from bodega,producto where bodega.ruc=\"12534467812\"\n" +
                    "and producto.bodega_ruc=\"12534467812\";");

            while (rs.next()) {
                Bproductos job = new Bproductos();
                job.setNombre(rs.getString(1));
                job.setDescripcion(rs.getString(2));
                job.setCantidad(rs.getInt(3));
                job.setPrecioUnitario(rs.getDouble(4));

                listaProductos.add(job);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaProductos;
    }
}
