package Daos;
import Beans.BCliente;
import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class ClienteDao {

    public static boolean validacionLetras(String cadena) {
        for (int x = 0; x < cadena.length(); x++) {
            char c = cadena.charAt(x);
            // Si no está entre a y z, ni entre A y Z, ni es un espacio
            if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == ' ')) {
                return false;
            }
        }
        return true;
    }

    public static boolean validarMail(String email) {

        Pattern pattern =
                Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

        Matcher mather = pattern.matcher(email);
        return mather.find();
    }


    public ArrayList <BCliente> listaDNI(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        String sql = "select dni from cliente";
        ArrayList<BCliente> listaDNI = new ArrayList<>();

        try (  Connection connection = DriverManager.getConnection(url, usuario, password);
            ){

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                BCliente bCliente = new BCliente();
                bCliente.setDniC(rs.getString(1));
                listaDNI.add(bCliente);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDNI;

    }

    public BCliente datosCliente(String dniC){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        System.out.println("#################");
        System.out.println(dniC);
        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        String sql =  "SELECT * FROM cliente WHERE dni = ?; ";
        BCliente bCliente=null;

        try (  Connection connection = DriverManager.getConnection(url, usuario, password);
               PreparedStatement pstmt = connection.prepareStatement(sql)    ){
            pstmt.setString(1,dniC);

            ResultSet rs = pstmt.executeQuery();
                if(rs.next()) {
                    bCliente = new BCliente();
                    bCliente.setDniC(rs.getString(1));
                    System.out.println(bCliente.getNombreC());
                    bCliente.setNombreC(rs.getString(2));
                    bCliente.setApellidoC(rs.getString(3));
                    bCliente.setIdDistrito(rs.getInt(4));
                    bCliente.setContraseñaC(rs.getString(5));
                    bCliente.setCorreoC(rs.getString(6));
                }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println("F");
        }

        return bCliente;

    }


    public ArrayList <BCliente> listaCorreos(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        String sql = "select correo from cliente";
        ArrayList<BCliente> listaCorreos= new ArrayList<>();

        try (  Connection connection = DriverManager.getConnection(url, usuario, password);){

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                BCliente bCliente = new BCliente();
                bCliente.setCorreoC(rs.getString(1));
                listaCorreos.add(bCliente);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaCorreos;

    }


    public ArrayList <BCliente> listaDistritos(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        String sql = "select * from distrito";
        ArrayList<BCliente> listaDistritos= new ArrayList<>();

        try (  Connection connection = DriverManager.getConnection(url, usuario, password);){

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                BCliente bCliente = new BCliente();
                bCliente.setIdDistrito(rs.getInt(1));
                bCliente.setNombreDistrito(rs.getString(2));
                listaDistritos.add(bCliente);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDistritos;

    }






    public void agregarCliente(String dniC, String nombreC, String apellidoC, String distritoC,
                                  String contraC, String emailC) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        //primero tengo que obtener el iddistrito
        String sql1 = "insert into cliente (dni, nombre,apellido, idDistrito, contraseña, correo) " +
                "values (?,?,?,?,?,?)";


        try (Connection connection = DriverManager.getConnection(url, usuario, password);
             PreparedStatement pstmt = connection.prepareStatement(sql1);
             ) {
                int idDistrito=Integer.parseInt(distritoC);
            System.out.println("*****************************++");
            System.out.println(dniC);
            System.out.println(nombreC);
            System.out.println(apellidoC);
            System.out.println(idDistrito);
            System.out.println(emailC);
            System.out.println(contraC);
                pstmt.setString(1, dniC);
                pstmt.setString(2, nombreC);
                pstmt.setString(3, apellidoC);
                pstmt.setInt(4, idDistrito);
                pstmt.setString(5, contraC);
                pstmt.setString(6, emailC);

                pstmt.executeUpdate();

            System.out.println("entro");



        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println(throwables.getMessage());
            System.out.println("no entro");

        }


    }
    public ArrayList<BCliente> listaClientes (){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        String sql = "select * from cliente";
        ArrayList<BCliente> listaClientes = new ArrayList<>();

        try (  Connection connection = DriverManager.getConnection(url, usuario, password);
        ){

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                BCliente bCliente = new BCliente();
                bCliente.setDniC(rs.getString(1));
                bCliente.setNombreC(rs.getString(2));
                bCliente.setApellidoC(rs.getString(3));
                bCliente.setIdDistrito(rs.getInt(4));
                bCliente.setContraseñaC(rs.getString(5));
                bCliente.setCorreoC(rs.getString(6));
                listaClientes .add(bCliente);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaClientes;

    }

    public void actualizarCliente(String dniC, String nombreC, String apellidoC, String distritoC) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        //primero tengo que obtener el iddistrito

        int idDistrito=Integer.parseInt(distritoC);

        String sql1 = "UPDATE `grupo1_db`.`cliente` SET `nombre` = ?, `apellido` = ?, `idDistrito` = ? WHERE (`dni` = ?);";


        try (Connection connection = DriverManager.getConnection(url, usuario, password);
             PreparedStatement pstmt = connection.prepareStatement(sql1)) {


            System.out.println("*****************************++");
            System.out.println(nombreC);
            System.out.println(apellidoC);
            System.out.println(idDistrito);
            System.out.println(dniC);

            pstmt.setString(1,nombreC);
            pstmt.setString(2,apellidoC);
            pstmt.setInt(3,idDistrito);
            pstmt.setString(4,dniC);
            pstmt.executeUpdate();


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throwables.getMessage();
            System.out.println("no entro");


        }


    }

    public boolean verificacionCliente(String dniC, String contraC) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String usuario = "root";
        String password = "root";

        String url = "jdbc:mysql://localhost:3306/grupo1_db?serverTimezone=America/Lima";
        //primero tengo que obtener el iddistrito
        String sql1 = "select contraseña from cliente where dni=? ";


        try (Connection connection = DriverManager.getConnection(url, usuario, password);
             PreparedStatement pstmt = connection.prepareStatement(sql1);
             ) {

            pstmt.setString(1, dniC);

            ResultSet rs=pstmt.executeQuery();
            rs.next();
            String contra1= rs.getString(1);
            if(contra1.equals(contraC)){
                return true;
            }else{
                return false;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }



}


