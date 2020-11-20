package Servlets;

import Beans.Bproductos;
import Daos.ProductosDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletDiego", urlPatterns = {"/ProductosBodega"})
public class ServletDiego extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //try(PrintWriter printWriter= response.getWriter()){
          //  printWriter.println("Hola mundo");
            //printWriter.println("Xd");
        //}
        ProductosDao productosDao =new ProductosDao();
        ArrayList<Bproductos>lista_productos= productosDao.obtenerListaProductos();
        request.setAttribute("lista", lista_productos);
        RequestDispatcher view = request.getRequestDispatcher("bootstrap/lista_productos.jsp");
        view.forward(request,response);
    }
}
