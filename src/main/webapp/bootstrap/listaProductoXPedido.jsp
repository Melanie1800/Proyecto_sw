<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="Beans.BlistaProductosXPedido" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaProductosXPedido" type="java.util.ArrayList<Beans.BlistaProductosXPedido>" scope="request"/>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="/bootstrap/header.jsp"/>
    <title>Lista Productos X Pedido (Cliente)</title></head>
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
                <h2 class="navbar-dark mb-1 text-gray-800"><strong><strong>GENERAR PEDIDO</strong></strong></h2>

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
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <style>
                    .navbar-custom {
                        background-color: #36b9cc !important;
                    }
                </style>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Pedido</h6>
                    </div>
                    <!-- Especify Time-->

                    <div class="card-body">

                        <div class="form-group">
                            <label>Fecha de Entrega:</label>
                            <input class="form-control" type="datetime-local" autocomplete="off" />
                        </div>


                        <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Aumentar Productos</th>
                                <th>Quitar Productos</th>

                            </tr>
                            </thead>
                            <tbody>
                            <% for (BlistaProductosXPedido blistaProductosXPedido : listaProductosXPedido) { %>
                            <tr>
                                <td><%=  blistaProductosXPedido.getNombre()%>
                                </td>
                                <td><%=  blistaProductosXPedido.getPrecio()%>
                                </td>
                                <td><%=  blistaProductosXPedido.getCantidad()%>
                                </td>
                                <td>
                                    <!--Aumentar la cantidad de Productos de un pedido-->
                                    <div style="text-align: center"><a data-toggle="modal" href="#anadirProductos"
                                                                       class="btn btn-success btn-circle">
                                        <i class="fas fa-plus"></i>
                                    </a></div>
                                </td>
                                <td>
                                    <!--Restar la cantidad de Productos de un pedido-->
                                    <div style="text-align: center"><a data-toggle="modal" href="#restarProductos"
                                                                       class="btn btn-danger btn-circle">
                                        <i class="fas fa-minus"></i>
                                    </a></div>
                                </td>
                            </tr>
                            <% } %>
                            <tr>
                                <td>Monto Total:</td>
                                <td>S/.72.00</td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="form-check-inline" >

                            <a data-toggle="modal" href="#regresar" class="btn btn-warning btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-arrow-right"></i>
                    </span>
                                <span class="text">Regresar</span>
                            </a>
                        </div>
                        <div class="form-check-inline">

                            <a data-toggle="modal" href="#guardarCambios" class="btn btn-info btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-save"></i>
                    </span>
                                <span class="text">Guardar Cambios</span>
                            </a>
                        </div>
                        <div class="form-check-inline">

                            <a data-toggle="modal" href="#generarPedido" class="btn btn-success btn-icon-split ">
                    <span class="icon text-white-50">
                      <i class="fas fa-check"></i>
                    </span>
                                <span class="text">Generar Pedido</span>
                            </a>
                        </div>
                    </div>


                </div>
                <!--End of Datatables Example -->



            </div>
            <!-- End of page content-->

        </div>
        <!--End of Main content -->


    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

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
<!-- Restar Productos -->
<div class="modal fade" id="restarProductos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Quitar Productos</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Ingrese la cantidad de productos que desea quitar:
                <div class="input-group modal-footer justify-content-center"
                     style="text-align: center; margin-top: 15px">
                    <input type="number" min="0" max="50" placeholder="0" size="2" maxlength="2">
                    <a class="btn btn-primary" href="generarPedido.html">Restar</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Añadir Productos -->
<div class="modal fade" id="anadirProductos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Aumentar Productos</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Ingrese la cantidad de productos a aumentar:
                <div class="input-group modal-footer justify-content-center"
                     style="text-align: center; margin-top: 15px">
                    <input type="number" min="0" max="50" placeholder="0" size="2" maxlength="2">
                    <a class="btn btn-primary" href="generarPedido.html">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mensaje de validación al regresar -->
<div class="modal fade" id="regresar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">Regresar a Comprar</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body"><strong>LOS CAMBIOS QUE SE REALIZÓ SERÁN BORRADOS</strong></div>
            <div class="modal-footer">
                <a class="btn btn-danger" href="clienteProducto.html">Regresar</a>
            </div>
        </div>
    </div>
</div>

<!-- Mensaje de generación de pedido -->
<div class="modal fade" id="generarPedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel4">Código de pedido: 00015201103</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Se generó el Pedido exitosamente</div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="lista_bodegas.html">Terminar Compra</a>
            </div>
        </div>
    </div>
</div>
<!-- Validación de cambios guardados -->
<div class="modal fade" id="guardarCambios" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel5">Guardar cambios</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Los cambios se guardaron exitosamente</div>
            <div class="modal-footer">
                <a class="btn btn-info" href="generarPedido.html">Continuar</a>
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
