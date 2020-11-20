package Servlets;

import Daos.BodegasAdminDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BodegasAdminServlet", urlPatterns = {"/AdminServlet","/admin", "/servletadmin" })
public class BodegasAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BodegasAdminDao bodegaDao = new BodegasAdminDao();
        request.setAttribute("listaBodegasAdmin", bodegaDao.listaBodegas());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/bootstrap/listaBodegasAdmin.jsp");
        requestDispatcher.forward(request,response);
    }
}
