package Servlets;

import Beans.BProductosCliente;
import Daos.ProductosClienteDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Servlet", urlPatterns = {"/clienteProductos"})
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductosClienteDao productosDao =new ProductosClienteDao();
        ArrayList<BProductosCliente> lista_productos_cliente= productosDao.obtenerListaProductos();
        request.setAttribute("lista", lista_productos_cliente);
        RequestDispatcher view = request.getRequestDispatcher("bootstrap/lista_productos_cliente.jsp");
        view.forward(request,response);

    }
}
