<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="Beans.BlistaPedidos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaPedidos" type="java.util.ArrayList<Beans.BlistaPedidos>" scope="request"/>
<!--Me ahora usar el comando de arriba -->

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="/bootstrap/header.jsp"/>
    <title>Lista Pedidos (Cliente)</title>
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

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="clienteListaBodegas.html">
                <i class="fa fa-plus"></i>
                <span>Nuevo Pedido</span></a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left" href="clienteHistorialpedido.html">
                <i class="fa fa-table"></i>
                <span>Historial de Pedidos</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link ollapsed text-lg-left" href="clienteEditarPerfil.html">
                <i class="fas fa-edit"></i>
                <span>Editar Perfil</span></a>
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
                <h2 class="navbar-dark mb-1 text-gray-800"><strong><strong>EDITAR PEDIDO</strong></strong></h2>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="login.html" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Usuario</span>
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

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Filters-->
                <style>
                    .navbar-custom {
                        background-color: #36b9cc !important;
                    }
                </style>
                <div class="card-body">
                    <nav class="navbar-light pb-4">
                        <form class="row">
                            <div class="col-md-3 col-sm-12 pt-2 pb-2">
                                <input id="input-search" class="form-control" type="search" placeholder="Codigo:"
                                       aria-label="Search">
                            </div>
                            <div class="col-md-3 col-sm-12 pt-2 pb-2">

                                <select id="inputDistrito" class="form-control">
                                    <option>Distrito</option>
                                    <
                                    <option>Ancón</option>
                                    <option>Ate Vitarte</option>
                                    <option>Barranco</option>
                                    <option>Breña</option>
                                    <option>Carabayllo</option>
                                    <option>Chaclacayo</option>
                                    <option>Chorrillos</option>
                                    <option>Cieneguilla</option>
                                    <option>Comas</option>
                                    <option>El Agustino</option>
                                    <option>Independencia</option>
                                    <option>Jesús María</option>
                                    <option>La Molina</option>
                                    <option>La Victoria</option>
                                    <option>Lima</option>
                                    <option>Lince</option>
                                    <option>Los Olivos</option>
                                    <option>Lurigancho</option>
                                    <option>Lurín</option>
                                    <option>Magdalena del Mar</option>
                                    <option>Miraflores</option>
                                    <option>Pachacamac</option>
                                    <option>Pucusana</option>
                                    <option>Pueblo Libre</option>
                                    <option>Puente Piedra</option>
                                    <option>Punta Hermosa</option>
                                    <option>Punta Negra</option>
                                    <option>Rímac</option>
                                    <option>San Bartolo</option>
                                    <option>San Borja</option>
                                    <option>San Isidro</option>
                                    <option>San Juan de Lurigancho</option>
                                    <option>San Juan de Miraflores</option>
                                    <option>San Luis</option>
                                    <option>San Martín de Porres</option>
                                    <option>San Miguel</option>
                                    <option>Santa Anita</option>
                                    <option>Santa María del Mar</option>
                                    <option>Santa Rosa</option>
                                    <option>Santiago de Surco</option>
                                    <option>Surquillo</option>
                                    <option>Villa el Salvador</option>
                                    <option>Villa María del Triunfo</option>
                                </select>

                            </div>
                            <div class="col-md-3 col-sm-12 pt-2 pb-2">
                                <input id="input-bodega" class="form-control" type="search" placeholder="Nombre bodega:"
                                       aria-label="Search">
                            </div>
                            <div class="col-md-3 col-sm-12 pt-2 pb-2">

                                <select id="inputEstado" class="form-control">
                                    <div>
                                        <option>Estado</option>
                                    </div>
                                    <option>ENTREGADO</option>
                                    <option>PENDIENTE</option>
                                    <option>CANCELADO</option>
                                </select>

                            </div>
                        </form>
                    </nav>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Pedido</h6>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered"  width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Codigo </th>
                                    <th>Bodega</th>
                                    <th>Distrito</th>
                                    <th>Direccion</th>
                                    <th>Estado</th>
                                    <th>Monto</th>
                                    <th>Valoracion</th>
                                    <th>Cancelar/Visualizar</th>

                                </tr>
                                </thead>

                                <tbody>
                                <% for (BlistaPedidos blistaPedidos : listaPedidos) { %>
                                <tr>
                                    <td><%=  blistaPedidos.getCodigoPedido()%>
                                    </td>
                                    <td><%=  blistaPedidos.getNombreBodega()%>
                                    </td>
                                    <td><%=  blistaPedidos.getNombreDistrito()%>
                                    </td>
                                    <td><%=  blistaPedidos.getDireccion()%>
                                    </td>
                                    <td><%=  blistaPedidos.getEstado()%>
                                    </td>
                                    <td><%=  blistaPedidos.getMonto()%>
                                    </td>
                                    <td class="d-flex justify-content-center align-items-center">
                                        <a class="btn btn-danger btn-circle" data-toggle="modal"
                                           href="#valoracionModal">
                                            <i class="fas fa-check-square"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a data-toggle="modal" href="#cancelPedido"
                                           class="btn btn-danger btn-circle align">
                                            <i class="fas fa-lock"></i>
                                        </a>
                                        <a href="rellarconlodeAli.html" class="btn btn-info btn-circle">
                                            <i class="fas fa-info-circle"></i>
                                        </a>
                                    </td>
                                </tr>
                                <% } %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->


<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
    <!-- Cancelar Pedido -->
    <div class="modal fade" id="cancelPedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Cancelar Pedido</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">¿Estás seguro de cancelar su pedido?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No</button>
                    <a class="btn btn-primary" href="clienteHistorialpedido.html">Si</a>
                </div>
            </div>
        </div>
    </div>
<!-- Alerta cierre sesion-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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
    <!-- Alerta modal valoracion -->
    <div class="modal fade" id="valoracionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Califica a esta bodega</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer justify-content-center">
                    <a class="btn btn-primary" href="clienteHistorialpedido.html">1</a>
                    <a class="btn btn-primary" href="clienteHistorialpedido.html">2</a>
                    <a class="btn btn-primary" href="clienteHistorialpedido.html">3</a>
                    <a class="btn btn-primary" href="clienteHistorialpedido.html">4</a>
                    <a class="btn btn-primary" href="clienteHistorialpedido.html">5</a>
                </div>
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
<script src="bootstrap/pvendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="bootstrap/js/demo/datatables-demo.js"></script>


</body>
</html>
