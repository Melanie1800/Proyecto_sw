<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BCliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inicio</title>
    <jsp:include page="header.jsp"/>


</head>
<body>

    <a href="<%=request.getContextPath()%>/ClienteServlet2?accion=registrar" class="btn btn-danger">Registrar</a>
    <a href="<%=request.getContextPath()%>/ClienteServlet2?accion=editar&dniC=<%= "71622115" %>" class="btn btn-success">Editar Perfil</a>
    <a href="<%=request.getContextPath()%>/ClienteServlet2?accion=distritos" class="btn btn-success">distritos</a>

</body>
</html>
