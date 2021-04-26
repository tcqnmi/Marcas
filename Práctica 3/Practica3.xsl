<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="Practica3.css"/>
			</head>
			<body>
				<h2>11.- Para todos los productos de la tienda añade una nueva columna llamada "cuanto me estafan" en la que vamos a añadir la diferencia entre el precio con IVA y el precio calculado real con IVA. Este resultado puede ser positivo o negativo.<br />
				Ordena los datos por el tipo de producto y después por cuanto me estafan.<br /> 
				Se deben mostrar los datos en el siguiente orden: Nombre del producto, precio con IVA sin calcular, el precio con IVA calculado, precio sin IVA, productos en stock, tipo y cuanto me estafan. Detrás de todos los precios se debe incluir la unidad de medida en €.</h2>
				<table>
					<tr>
						<th>Nombre de producto</th>
						<th>Precio con IVA (sin calcular)</th>
						<th>Precio con IVA (calculado)</th>
						<th>Precio sin IVA </th>
						<th>Productos en stock</th>
						<th>Tipo</th>	
						<th>Cuanto me estafan</th>
						
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="@tipo"/>
					<xsl:sort select="preciosiniva * 1.21 - precioconiva" data-type="number"/>
					

					<xsl:if test="@tipo='software' or @tipo='hardware'">
						<tr>
							
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="precioconiva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva * 1.21" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo"/></td>
							<td class="violeta"><xsl:value-of select="round((preciosiniva * 1.21 - precioconiva)*100)div 100" />€</td>
						</tr>
					</xsl:if>
					<xsl:if test="@tipo='alimentacion' or @tipo='clases' or @tipo='medicina'" >
						<tr>
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="precioconiva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva * 1.10" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo"/></td>
							<td class="violeta"><xsl:value-of select="round((preciosiniva * 1.10 - precioconiva)*100)div 100" />€</td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>12.- Partiendo de la tabla del ejercicio 11 muestra solo los productos en los que te estafen por valor mayor que 10 €. 
				<br/>
				Ordena los datos por proveedores y después por cuánto me estafan.
				<br />
				Se deben mostrar los datos en el siguiente orden: Nombre del producto, precio con IVA sin calcular, el precio con IVA calculado, precio sin IVA, productos en stock, tipo de producto, nombre del proveedor y cuanto me estafan. Detrás de todos los precios se debe incluir la unidad de medida en €.</h2>
				<table>
					<tr>
						<th>Nombre de producto</th>
						<th>Precio con IVA (sin calcular)</th>
						<th>Precio con IVA (calculado)</th>
						<th>Precio sin IVA </th>
						<th>Productos en stock</th>
						<th>Tipo</th>	
						<th>Nombre del proveedor</th>
						<th>Cuanto me estafan</th>
						
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="@tipo"/>
					<xsl:sort select="preciosiniva * 1.21 - precioconiva" data-type="number"/>
					

					<xsl:if test="(@tipo='software' or @tipo='hardware') and preciosiniva * 1.20 - precioconiva>10">
						<tr>
							
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="precioconiva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva * 1.21" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo"/></td>
							<td class="azul"><xsl:value-of select="proveedores/nombre"/></td>
							<td class="violeta"><xsl:value-of select="round((preciosiniva * 1.21 - precioconiva)*100)div 100" />€</td>
						</tr>
					</xsl:if>
					<xsl:if test="(@tipo='alimentacion' or @tipo='clases' or @tipo='medicina')  and preciosiniva * 1.10 - precioconiva>10" >
						<tr>
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="precioconiva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva * 1.10" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo"/></td>
							<td class="violeta"><xsl:value-of select="round((preciosiniva * 1.10 - precioconiva)*100)div 100" />€</td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>13.- Obtener las ganancias previstas por el proveedor para cada producto de tipo hardware o software en función del número de productos en stock y el precio sin IVA, teniendo en cuenta que el proveedor se lleva el 60% de las ganancias.
				<br /> Ordena los datos por las ganancias previstas. Detrás de todos los precios se debe incluir la unidad de medida en €.</h2>
				<table>
					<tr>
						<th>Nombre del proveedor</th>
						<th>Nombre del producto</th>
						<th>Tipo</th>
						<th>Productos en stock</th>
						<th>Precio sin iva</th>
						<th>Ganancias del proveedor</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="(preciosiniva*productosenstock)*0.6" data-type="number"/>
					<xsl:if test="@tipo='software' or @tipo='hardware'">
						<tr>
							<td class="azul"><xsl:value-of select="proveedores/nombre" /></td>
							<td class="verde"><xsl:value-of select="nombre" /></td>
							<td class="verde"><xsl:value-of select="@tipo" /></td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="violeta"><xsl:value-of select="preciosiniva" />€</td>
							<td class="violeta"><xsl:value-of select="(preciosiniva*productosenstock)*0.6" />€</td>
						</tr>
					</xsl:if>
					</xsl:for-each>

				</table>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>