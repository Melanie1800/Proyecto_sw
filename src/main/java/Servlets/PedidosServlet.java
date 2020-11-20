package Servlets;

import Daos.PedidosDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "PedidosServlet", urlPatterns = "/pedidosBodega")
public class PedidosServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PedidosDao pedidoDao= new PedidosDao();
        request.setAttribute("listaPedidosBodega",pedidoDao.listaPedidosBodega());

        RequestDispatcher requestDispatcher=
                request.getRequestDispatcher("/bootstrap/listaPedidosBodega.jsp");
        requestDispatcher.forward(request,response);
    }
}





