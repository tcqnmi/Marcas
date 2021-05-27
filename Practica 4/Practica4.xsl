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
					
						<xsl:
							ble name="coniva">
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
							<td class="violeta"><xsl:value-of select="round(($estafan)*100)div100" />€</td>
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
							<td class="violeta"><xsl:value-of select="$ganancia" />€</td>
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
						<xsl:variable name="productosProveedorJusto" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo'])" />
						<xsl:variable name="productosProveedorMicrosoft" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft'])" />
						<xsl:variable name="productosProveedorVervatim" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim'])" />
						<xsl:variable name="productosProveedorAvast" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Avast'])" />
						<xsl:variable name="productosProveedorCorsair" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Corsair'])" />
						<xsl:variable name="productosProveedorPcComponentes" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='PC Componentes'])" />
						<xsl:variable name="productosProveedorAmazon" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Amazon'])" />
						<xsl:variable name="productosProveedorCMA" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='CMA Onine'])" />
						<xsl:variable name="productosProveedorLegumbres" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Legumbres Luengo'])" />
						<xsl:variable name="productosProveedorRazer" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Razer'])" />
						<xsl:variable name="productosProveedorAntibioticos" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Antibioticos León'])" />
						<xsl:variable name="productosProveedorAVG" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='AVG'])" />
						<xsl:variable name="productosProveedorMAES" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Carniceria MAES'])" />
						<xsl:variable name="productosProveedorLenovo" select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Lenovo'])" />
						<xsl:variable name="numProductos" select="count(//@idproducto)" />

					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo']" /></td>
						<td><xsl:value-of select="$productosProveedorJusto" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim']" /></td>
						<td><xsl:value-of select="$productosProveedorVervatim" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft']" /></td>
						<td><xsl:value-of select="$productosProveedorMicrosoft" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Avast']" /></td>
						<td><xsl:value-of select="$productosProveedorAvast" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Corsair']" /></td>
						<td><xsl:value-of select="$productosProveedorCorsair" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='PC Componentes']" /></td>
						<td><xsl:value-of select="$productosProveedorPcComponentes" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Amazon']" /></td>
						<td><xsl:value-of select="$productosProveedorAmazon" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='CMA Online']" /></td>
						<td><xsl:value-of select="$productosProveedorCMA" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Legumbres Luengo']" /></td>
						<td><xsl:value-of select="$productosProveedorLegumbres" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Razer']" /></td>
						<td><xsl:value-of select="$productosProveedorRazer" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Antibioticos León']" /></td>
						<td><xsl:value-of select="$productosProveedorAntibioticos" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='AVG']" /></td>
						<td><xsl:value-of select="$productosProveedorAVG" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Carniceria MAES']" /></td>
						<td><xsl:value-of select="$productosProveedorMAES" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="verde">
						<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Lenovo']" /></td>
						<td><xsl:value-of select="$productosProveedorLenovo" /></td>
					</tr>
					</xsl:if>
					<xsl:if test="position()=1">
					<tr class="violeta">
						<th>Total</th>
						<td><xsl:value-of select="$numProductos" /></td>
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

					<xsl:for-each select="tienda/productos/producto" >
						<xsl:variable name="productosJusto" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Justo Jaramillo'])" />
						<xsl:variable name="productosMicrosoft" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Microsoft'])" />
						<xsl:variable name="productosVervatim" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Vervatim'])" />
						<xsl:variable name="productosAvast" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Avast'])" />
						<xsl:variable name="productosCorsair" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Corsair'])" />
						<xsl:variable name="productosPcComponentes" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='PC Componentes'])" />
						<xsl:variable name="productosAmazon" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Amazon'])" />
						<xsl:variable name="productosCMA" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='CMA Online'])" />
						<xsl:variable name="productosLegumbres" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Legumbres Luengo'])" />
						<xsl:variable name="productosRazer" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Razer'])" />
						<xsl:variable name="productosAntibioticos" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Antibioticos León'])" />
						<xsl:variable name="productosAVG" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='AVG'])" />
						<xsl:variable name="productosMAES" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Carniceria MAES'])" />
						<xsl:variable name="productosLenovo" select="sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Lenovo'])" />
						<xsl:variable name="totalStock" select="sum(/tienda/productos/producto/productosenstock)"/>

						<xsl:if test="position() = 1">
						<tr class="verde">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo']" /></td>
							<td><xsl:value-of select="$productosJusto" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim']" /></td>
							<td><xsl:value-of select="$productosVervatim" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="violeta">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft']" /></td>
							<td><xsl:value-of select="$productosMicrosoft" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="verde">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Avast']" /></td>
							<td><xsl:value-of select="$productosAvast" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Corsair']" /></td>
							<td><xsl:value-of select="$productosCorsair" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="violeta">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='PC Componentes']" /></td>
							<td><xsl:value-of select="$productosPcComponentes" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Amazon']" /></td>
							<td><xsl:value-of select="$productosAmazon" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="verde">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='CMA Online']" /></td>
							<td><xsl:value-of select="$productosCMA" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="violeta">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Legumbres Luengo']" /></td>
							<td><xsl:value-of select="$productosLegumbres" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Razer']" /></td>
							<td><xsl:value-of select="$productosRazer" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="verde">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Antibioticos León']" /></td>
							<td><xsl:value-of select="$productosAntibioticos" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="violeta">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='AVG']" /></td>
							<td><xsl:value-of select="$productosAVG" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Carniceria MAES']" /></td>
							<td><xsl:value-of select="$productosMAES" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="verde">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Lenovo']" /></td>
							<td><xsl:value-of select="$productosLenovo" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="violeta">
							<th>Total</th>
							<td><xsl:value-of select="$totalStock" /></td>
						</tr>
						</xsl:if>

					</xsl:for-each>
					
				</table>

				<h2>10.- Calcular la media de precio con iva calculado de los productos de la tienda y muestra los productos cuyo precio con iva calculado sea mayor que la media.</h2>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Precio con IVA mayor de la media</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
						

						<xsl:variable name="total" select="sum(/tienda/productos/producto/productosenstock)"/>
						<xsl:variable name="precioivas" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='software'])*1.21" />
						<xsl:variable name="precioivah" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='hardware'])*1.21" />
						<xsl:variable name="precioivam" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='medicina'])*1.10" />
						<xsl:variable name="precioivac" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='clases'])*1.10" />
						<xsl:variable name="precioivaa" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='alimentación'])*1.10" />
						<xsl:variable name="media" select="round((($total + $precioivaa +$precioivac + $precioivam + $precioivah + $precioivas)div $total)*100)div 100"/>
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



						<xsl:if test="position()=1">
							<tr>
									<th>Media IVA </th>
									<td class="violeta"><xsl:value-of select="$media" />€</td>
							</tr>
						</xsl:if>
						<xsl:if test=" $coniva>$media">
							<tr>
								<td class="azul"><xsl:value-of select="nombre" /></td>
								<td class="violeta"><xsl:value-of select="$coniva" />€</td>
							</tr>
						</xsl:if>
						
						
				</xsl:for-each>
				</table> 
				<h2>11.- Partiendo del ejercicio 10, añade una columna en la que se calcule el coste medio de los productos dividiendo en vez de por el número de productos por la cantidad total de productos en stock de la tienda.</h2>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Precio con IVA mayor de la media</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
						

						<xsl:variable name="total" select="sum(/tienda/productos/producto/productosenstock)"/>
						<xsl:variable name="precioivas" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='software'])*1.21" />
						<xsl:variable name="precioivah" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='hardware'])*1.21" />
						<xsl:variable name="precioivam" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='medicina'])*1.10" />
						<xsl:variable name="precioivac" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='clases'])*1.10" />
						<xsl:variable name="precioivaa" select="sum(/tienda/productos/producto/preciosiniva[../@tipo='alimentación'])*1.10" />
						<xsl:variable name="media" select="round((($total + $precioivaa + $precioivac + $precioivam + $precioivah + $precioivas)div $total)*100)div 100"/>
						<xsl:variable name="numProductos" select="count(//@idproducto)" />
						<xsl:variable name="mediaCoste" select="round((($total + $precioivaa +$precioivac + $precioivam + $precioivah + $precioivas)div $numProductos)*100)div 100"/>
					

						<xsl:if test="position()=1">
							<tr>
									<th>Media IVA </th>
									<td class="violeta"><xsl:value-of select="$media" />€</td>
							</tr>
						</xsl:if>
						<xsl:if test="position()=1">
							<tr>
									<th>Media Coste</th>
									<td class="violeta"><xsl:value-of select="$mediaCoste" />€</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</table>

				<h2>12.- Obtener el precio medio de los productos divididos por proveedor teniendo en cuenta la cantidad de productos en stock que tiene cada uno, es decir, si un proveedor tiene 1000 productos en stock y la suma de los precios de sus productos es 500, el precio medio será de 0,5 €.</h2>

				<table>
					<tr>
						<th>Nombre del proveedor</th>
						<th>Nombre del prodcuto</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
						<xsl:variable name="pmjusto" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Justo Jaramillo']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Justo Jaramillo']))*100) div 100" />
						<xsl:variable name="pmMicrosoft" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Microsoft']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Microsoft']))*100) div 100" />
						<xsl:variable name="pmVervatim" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Vervatim']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Vervatim']))*100) div 100" />
						<xsl:variable name="pmAvast" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Avast']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Avast']))*100) div 100" />
						<xsl:variable name="pmCorsair" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Corsair']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Corsair']))*100) div 100" />
						<xsl:variable name="pmPcComponentes" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='PC Componentes']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='PC Componentes']))*100) div 100" />
						<xsl:variable name="pmAmazon" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Amazon']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Amazon']))*100) div 100" />
						<xsl:variable name="pmCMA" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='CMA Online']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='CMA Online']))*100) div 100" />
						<xsl:variable name="pmLegumbres" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Legumbres Luengo']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Legumbres Luengo']))*100) div 100" />
						<xsl:variable name="pmRazer" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Razer']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Razer']))*100) div 100" />
						<xsl:variable name="pmAntibioticos" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Antibioticos León']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Antibioticos León']))*100) div 100" />
						<xsl:variable name="pmAVG" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='AVG']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='AVG']))*100) div 100" />
						<xsl:variable name="pmMAES"  select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Carniceria MAES']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Carniceria MAES']))*100) div 100" />
						<xsl:variable name="pmLenovo" select="round((sum(/tienda/productos/producto/preciosiniva[../proveedores/nombre='Lenovo']) div sum(/tienda/productos/producto/productosenstock[../proveedores/nombre='Lenovo']))*100) div 100" />
						
						
					
					<xsl:if test="position()=1">
						<tr class="azul">
							<td>Precio medio Justo Jaramillo</td>
							<td><xsl:value-of select="$pmjusto"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="violeta">
							<td>Precio medio Microsoft</td>
							<td><xsl:value-of select="$pmMicrosoft"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="verde">
							<td>Precio medio Vervatim</td>
							<td><xsl:value-of select="$pmVervatim"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="azul">
							<td>Precio medio Avast</td>
							<td><xsl:value-of select="$pmAvast"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="violeta">
							<td>Precio medio Corsair</td>
							<td><xsl:value-of select="$pmCorsair"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="verde">
							<td>Precio medio PcComponentes</td>
							<td><xsl:value-of select="$pmPcComponentes"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="azul">
							<td>Precio medio Amazon</td>
							<td><xsl:value-of select="$pmAmazon"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="violeta">
							<td>Precio medio CMA Online</td>
							<td><xsl:value-of select="$pmCMA"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="verde">
							<td>Precio medio Legumbres Luengo</td>
							<td><xsl:value-of select="$pmLegumbres"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="azul">
							<td>Precio medio Razer</td>
							<td><xsl:value-of select="$pmRazer"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="violeta">
							<td>Precio medio Antibioticos León</td>
							<td><xsl:value-of select="$pmAntibioticos"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="verde">
							<td>Precio medio AVG</td>
							<td><xsl:value-of select="$pmAVG"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="azul">
							<td>Precio medio Carniceria MAES</td>
							<td><xsl:value-of select="$pmMAES"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()=1">
						<tr class="violeta">
							<td>Precio medio Lenovo</td>
							<td><xsl:value-of select="$pmLenovo"/></td>
						</tr>
					</xsl:if>
					
				</xsl:for-each>
				</table>


				<h2>13. Obtener el mayor y el menor número de productos en stock.</h2>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Productos en stock</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
				    <xsl:sort select="productosenstock" data-type="number"/>
				    <xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min]">

								<tr>
									<td class="azul"><xsl:value-of select="nombre"/></td>
									<td class="violeta"><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max]">

								<tr>
									<td class="azul"><xsl:value-of select="nombre"/></td>
									<td class="violeta"><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>

					</xsl:for-each>
				</table>
				
				<h2>14.- Obtener los productos que tienen el mayor y menor número de prodcutos en stock de cada uno de los proveedores</h2>
				<table>
					<tr>
						<th>  -  </th>
						<th>Nombre del producto</th>
						<th>Cantidad</th>
						
						
					</tr>
					<tr>

						<td colspan="3" class="violeta">Microsoft</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Microsoft']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Microsoft']">

								<tr class="violeta">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Microsoft']">

								<tr class="violeta">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="azul">Justo Jaramillo</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Justo Jaramillo']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Justo Jaramillo']">

								<tr class="azul">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Justo Jaramillo']">

								<tr class="azul">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="verde">Vervatim</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Vervatim']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Vervatim']">

								<tr class="verde">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Vervatim']">

								<tr class="verde">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="amarillo">Avast</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Avast']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Avast']">

								<tr class="amarillo">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Avast']">

								<tr class="amarillo">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="violeta">Corsair</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Corsair']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Corsair']">

								<tr class="violeta">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Corsair']">

								<tr class="violeta">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="azul">Pc Componente</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'PC Componentes']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'PC Componentes']">

								<tr class="azul">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'PC Componentes']">

								<tr class="azul">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="verde">Amazon</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Amazon']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Amazon']">

								<tr class="verde">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Amazon']">

								<tr class="verde">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="amarillo">CMA Online</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'CMA Online']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'CMA Online']">

								<tr class="amarillo">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'CMA Online']">

								<tr class="amarillo">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="violeta">Legumbres Luengo</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Legumbres Luengo']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Legumbres Luengo']">

								<tr class="violeta">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Legumbres Luengo']">

								<tr class="violeta">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="azul">Razer</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Razer']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Razer']">

								<tr class="azul">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Razer']">

								<tr class="azul">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="violeta">Antibioticos León</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Antibioticos León']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Antibioticos León']">

								<tr class="violeta">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Antibioticos León']">

								<tr class="violeta">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="verde">AVG</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'AVG']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'AVG']">

								<tr class="verde">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'AVG']">

								<tr class="verde">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="amarillo">Carniceria MAES</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Carniceria MAES']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Carniceria MAES']">

								<tr class="amarillo">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Carniceria MAES']">

								<tr class="amarillo">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					<tr>

						<td colspan="3" class="violeta">Lenovo</td>
					</tr>
					<xsl:for-each select="tienda/productos/producto[proveedores/nombre = 'Lenovo']">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="max" select="productosenstock"/>
				    <xsl:variable name="min" select="productosenstock"/>

						<xsl:if test="position()=1">
							<xsl:for-each select="/tienda/productos/producto[productosenstock=$min and proveedores/nombre = 'Lenovo']">

								<tr class="violeta">
									<td>Minimo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>

							</xsl:for-each>
						</xsl:if>

						<xsl:if test="position()=last()">
       					<xsl:for-each select="/tienda/productos/producto[productosenstock=$max and proveedores/nombre = 'Lenovo']">

								<tr class="violeta">
									<td>Maximo</td>
									<td><xsl:value-of select="nombre"/></td>
									<td><xsl:value-of select="productosenstock"/></td>
								</tr>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
				</table>
				
				
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>