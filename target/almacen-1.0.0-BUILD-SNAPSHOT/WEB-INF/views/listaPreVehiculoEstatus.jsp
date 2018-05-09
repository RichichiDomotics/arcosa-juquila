<%--
  Created by IntelliJ IDEA.
  User: jolvera
  Date: 11/11/2014
  Time: 10:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/views/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/entrada.css" />
<section class="contenido-forma-vigilancia">
    <h3 id="item_name"><fmt:message key="pre_entradas_lista.subtitle"/></h3>
    <table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
        <thead>
        <tr role="row">
            <th>Cliente</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Operador</th>
            <th>Placas</th>
            <th>Veh&iacute;culo</th>
            <th>Peso</th>
            <th>Maniobra</th>
            <th>Planta</th>
            <th>Puerta</th>
        </tr>
        </thead>
        <c:forEach items="${registros}" var="e">
            <tbody aria-relevant="all" aria-live="polite" role="alert"><tr class="odd">
                <td class="center  sorting_1">${e[1].idCliente} ${e[1].nombreCliente}</td>
                <td class="center  sorting_1">
                    <fmt:parseDate value="${e[0].fechaEntrada}" var="parsedEmpDate" pattern="yyyy-MM-dd" />
                    <fmt:formatDate pattern="dd-MM-yyyy" value="${parsedEmpDate}" />
                </td>
                <td class="center  sorting_1">${e[0].horaEntrada}</td>
                <td class="center  sorting_1">${e[0].nombreOperador}</td>
                <td class="center  sorting_1">${e[0].placasVehiculo}</td>
                <td class="center  sorting_1">${e[0].tipoProducto}</td>
                <td class="center  sorting_1"><fmt:formatNumber value="${e[0].peso}" maxFractionDigits="2"/></td>
                <td class="center  sorting_1">${e[0].maniobraCargaDescarga}</td>
                <td class="center  sorting_1">${e[0].planta}</td>
                <td class="center  sorting_1">${e[0].puerta}</td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</section>
