package Daos;

import Beans.BBodegasAdmin;

import java.sql.*;
import java.util.ArrayList;

public class BodegasAdminDao {
    public ArrayList<BBodegasAdmin> listaBodegas(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String user= "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";

        ArrayList<BBodegasAdmin> listaBodegasAdmin = new ArrayList<>();

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            String sql = "select bo.ruc,\n" +
                    "\tbo.nombreBodega,\n" +
                    "    di.nombreDistrito,\n" +
                    "    bo.direccion,\n" +
                    "    bo.correo\n" +
                    "from bodega bo, distrito di\n" +
                    "where bo.idDistrito=di.idDistrito AND bo.bloqueado =0;\n;";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                BBodegasAdmin b = new BBodegasAdmin();
                b.setRuc(rs.getString(1));
                b.setNombreBodega(rs.getString(2));
                b.setDistrito(rs.getString(3));
                b.setDireccion(rs.getString(4));
                b.setCorreo(rs.getString(5));

                listaBodegasAdmin.add(b);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaBodegasAdmin;

    }
}
