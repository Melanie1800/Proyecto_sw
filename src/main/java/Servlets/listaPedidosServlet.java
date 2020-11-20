package Servlets;

import Beans.BlistaPedidos;
import Daos.listaPedidosDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "listaPedidosServlet",urlPatterns = "/clientePedido")
public class listaPedidosServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        listaPedidosDao listaPedidosDao = new listaPedidosDao();

        request.setAttribute("listaPedidos",listaPedidosDao.listaPedidos());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/bootstrap/listaPedidos.jsp");
        requestDispatcher.forward(request, response);

    }
}
