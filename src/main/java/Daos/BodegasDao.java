package Daos;

import Beans.BBodegas;

import java.sql.*;
import java.util.ArrayList;

public class BodegasDao {
    //funcionalidades
    public ArrayList<BBodegas> listaBodegas(int pagina) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";

        String sql= "select b.nombreBodega, d.nombreDistrito, b.direccion, b.valoracion"+
        " FROM bodega b, distrito d"+
        " WHERE b.idDistrito =d.idDistrito"+
        " order by b.nombreBodega ASC limit "+((10*pagina)-10)+",10;";
        /*String sql="select b.nombreBodega, d.nombreDistrito, b.direccion, b.valoracion" +
                "        FROM bodega b, distrito d, cliente c" +
                "         WHERE b.idDistrito =d.idDistrito and c.idDistrito=b.idDistrito" +
                "         and c.idDistrito=d.idDistrito and c.dni=74238876" +
                " order by b.nombreBodega ASC;";*/



        ArrayList<BBodegas> listaBodegas=new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(url, usuario, password);){
            Statement stmt= connection.createStatement();
            ResultSet rs= stmt.executeQuery(sql);
            while(rs.next()){
                //objeto
                BBodegas bodega=new BBodegas();
                bodega.setNombreBodega(rs.getString(1));
                bodega.setDistrito(rs.getString(2));
                bodega.setDireccion(rs.getString(3));
                bodega.setValoracion(rs.getInt(4));
                listaBodegas.add(bodega);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaBodegas;
    }

    public int tamanioListaBodegas(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";

        String sql= "select b.nombreBodega, d.nombreDistrito, b.direccion, b.valoracion"+
                " FROM bodega b, distrito d"+
                " WHERE b.idDistrito =d.idDistrito"+
                " order by b.nombreBodega ASC;";
        /*String sql="select b.nombreBodega, d.nombreDistrito, b.direccion, b.valoracion" +
                "        FROM bodega b, distrito d, cliente c" +
                "         WHERE b.idDistrito =d.idDistrito and c.idDistrito=b.idDistrito" +
                "         and c.idDistrito=d.idDistrito and c.dni=74238876" +
                " order by b.nombreBodega ASC;";*/



        ArrayList<BBodegas> listaBodegas=new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(url, usuario, password);){
            Statement stmt= connection.createStatement();
            ResultSet rs= stmt.executeQuery(sql);
            while(rs.next()){
                //objeto
                BBodegas bodega=new BBodegas();
                bodega.setNombreBodega(rs.getString(1));
                bodega.setDistrito(rs.getString(2));
                bodega.setDireccion(rs.getString(3));
                bodega.setValoracion(rs.getInt(4));
                listaBodegas.add(bodega);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaBodegas.size();



    }

}
