<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="Practica2.css" />
			</head>
			<body>
				<h2>1.-Obtener una tabla con todos los productos del xml y otra con todas las facturas. Crea por lo menos 5 estilos distintos para representar cada uno de los elementos. Los elementos han de mostrarse en este orden: </h2>
				<ul>
					<li><h2>Productos: nombre de producto, precio con iva, precio sin iva, productos en stock, nombre del proveedor, dirección del proveedor y teléfono del proveedor.</h2></li>
					<li><h2>Facturas: Número de línea, fecha y hora, código de cliente, nombre del artículo, cantidad y precio unitario</h2></li>
				</ul>
				<table>
					<tr>
						<th rowspan="2">Nombre de producto</th>
						<th  rowspan="2">Precio con IVA</th>
						<th  rowspan="2">Precio sin IVA</th>
						<th  rowspan="2">Productos en stock</th>
						<th colspan="3">Proveedores</th>
					</tr>
					<tr>
						
						<th>Nombre del proveedor</th>
						<th>Dirección del proveedor</th>
						<th>Teléfono del proveedor</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
						<tr>
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="precioconiva" /></td>
							<td class="violeta"><xsl:value-of select="preciosiniva" /></td>
							<td class="violeta"><xsl:value-of select="productosenstock" /></td>
							
							<td class="verde"><xsl:value-of select="proveedores/nombre" /></td>
							<td class="verde"><xsl:value-of select="proveedores/direccion" /></td>
							<td class="verde"><xsl:value-of select="proveedores/telefono" /></td>
						</tr>
					</xsl:for-each>
				</table>
				<br />
				<table>
					<tr>
						<th rowspan="2">Número de línea</th>
						<th rowspan="2">Fecha y hora</th>
						<th rowspan="2">Código de cliente</th>
						<th colspan="3">Artículos</th>
					</tr>
					<tr>
						<th>Nombre del artículo</th>
						<th>Cantidad</th>
						<th>Precio unitario</th>
					</tr>
					<xsl:for-each select="tienda/facturas/factura">
						<tr>
							<td class="coral"><xsl:value-of select="numlinea" /></td>
							<td class="amarillo"><xsl:value-of select="fecha" /></td>
							<td class="amarillo"><xsl:value-of select="codcliente" /></td>
							<td class="naranja"><xsl:value-of select="articulos/articulo/nombre" /></td>
							<td class="naranja"><xsl:value-of select="articulos/articulo/cantidad" /></td>
							<td class="naranja"><xsl:value-of select="articulos/articulo/pvp" /></td>
						</tr>
					</xsl:for-each>
					
				</table>
				<h2>2.- Obtener lo mismo pero que las filas pares sean de un color y las impares de otro Crea cuatro estilos distintos y aplícalos a las celdas pares e impares respectivamente (2 para las facturas y 2 para los productos)</h2>
				<table>
					<tr>
						<th rowspan="2">Nombre de producto</th>
						<th  rowspan="2">Precio con IVA</th>
						<th  rowspan="2">Precio sin IVA</th>
						<th  rowspan="2">Productos en stock</th>
						<th colspan="3">Proveedores</th>
					</tr>
					<tr>
						
						<th>Nombre del proveedor</th>
						<th>Dirección del proveedor</th>
						<th>Teléfono del proveedor</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:if test="position() mod 2 = 1">
						<tr class="imparProducto">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="precioconiva" /></td>
							<td><xsl:value-of select="preciosiniva" /></td>
							<td><xsl:value-of select="productosenstock" /></td>
							
							<td><xsl:value-of select="proveedores/nombre" /></td>
							<td><xsl:value-of select="proveedores/direccion" /></td>
							<td><xsl:value-of select="proveedores/telefono" /></td>
						</tr>
					</xsl:if>
					<xsl:if test="position() mod 2 = 0">
						<tr class="parProducto">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="precioconiva" /></td>
							<td><xsl:value-of select="preciosiniva" /></td>
							<td><xsl:value-of select="productosenstock" /></td>
							
							<td><xsl:value-of select="proveedores/nombre" /></td>
							<td><xsl:value-of select="proveedores/direccion" /></td>
							<td><xsl:value-of select="proveedores/telefono" /></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<br />
				<table>
					<tr>
						<th rowspan="2">Número de línea</th>
						<th rowspan="2">Fecha y hora</th>
						<th rowspan="2">Código de cliente</th>
						<th colspan="3">Artículos</th>
					</tr>
					<tr>
						<th>Nombre del artículo</th>
						<th>Cantidad</th>
						<th>Precio unitario</th>
					</tr>
					<xsl:for-each select="tienda/facturas/factura">
					<xsl:if test="position() mod 2 = 1">
						<tr class="imparFactura">
							<td><xsl:value-of select="numlinea" /></td>
							<td><xsl:value-of select="fecha" /></td>
							<td ><xsl:value-of select="codcliente" /></td>
							<td ><xsl:value-of select="articulos/articulo/nombre" /></td>
							<td ><xsl:value-of select="articulos/articulo/cantidad" /></td>
							<td><xsl:value-of select="articulos/articulo/pvp" /></td>
						</tr>
					</xsl:if>
					<xsl:if test="position() mod 2 = 0">
						<tr class="parFactura">
							<td><xsl:value-of select="numlinea" /></td>
							<td><xsl:value-of select="fecha" /></td>
							<td ><xsl:value-of select="codcliente" /></td>
							<td ><xsl:value-of select="articulos/articulo/nombre" /></td>
							<td ><xsl:value-of select="articulos/articulo/cantidad" /></td>
							<td><xsl:value-of select="articulos/articulo/pvp" /></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
					
				</table>
				<h2>3.- Añade a los ejercicios 1 y 2 los atributos de los diferentes elementos. Para mostrar los atributos se utiliza la sintaxis: @nombre_del_atributo. Los elementos han de mostrarse en este orden:</h2>
				<ul>
					<li>
						<h2>3.1</h2>
						<table>
							<tr>
								<th rowspan="2">ID de producto</th>
								<th rowspan="2">Nombre de producto</th>
								<th  rowspan="2">Precio con IVA</th>
								<th  rowspan="2">Precio sin IVA</th>
								<th  rowspan="2">Productos en stock</th>
								<th  rowspan="2">Tipo de producto</th>
								<th colspan="3">Proveedores</th>
							</tr>
							<tr>
								
								<th>Nombre del proveedor</th>
								<th>Dirección del proveedor</th>
								<th>Teléfono del proveedor</th>
							</tr>
							<xsl:for-each select="tienda/productos/producto">
								<tr>
									<td class="azul"><xsl:value-of select="@idproducto" /></td>
									<td class="azul"><xsl:value-of select="nombre" /></td>
									<td class="violeta"><xsl:value-of select="precioconiva" /></td>
									<td class="violeta"><xsl:value-of select="preciosiniva" /></td>
									<td class="violeta"><xsl:value-of select="productosenstock" /></td>
									<td class="azul"><xsl:value-of select="@tipo" /></td>
									<td class="verde"><xsl:value-of select="proveedores/nombre" /></td>
									<td class="verde"><xsl:value-of select="proveedores/direccion" /></td>
									<td class="verde"><xsl:value-of select="proveedores/telefono" /></td>
								</tr>
							</xsl:for-each>
						</table>
						<br />
						<table>
							<tr>
								<th rowspan="2">ID Factura</th>
								<th rowspan="2">Número de línea</th>
								<th rowspan="2">Fecha y hora</th>
								<th rowspan="2">Código de cliente</th>
								<th colspan="4">Artículos</th>
							</tr>
							<tr>
								<th>Código de producto</th>
								<th>Nombre del artículo</th>
								<th>Cantidad</th>
								<th>Precio unitario</th>
							</tr>
							<xsl:for-each select="tienda/facturas/factura">
								<tr>
									<td class="coral"><xsl:value-of select="@idfactura" /></td>
									<td class="coral"><xsl:value-of select="numlinea" /></td>
									<td class="amarillo"><xsl:value-of select="fecha" /></td>
									<td class="amarillo"><xsl:value-of select="codcliente" /></td>
									<td class="naranja"><xsl:value-of select="articulos/articulo/@idarticulo" /></td>
									<td class="naranja"><xsl:value-of select="articulos/articulo/nombre" /></td>
									<td class="naranja"><xsl:value-of select="articulos/articulo/cantidad" /></td>
									<td class="naranja"><xsl:value-of select="articulos/articulo/pvp" /></td>
								</tr>
							</xsl:for-each>
							
						</table>
					</li>
					<li>
						<h2>3.2</h2>
						<table>
						<tr>
							<th rowspan="2">ID de producto</th>
							<th rowspan="2">Nombre de producto</th>
							<th  rowspan="2">Precio con IVA</th>
							<th  rowspan="2">Precio sin IVA</th>
							<th  rowspan="2">Productos en stock</th>
							<th  rowspan="2">Tipo de producto</th>
							<th colspan="3">Proveedores</th>
						</tr>
						<tr>
							
							<th>Nombre del proveedor</th>
							<th>Dirección del proveedor</th>
							<th>Teléfono del proveedor</th>
						</tr>
						<xsl:for-each select="tienda/productos/producto">
						<xsl:if test="position() mod 2 = 1">
							<tr class="imparProducto">
								<td><xsl:value-of select="@idproducto" /></td>
								<td><xsl:value-of select="nombre" /></td>
								<td><xsl:value-of select="precioconiva" /></td>
								<td><xsl:value-of select="preciosiniva" /></td>
								<td><xsl:value-of select="productosenstock" /></td>
								<td><xsl:value-of select="@tipo" /></td>
								<td><xsl:value-of select="proveedores/nombre" /></td>
								<td><xsl:value-of select="proveedores/direccion" /></td>
								<td><xsl:value-of select="proveedores/telefono" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="position() mod 2 = 0">
							<tr class="parProducto">
								<td><xsl:value-of select="@idproducto" /></td>
								<td><xsl:value-of select="nombre" /></td>
								<td><xsl:value-of select="precioconiva" /></td>
								<td><xsl:value-of select="preciosiniva" /></td>
								<td><xsl:value-of select="productosenstock" /></td>
								<td><xsl:value-of select="@tipo" /></td>
								<td><xsl:value-of select="proveedores/nombre" /></td>
								<td><xsl:value-of select="proveedores/direccion" /></td>
								<td><xsl:value-of select="proveedores/telefono" /></td>
							</tr>
						</xsl:if>
						</xsl:for-each>
					</table>
					<br />
					<table>
						<tr>
							<th rowspan="2">ID Factura</th>
							<th rowspan="2">Número de línea</th>
							<th rowspan="2">Fecha y hora</th>
							<th rowspan="2">Código de cliente</th>
							<th colspan="4">Artículos</th>
						</tr>
						<tr>
							<th>Código de producto</th>
							<th>Nombre del artículo</th>
							<th>Cantidad</th>
							<th>Precio unitario</th>
						</tr>
						<xsl:for-each select="tienda/facturas/factura">
						<xsl:if test="position() mod 2 = 1">
							<tr class="imparFactura">
								<td><xsl:value-of select="@idfactura" /></td>
								<td><xsl:value-of select="numlinea" /></td>
								<td><xsl:value-of select="fecha" /></td>
								<td ><xsl:value-of select="codcliente" /></td>
								<td ><xsl:value-of select="articulos/articulo/@idarticulo" /></td>
								<td ><xsl:value-of select="articulos/articulo/nombre" /></td>
								<td ><xsl:value-of select="articulos/articulo/cantidad" /></td>
								<td><xsl:value-of select="articulos/articulo/pvp" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="position() mod 2 = 0">
							<tr class="parFactura">
								<td><xsl:value-of select="@idfactura" /></td>
								<td><xsl:value-of select="numlinea" /></td>
								<td><xsl:value-of select="fecha" /></td>
								<td ><xsl:value-of select="codcliente" /></td>
								<td ><xsl:value-of select="articulos/articulo/@idarticulo" /></td>
								<td ><xsl:value-of select="articulos/articulo/nombre" /></td>
								<td ><xsl:value-of select="articulos/articulo/cantidad" /></td>
								<td><xsl:value-of select="articulos/articulo/pvp" /></td>
							</tr>
						</xsl:if>
						</xsl:for-each>
						</table>
					</li>
				</ul>


			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>