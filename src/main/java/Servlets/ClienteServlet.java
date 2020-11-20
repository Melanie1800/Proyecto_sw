package Servlets;

import Beans.BBodegasAdmin;
import Beans.BCliente;
import Daos.BodegasDao;
import Daos.ClienteDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //accion
        String accion = request.getParameter("accion") == null ?
                "inicio" : request.getParameter("accion");


        ClienteDao clienteDao = new ClienteDao();
        String nombreC ;
        String apellidoC ;
        String dniC ;
        String distritoC ;
        String emailC ;
        String contraC ;
        String contraRC ;


        boolean valNombreLetras;
        boolean valNombreVacio=true;
        boolean valApellidoLetras ;
        boolean valApellidoVacio=true;
        boolean valDistrito = true;
        boolean valEmail ;
        boolean valEmailVacio=true;
        boolean valEmailExiste=true;
        boolean valDniNum =true;
        boolean valDniExiste=true;
        boolean valDniLong=true;
        boolean valDniVacio=true;
        boolean valcontraIguales ;
        boolean valcontra1Vacio=true;
        boolean valcontra2Vacio=true;
        boolean valcontraLong=true;
        BCliente cliente2 = new BCliente();



        switch (accion){
            case("crear"):
                nombreC = request.getParameter("nombreC");
                apellidoC = request.getParameter("apellidoC");
                dniC = request.getParameter("dniC");
                distritoC = request.getParameter("distritoC");
                emailC = request.getParameter("emailC");
                contraC = request.getParameter("contraC");
                contraRC = request.getParameter("contraRC");
                valNombreLetras = ClienteDao.validacionLetras(nombreC);

                /*-----------------VALIDACION NOMBRE------------------------*/
                valNombreLetras = ClienteDao.validacionLetras(nombreC);
                if(nombreC.isEmpty()){
                    valNombreVacio=false;
                }

                /*-----------------VALIDACION APELLIDO------------------------*/
                valApellidoLetras = ClienteDao.validacionLetras(apellidoC);
                if(apellidoC.isEmpty()){
                    valApellidoVacio=false;
                }
                /*-----------------VALIDACION DiSTRITO------------------------*/

                int distritoIT = 0;
                try {
                    distritoIT = Integer.parseInt(distritoC);
                    /*Validar Tamaño*/

                    if(distritoIT <1 || distritoIT> 42 || distritoC == null ){
                        valDistrito = false;
                    }

                }catch (NumberFormatException e){
                    e.printStackTrace();
                    valDistrito = false;
                }

                /*-----------------VALIDACION EMAIL------------------------*/
                valEmail = ClienteDao.validarMail(emailC);
                if(emailC.isEmpty()){
                    valEmailVacio=false;
                }
                ArrayList<BCliente> listaCorreo = clienteDao.listaCorreos();
                for(BCliente bCliente:listaCorreo){
                    if(bCliente.getCorreoC().equalsIgnoreCase(emailC)){
                        valEmailExiste=false;
                        break;
                    }
                }

                /*-----------------VALIDACION DNI------------------------*/

                /* vacio */
                if(dniC.isEmpty()){
                    valDniVacio=false;
                }
                /*---- cantidad de caracteres ----- */
                if ((dniC.length() != 8)  ) {
                    valDniLong=false;
                }

                /* ----verificacion de que son solo numeros ------*/
                try {
                    int dni = Integer.parseInt(dniC);
                    valDniNum=true;
                    //si tiene solo  numeros
                } catch (NumberFormatException e) {
                    valDniNum = false;
                }

                /*------------verificar si exise el dni---------*/
                ArrayList<BCliente> listaDNI= clienteDao.listaDNI();
                for(BCliente bCliente:listaDNI){
                    if(bCliente.getDniC().equalsIgnoreCase(dniC)){
                        // si existe false
                        valDniExiste=false;
                        break;
                    }
                }
                //en el caso de que no exitsa valDniVacio==true;

                /*-----------------VALIDACION CONTRASEÑA------------------------*/

                if(contraC.length()!=8){
                    valcontraLong=false;
                }
                if(contraC.isEmpty()){
                    valcontra1Vacio=false;
                }
                if(contraRC.isEmpty()){
                    valcontra2Vacio=false;
                }

                if ( contraC .equalsIgnoreCase(contraRC)) {
                    valcontraIguales = true;
                }else{
                    valcontraIguales=false;
                }

                /* ************************************************************* */

                if(valNombreLetras & valNombreVacio &
                        valApellidoLetras & valApellidoVacio&
                        valDniVacio &valDniLong &valDniExiste & valDniNum &
                        valDistrito &
                        valEmail& valEmailVacio& valEmailExiste&
                        valcontraIguales & valcontra1Vacio & valcontra2Vacio & valcontraLong){


                            clienteDao.agregarCliente(dniC,nombreC,apellidoC,distritoC,contraC,emailC);
                    response.sendRedirect(request.getContextPath()+"/ClienteServlet");



                }else{
                    //uso el request DIspatcher para que no se borre lo que coloco
                    request.setAttribute("valNombreLetras",valNombreLetras);
                    request.setAttribute("valNombreVacio",valNombreVacio);
                    request.setAttribute("valApellidoLetras",valApellidoLetras);
                    request.setAttribute("valApellidoVacio",valApellidoVacio);
                    request.setAttribute("valDniLong",valDniLong);
                    request.setAttribute("valDniVacio",valDniVacio);
                    request.setAttribute("valDniExiste",valDniExiste);
                    request.setAttribute("valDniNum",valDniNum);
                    request.setAttribute("valDistrito",valDistrito);
                    request.setAttribute("valEmail",valEmail);
                    request.setAttribute("valEmailVacio",valEmailVacio);
                    request.setAttribute("valEmailExiste",valEmailExiste);
                    request.setAttribute("valcontra1Vacio",valcontra1Vacio);
                    request.setAttribute("valcontra2Vacio",valcontra2Vacio);
                    request.setAttribute("valcontraIguales",valcontraIguales);
                    request.setAttribute("valcontraLong",valcontraLong);

                    request.setAttribute("listaDistritos",clienteDao.listaDistritos());

                    RequestDispatcher requestDispatcher=request.getRequestDispatcher("/bootstrap/registroCliente.jsp");
                    requestDispatcher.forward(request,response);

                }

                break;

            case ("actualizar"):
                nombreC = request.getParameter("nombreC");
                apellidoC = request.getParameter("apellidoC");
                dniC = request.getParameter("dniC");
                distritoC = request.getParameter("distritoC");
                contraC = request.getParameter("contraC");

                cliente2.setDniC(dniC);
                cliente2.setNombreC(nombreC);
                cliente2.setApellidoC(apellidoC);
                cliente2.setIdDistrito(Integer.parseInt(distritoC));
                cliente2.setContraseñaC(contraC);


                boolean verifCliente=clienteDao.verificacionCliente(dniC,contraC);
                System.out.println(verifCliente);
                System.out.println(dniC);
                System.out.println(nombreC);
                System.out.println(apellidoC);
                System.out.println(distritoC);
                /*-----------------VALIDACION NOMBRE------------------------*/
                valNombreLetras = ClienteDao.validacionLetras(nombreC);
                if(nombreC.isEmpty()){
                    valNombreVacio=false;
                }


                /*-----------------VALIDACION APELLIDO------------------------*/
                valApellidoLetras = ClienteDao.validacionLetras(apellidoC);
                if(apellidoC.isEmpty()){
                    valApellidoVacio=false;
                }
                /*-----------------VALIDACION DiSTRITO------------------------*/
                 distritoIT = 0;
                try {
                    distritoIT = Integer.parseInt(distritoC);
                    /*Validar Tamaño*/

                    if(distritoIT <1 || distritoIT> 42 || distritoC == null ){
                        valDistrito = false;
                    }

                }catch (NumberFormatException e){
                    e.printStackTrace();
                    valDistrito = false;
                }


                /*-----------------VALIDACION CONTRASEÑA------------------------*/

                if(contraC.length()!=8){
                    valcontraLong=false;
                }
                if(contraC.isEmpty()){
                    valcontra1Vacio=false;
                }


                /* ************************************************************* */
                if(valNombreLetras & valNombreVacio &
                        valApellidoLetras & valApellidoVacio&
                        valDistrito & valcontra1Vacio &  valcontraLong & verifCliente){

                            System.out.println("enviando");

                            clienteDao.actualizarCliente(dniC,nombreC,apellidoC,distritoC);

                    BodegasDao bodegasDao= new BodegasDao();
                    int t=bodegasDao.tamanioListaBodegas();

                    request.setAttribute("listaBodegas",bodegasDao.listaBodegas(1));
                    request.setAttribute("tamanio",t);
                    RequestDispatcher requestDispatcher= request.getRequestDispatcher("/bootstrap/listaBodegas.jsp");
                    requestDispatcher.forward(request,response);
                            break;
                }else{
                    //uso el request DIspatcher para que no se borre lo que coloco
                    request.setAttribute("valNombreLetras",valNombreLetras);
                    request.setAttribute("valNombreVacio",valNombreVacio);
                    request.setAttribute("valApellidoLetras",valApellidoLetras);
                    request.setAttribute("valApellidoVacio",valApellidoVacio);
                    request.setAttribute("valDistrito",valDistrito);
                    request.setAttribute("valcontra1Vacio",valcontra1Vacio);
                    request.setAttribute("verifCliente",verifCliente);
                    request.setAttribute("listaDistritos",clienteDao.listaDistritos());

                    request.setAttribute("datosCliente", cliente2);



                    RequestDispatcher requestDispatcher=request.getRequestDispatcher("/bootstrap/editarPerfil.jsp");
                    requestDispatcher.forward(request,response);



                }
                break;

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion= (String) request.getParameter("accion") == null ?
                "inicio": request.getParameter("accion");

        ClienteDao clienteDao=new ClienteDao();
        RequestDispatcher requestDispatcher;
        switch(accion){
            case "inicio":
                requestDispatcher=request.getRequestDispatcher("/bootstrap/login.jsp");
                requestDispatcher.forward(request,response);
                break;

            case "bodegas":
                BodegasDao bodegasDao= new BodegasDao();
                int t=bodegasDao.tamanioListaBodegas();
                int pagina=1;
                try {
                    pagina = Integer.parseInt(request.getParameter("pagina"));
                }catch (NumberFormatException e){
                    e.getStackTrace();
                }

                request.setAttribute("listaBodegas",bodegasDao.listaBodegas(pagina));
                request.setAttribute("tamanio",t);
                requestDispatcher= request.getRequestDispatcher("/bootstrap/listaBodegas.jsp");
                requestDispatcher.forward(request,response);
                break;

            case "registrar":
                request.setAttribute("listaDistritos",clienteDao.listaDistritos());
                requestDispatcher=request.getRequestDispatcher("/bootstrap/registroCliente.jsp");
                requestDispatcher.forward(request,response);

                break;

            case "editar":
                request.setAttribute("listaDistritos",clienteDao.listaDistritos());
                String dniC = request.getParameter("dniC");
                System.out.println(dniC);
                BCliente bCliente = clienteDao.datosCliente(dniC);
                System.out.println(bCliente.getNombreC());

                    request.setAttribute("datosCliente", bCliente);
                    requestDispatcher = request.getRequestDispatcher("/bootstrap/editarPerfil.jsp");
                    requestDispatcher.forward(request, response);


                break;

            case "distritos":
                request.setAttribute("listaDistritos", clienteDao.listaDistritos());
                requestDispatcher=request.getRequestDispatcher("/bootstrap/distritos.jsp");
                requestDispatcher.forward(request,response);
                break;



        }


    }
}
