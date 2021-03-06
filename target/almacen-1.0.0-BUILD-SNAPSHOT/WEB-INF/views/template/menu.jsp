<%@ include file="/WEB-INF/views/include.jsp" %>
<sec:authentication property="authorities" var="roles" scope="page" />
<c:forEach var="role" items="${roles}">
	<c:set var="rolef" value="${role}"/>
</c:forEach>
<script>
	$(document).ready(function(){
		$("#facturas").css("cursor","pointer");
		$("#facturas").click(function(){
			if($("#facturacion").length){
				$("#supdiv").append('<div id="facturacion"></div>')
			}
			//bootbox.dialog($("#facturacion").html("<iframe src='http://"+window.location.hostname+":8100/facturacion' width='100%' height='900px' frameborder='no' tabindex='0'></iframe>")
			//bootbox.dialog($("#facturacion").html("<iframe src='http://"+window.location.hostname+":8087/login.php' width='100%' height='900px' frameborder='no' tabindex='0'></iframe>")
			bootbox.dialog($("#facturacion").html("<iframe src='http://"+window.location.hostname+"/facturacion' width='100%' height='900px' frameborder='no' tabindex='0'></iframe>")
					, [{
						"label" : "Cerrar",
						"class" : "btn-small btn-primary",
						"callback": function() {
							$("#facturacion").html("");
						}
					}]
			).css({"width":"1320px","height":"auto","left":"290px","overflow-y": "hidden"});
		});
	});
</script>

<ul class="nav nav-tabs" >
	<li role="presentation" class="dropdown">
		<a class="dropdown-toggle" href="<c:url value="home"/>" >
			<i class="icon-home fa fa-caret-right  bigger-150"></i>
			<span class="menu-text">Inicio</span>
		</a>
		<b class="arrow"></b>
	</li>
	<c:if test="${(rolef eq 'ROLE_VIGILANTE') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_FACTURACION')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-download-alt  fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Tr&aacute;fico <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="dropdown-menu" role="menu">
				<!--<li class="hover">
					<a href="<c:url value="v_ingresoPreVehiculo"/>">
						<i class="icon-download-alt  fa fa-caret-right"></i>
						Pre-Registro de Veh&iacute;culos
					</a>
					<b class="arrow"></b>
				</li> -->
				<li class="hover">
					<a href="<c:url value="v_listaPreVehiculo"/>">
						<i class="icon-download-alt  fa fa-caret-right"></i>
						Consulta de Veh&iacute;culos
					</a>
					<b class="arrow"></b>
				</li>
				<li class="hover">
					<a href="<c:url value="/ae_salidaPreVehiculo"/>">
						<i class="icon-download-alt  fa fa-caret-right"></i>
						Salida Veh&iacute;culo
					</a>
					<b class="arrow"></b>
				</li>
			</ul><div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_ADMISION') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_FACTURACION')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-exchange  fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Ingresos y Salidas <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="dropdown-menu" role="menu">
				<!--<li class="hover">
					<a href="<c:url value="adm_ingresoVehiculo"/>">
						<i class="icon-exchange fa fa-caret-right"></i>
						Registra Ingreso de Veh&iacute;culos
					</a>
					<b class="arrow"></b>
				</li> -->

				<!-- <li class="hover">
					<a href="<c:url value="/alm_consultaIngresos" />">
						<i class="icon-exchange fa fa-caret-right"></i>
						Captura Ingresos
					</a>
					<b class="arrow"></b>
				</li>
				-->
				<!--
				<li class="hover">
					<a href="<c:url value="/alm_consultaSalidas" />">
						<i class="icon-exchange fa fa-caret-right"></i>
						Captura Salidas
					</a>
					<b class="arrow"></b>
				</li>

				-->

				<!--
				<li class="hover">
					<a href="<c:url value="adm_salidaVehiculo"/>">
						<i class="icon-exchange fa fa-caret-right"></i>
						Registro Salida de Veh&iacute;culos
					</a>
					<b class="arrow"></b>
				</li>
				-->


				<li class="hover">
					<a href="<c:url value="/listaPreVehiculoEstatus"/>">
						<i class="icon-exchange fa fa-caret-right"></i>
						Consulta Ingreos y Salidas en proceso
					</a>
					<b class="arrow"></b>
				</li>
			</ul><div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_FACTURACION')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-adjust  fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Ubicaciones <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="dropdown-menu" role="menu">

				<!--<li class="hover">
					<a href="<c:url value="/alm_regUbicaciones" />">
						<i class="icon-adjust fa fa-caret-right"></i>
						Captura Ubicaci&oacute;n
					</a>
					<b class="arrow"></b>
				</li>
				-->

				<li class="hover">
					<a href="<c:url value="/alm_getUbicaciones" />">
						<i class="icon-adjust fa fa-caret-right"></i>
						Consulta Ubicaci&oacute;n
					</a>
					<b class="arrow"></b>
				</li>



			</ul><div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_ADMIN')  || (rolef eq 'ROLE_FACTURACION')  || (rolef eq 'ROLE_TIF') || (rolef eq 'ROLE_AUDITORIA') || (rolef eq 'ROLE_MAQUILA')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-dashboard fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Operaciones <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="dropdown-menu" role="menu">
		<c:if test="${(rolef eq 'ROLE_TIF')}">
				<!-- <li class="hover">
					<a href="<c:url value="ae_mandaRetemesTIF" />">
						<i class="icon-dashboard fa fa-caret-right"></i>
						Captura Retemes TIF
					</a>
					<b class="arrow"></b>
				</li> -->
				<li class="hover">
					<a href="<c:url value="formaConsultaClienteFichaTecnica"/>">
						<i class="icon-dashboard fa fa-caret-right"></i>
						Ficha T&eacute;cnica del Cliente
					</a>
					<b class="arrow"></b>
				</li>
			<li class="hover">
				<a href="<c:url value="ae_consultaRetemes" />">
					<i class="icon-dashboard fa fa-caret-right"></i>
					Consulta Retemes
				</a>
				<b class="arrow"></b>
			</li>
			</c:if>
		<c:if test="${(rolef eq 'ROLE_AUDITORIA') || (rolef eq 'ROLE_MAQUILA')}">
				<li class="hover">
					<a href="<c:url value="ae_consultaRetemes" />">
						<i class="icon-dashboard fa fa-caret-right"></i>
						Consulta Retemes
					</a>
					<b class="arrow"></b>
				</li>
			<li class="hover">
				<a href="<c:url value="/formConsultaModificacionesFecha" />">
					<i class="icon-dashboard fa fa-caret-right"></i>
					Consulta Cambios al sistema
				</a>
				<b class="arrow"></b>
			</li>
			</c:if>
		<c:if test="${(rolef eq 'ROLE_MAQUILA')}">
			<!--<li class="hover">
				<a href="<c:url value="ae_mandaRetemes" />">
					<i class="icon-dashboard fa fa-caret-right"></i>
					Captura Retemes
				</a>
				<b class="arrow"></b>
			</li> -->
			</c:if>
				<c:if test="${(rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_FACTURACION')}">
				<li class="hover">
					<a href="<c:url value="formaConsultaClienteFichaTecnica"/>">
						<i class="icon-dashboard fa fa-caret-right"></i>
						Ficha T&eacute;cnica del Cliente
					</a>
					<b class="arrow"></b>
				</li>

					<!--<li class="hover">
						<a href="<c:url value="ae_traspasos"/>">
							<i class="icon-dashboard fa fa-caret-right"></i>
							Traspasos Camara y T&uacute;nel
						</a>
						<b class="arrow"></b>
					</li>
					-->

					<li class="hover">
						<a href="<c:url value="/formConsultaTraspasos"/>">
							<i class="icon-dashboard fa fa-caret-right"></i>
							Consulta Traspasos Camara y T&uacute;nel
						</a>
						<b class="arrow"></b>
					</li>
					<!--<li class="hover">
						<a href="<c:url value="ae_mandaRetemes" />">
							<i class="icon-dashboard fa fa-caret-right"></i>
							Captura Retemes
						</a>
						<b class="arrow"></b>
					</li>
					-->


					<li class="hover">
						<a href="<c:url value="ae_consultaRetemes" />">
							<i class="icon-dashboard fa fa-caret-right"></i>
							Consulta Retemes
						</a>
						<b class="arrow"></b>
					</li>

					<!-- <li class="hover">
						<a href="<c:url value="solicitudModificacion" />">
							<i class="icon-dashboard fa fa-caret-right"></i>
							Solicitud de Modificacion al Sistema
						</a>
						<b class="arrow"></b>
					</li>
					-->
					<!--<li class="hover">
						<a href="<c:url value="/formConsultaModificacionesFecha" />">
							<i class="icon-dashboard fa fa-caret-right"></i>
							Consulta Cambios al sistema
						</a>
						<b class="arrow"></b>
					</li>
					-->

				</c:if>
				<c:if test="${rolef eq 'ROLE_ADMIN' || (rolef eq 'ROLE_FACTURACION')}">
					<!-- <li class="hover">
						<a href="<c:url value="autorizarModificaciones" />">
							<i class="icon-dashboard fa fa-caret-right"></i>
							Atencion Modificaciones al Sistema
						</a>
						<b class="arrow"></b>
					</li>-->

				</c:if>
			</ul><div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_COMERCIAL') || (rolef eq 'ROLE_TIF') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_MAQUILA') ||(rolef eq 'ROLE_COMERCIAL_GERENTE') || (rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_AUDITORIA') || rolef eq 'ROLE_ALMACENISTA' || rolef eq 'ROLE_FACTURACION'}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-globe fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Comercial <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow fa fa-angle-down"></b>
			<ul class="dropdown-menu" role="menu">
				<!--
				<c:if test="${rolef eq 'ROLE_EJECUTIVO' || (rolef eq 'ROLE_ADMIN') }">
					<li class="hover">

						<a href="<c:url value="ae_formaProspecto" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Ingreso Prospecto
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">

						<a href="<c:url value="ae_formaProspectoAutorizado" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Prospectos Autorizados
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">

						<a href="<c:url value="/ae_formaProspectoRechazado" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Prospectos Rechazados
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">

						<a href="<c:url value="/ae_formaProspectoSeguimiento" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Revisar Seguiienros
						</a>
						<b class="arrow"></b>
					</li>
				</c:if>
				<c:if test="${rolef eq 'ROLE_JEFEEJE' || (rolef eq 'ROLE_ADMIN')}">
					<li class="hover">

						<a href="<c:url value="ae_formaProspectoJefe" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Ingreso Prospecto
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">

						<a href="<c:url value="/ae_formaProspectoAutorizadoJefe" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Autorizar prospectos
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">

						<a href="<c:url value="/ae_formaProspectoSeguimientoJefe" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Revisar Seguimiento
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">

						<a href="<c:url value="/ae_formaProspectoReAutorizaJefe" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Solicitud de Re-Autorizaci&oacute;n
						</a>
						<b class="arrow"></b>
					</li>

					<li class="hover">

						<a href="<c:url value="/ae_consultaProspectoAceptado" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Cambio a cliente
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
					<a href="<c:url value="reportesprospectos" />">
						<i class="icon-globe fa fa-caret-right"></i>
						Reporte de Prospectos
					</a>
					<b class="arrow"></b>
				</li>
				</c:if>
-->
				<li class="hover">
					<a href="<c:url value="ae_formaIngresoCliente" />">
						<i class="icon-globe fa fa-caret-right"></i>
						Listado Clientes
					</a>
					<b class="arrow"></b>
				</li>
				<c:if test="${(rolef eq 'ROLE_COMERCIAL') || (rolef eq 'ROLE_COMERCIAL_GERENTE') ||(rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION')  || rolef eq 'ROLE_ALMACENISTA' || rolef eq 'ROLE_FACTURACION'}">
					<li class="hover">
						<a href="<c:url value="/calendarioTunel" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Apartado Tunel
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="formaConsultaClienteCompleto" />">
							<i class="icon-globe fa fa-caret-right"></i>
							Detalle Datos Cliente
						</a>
						<b class="arrow"></b>
					</li>
				</c:if>
			</ul>
			<div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-barcode fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Facturacion <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow fa fa-angle-down"></b>
			<ul class="dropdown-menu" role="menu">
				<c:if test="${(rolef eq 'ROLE_FACTURACION')}">
					<li class="hover">
						<a href="<c:url value="/formCrearFacturas"/>">
							<i class="icon-barcode fa fa-caret-right"></i>
							Creaci&oacute;n de facturas
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/consultaPreFacturas"/>">
							<i class="icon-barcode fa fa-caret-right"></i>
							Consulta Pre-Facturas
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="notasCredito"/>">
							<i class="icon-barcode fa fa-caret-right"></i>
							Notas de Cr&eacute;dito
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/formEntradasSeguro"/>">
							<i class="icon-barcode fa fa-caret-right"></i>
							Revision de Seguros por RD
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/RDCancelados"/>">
							<i class="icon-barcode fa fa-caret-right"></i>
							Recibos de Entrada Cancelados
						</a>
						<b class="arrow"></b>
					</li>
				</c:if>
				<c:if test="${(rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION')}">
					<li class="hover">
						<a href="<c:url value="bloqueoSalidas"/>">
							<i class="icon-barcode fa fa-caret-right"></i>
							Bloqueo de Salidas
						</a>
						<b class="arrow"></b>
					</li>
				</c:if>
				<!--li class="hover">
					<a id="facturas">
						<i class="icon-barcode fa fa-caret-right"></i>
						Creaci&oacute;n de facturas
					</a>
					<b class="arrow"></b>
				</li-->

			</ul>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_ALMACENISTA')  || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_MAQUILA') || (rolef eq 'ROLE_OPERACION')||(rolef eq 'ROLE_COMERCIAL_GERENTE') || (rolef eq 'ROLE_COMERCIAL') || (rolef eq 'ROLE_AUDITORIA') || (rolef eq 'ROLE_FACTURACION')|| (rolef eq 'ROLE_TIF')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-bar-chart fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Inventarios <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow fa fa-angle-down"></b>
			<ul class="dropdown-menu" role="menu">
				<c:if test="${(rolef eq 'ROLE_COMERCIAL') }">
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosComercial" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Consulta Inventario
						</a>
						<b class="arrow"></b>
					</li>
				</c:if>
				<c:if test="${(rolef eq 'ROLE_COMERCIAL_GERENTE') }">
					<li class="hover">
						<a href="<c:url value="/ae_formInventarios" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Consulta Inventario
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventarioRD" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Consulta Recibo de Entrada
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosCamara" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Saldos por Camaras y Tunel
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosCliente" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Saldos por Cliente
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosTodaCamaras" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Inventario Todas las Camaras
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formFormatosUnicos" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Formatos Unicos
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosCamara" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Saldos por Camaras y Tunel
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosCliente" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Saldos por Cliente
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosTodaCamaras" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Inventario Todas las Camaras
						</a>
						<b class="arrow"></b>
					</li>
					</c:if>
				<c:if test="${(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_AUDITORIA') || (rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_MAQUILA') || (rolef eq 'ROLE_TIF')}">
					<li class="hover">
						<a href="<c:url value="/ae_formInventarios" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Consulta Inventario
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventarioRD" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Consulta Recibo de Entrada
						</a>
						<b class="arrow"></b>
					</li>
					<c:if test="${(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_AUDITORIA')  || (rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_MAQUILA')}">
					<li class="hover">
						<a href="<c:url value="/ae_formFormatosUnicos" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Formatos Unicos
						</a>
						<b class="arrow"></b>
					</li>
						</c:if>
					<c:if test="${(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION')  || (rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_MAQUILA')|| (rolef eq 'ROLE_AUDITORIA')}">
						<c:if test="${(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_OPERACION')  || (rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_MAQUILA')}">
					<li class="hover">
						<a href="<c:url value="/ae_formCitroFrut" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Consultar Marca y Lote Citrofrut
						</a>
						<b class="arrow"></b>
					</li>
							</c:if>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosCamara" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Saldos por Camaras y Tunel
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosCliente" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Saldos por Cliente
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="/ae_formInventariosTodaCamaras" />">
							<i class="icon-bar-chart fa fa-caret-right"></i>
							Inventario Todas las Camaras
						</a>
						<b class="arrow"></b>
					</li>
						</c:if>
				</c:if>
			</ul>
			<div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_COMERCIAL')|| (rolef eq 'ROLE_MAQUILA') || (rolef eq 'ROLE_FACTURACION') ||(rolef eq 'ROLE_ALMACENISTA')|| (rolef eq 'ROLE_OPERACION') ||(rolef eq 'ROLE_COMERCIAL_GERENTE') || (rolef eq 'ROLE_ADMIN') ||(rolef eq 'ROLE_EJECUTIVO') || (rolef eq 'ROLE_AUDITORIA')|| (rolef eq 'ROLE_TIF')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-book fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Reportes <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow fa fa-angle-down"></b>
			<ul class="dropdown-menu" role="menu">
				<c:if test="${(rolef eq 'ROLE_COMERCIAL') }">
					<li class="hover">
						<a href="<c:url value="aes_formReporteEntrada" />">
							<i class="icon-book fa fa-caret-right"></i>
							Reporte de Entradas
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="aes_formReporteSalida" />">
							<i class="icon-book fa fa-caret-right"></i>
							Reporte de Salidas
						</a>
						<b class="arrow"></b>
					</li>
				</c:if>
		<c:if test="${(rolef eq 'ROLE_COMERCIAL_GERENTE') }">
			<li class="hover">
			<a href="<c:url value="aes_formReporteEntrada" />">
				<i class="icon-book fa fa-caret-right"></i>
				Reporte de Entradas
			</a>
			<b class="arrow"></b>
			</li>
			<li class="hover">
				<a href="<c:url value="aes_formReporteSalida" />">
					<i class="icon-book fa fa-caret-right"></i>
					Reporte de Salidas
				</a>
				<b class="arrow"></b>
			</li>
			<li class="hover">
			<a href="<c:url value="ae_reporteVentasEjecutivo" />">
				<i class="icon-book fa fa-caret-right"></i>
				Reporte de Ventas por Ejecutivo
			</a>
			<b class="arrow"></b>
			</li>
			<li class="hover">
				<a href="<c:url value="ae_reporteVentasEjecutivoMes" />">
					<i class="icon-book fa fa-caret-right"></i>
					Reporte de Ventas por Mes
				</a>
				<b class="arrow"></b>
			</li>
			</c:if>
				<c:if test="${(rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_MAQUILA') || (rolef eq 'ROLE_OPERACION') ||(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_AUDITORIA')|| (rolef eq 'ROLE_TIF')}">
					<li class="hover">
						<a href="<c:url value="aes_formReporteEntrada" />">
							<i class="icon-book fa fa-caret-right"></i>
							Reporte de Entradas
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="aes_formReporteSalida" />">
							<i class="icon-book fa fa-caret-right"></i>
							Reporte de Salidas
						</a>
						<b class="arrow"></b>
					</li>
					<c:if test="${(rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_OPERACION') ||(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') }">
						<li class="hover">
							<a href="<c:url value="/tiemposAtencion" />">
								<i class="icon-book fa fa-caret-right"></i>
								Tiempos de Atenci&oacute;n
							</a>
							<b class="arrow"></b>
						</li>
						<li class="hover">
							<a href="<c:url value="/consultaRendimientos" />">
								<i class="icon-book fa fa-caret-right"></i>
								Rendimientos
							</a>
							<b class="arrow"></b>
						</li>
						</c:if>
					<c:if test="${(rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_FACTURACION') }">
						<li class="hover">
							<a href="<c:url value="ae_reporteVentasEjecutivo" />">
								<i class="icon-book fa fa-caret-right"></i>
								Reporte de Ventas por Ejecutivo
							</a>
							<b class="arrow"></b>
						</li>
						<li class="hover">
							<a href="<c:url value="ae_reporteVentasEjecutivoMes" />">
								<i class="icon-book fa fa-caret-right"></i>
								Reporte de Ventas por Mes
							</a>
							<b class="arrow"></b>
						</li>
						<li class="hover">
							<a href="<c:url value="/formgetFacturasRD" />">
								<i class="icon-book fa fa-caret-right"></i>
								Reporte de Facturas por RD
							</a>
							<b class="arrow"></b>
						</li>
						<li class="hover">
							<a href="<c:url value="/formgetFacturasFecha" />">
								<i class="icon-book fa fa-caret-right"></i>
								Reporte de Facturas por D&iacute;a
							</a>
							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="<c:url value="/formFacturasDiarias" />">
								<i class="icon-book fa fa-caret-right"></i>
								Reporte Facturas por Rubro
							</a>
							<b class="arrow"></b>
						</li>
					</c:if>
					<c:if test="${(rolef eq 'ROLE_FACTURACION') || (rolef eq 'ROLE_OPERACION') ||(rolef eq 'ROLE_ALMACENISTA') || (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_AUDITORIA')}">
						<c:if test="${(rolef eq 'ROLE_FACTURACION')|| (rolef eq 'ROLE_ADMIN') || (rolef eq 'ROLE_AUDITORIA')}">
						<li class="hover">
							<a href="<c:url value="/formFacturasImpresas" />">
								<i class="icon-book fa fa-caret-right"></i>
								Reporte de Facturacion Impresa
							</a>
							<b class="arrow"></b>
						</li>
							</c:if>
						<c:if test="${(rolef eq 'ROLE_FACTURACION')|| (rolef eq 'ROLE_ADMIN')}">
						<li class="hover">
						<a href="<c:url value="ae_InOutFormVehiculo" />">
							<i class="icon-book fa fa-caret-right"></i>
							Tiempos de Respuesta
						</a>
						<b class="arrow"></b>
					</li>
							<li class="hover">
							<a href="<c:url value="/tiemposAtencion" />">
								<i class="icon-book fa fa-caret-right"></i>
								Tiempos de Atenci&oacute;n
							</a>
							<b class="arrow"></b>
							</li>
							<li class="hover">
								<a href="<c:url value="/consultaRendimientos" />">
									<i class="icon-book fa fa-caret-right"></i>
									Rendimientos
								</a>
								<b class="arrow"></b>
							</li>
							</c:if>
						</c:if>
				</c:if>
				<c:if test="${rolef eq 'ROLE_EJECUTIVO'}">
					<!--
					<li class="hover">
					<a href="<c:url value="reportesprospectos" />">
					<i class="icon-book fa fa-caret-right"></i>
					Reporte de Prospectos
					</a>
					<b class="arrow"></b>
					</li>
					-->
					<li class="hover">
						<a href="<c:url value="ae_reporteVentasEjecutivoId" />">
							<i class="icon-book fa fa-caret-right"></i>
							Reporte de Ventas por Ejecutivo
						</a>
						<b class="arrow"></b>
					</li>
					<!--
					<li class="hover">
					<a href="<c:url value="reporteDetalleProspectos" />">
					<i class="icon-book fa fa-caret-right"></i>
					Reportes Detalle Prospectos
					</a>
					<b class="arrow"></b>
					</li>
					-->
				</c:if>
				<!--
				<c:if test="${rolef eq 'ROLE_JEFEEJE'}">
					<li class="hover">
						<a href="<c:url value="reportesprospectosJefe" />">
							<i class="icon-book fa fa-caret-right"></i>
							Reporte de Prospectos
						</a>
						<b class="arrow"></b>
					</li>
					<li class="hover">
						<a href="<c:url value="reporteDetalleProspectos" />">
							<i class="icon-book fa fa-caret-right"></i>
							Reportes Detalle Prospectos
						</a>
						<b class="arrow"></b>
					</li>
				</c:if>
				-->
			</ul>
			<div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
	</c:if>
	<c:if test="${(rolef eq 'ROLE_FACTURACION') ||(rolef eq 'ROLE_ALMACENISTA')|| (rolef eq 'ROLE_OPERACION') || (rolef eq 'ROLE_ADMIN')}">
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-film fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Impresiones <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow fa fa-angle-down"></b>
			<ul class="dropdown-menu" role="menu">
				<li class="hover">
					<a href="<c:url value="/alm_consultaEntradasImp" />">
						<i class="icon-film fa fa-caret-right"></i>
						Impresi&oacute;n de Entradas
					</a>
					<b class="arrow"></b>
				</li>
				<li class="hover">
					<a href="<c:url value="alm_consultaSalidasImp" />">
						<i class="icon-film fa fa-caret-right"></i>
						Impresi&oacute;n de Salidas
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
			<div style="display: none; top: 69px; left: 183px;" class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible"><div style="top: 0px;" class="scroll-bar"></div></div>
		</li>
		<!--li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
				<i class="icon-laptop fa fa-caret-right bigger-150"></i>
				<span class="menu-text"> Etiquetas <span class="caret"></span></span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow fa fa-angle-down"></b>
			<ul class="dropdown-menu" role="menu">
				<li class="hover">
					<a href="<c:url value="/generadorEtiquetas" />">
						<i class="icon-laptop fa fa-caret-right"></i>
						Generar Etiquetas para Pallets
					</a>
					<b class="arrow"></b>
				</li>
				<li class="hover">
					<a href="<c:url value="/subirEscaneo" />">
						<i class="icon-laptop fa fa-caret-right"></i>
						Subir Escaneo
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li-->
	</c:if>
	<li role="presentation" class="dropdown">
		<a class="dropdown-toggle" href="<c:url value="j_spring_security_logout" />" >
			<i class="icon-off fa fa-caret-right bigger-150"></i>
			<span class="menu-text">Salir</span>
		</a>
		<b class="arrow"></b>
	</li>
</ul>
<div id="supdiv"><div id="facturacion"></div></div>
