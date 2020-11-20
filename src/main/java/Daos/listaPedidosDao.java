package Daos;

import Beans.BlistaPedidos;

import java.sql.*;
import java.util.ArrayList;

public class listaPedidosDao {

    //Se crea un metodo por cada funcionalidad que se quiera que haga
    public  ArrayList<BlistaPedidos> listaPedidos(){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT p.codigoPedido, b.nombreBodega, d.nombreDistrito, b.direccion, p.estado ,p.monto " +
                "FROM pedido p, distrito d, bodega b, cliente cl WHERE d.idDistrito = b.idDistrito AND b.ruc = p.bodega_ruc AND " +
                "cl.dni = 71622115 ORDER BY p.codigoPedido DESC;";
        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";

        ArrayList<BlistaPedidos> listaPedidos = new ArrayList<>();

        try(Connection connection = DriverManager.getConnection(url, "root", "root");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);){

            while (rs.next()){
                BlistaPedidos pedidos = new BlistaPedidos();
                pedidos.setCodigoPedido(rs.getString(1));
                pedidos.setNombreBodega(rs.getString(2));
                pedidos.setNombreDistrito(rs.getString(3));
                pedidos.setDireccion(rs.getString(4));
                pedidos.setEstado(rs.getString(5));
                pedidos.setMonto(rs.getDouble(6));

                listaPedidos.add(pedidos);
            }

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }

        return  listaPedidos;
    }



}
