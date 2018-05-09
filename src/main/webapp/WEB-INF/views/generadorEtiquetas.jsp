<%@ include file="/WEB-INF/views/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css"	href="resources/bootstrap/css/capturaDetalle.css" />
<style>
    .bloqueforma {
        display: block;
        width: 290px;
        float: left;
    }
</style>
<script type="text/javascript">
    function imprSelec(imp)
    {
        var contenido= document.getElementById(imp).innerHTML;
        var contenidoOriginal= document.body.innerHTML;

        document.body.innerHTML = contenido;

        window.print();

        document.body.innerHTML = contenidoOriginal;
    }
    $(document).ready(function () {
        var qrUrlStart = 'https://api.qrserver.com/v1/create-qr-code/?data=BEGIN%3AVCARD%0AVERSION%3A2.1%0A';
        var qrUrlEnd = 'END%3AVCARD%0A';
        $("#imprimir").hide();
        $("#siguiente").click(function () {
            var idCliente=$("#idCliente").val();
            var idClienteVal= 'FN%3ACLIENTE%3A'+idCliente+'%0A';
            var rd=$("#rd").val();
            var rdVal='FN%3ARD%3A'+rd+'%0A';
            var tarimas=$("#tarimas").val();
            var alegerno=$("#tipoProducto").val();
            var alergenoVal='FN%3AALERGENO%3A'+alegerno+'%0A';
            var maquila="";
            if($("#maquila").prop('checked')){
                maquila="SI";
            }else {
                maquila="NO";
            }
            var maquilaVal='FN%3AMAQUILA%3A'+maquila+'%0A';
            var idalmacenista=$("#idalmacenista").val();
            var idalmacenistaVal='FN%3AALMACENISTA%3A'+idalmacenista+'%0A';
            var tif="";
            if($("#tif").prop('checked')){
                tif="SI";
            }else {
                tif="NO";
            }
            var tifVal='FN%3ATIF%3A'+tif+'%0A';
            var usuario=$("#nombre").val();
            var usuarioVal='FN%3AUSUARIO%3A'+usuario+'%0A';
            var fecha=$("#fecha").val();
            var fechaVal='FN%3AFECHA%3A'+fecha+'%0A';
            var producto=$("#producto").val();
            var productoVal='FN%3APRODUCTO%3A'+producto+'%0A';
            var lote=$("#lote").val();
            var loteVal='FN%3ALOTE%3A'+lote+'%0A';
            var caducidad=$("#caducidad").val();
            var caducidadVal='FN%3ACADUCIDAD%3A'+caducidad+'%0A';
            var peso=$("#peso").val();
            var pesoVal='FN%3APESO%3A'+peso+'%0A';
            var qrurl= qrUrlStart+idClienteVal+rdVal+productoVal+loteVal+caducidadVal+pesoVal+alergenoVal+maquilaVal+idalmacenistaVal+tifVal+usuarioVal+fechaVal;
            $.ajax("Etiquetas",{
                "type": "POST",
                "success": function (result) {
                    $("#result").html(result);
                    $("#imprimir").show();
                },
                "error": function (data) {
                    $("#result").html(data);
                },
                "data":{idCliente:idCliente,rd:rd,tarimas:tarimas,producto:producto,lote:lote,caducidad:caducidad,peso:peso,alergeno:alegerno,maquila:maquila,idalmacenista:idalmacenista,tif:tif,usuario:usuario,qrurl:qrurl},
                "async":true
            });
            /*for(i=1;i<=tarimas;i++){
                var image='<div class="qr-out row"><img class="qr-img" alt="" src="'+qrurl+'FN%3ATARIMA%20NUMERO%3A'+i+'%0A"></div>';
                //var vcard='<div class="biscard-out"><div class="biscard-img"><h3>'+nomcliente+'</h3></div>';
                $("#result").before(image);
            }*/
        });
    });
</script>
<div class="page-content">
    <div class="page-header position-relative titulo">
        <h1>Generador de Etiquetas
            <small>
                <i class="icon-double-angle-right"></i>
                Apartado para la creaci&oacute;n e impresi&oacute;n de Etiquetas
            </small>
        </h1>
    </div>
    <section class="container">
        <section class="grupodedatos">
                <div class="bloqueforma">
                    <div class="row" id="primera_parte">
                        <div class="control-group col-sm-3">
                            <label for="idCliente">Cliente</label>
                            <select id="idCliente" name="idCliente" value='' class="form-control" required>
                                <option value="" > <fmt:message key="inventarios.select.cliente"/> </option>
                                <c:forEach items="${clientes}" var="client">
                                    <option value="${client.idCliente} ${client.nombreCliente}"> <c:out value="${client.idCliente} ${client.nombreCliente}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="RD">RD</label>
                            <br>
                            <input type="text" class="form-control" id="rd">
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="tarimas">Numero de Tarimas</label>
                            <br>
                            <input type="number" class="form-control" id="tarimas" max="100">
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="producto">Producto</label>
                            <br>
                            <input type="text" class="form-control" id="producto">
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="lote">Lote</label>
                            <br>
                            <input type="text" class="form-control" id="lote">
                        </div>
                    </div>
                </div>
                <!--div class="bloqueforma">
                    <div class="row" id="segunda_parte">
                        <div id="resultado"></div>
                        <div class="control-group col-sm-3" id="continuar"><button type="button" class="btn btn-primary btn-small" id="continue">Continuar</button></div>
                    </div>
                </div-->
                <div class="bloqueforma">
                    <div class="row" id="tercera_parte">
                        <div class="control-group col-sm-3">
                            <label for="tipoProducto">Alergeno: </label>
                            <br>
                            <select id="tipoProducto" name="tipoProducto" value='' class="form-control" required>
                                <option value="AL">Leche</option>
                                <option value="AH">Huevo</option>
                                <option value="AC">Cacahuate</option>
                                <option value="AN">Nueces</option>
                                <option value="AP">Pescados</option>
                                <option value="AM">Mariscos</option>
                                <option value="AS">Soya</option>
                                <option value="AT">Trigo</option>
                                <option value="N/A">No aplica</option>
                            </select>
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="maquila">Maquila: <input id="maquila" name="maquila" class="ace-switch ace-switch-5" type="checkbox" value="SI"><span class="lbl"></span></label>
                        </div>
                        <input type="hidden" value="${now}" id="fecha">
                        <div class="control-group col-sm-3">
                            <label for="idalmacenista">Almacenista</label>
                            <br>
                            <input type="text" class="form-control" id="idalmacenista">
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="tif">TIF: <input id="tif" name="tif" class="ace-switch ace-switch-5" type="checkbox" value="SI"><span class="lbl"></span></label>
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="caducidad">Caducidad</label>
                            <br>
                            <input type="text" class="form-control" id="caducidad">
                        </div>
                        <div class="control-group col-sm-3">
                            <label for="peso">Peso Total de la Tarima</label>
                            <br>
                            <input type="text" class="form-control" id="peso">
                        </div>
                        <input type="hidden" id="nombre" value="${usuario}">
                        <div class="control-group col-sm-3" id="next">
                            <button type="button" class="btn btn-primary btn-small" id="siguiente">Generar</button>
                        </div>
                    </div>
                </div>
        </section>
    </section>
</div>
<div id="result"></div>
<a href="javascript:imprSelec('result')" class="btn btn-primary btn-small" id="imprimir">Imprimir</a>

