<%@ page import="Beans.BCliente" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList <BCliente> listaDistritos=  (ArrayList<BCliente>)request.getAttribute("listaDistritos");  %>

<%
    BCliente bcliente= (BCliente) request.getAttribute("datosCliente");


%>


<%
    boolean valNombreLetras = request.getAttribute("valNombreLetras") != null ?
            ((boolean) request.getAttribute("valNombreLetras")) : true;

    boolean valNombreVacio = request.getAttribute("valNombreVacio") != null ?
            ((boolean) request.getAttribute("valNombreVacio")) : true;

    boolean valApellidoVacio = request.getAttribute("valApellidoVacio") != null ?
            ((boolean) request.getAttribute("valApellidoVacio")) : true;

    boolean valApellidoLetras = request.getAttribute("valApellidoLetras") != null ?
            ((boolean) request.getAttribute("valApellidoLetras")) : true;


    boolean valDistrito = request.getAttribute("valDistrito") != null ?
            ((boolean) request.getAttribute("valDistrito")) : true;


    boolean valcontra1Vacio = request.getAttribute("valcontra1Vacio") != null ?
            ((boolean) request.getAttribute("valcontra1Vacio")) : true;




    boolean verifCliente = request.getAttribute("verifCliente") != null ?
            ((boolean) request.getAttribute("verifCliente")) : true;



%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EditarPerfil</title>

    <!-- Custom fonts for this template-->
    <link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body>
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav navbar-custom sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <text class="sidebar-brand d-flex align-items-center justify-content-center">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-shopping-cart"></i>
            </div>
            <div class="sidebar-brand-text mx-3"><strong></strong>USER XXX<strong></strong></div>
        </text>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left" href="clienteListaBodegas.html">
                <i class="fas fa-plus"></i>
                <span>Nuevo Pedido</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left" href="clienteHistorialpedido.html">
                <i class="fas fa-table"></i>
                <span>Historial de Pedidos</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left" href="clienteEditarPerfil.html">
                <i class="fas fa-edit"></i>
                <span>Editar Perfil</span>
            </a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">


        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <h2 class="navbar-dark mb-1 text-gray-800"><strong><strong>Editar Perfil</strong></strong></h2>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="login.html" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Cliente cliente</span>
                            <i class="fas fa-user-alt"></i>
                        </a>

                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Cerrar Sesión
                            </a>
                        </div>

                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->
            <!-- End of Topbar -->


            <!-- Begin Page Content -->

            <div class="container-fluid">
                <style>
                    .navbar-custom {
                        background-color: #36b9cc !important;
                    }
                </style>
                <!-- Page Heading -->


                    <div class="card-body">
                        <div class="text-xl-left">
                            <div class="container">


                                <!-- formulario -->
                                <div class="row">


                                    <form method="POST" action="<%=request.getContextPath()%>/ClienteServlet?accion=actualizar">
                                        <div class="form-row">

                                            <div class="col-md-7 mb-3">
                                                <label for="dniC">DNI</label>
                                                <input type="text" class="form-control " name="dniC"  id="dniC" value="<%=bcliente.getDniC()%>" readonly=»readonly» >

                                            </div>
                                            <div class="col-md-7 mb-3">
                                                <label for="nombreC">Nombre </label>
                                                <input type="text" class="form-control <%=valNombreLetras && valNombreVacio?"" : "is-invalid"%>" name="nombreC"  id="nombreC"
                                                       value="<%=bcliente.getNombreC()%>"
                                                     <%=request.getParameter("nombreC") != null ?"value='"+request.getParameter("nombreC")+"'":""%>
                                                     aria-describedby="validationServer03Feedback"
                                                        >


                                                <div id="validationServer03Feedback" class="invalid-feedback">
                                                    <%=valNombreLetras && valNombreVacio ?"" : "Los caracteres no son correctos"%>
                                                </div>
                                            </div>

                                            <div class="col-md-7 mb-3">
                                                <label for="apellidoC">Apellido</label>
                                                <input type="text" class="form-control <%=valApellidoLetras && valApellidoVacio?"":" is-invalid"%>" name="apellidoC" id="apellidoC"
                                                       value="<%=bcliente.getApellidoC()%>"


                                                    <%=request.getParameter("apellidoC") != null ?"value='"+request.getParameter("apellidoC")+"'":""%>
                                                       aria-describedby="validationServer04Feedback" >
                                                <div id="validationServer04Feedback" class="invalid-feedback">
                                                    <%=valApellidoLetras && valApellidoVacio?"" : "Los caracteres no son correctos"%>
                                                </div>

                                            </div>
                                            <div class="col-md-7 mb-3">
                                                <label for="distritoC">Distrito</label>
                                                <select class="form-control <%=valDistrito ?"" : "is-invalid"%>"
                                                        name="distritoC" id="distritoC" value="<%=bcliente.getNombreDistrito()%>"

                                                        aria-describedby="validationServer05Feedback">
                                                    <option selected disabled value="0">Distritos Disponibles</option>
                                                    <% for (BCliente distrito : listaDistritos) {%>
                                                    <option  value="<%=distrito.getIdDistrito()%>"
                                                            <%=String.valueOf(distrito.getIdDistrito()).equals(request.getParameter("distrito")) || bcliente.getIdDistrito() == distrito.getIdDistrito() ?  "selected" : "" %>
                                                    ><%=distrito.getNombreDistrito()%>
                                                    </option>

                                                    <% }%>
                                                </select>
                                                <div id="validationServer05Feedback" class="invalid-feedback">
                                                    <%=valDistrito ?"" : "Seleccione un distrito"%>
                                                </div>

                                            </div>

                                            <div class="col-md-7 mb-3">
                                                <label for="contraC">Contraseña</label>
                                                <input type="password" class="form-control <%=valcontra1Vacio && verifCliente?"":" is-invalid"%> " name="contraC" id="contraC"

                                                       aria-describedby="validationServer06Feedback" >
                                                <div id="validationServer06Feedback" class="invalid-feedback">
                                                    <%=valcontra1Vacio?"" : "recuadro vacio"%>
                                                    <%=verifCliente?"" : "|| la contraseña no es correcta"%>
                                                </div>


                                            </div>


                                            <div class="col-md-7 mb-3">
                                                <button type="submit" href="<%=request.getContextPath()%>/ClienteServlet" class="btn btn-primary" >Actualizar  </button>
                                                <a  class="btn btn-danger" href="<%=request.getContextPath()%>/ClienteServlet?accion=bodegas" type="submit">Cancelar</a>
                                                </div>
                                        </div>
                                    </form>
                                </div>
                            </div></div>


                </div>





        </div>

    </div>
    <!-- End of Main Content -->



</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->

<!-- Alerta cierre sesion-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sesión</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Usted esta a punto de salir ¿Desea continuar?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                <a class="btn btn-primary" href="login.html">Cerrar Sesión</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="bootstrap/js/demo/datatables-demo.js"></script>
</body>
</html>