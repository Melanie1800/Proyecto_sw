package Daos;

import Beans.BProductosCliente;

import java.sql.*;
import java.util.ArrayList;

public class ProductosClienteDao {
    public ArrayList<BProductosCliente> obtenerListaProductos(){
        ArrayList<BProductosCliente> listaProductos = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("select nombreProducto, descripcion,precio from bodega,producto where bodega.ruc=\"12534467819\"\n" +
                    "and producto.bodega_ruc=\"12534467819\";");

            while (rs.next()) {
                BProductosCliente prod = new BProductosCliente();
                prod.setNombre(rs.getString(1));
                prod.setDescripcion(rs.getString(2));
                prod.setPrecioUnitario(rs.getDouble(3));

                listaProductos.add(prod);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaProductos;
    }
}
