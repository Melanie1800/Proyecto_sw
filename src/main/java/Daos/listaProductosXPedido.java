package Daos;

import Beans.BlistaProductosXPedido;

import java.sql.*;
import java.util.ArrayList;

public class listaProductosXPedido {

    public static ArrayList<BlistaProductosXPedido> listaGenerarPedidos() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";

        String sql = "SELECT p.nombreProducto , (p.precio*php.cantidadProducto) as precioProducto, php.cantidadProducto" +
                " FROM pedido_has_producto php, producto p, pedido pd, cliente cl" +
                " WHERE cl.dni = pd.cliente_dni and" +
                "        pd.codigoPedido = php.codigoPedido and" +
                "        php.idProducto = p.idProducto and" +
                "        pd.codigoPedido = 00004201103 and" +
                "        cl.dni = 71622115" +
                " ORDER BY p.nombreProducto ASC;";

        ArrayList<BlistaProductosXPedido> listaProductosXPedido=new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(url, usuario, password);){
            Statement stmt= connection.createStatement();
            ResultSet rs= stmt.executeQuery(sql);
            while(rs.next()){
                //objeto
                BlistaProductosXPedido producto=new BlistaProductosXPedido();
                producto.setNombre(rs.getString(1));
                producto.setPrecio(rs.getDouble(2));
                producto.setCantidad(rs.getInt(3));
                listaProductosXPedido.add(producto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaProductosXPedido;

    }
}
