<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="Practica4.css" />
			</head>
			<body>
				<h2>1.- Obtener una tabla con todos los productos del xml sustituyendo el precio con iva por un precio calculado de la siguiente manera:
				<ul>
					<li>Si el producto es software o hardware hay que multiplicar el precio sin iva por 1,21</li>
					<li>Si el producto es alimentación, clases o medicina hay que multiplicar el precio sin iva por 1,10.</li>
				</ul>
				Muestra los siguientes elementos: Nombre del producto, precio con iva calculado, precio sin iva, productos en stock y nombre del proveedor. </h2>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Precio con iva calculado</th>
						<th>Precio sin iva</th>
						<th>Productos en stock</th>
						<th>Nombre del proveedor</th>
						
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					
						<xsl:variable name="coniva">
							<xsl:choose>
								<xsl:when test="@tipo='software' or @tipo='hardware'">
									<xsl:value-of select="preciosiniva*1.21" />
								</xsl:when>
								<xsl:otherwise >
									<xsl:value-of select="preciosiniva*1.10" />
								</xsl:otherwise>

							</xsl:choose>
						</xsl:variable>
						<tr>
							
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="$coniva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="azul"><xsl:value-of select="proveedores/nombre" /></td>
						</tr>
					</xsl:for-each>
				</table>
				<h2>2.- Obtener una tabla con todas las facturas añadiendo una nueva columna llamada “precio total” que se ha de calcular de la siguiente manera:
					<ul>
						<li>Precio total = cantidad * pvp</li>
					</ul>
				Ordena los resultados por el precio total calculado. </h2>
				<table>
					<tr>
						<th rowspan="2">Número de línea</th>
						<th rowspan="2">Fecha</th>
						<th rowspan="2">Código client</th>
						<th colspan="3">Artículos</th>
						<th rowspan="2">Precio total</th>
						
					</tr>
					<tr>
						
						<th>Nombre</th>
						<th>Cantidad</th>
						<th>PVP</th>
					</tr>
					<xsl:for-each select="tienda/facturas/factura">
					<xsl:sort select="articulos/articulo/pvp*articulos/articulo/cantidad" data-type="number" />
					<xsl:variable name="total" select="articulos/articulo/pvp*articulos/articulo/cantidad"/>
					
					<tr>

						<td class="coral"><xsl:value-of select="numlinea" /></td>
						<td class="amarillo"><xsl:value-of select="fecha" /></td>
						<td class="coral"><xsl:value-of select="codcliente" /></td>
						<td class="coral"><xsl:value-of select="articulos/articulo/nombre" /></td>
						<td class="amarillo"><xsl:value-of select="articulos/articulo/cantidad" /></td>
						<td class="naranja"><xsl:value-of select="articulos/articulo/pvp" />€</td>
						<td class="naranja"><xsl:value-of select="$total" />€</td>
					</tr>
					</xsl:for-each> 

				</table>
				<h2>3.- Partiendo de la consulta número 1, obtén los los productos que son de tipo clases y ordénalos por el precio con iva calculado.</h2>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Precio con iva calculado</th>
						<th>Precio sin iva</th>
						<th>Productos en stock</th>
						<th>Nombre del proveedor</th>
						
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="preciosiniva*1.10" />
					<xsl:if test="@tipo='clases'">
						<xsl:variable name="coniva" select="preciosiniva*1.10"/>
						
						<tr>
							
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="$coniva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="azul"><xsl:value-of select="proveedores/nombre" /></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>4.- . De la tabla productos obtén los que contengan las cadenas en, er, y an cuyo precio con iva calculado sea mayor que 20. Muestra los siguientes elementos: Nombre del producto, precio con iva calculado, cantidad en stock y tipo. Ordena los resultados por el tipo de producto. (La comparativa del precio con iva calculado hay que hacerla sin variables).</h2>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Precio con iva calculado</th>
						<th>Precio sin iva</th>
						<th>Productos en stock</th>
						<th>Tipo</th>
						
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="@tipo" />
					<xsl:variable name="coniva">
						<xsl:choose>
							<xsl:when test="@tipo='clases' or @tipo='alimentacion' or @tipo='medicina'">
								<xsl:value-of select="preciosiniva*1.10"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="preciosiniva*1.21" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:if test="(contains(nombre,'en') or contains(nombre,'er') or contains(nombre,'an')) and  $coniva>20">
						
						
						<tr>
							
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="$coniva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva"/>€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo" /></td>
						</tr>
					</xsl:if>
					
				</xsl:for-each>
				</table>
				<h2>5.- Para todos los productos de la tienda añade una nueva columna llamada "cuanto me estafan" en la que vamos a añadir la diferencia entre el precio con IVA calculado y el precio con IVA. Este resultado puede ser positivo o negativo. Se deben mostrar los datos en el siguiente orden: Nombre del producto, precio con IVA sin calcular, el precio con IVA calculado, precio sin IVA, productos en stock, tipo, nombre del proveedor y cuanto me estafan. Ordena los resultados por el tipo de producto seguido del precio sin iva. </h2>
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
					<xsl:sort select="precioconiva" data-type="number"/>
					<xsl:variable name="coniva">
						<xsl:choose>
							<xsl:when test="@tipo='software' or @tipo='hardware'">
								<xsl:value-of select="preciosiniva*1.21" />
							</xsl:when>
							<xsl:otherwise >
								<xsl:value-of select="preciosiniva*1.10" />
							</xsl:otherwise>

						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="estafan" select="($coniva)-precioconiva"/>
						<tr>
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="precioconiva" />€</td>
							<td class="violeta"><xsl:value-of select="$coniva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo"/></td>
							<td class="violeta"><xsl:value-of select="round(($estafan)*100)div 100" />€</td>
						</tr>
					
					</xsl:for-each>
				</table>
				<h2>6. Partiendo de la tabla del ejercicio 5, muestra solo los productos en los que te estafen por  valor mayor que 10 €. Ordena los datos por proveedores y después por cuánto me estafan de forma descendente. Se deben mostrar los datos en el siguiente orden: Nombre del producto, precio con IVA sin calcular, el precio con IVA calculado, precio sin IVA, productos en stock, tipo de producto, nombre del proveedor y cuanto me estafan</h2>
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
					<xsl:sort select="proveedores/nombre"/>
					<xsl:sort select="precioconiva-preciosiniva*1.10" data-type="number" order="descending" />
					<xsl:variable name="coniva">
						<xsl:choose>
							<xsl:when test="@tipo='software' or @tipo='hardware'">
								<xsl:value-of select="preciosiniva*1.21" />
							</xsl:when>
							<xsl:otherwise >
								<xsl:value-of select="preciosiniva*1.10" />
							</xsl:otherwise>s

						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="estafan" select="precioconiva - $coniva" />
					<xsl:if test="$estafan >10">
						
						<tr>
							<td class="azul"><xsl:value-of select="nombre" /></td>
							<td class="violeta"><xsl:value-of select="precioconiva" />€</td>
							<td class="violeta"><xsl:value-of select="$coniva" />€</td>
							<td class="violeta"><xsl:value-of select="preciosiniva " />€</td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="verde"><xsl:value-of select="@tipo"/></td>
							<td class="verde"><xsl:value-of select="proveedores/nombre"/></td>
							<td class="violeta"><xsl:value-of select="round((precioconiva - $coniva)*100)div100" />€</td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				<h2>7.- Obtener las ganancias previstas por el proveedor para cada producto en función del tipo de producto teniendo en cuenta el número de productos en stock y el precio sin iva calculado. Para calcular las ganancias se utilizará el siguiente criterio:
					<ul>
						<li>En los productos de tipo hardware o software el proveedor se lleva el 60% de las ganancias. </li>
						<li>En los productos de tipo clases o medicina el proveedor se lleva el 70 % de las ganancias</li>
						<li>En los productos de tipo alimentación el proveedor se lleva el 25% de las ganancias.</li>
					</ul>
				Ordena los datos por el tipo de producto seguido del nombre del proveedor</h2>
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
					<xsl:sort select="proveedores/nombre"/>
					<xsl:variable name="ganancia">
						<xsl:choose>
							<xsl:when test="@tipo='hardware' or @tipo='software'">
								<xsl:value-of select="preciosiniva*productosenstock*0.6"/>
							</xsl:when>
							<xsl:when test="@tipo='clases' or @tipo='medicina'">
								<xsl:value-of select="preciosiniva*productosenstock*0.7"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="preciosiniva*productosenstock*0.25"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
						<tr>
							<td class="azul"><xsl:value-of select="proveedores/nombre" /></td>
							<td class="verde"><xsl:value-of select="nombre" /></td>
							<td class="verde"><xsl:value-of select="@tipo" /></td>
							<td class="verde"><xsl:value-of select="productosenstock" /></td>
							<td class="violeta"><xsl:value-of select="preciosiniva" />€</td>
							<td class="violeta"><xsl:value-of select="(preciosiniva*productosenstock)*0.7" />€</td>
						</tr>
					</xsl:for-each>
				</table>
				<h2>8.- Obtener el número de productos de cada proveedor y el número total de productos (productos, no productos en stock).</h2>
				<table>
					<tr>
						<th>Nombre del proveedor</th>
						<th>Total de productos</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto" >
						<xsl:variable nombre="proudctos">
							<xsl:choose>
								<xsl:when test="producto">
									<xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo'])" />
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo']" /></td>
						<td><xsl:value-of select="" /></td>
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
				<h2>9.- Obtener el número de productos en stock de cada proveedor y el número total de productos en stock.</h2>
				<table>
					<tr>
						<th>Nombre del proveedor</th>
						<th>Productos en stock</th>
					</tr>

					
				</table>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>