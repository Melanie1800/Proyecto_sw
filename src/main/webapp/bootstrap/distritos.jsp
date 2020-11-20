<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BCliente" %><%--
  Created by IntelliJ IDEA.
  User: MELANIE
  Date: 14/11/2020
  Time: 07:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<BCliente> distritos= (ArrayList<BCliente> )request.getAttribute("listaDistritos"); %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="header.jsp"/>
</head>
<body>
<div  class="container">
<table class="table">


<tr>
    <th># </th>
    <th>distrito </th>

</tr>
<%  int i=1;
    for(BCliente bCliente:distritos){%>
<tr>
    <td><%= i%>   </td>
    <td> <%= bCliente.getNombreDistrito()%>   </td>

</tr>
    <%}%>
</table>
</div>

</body>
</html>
