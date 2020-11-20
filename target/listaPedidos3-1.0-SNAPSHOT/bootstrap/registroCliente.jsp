<%@ page import="Beans.BCliente" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList <BCliente> listaDistritos=  (ArrayList<BCliente>)request.getAttribute("listaDistritos");  %>
<%
BCliente cliente= new BCliente();


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

    boolean valDniLong = request.getAttribute("valDniLong") != null ?
            ((boolean) request.getAttribute("valDniLong")) : true;

    boolean valDniVacio = request.getAttribute("valDniVacio") != null ?
            ((boolean) request.getAttribute("valDniVacio")) : true;

    boolean valDniExiste = request.getAttribute("valDniExiste") != null ?
            ((boolean) request.getAttribute("valDniExiste")) : true;
    boolean valDniNum = request.getAttribute("valDniNum") != null ?
            ((boolean) request.getAttribute("valDniNum")) : true;

    boolean valDistrito = request.getAttribute("valDistrito") != null ?
            ((boolean) request.getAttribute("valDistrito")) : true;

    boolean valEmail = request.getAttribute("valEmail") != null ?
            ((boolean) request.getAttribute("valEmail")) : true;

    boolean valEmailVacio = request.getAttribute("valEmailVacio") != null ?
            ((boolean) request.getAttribute("valEmailVacio")) : true;

    boolean valEmailExiste = request.getAttribute("valEmailExiste") != null ?
            ((boolean) request.getAttribute("valEmailExiste")) : true;

    boolean valcontra1Vacio = request.getAttribute("valcontra1Vacio") != null ?
            ((boolean) request.getAttribute("valcontra1Vacio")) : true;

    boolean valcontra2Vacio = request.getAttribute("valcontra2Vacio") != null ?
            ((boolean) request.getAttribute("valcontra2Vacio")) : true;

    boolean valcontraIguales = request.getAttribute("valcontraIguales") != null ?
            ((boolean) request.getAttribute("valcontraIguales")) : true;

    boolean valcontraLong = request.getAttribute("valcontraLong") != null ?
            ((boolean) request.getAttribute("valcontraLong")) : true;

%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Registro Cliente</title>

    <!-- Custom fonts for this template-->

    <link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

<div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Crea tu cuenta</h1>
                            </div>
                            <form method="POST" action="<%=request.getContextPath()%>/ClienteServlet?accion=crear">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control <%=valNombreLetras && valNombreVacio?"" : "is-invalid"%>" name="nombreC"  id="nombreC"
                                            <%=request.getParameter("nombreC") != null ?"value='"+request.getParameter("nombreC")+"'":""%>
                                               aria-describedby="validationServer03Feedback" placeholder="Nombre..." >
                                        <div id="validationServer03Feedback" class="invalid-feedback">
                                            <%=valNombreLetras && valNombreVacio ?"" : "Los caracteres no son correctos"%>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control <%=valApellidoLetras && valApellidoVacio?"":" is-invalid"%>" name="apellidoC" id="apellidoC"
                                            <%=request.getParameter("apellidoC") != null ?"value='"+request.getParameter("apellidoC")+"'":""%>
                                               aria-describedby="validationServer04Feedback" placeholder="Apellido..." >
                                        <div id="validationServer04Feedback" class="invalid-feedback">
                                            <%=valApellidoLetras && valApellidoVacio?"" : "Los caracteres no son correctos"%>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control <%=(valDniLong && valDniVacio && valDniExiste && valDniNum)?"":" is-invalid"%>" name="dniC"  id="dniC"
                                              placeholder="DNI... "
                                            <%=request.getParameter("dniC") != null ?"value='"+request.getParameter("dniC")+"'":""%>
                                               aria-describedby="validationServer05Feedback" >
                                        <div id="validationServer05Feedback" class="invalid-feedback">

                                            <%=valDniLong && valDniVacio && valDniNum?"" : "No contiene 8 digitos (caracteres incorrectos) "%>

                                            <%=valDniExiste?"" : "El DNI ingresado ya existe"%>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <select class="form-control <%=valDistrito ?"" : "is-invalid"%>"
                                                name="distritoC" id="distritoC"
                                                value="<%=cliente.getNombreDistrito()%>"

                                                aria-describedby="validationServer06Feedback">
                                            <option selected disabled value="0">Distritos Disponibles</option>
                                            <% for (BCliente distrito : listaDistritos){%>
                                            <option  value="<%=distrito.getIdDistrito()%>"
                                                    <%=String.valueOf(distrito.getIdDistrito()).equals(request.getParameter("distritoC")) || cliente.getIdDistrito() == distrito.getIdDistrito() ?  "selected" : "" %>
                                            ><%=distrito.getNombreDistrito()%>
                                            </option>

                                            <% }%>
                                        </select>
                                        <div id="validationServer06Feedback" class="invalid-feedback">
                                            <%=valDistrito  ?"" : "Seleccione un distrito"%>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control <%=valEmail && valEmailVacio && valEmailExiste?"":" is-invalid"%>"
                                        name="emailC"  id="emailC"
                                        <%=request.getParameter("emailC") != null ?"value='"+request.getParameter("emailC")+"'":""%>
                                           aria-describedby="validationServer07Feedback" placeholder="Correo...">
                                    <div id="validationServer07Feedback" class="invalid-feedback" >
                                        <%=valEmail?"" : "los caracteres no son correctos"%>
                                        <%=valEmailVacio?"" : ""%>
                                        <%=valEmailExiste?"" : "Ya se uso este correo"%>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control <%=valcontra1Vacio && valcontraLong?"":" is-invalid"%> " name="contraC" id="contraC"
                                               aria-describedby="validationServer08Feedback" placeholder="Contraseña...">

                                        <div id="validationServer08Feedback" class="invalid-feedback">
                                            <%=valcontraLong||valcontra1Vacio?"" : "la cantidad de caracteres debe ser 8"%>
                                        </div>

                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control <%=valcontra2Vacio && valcontraIguales?"":" is-invalid"%>"name="contraRC" id="contraRC"
                                               aria-describedby="validationServer09Feedback" placeholder="Confirmar contraseña...">
                                        <div id="validationServer09Feedback" class="invalid-feedback">
                                            <%=valcontraIguales?"" : "las contraseñas no coinciden"%>
                                            <%=valcontra2Vacio?"" : " recuadro vacio"%>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" href="<%=request.getContextPath()%>/ClienteServlet" class="btn btn-primary">Registrar</button>
                                <a  class="btn btn-danger" href="<%=request.getContextPath()%>/ClienteServlet?accion=inicio" type="submit">Cancelar</a>

                            </form>

                            <div class="text-center">
                                <a class="small" href="RecuperarContraseña.html">¿Olvidaste tu contraseña?</a>
                            </div>

                        </div>
                    </div>
                </div>
                <script>
                    // Example starter JavaScript for disabling form submissions if there are invalid fields
                    (function() {
                        'use strict';
                        window.addEventListener('load', function() {
                            // Fetch all the forms we want to apply custom Bootstrap validation styles to
                            var forms = document.getElementsByClassName('needs-validation');
                            // Loop over them and prevent submission
                            var validation = Array.prototype.filter.call(forms, function(form) {
                                form.addEventListener('submit', function(event) {
                                    if (form.checkValidity() === false) {
                                        event.preventDefault();
                                        event.stopPropagation();
                                    }
                                    form.classList.add('was-validated');
                                }, false);
                            });
                        }, false);
                    })();
                </script>
            </div>
        </div>

</div>

<!-- Bootstrap core JavaScript-->

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
