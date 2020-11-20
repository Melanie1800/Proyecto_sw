<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BPedidos" %>
<%@ page import="Beans.BPedidos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<BPedidos> listaPedidosBodega = (ArrayList<BPedidos>) request.getAttribute("listaPedidosBodega");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pedidos</title>

    <!-- Custom fonts for this template-->
    <link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!--Custom styles for this template -->
    <link type="text/css" href="css/sb-admin-2.min.css" rel="stylesheet">

    <link href="bootstrap/css/sb-admin-2.min.css"rel="stylesheet" type="text/css"/>

    <!--Custom styles for this page-->
    <link href="bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body>
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <text class="sidebar-brand d-flex align-items-center justify-content-center">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-store"></i>
            </div>
            <div class="sidebar-brand-text mx-3"><strong></strong>BODEGA<strong></strong></div>
        </text>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Productos -->
        <li class="nav-item">
            <a class="nav-link text-lg-left" href="tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Productos</span></a>
        </li>


        <!-- Heading
        <div class="sidebar-heading">
          Interface
        </div>-->

        <!-- Registrar Productos -->
        <li class="nav-item">
            <a class="nav-link text-lg-left" href="RegistroProducto.html">
                <i class="fas fa-fw fa-plus"></i>
                <span>Registrar Producto</span>
            </a>
        </li>



        <!-- Ver Pedidos -->
        <li class="nav-item">
            <a class="nav-link text-lg-left" href="historialPedidos.html">
                <i class="fas fa-fw fa-eye"></i>
                <span>Ver Pedidos</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

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
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>
                <h2 class="navbar-dark mb-1 text-gray-800"><strong><strong>PEDIDOS</strong></strong></h2>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Doña Pepa</span>
                            <i class="fas fa-user-alt"></i>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Cerrar Sesión
                            </a>
                        </div>
                    </li>
                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class='container-fluid'>
                <h1 class='mb-3'>Lista de Pedidos</h1>
                <table class="table table-bordered"  width="100%" cellspacing="0">
                    <tr>
                        <th>Codigo de Pedido</th>
                        <th>Fecha de Entrega</th>
                        <th>Estado</th>
                        <th>Monto Total</th>
                        <th>DNI del Cliente</th>
                    </tr>
                    <% for (BPedidos pedido: listaPedidosBodega) { %>
                    <tr>
                        <td><%=pedido.getCodigoPedido()%></td>
                        <td><%=pedido.getFechaEntrega()%> <%=pedido.getHoraRecojo()%></td>
                        <td><%=pedido.getEstado()%></td>
                        <td><%=pedido.getMonto()%></td>
                        <td><%=pedido.getCliente_dni()%></td>
                    </tr>
                    <% }%>


                </table>
            </div>
            <!-- /.container-fluid -->
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    <!-- Modal advertencia eliminar -->
    <div class="modal fade" id="Modal-eliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Está seguro que desea eliminar producto?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="tables.html">Sí</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

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
