
<%@ page import="Beans.BProductosCliente" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Diego
  Date: 5/11/2020
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<BProductosCliente> lista_productos_cliente = (ArrayList<BProductosCliente>) request.getAttribute("lista");

%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Productos Cliente</title>

    <!-- Custom fonts for this template-->
    <link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!--Custom styles for this template -->
    <link type="text/css" href="../webapp/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="bootstrap/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>


    <!--Custom styles for this page-->
    <link href="bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


</head>
<body>
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav navbar-custom sidebar sidebar-dark accordion" id="accordionSidebar">
        <text class="sidebar-brand d-flex align-items-center justify-content-center">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-store"></i>
            </div>
            <div class="sidebar-brand-text mx-3"><strong></strong>CLIENTE<strong></strong></div>
        </text>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Productos -->
        <li class="nav-item">
            <a class="nav-link text-lg-left" href="tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Tienda</span></a>
        </li>


        <!-- Heading
        <div class="sidebar-heading">
          Interface
        </div>-->

        <!-- Registrar Productos -->
        <li class="nav-item">
            <a class="nav-link text-lg-left" href="RegistroProducto.html">
                <i class="fas fa-fw fa-plus"></i>
                <span>Nuevo Pedido</span>
            </a>
        </li>


        <!-- Ver Pedidos -->
        <li class="nav-item">
            <a class="nav-link text-lg-left" href="historialPedidos.html">
                <i class="fas fa-fw fa-eye"></i>
                <span>Ver mis Pedidos</span></a>
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
                <h2 class="navbar-dark mb-1 text-gray-800"><strong><strong>PRODUCTOS</strong></strong></h2>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Joham Romucho</span>
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
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="2">
                        <!-- EDITAR ACA -->

                        <th>
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="1">
                                <!-- EDITAR ACA -->
                                <thead>
                                <tr>
                                    <th>
                                        <div style=text-align:center>Nombre Producto</div>
                                    </th>
                                    <th>
                                        <div style=text-align:center>Descripción</div>
                                    </th>
                                    <th>
                                        <div style=text-align:center>Foto</div>
                                    </th>
                                    <th>
                                        <div style=text-align:center>Precio Unitario</div>
                                    </th>
                                    <th>
                                        <div style=text-align:center>Agregar al carrito</div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                    <%
               for (BProductosCliente productos : lista_productos_cliente) {
                            %>
                                <tr>
                                    <td><%=productos.getNombre()%>
                                    </td>
                                    <td><div><%=productos.getDescripcion()%></div>
                                    </td>
                                    <td ><div align="center"><img src="https://www.chedraui.com.mx/medias/7501055302925-00-CH1200Wx1200H?context=bWFzdGVyfHJvb3R8MTAxODk3fGltYWdlL2pwZWd8aDliL2gxOS8xMDE1MDY0NzI2NzM1OC5qcGd8NDE4ZDZkYzVmYjEwYTNjMzczOWQ2Y2JiNTU1NjM0ODA5NTViMWNkN2UwNjJmZGEwNGExNjRhYjYwM2Q1NjQ0NA" style="width:100px;height:100px;" /></div></td>
                                    <td ><div style=text-align:center > <%="S/"+productos.getPrecioUnitario()%></div>
                                    </td>
                                    <td><div class="input-group" style="text-align: center; margin-top: 8%" >
                                        <input type="number" min="0" max="50"  placeholder="0" size="2" maxlength="2">
                                        <input type="Submit" STYLE="background-color: #fd7e14; border-radius: 10%" value="Agregar">
                                    </div></td>
                                    <%
                                        }
                                    %>

                                </tr>

                            </table>
                        </th>
                        <th>
                            <h4>Carrito de Compras</h4>
                            <table class="table table-bordered" width="50%" cellspacing="1">
                                <!-- EDITAR ACA -->
                                <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
                                    <th>Eliminar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a>Gaseosa Coca Cola</a></td>
                                    <td>2</td>
                                    <td>S/.9.00</td>
                                    <td><a class="btn btn-circle btn-danger" href="">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                    </td>
                                </tr>
                                <td><a>Arroz RompeOlla</a></td>
                                <td>7</td>
                                <td>S/.12.60</td>
                                <td><a class="btn btn-circle btn-danger" href="">
                                    <i class="fas fa-trash"></i>
                                </a>
                                </td>
                                </tr>
                                <td><a>Chicle Chi Chiste</a></td>
                                <td>1</td>
                                <td>S/.2.40</td>
                                <td><a class="btn btn-circle btn-danger" href="">
                                    <i class="fas fa-trash"></i>
                                </a>
                                </td>
                                </tr>
                                <td><a>Lavavajilla Ayudin</a></td>
                                <td>3</td>
                                <td>S/.4.50</td>
                                <td><a class="btn btn-circle btn-danger" href="">
                                    <i class="fas fa-trash"></i>
                                </a>
                                </td>
                                </tr>
                                <tr class="background-color">
                                    <td BGCOLOR="#F9E79F">Total:</td>
                                    <td BGCOLOR="#F9E79F">S/.28.50</td>
                                </tr>
                                </tbody>


                            </table>
                            <div style="text-align: right;">
                                <button class="btn-primary" href=""><i type="button btn-primary">
                                    Continuar... </i></button>
                            </div>


                        </th>
                    </table>

                    <!-- /.container-fluid -->
                    <!-- End of Main Content -->
                </div>
                <!-- End of Content Wrapper -->
                <style>
                    .navbar-custom {
                        background-color: #36b9cc !important;
                    }
                </style>
            </div>
        </div>
        <!-- End of Page Wrapper -->
        <!-- Modal advertencia eliminar -->
        <div class="modal fade" id="Modal-eliminar" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Está seguro que desea eliminar
                            producto?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar
                        </button>
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
    <script src="js/demo/datatables-demo.js"></script>
</div>
</div>
</body>
</html>