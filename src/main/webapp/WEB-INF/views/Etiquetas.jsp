<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<style>
    .etiqueta-container{
        width:10cm;
        height:7.5cm;
        margin:0 auto;
        border:1px solid rgb(22, 22, 22);
        padding: 20px;
        border-radius: 10px;
        font-size:12px;
        position: relative;
    }

    .cliente{
        width:100%;position: relative;
    }
    .wrap-cliente{
        width:70%;
        position: relative;
        left: 0;
        top: 0;
    }
    .cliente-id{

        font-size:15px;
        font-weight: 600;
        margin-bottom:10px;
    }
    .codigo-barras{
        width: 28%;
        height: 60px;
        position: absolute;
        right: 0;
        top: 0;
    }
    .codigo-barras img{
        width:100%;
        height: auto;
    }
    .producto-nombre{
        font-weight: 600;
        font-size:12px;
    }

    .producto-cad{
        font-size:10px;
    }
    .body-etq{
        /*margin-top:10px;*/
        position: relative;
    }
    .wrap-qr{
        width:48%;
        display: block;
        position: relative;
    }
    .cont-qr{
        width: 100%;
    }
    .wrap-info{
        position: absolute;
        right: -50px;
        top: 0;
        width: 50%;
    }
    .titulo-ubi{
        font-size:16px;
        font-weight:600;
        margin-bottom:5px;
    }
    .cont-qr img{
        width:96%;
        height: auto;
    }
    .fecha-inicio{font-size:10px;}
    .row{
        /*margin-bottom:10px;*/
    }
    .cont-name{
        font-size:14px;
        font-weight: 600;
    }
    .cont-33{
        display: inline-block;
        margin-right: 10px;
        width: 45px;
    }
    .id-qr{
        font-weight:600;
    }
    .cont-5{
        display:inline-block;
        width: 49%;
    }
    .cont-33:last-child{
        margin-right:0;
    }
    @media print{
        @page {
            size: 10cm 7.5cm; /* landscape */
            margin: 0;

        }

        .wrapper{
            display: none;
        }
        .nav{
            display: none;
        }
        .nav .nav-tabs{
            display: none;
        }

        #primera_parte{
            display: none;
        }
        #tercera_parte{
            display: none;
        }
        .footer{
            display: none;
        }
        .titulo{
            display: none;
        }
        .etiqueta-container{
            width:10cm;
            height: 8cm;
            display: block;
            border:none;
            padding: 0px;
            margin-left: 0px;
        }
        .wrap-info{
            position: absolute;
            right: -20px;
            top: -10px;
            width: 50%;
        }

    }

</style>
<c:forEach var="i" begin="1" end="${tarimas}">
    <div class="etiqueta-container">

        <div class="cliente">
            <div class="wrap-cliente">
                <div class="cliente-id">
                    ${idCliente}
                </div>
                <div class="producto-nombre">
                    ${producto}
                </div>
                <div class="producto-cad">
                    Cad. ${caducidad}
                </div>
            </div>
            <!--div class="codigo-barras">
                <img src="img/barras.png" alt="">
            </div-->
        </div>
        <div class="body-etq">
            <div class="wrap-qr">
                <div class="cont-qr">
                    <img src="${qrurl}FN%3ATARIMA%20NUMERO%3A${i}&size=368x368" alt="">
                </div>
                <div class="idEtiqueta">
                    <div class="id-qr">
                        ${rd}.${alergeno}.${i}
                    </div>
                    <div class="fecha-inicio">
                        ${now}
                    </div>
                </div>
            </div>
            <div class="wrap-info">
                <div class="row">
                    <div class="cont-33">
                        <div class="cont-tit">
                            RD
                        </div>
                        <div class="cont-name">
                            ${rd}
                        </div>
                    </div>
                    <div class="cont-33">
                        <div class="cont-tit">
                            Alergeno
                        </div>
                        <div class="cont-name">
                            ${alergeno}
                        </div>
                    </div>
                    <div class="cont-33">
                        <div class="cont-tit">
                            Maquila
                        </div>
                        <div class="cont-name">
                            ${maquila}
                        </div>
                    </div>
                </div>
                <div class="titulo-ubi">
                    Ubicaci&oacute;n
                </div>
                <div class="row">
                    <div class="cont-33">
                        <div class="cont-tit">
                            Planta
                        </div>
                        <div class="cont-name">
                            2
                        </div>
                    </div>
                    <div class="cont-33">
                        <div class="cont-tit">
                            Lado
                        </div>
                        <div class="cont-name">
                            A
                        </div>
                    </div>
                    <div class="cont-33">
                        <div class="cont-tit">
                            Pasillo
                        </div>
                        <div class="cont-name">
                            3
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="cont-33">
                        <div class="cont-tit">
                            Fila
                        </div>
                        <div class="cont-name">
                            2
                        </div>
                    </div>
                    <div class="cont-33">
                        <div class="cont-tit">
                            Posici&oacute;n
                        </div>
                        <div class="cont-name">
                            4
                        </div>
                    </div>
                    <div class="cont-33">
                        <div class="cont-tit">
                            Nivel
                        </div>
                        <div class="cont-name">
                            5
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="cont-5">
                        <div class="cont-tit">
                            Lote
                        </div>
                        <div class="cont-name">
                            ${lote}
                        </div>
                    </div>
                    <div class="cont-5">
                        <div class="cont-tit">
                            Peso total
                        </div>
                        <div class="cont-name">
                            ${peso}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
