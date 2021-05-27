<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="Practica6.css"/>
		</head>
		<body>
			<h2>1.- Crea una tabla con los jugadores ordenados en este orden: equipo actual, posición, dorsal. El orden de los datos que se han de mostrar es el siguiente: Número de línea, equipo actual, apodo, dorsal, posición, edad, partidos jugados, amarillas, rojas, goles y asistencias</h2>
			<table class="table2">
				<tr>
					<th>Número de línea</th>
					<th>Equipo actual</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Partidos jugados</th>
					<th>Amarillas</th>
					<th>Rojas</th>
					<th>Goles</th>
					<th>Asistencias</th>
				</tr>
				<xsl:for-each select="jugadores/jugador">
				<xsl:sort select="equipoactual"/>
				<xsl:sort select="posicion"/>
				<xsl:sort select="dorsal" data-type="number" order="descending"/>
				<tr class="violeta">
					<td><xsl:value-of select="position()" /></td>
					<td><xsl:value-of select="equipoactual" /></td>
					<td><xsl:value-of select="apodo" /></td>
					<td><xsl:value-of select="dorsal" /></td>
					<td><xsl:value-of select="posicion" /></td>
					<td><xsl:value-of select="edad" /></td>
					<td><xsl:value-of select="partidosjugados" /></td>
					<td><xsl:value-of select="tarjetasamarillas" /></td>
					<td><xsl:value-of select="tarjetasrojas" /></td>
					<td><xsl:value-of select="goles" /></td>
					<td><xsl:value-of select="asistencias" /></td>

					
				</tr>
				</xsl:for-each>
			</table>
			<h2>Crea una tabla con los jugadores cuya posición es delantero. Ordena los jugadores por goles anotados y después por asistencias. Los datos deben mostrarse en el siguiente orden: Número de línea, equipo actual, apodo, goles, asistencias, partidos jugados y minutos jugados</h2>
			<table class="table2">
				<tr>
					<th>Número de línea</th>
					<th>Equipo actual</th>
					<th>Apodo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					<th>Partidos jugados</th>
					<th>Minutos jugados</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[posicion='Delantero']" >
				<xsl:sort select="goles" data-type="number" order="descending" />
				<xsl:sort select="asistencias" data-type="number" order="descending" />
					<tr class="azul">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:for-each>
			</table>
			<h2>3.- Crea una tabla con los jugadores cuya posición es defensa. Si el jugador es Sergio Ramos debes añadir 20 tarjetas rojas, si es Piqué debes añadir 15 tarjetas rojas y si es Jordi Alba 10 tarjetas rojas y 200 amarillas. Ordena los datos por tarjetas rojas seguido de las amarillas. Los datos deben mostrarse en el siguiente orden: Número de línea, apodo, posición, amarillas, rojas</h2>
			<table class="table2">
				<tr>
					<th>Número de línea</th>
					<th>Apodo</th>
					<th>Posición</th>
					<th>Amarillas</th>
					<th>Rojas</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[posicion='Defensa']">
					<xsl:if test="nombre='Sergio Ramos'">
						<tr class="naranja">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas +20" /></td>
						</tr>
					</xsl:if>
					<xsl:if test="apodo='Piqué'">
						<tr class="amarillo">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas +15" /></td>
						</tr>
					</xsl:if>
					<xsl:if test="nombre='Jordi Alba'">
						<tr class="azul">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas +200" /></td>
							<td><xsl:value-of select="tarjetasrojas +10" /></td>
						</tr>
					</xsl:if >
					<xsl:if test="nombre !='Jordi Alba' and apodo!='Piqué' and nombre !='Sergio Ramos'">
						<tr class="verde">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<h2>4.- Partiendo de la tabla 1, ordena los resultados por equipo, después por posición en orden descendente y finalmente por los minutos disputados de forma descendente. </h2>
			<table class="table2">
				<tr>
					<th>Número de línea</th>
					<th>Equipo actual</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Partidos jugados</th>
					<th>Amarillas</th>
					<th>Rojas</th>
					<th>Goles</th>
					<th>Asistencias</th>
				</tr>
				<xsl:for-each select="jugadores/jugador">
				<xsl:sort select="equipoactual"/>
				<xsl:sort select="posicion" order="descending"/>
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>
				<tr class="violeta">
					<td><xsl:value-of select="position()" /></td>
					<td><xsl:value-of select="equipoactual" /></td>
					<td><xsl:value-of select="apodo" /></td>
					<td><xsl:value-of select="dorsal" /></td>
					<td><xsl:value-of select="posicion" /></td>
					<td><xsl:value-of select="edad" /></td>
					<td><xsl:value-of select="partidosjugados" /></td>
					<td><xsl:value-of select="tarjetasamarillas" /></td>
					<td><xsl:value-of select="tarjetasrojas" /></td>
					<td><xsl:value-of select="goles" /></td>
					<td><xsl:value-of select="asistencias" /></td>
				</tr>
				</xsl:for-each>
			</table>
			<h2>5.- Obtén los 11 jugadores de cada equipo que más minutos han disputado. Ordena los resultados por equipo seguido de los minutos disputados de forma descendente y finalmente por los partidos disputados. </h2>
			<table class="table2" >
				<tr>
					<th>Número de línea</th>
					<th>Equipo actual</th>
					<th>Apodo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					<th>Partidos jugados</th>
					<th>Minutos jugados</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="azul">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="violeta">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="verde">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="azul">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="violeta">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="verde">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C.']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="azul">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="violeta">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="verde">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="azul">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="violeta">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="verde">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="azul">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="violeta">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="verde">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()&lt;12">
					<tr class="azul">
						<td><xsl:value-of select="position()" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="asistencias" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>

		</body>
	</html>
</xsl:template>
</xsl:stylesheet>