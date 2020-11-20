package Daos;

import Beans.BPedidos;

import java.sql.*;
import java.util.ArrayList;

public class PedidosDao {

    public ArrayList<BPedidos> listaPedidosBodega(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";

        ArrayList<BPedidos> listaPedidosBodega = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            String sql = "select p.codigoPedido,p.fechaEntrega,p.horaRecojo,p.estado,p.monto,p.cliente_dni\n" +
                    "from pedido p WHERE p.bodega_ruc=\"12534467810\";";
            ResultSet rs = stmt.executeQuery(sql);

            while(rs.next()){
                BPedidos pedido=new BPedidos();
                pedido.setCodigoPedido(rs.getString(1));
                pedido.setFechaEntrega(rs.getDate(2));
                pedido.setHoraRecojo(rs.getTime(3));
                pedido.setEstado(rs.getString(4));
                pedido.setMonto(rs.getDouble(5));
                pedido.setCliente_dni(rs.getString(6));
                listaPedidosBodega.add(pedido);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaPedidosBodega;

    }
}
