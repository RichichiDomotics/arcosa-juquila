<%--
  Created by IntelliJ IDEA.
  User: jolvera
  Date: 03/09/2014
  Time: 10:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/views/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title></title>
</head>
<script>
    $(document).ready(function() {
        $(".salidaVehiculobtn").click(function(){
            idVehiculo = $(this).attr("idVehiculo");
            tipoEntradaSalida = $(this).attr("tipoEntradaSalida");
            fleje = "";
            causa= $("#"+idVehiculo+"1").val();
            alert(causa);
            if(tipoEntradaSalida=="1112"){
                if($("#"+idVehiculo).val()==""){
                    alert("favor de ingresar el fleje de salida");
                    $("#"+idVehiculo).focus();
                    return false;
                }else{
                    fleje = $("#"+idVehiculo).val();
                }
            }

            cambiaFleje(idVehiculo,fleje,causa);
            //consultaProspectoId = $(this).attr("consultaProspectoId")
            //agregarCliente(idProspecto,consultaProspectoId);
        });

        cambiaFleje = function(idVehiculo,fleje,causa){
            $.ajax("ae_SalidaAutoriza?idVehiculo="+idVehiculo+"&fleje="+fleje+"&causa="+causa, {
                "type": "GET",
                "beforeSend": function() {
                    $("#buscaProspectodiv").css("font-size","27px");
                    $("#buscaProspectodiv").html('Cargando ...');
                },
                "success": function(result){
                    $("#buscaProspectodiv").css("font-size","14px");
                    $("#buscaProspectodiv").html(result);
                    return false;
                },
                "error": function(result) {
                    alert("Error al recuperar la información", result);
                    //showAlert("Error al recuperar la información", result);
                },
                "data": {},
                "async": true
            });
        }

        /* $("input[name=causa]").click(function () {
<c:forEach items="${causas}" var="c">
                    <c:if test="${c.imputable=='C'}">
                    $("#causas").attr("<option value='${c.id}'>${c.descripcion}</option>");
                    </c:if>
                    </c:forEach>
                }else{
            <c:forEach items="${causas}" var="c">
            <c:if test="${c.imputable=='A'}">
            $("#causas").attr("<option value='${c.id}'>${c.descripcion}</option>");
            </c:if>
            </c:forEach>

    });  if($('input:radio[name=edad]:checked').val() == 1){*/



    });

</script>
<div id="buscaProspectodiv">
    <body>
    <h1 id="item_name">Salida de Vehiculos</h1>
    <h3 id="item_name">Registro de salida</h3>
    <table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
        <thead>
        <tr role="row">
            <th>Tipo Vehiculo</th>
            <th>Placas</th>
            <th>Cliente</th>
            <th>Nombre Operador</th>
            <th>Empresa</th>
            <td>Fleje Salida</td>
            <td>Causa Retaso</td>
            <th></th>
        </tr>
        </thead>
        <c:set var="contador" value="0" />
        <tbody aria-relevant="all" aria-live="polite" role="alert"><tr class="odd">
            <c:forEach items="${vehiculos}" var="v">
            <td>${(v[1]).descripcion}</td>
            <td>${(v[0]).placasVehiculo}</td>
            <td>${(v[0]).idCliente} ${(v[2]).nombreCliente}</td>
            <td>${(v[0]).nombreOperador}</td>
            <td>${(v[0]).nombreCiaTransporte}</td>
            <c:set var="tipoRec" value="${v[0].idTipoRecibo}"/>
            <c:if test="${tipoRec >= 1112}">
                <td><input type="text" id="${v[0].idIngresoVehiculo}" name="${v[0].idIngresoVehiculo}" value=""></td>
            </c:if>
            <c:if test="${tipoRec <= 1111}">
                <td></td>
            </c:if>
            <td><div class="controls">
                <!--label>
                    <input name="form-field-radio causa" type="radio" id="causa1" value="1"/>
                    <span class="lbl">Imputable a Cliente</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="form-field-radio causa" type="radio" id="causa2" value="2"/>
                    <span class="lbl">Imputable a Empresa</span>
                </label-->

                <select id="${v[0].idIngresoVehiculo}1"  name="causas" value='' class="form-control causas" required>
                    <option value="" >Seleccione una opci&oacute;n</option>
                    <c:forEach items="${causas}" var="c">
                        <option value="${c.descripcion}">${c.descripcion}</option>
                    </c:forEach>
                </select>

                <!--label>
                    <input name="form-field-radio empresa" type="radio" />
                    <span class="lbl">Imputable a Empresa</span>
                </label-->
            </div></td>
            <td>
                <button class="btn btn-minier btn-primary salidaVehiculobtn" tipoEntradaSalida="${v[0].idTipoRecibo}" idVehiculo="${v[0].idIngresoVehiculo}">Dar Salida</button>
                <!--a href="ae_SalidaAutoriza?idVehiculo=${v[0].idIngresoVehiculo}"><b>DAR SALIDA</b></a-->
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    </body>
</div>
</html>

