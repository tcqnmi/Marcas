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

					<xsl:for-each select="tienda/productos/producto" >
						<xsl:variable name="stockMicrosoft" select="(sum(/tienda/productos/producto/productosenstock[../tienda/productos/producto/proveedores/nombre='Microsoft'])" />
							<!--<xsl:variable name="productosStockProveedor">
								 <xsl:choose>
								 	<xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft']">
			                            <xsl:value-of select="(sum(/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft']))*productosenstock" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo'])" />
			                        </xsl:when>
			                         <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim']">
			                            <xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim']" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Corsair']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Corsair'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Avast']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Avast'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='PC Componentes']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='PC Componentes'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Amazon']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Amazon'])" />
			                        </xsl:when>
			                         <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='CMA Online']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='CMA Online'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Legumbres Luengo']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Legumbres Luengo'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Razer']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Razer'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Antibioticos León']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Antibioticos León'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='AVG']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='AVG'])" />
			                        </xsl:when>
			                       	<xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Carniceria MAES']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Carniceria MAES'])" />
			                        </xsl:when>
			                        <xsl:when test="/tienda/productos/producto/proveedores/nombre[../nombre='Lenovo']">
			                            <xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Lenovo'])" />
			                        </xsl:when>
	                    		</xsl:choose>
							</xsl:variable>-->
						<xsl:if test="position()=1">
						<tr class="verde">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Microsoft']" /></td>
							<td><xsl:value-of select="$stockMicrosoft" /></td>
						</tr>
						</xsl:if>
						<!--<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Vervatim']" /></td>
							<td><xsl:value-of select="$productosProveedor" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="violeta">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Justo Jaramillo']" /></td>
							<td><xsl:value-of select="$productosProveedor" /></td>
						</tr>
						</xsl:if>
						<xsl:if test="position()=1">
						<tr class="verde">
							<td><xsl:value-of select="/tienda/productos/producto/proveedores/nombre[../nombre='Avast']" /></td>
							<td><xsl:value-of select="count(/tienda/productos/producto/proveedores/nombre[../nombre='Avast'])" /></td>
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
						</xsl:if>-->
					</xsl:for-each>
					
				</table>
				<h2>10.- Calcular la media de precio con iva calculado de los productos de la tienda y muestra los productos cuyo precio con iva calculado sea mayor que la media.</h2>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Precio con IVA mayor de la media</th>
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
						<xsl:variable name="numeroProductos" select="count(//@idproducto)"/>
						<xsl:variable name="mediaIva" select="sum($coniva) div $numeroProductos"/>
						<xsl:if test="position()=1">
						<tr>
								<th>Media IVA </th>
								<td><xsl:value-of select="$mediaIva"/></td>
						</tr>
						</xsl:if>
						<xsl:if test="$coniva > $mediaIva ">
							<tr>
								<td class="azul"><xsl:value-of select="nombre" /></td>
								<td class="violeta"><xsl:value-of select="$coniva"/>€</td>
								
							</tr>
						</xsl:if>
						
				</xsl:for-each>
				</table><!-- NO ME SALE LA MEDIA DEL IVA
				<h2>11.- Partiendo del ejercicio 10, añade una columna en la que se calcule el coste medio de los productos dividiendo en vez de por el número de productos por la cantidad total de productos en stock de la tienda.</h2>
				<h2>12.- Obtener el precio medio de los productos divididos por proveedor teniendo en cuenta la cantidad de productos en stock que tiene cada uno, es decir, si un proveedor tiene 1000 productos en stock y la suma de los precios de sus productos es 500, el precio medio será de 0,5 €.</h2>

				<table>
					<tr>
						<th>Nombre del proveedor</th>
						<th>Nombre del prodcuto</th>
						<th>Cantidad en stock</th>
						<th>Precio</th>
						<th>Precio medio</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
						<xsl:variable name="precioTotal" select="sum(precio*productosenstock)" />
						
					</xsl:for-each>
					<tr>
					
					</tr>
				</table>
























				-->

				<h2>13. Obtener el mayor y el menor número de productos en stock.</h2>
				<caption>Producto con menor número de stock</caption>
				<table>
					<tr>
						<th>Nombre del producto</th>
						<th>Productos en stock</th>
					</tr>
					<xsl:for-each select="tienda/productos/producto">
					<xsl:sort select="productosenstock" data-type="number" order="ascending" />
					<xsl:variable name="maxstock" select="productosenstock"/>
					<xsl:if test="position()=1">

						<tr>
							<td class="azul"><xsl:value-of select="nombre"/></td>
							<td class="violeta"><xsl:value-of select="$maxstock"/></td>
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
					<xsl:variable name="minstock" select="productosenstock"/>
					<xsl:if test="position()=1">

						<tr>
							<td class="azul"><xsl:value-of select="nombre"/></td>
							<td class="violeta"><xsl:value-of select="$minstock"/></td>
						</tr>
					</xsl:if>
					</xsl:for-each>
				</table>
				

				
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>