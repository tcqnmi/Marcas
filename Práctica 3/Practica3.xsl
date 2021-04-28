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
				<h2>13.- Obtener las ganancias previstas por el proveedor para cada producto de tipo clases, alimentación o medicina en función del número de productos en stock y el precio sin IVA, teniendo en cuenta que los proveedores de medicina y de clases se lleva el 70% de las ganancias y los de alimentación el 20%. 
				<br />Ordena los datos por el tipo de producto y después por las ganancias previstas. Detrás de todos los precios se debe incluir la unidad de medida en €.</h2>
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
					<xsl:sort select="@tipo"/>
					<xsl:sort select="(preciosiniva*productosenstock)*0.6" data-type="number"/>
					<xsl:if test="@tipo='medicina' or @tipo='clases'">
						<tr>
							<td class="azul"><xsl:value-of select="proveedores/nombre" /></td>
							<td class="verde"><xsl:value-of select="nombre" /></td>
							<td class="verde"><xsl:value-of select="@tipo" /></td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="violeta"><xsl:value-of select="preciosiniva" />€</td>
							<td class="violeta"><xsl:value-of select="(preciosiniva*productosenstock)*0.7" />€</td>
						</tr>
					</xsl:if>
					<xsl:if test="@tipo='alimentacion'">
						<tr>
							<td class="azul"><xsl:value-of select="proveedores/nombre" /></td>
							<td class="verde"><xsl:value-of select="nombre" /></td>
							<td class="verde"><xsl:value-of select="@tipo" /></td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="violeta"><xsl:value-of select="preciosiniva" />€</td>
							<td class="violeta"><xsl:value-of select="(preciosiniva*productosenstock)*0.2" />€</td>
						</tr>
					</xsl:if>
					</xsl:for-each>

				</table>
				<h2>15.- Obtener los productos de Justo Jaramillo. Añadir también la columna ganancias previstas. Los datos han de mostrarse en el siguiente orden: Id del producto, nombre del producto, precio con IVA, precio sin IVA, productos en stock , tipo de producto, nombre del proveedor, dirección, teléfono y ganancias previstas.
				<br /> Ordena los datos por las ganancias previstas seguido de los productos en stock. </h2>
				<table>
					<tr>
						<th>Id del producto</th>
						<th>Nombre del producto</th>
						<th>Precio con IVA</th>
						<th>Precio sin IVA</th>
						<th>Productos en stock</th>
						<th>Tipo de producto</th>
						<th>Nombre del proveedor</th>
						<th>Dirección</th>
						<th>Teléfono</th>
						<th>Ganancias previstas</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="(preciosiniva*productosenstock)*0.2" data-type="number" />
					<xsl:sort select="productosenstock" data-type="number" />
					<xsl:if test="proveedores/nombre='Justo Jaramillo'">
						<tr>
							<td class="verde"><xsl:value-of select="@idproducto" /></td>
							<td class="verde"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="preciosiniva*1.10" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva" />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo" /></td>
							<td class="azul"><xsl:value-of select="proveedores/nombre" /></td>
							<td class="azul"><xsl:value-of select="proveedores/direccion" /></td>
							<td class="azul"><xsl:value-of select="proveedores/telefono" /></td>
							<td class="violeta"><xsl:value-of select="(preciosiniva*productosenstock)*0.2" />€</td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>16.- Obtener el número de productos de cada proveedor y el número total de productos.</h2>
				<table>
					<tr>
						<th>Nombre proveedor</th>
						<th>Nº de productos</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto" >
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Corsair']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Corsair'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Avast']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Avast'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='PC Componentes']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='PC Componentes'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Amazon']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Amazon'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='CMA Online']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='CMA Online'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Legumbres Luengo']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Legumbres Luengo'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Razer']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Razer'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Antibioticos León']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Antibioticos León'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='AVG']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='AVG'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Carniceria MAES']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Carniceria MAES'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Lenovo']" /></td>
						<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Lenovo'])" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<th>Total</th>
						<td><xsl:value-of select="count(//@idproducto)" /></td>
					</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>17.- Calcular los productos totales en stock</h2>
				<table>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:if test="position()=1">
						<tr>
							<th>Productos totales en stock</th>
							<td class="violeta"><xsl:value-of select="sum(//productosenstock)"/></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>18.- Calcular la media de precio sin iva de los productos de la tienda</h2>
				<table>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:if test="position()=1 ">
						<tr>
							<th>Media del precio sin iva </th>
							<td class="violeta"><xsl:value-of select="round(((sum(//preciosiniva))div(count(//@idproducto)))*100)div 100"/></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>19.- Partiendo del ejercicio 18. Añade una columna en la que se calcule el coste medio de los productos dividiendo en vez de por el número de productos por la cantidad total de productos en stock de la tienda.</h2>
				<table>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:if test="position()=1 ">
						<tr>
							<th>Media del precio sin iva </th>
							<td class="violeta"><xsl:value-of select="round(((sum(//preciosiniva))div(sum(//productosenstock)))*100)div 100"/></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>20.- Obtener los producto que tiene el mayor y el menor número de productos en stock</h2>
				<caption>Producto con menor número de stock</caption>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Productos en stock</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:if test="position()=1">

						<tr>
							<td class="azul"><xsl:value-of select="nombre"/></td>
							<td class="violeta"><xsl:value-of select="productosenstock"/></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<caption>Producto con mayor número de stock</caption>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Productos en stock</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="productosenstock" data-type="number" order="descending" />
					<xsl:if test="position()=1">

						<tr>
							<td class="azul"><xsl:value-of select="nombre"/></td>
							<td class="violeta"><xsl:value-of select="productosenstock"/></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>