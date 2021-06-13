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
			<h2>2.- Crea una tabla con los jugadores cuya posición es delantero. Ordena los jugadores por goles anotados y después por asistencias. Los datos deben mostrarse en el siguiente orden: Número de línea, equipo actual, apodo, goles, asistencias, partidos jugados y minutos jugados</h2>
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
				<xsl:for-each select="jugadores/jugador[posicion='Defensa' and nombre='Sergio Ramos']">
					<xsl:sort select="tarjetasrojas" data-type="number" order="descending" />
					<xsl:sort select="tarjetasamarillas" data-type="number"/>
					
						<tr class="naranja">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas +20" /></td>
						</tr>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[posicion='Defensa' and apodo='Piqué']">
					<xsl:sort select="tarjetasrojas" data-type="number" order="descending" />
					<xsl:sort select="tarjetasamarillas" data-type="number"/>
					
						<tr class="amarillo">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas +15" /></td>
						</tr>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[posicion='Defensa' and nombre='Jordi Alba']">
					<xsl:sort select="tarjetasrojas" data-type="number" order="descending" />
					<xsl:sort select="tarjetasamarillas" data-type="number"/>
					
						<tr class="azul">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas +200" /></td>
							<td><xsl:value-of select="tarjetasrojas +10" /></td>
						</tr>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[posicion='Defensa' and nombre !='Jordi Alba' and apodo!='Piqué' and nombre !='Sergio Ramos']">
					
						<tr class="verde">
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
						</tr>
				
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
				<xsl:for-each select="jugadores/jugador[equipoactual='Altetico de Madrid']" >
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
			<h2>6.- Teniendo en cuenta los resultados obtenidos en el ejercicio anterior, obtén el once tipo de cada equipo teniendo en cuenta a los jugadores que más minutos han jugado. La formación puede variar en función del equipo de tal modo que un equipo puede jugar con 5 defensas y otro con 3. Debes crear una tabla con cada equipo y mostrar los datos en el siguiente orden: Dorsal, Apodo, posición. Ordena los datos de tal manera que primero se muestre el portero, seguido de los defensas, los centrocampistas y los delanteros. </h2>
			<table class="table2" > 
				<caption>Athletic Bilbao</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<br/>
			<table class="table2" > 
				<caption>Atletico de Madrid</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" >
				<caption>Cadiz CF</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Deportivo Alaves</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Elche</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<br/>
				<caption>F.C. Barcelona</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Getafe F.C</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Granada</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>RC Celta</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta F.C.' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Betis</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Madrid</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Sociedad</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Valladolid</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>SD Huesca</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Valencia C.F</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Villarreal C.F.</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Portero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Defensa']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Centrocampista']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Delantero']" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<h2>7.-Haz lo mismo que en el ejercicio 5, pero obtén los 11 jugadores en función de los partidos disputados. En caso de haber un empate entre dos jugadores, se decide por el que más partidos haya jugado como titular.  </h2>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:for-each select="jugadores/jugador[equipoactual='Altetico de Madrid']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
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
			<h2>8.- Haz lo mismo que en el ejercicio 6, pero en este caso utilizando los datos obtenidos en el ejercicio 7. El orden y los datos a mostrar son los mismos que en el ejercicio 6.</h2>
			<table class="table2" > 
				<caption>Athletic Bilbao</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<br/>
			<table class="table2" > 
				<caption>Atletico de Madrid</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" >
				<caption>Cadiz CF</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Cadiz CF' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Deportivo Alaves</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Deportivo Alaves' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Elche</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Elche' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<br/>
				<caption>F.C. Barcelona</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Getafe F.C</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Getafe F.C' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>Granada</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Granada' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2" > 
				<caption>RC Celta</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta F.C.' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='RC Celta' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Betis</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Betis' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Madrid</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Sociedad</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Sociedad' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Real Valladolid</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Valladolid' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>SD Huesca</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='SD Huesca' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Valencia C.F</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Valencia C.F' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
				<br/>
				<table class="table2">
				<caption>Villarreal C.F.</caption>
				<tr>
					<th>Dorsal</th>
					<th>Apodo</th>
					<th>Posición</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Portero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Defensa']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Centrocampista']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual='Villarreal C.F.' and posicion='Delantero']" >
				<xsl:sort select="partidosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 3">
					<tr class="azul">
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="apodo" /></td>
						<td><xsl:value-of select="posicion" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				</table>
			<h2>9.- Ordena los jugadores por minutos disputados, seguido de los partidos disputados como titular y seguido por los partidos disputados (todos los órdenes son descendientes). </h2>
			<table class="table2">
				<tr>
					<th>Número de línea</th>
					<th>Equipo actual</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Minutos jugados</th>
					<th>Partidos jugados como titular</th>
					<th>Partidos jugados</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador" >
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular " data-type="number" order="descending"/>
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
				<tr class="violeta">
					<td><xsl:value-of select="position()" /></td>
					<td><xsl:value-of select="equipoactual" /></td>
					<td><xsl:value-of select="apodo" /></td>
					<td><xsl:value-of select="dorsal" /></td>
					<td><xsl:value-of select="posicion" /></td>
					<td><xsl:value-of select="edad" /></td>
					<td><xsl:value-of select="minutosjugados" /></td>
					<td><xsl:value-of select="partidosjugadostitular" /></td>
					<td><xsl:value-of select="partidosjugados" /></td>	
				</tr>
				</xsl:for-each>
			</table>
			<h2>10.- Obtén los 11 jugadores que más minutos han disputado. Ordena los datos por el númerode minutos disputados, seguido de los partidos disputados como titular y de los partidos disputados (todos los órdenes son descendientes). Para este ejercicio es obligatorio mostrar 1 portero, 4 defensas, 4 centrocampistas y dos delanteros</h2>
			<table>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Minutos jugados</th>
					<th>Partidos como titular</th>
					<th>Partidos disputados</th>
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position() &lt; 5">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position() &lt; 5">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position() &lt; 3">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<h2>11.- Descontando los 11 jugadores obtenidos en el ejercicio 10. Obtén los siguientes 11 jugadores que cumplen con los requisitos del ejercicio anterior </h2>
			<table>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Minutos jugados</th>
					<th>Partidos como titular</th>
					<th>Partidos disputados</th>
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position()=2">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position() >4 and position() &lt; 9">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position() >4 and position() &lt; 9">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
					<xsl:if test="position() >2 and position() &lt; 5">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<h2>12.- Se va a disputar un All-Star Game de la liga española. Los dos equipos estarán formados por 1 portero, 3 defensas, 4 centrocampistas y 3 delanteros. Para elegir a los 11 jugadores de los dos equipos se tendrá en cuenta lo siguiente: Deben jugar en alguno de los dos equipos los 6 máximos goleadores y los 4 máximos asistentes (si alguno de los asistentes está incluido entre los 6 jugadores con más goles, se elegirá al siguiente de la clasificación). El resto de jugadores se elegirán teniendo en cuenta los partidos disputados como titular, y en caso de haber un empate se elegirá al que más minutos disputados tenga. Debes mostrar los resultados en dos tablas con dos alineaciones en las que se diferencien claramente las posiciones de cada jugador (defensas de un color, centrocampistas de otro...).</h2>
			<table>
				<caption>EQUIPO 1</caption>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados"/>
					<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position() &lt;4 ">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position() &lt; 5">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position() &lt;4">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<table>
				<caption>EQUIPO 2</caption>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados"/>
					<xsl:if test="position()=2">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()> 3 and position() &lt;7 ">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()>4 and position() &lt; 9">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()> 3 and position() &lt;7 ">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<h2>13.- Partiendo del ejercicio anterior, añade los jugadores suplentes teniendo en cuenta que cada equipo debe tener 6 suplentes de los que como mínimo ha de haber 1 jugador por posición. Éstos jugadores se han de elegir teniendo en cuenta los criterios establecidos en el ejercicio 12</h2>
			<table>
				<caption>EQUIPO 1</caption>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados"/>
					<xsl:if test="position()=1">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position() &lt;4 ">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position() &lt; 5">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position() &lt;4">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				
			</table>
			<table>
				<caption>Suplentes Equipo 1</caption>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados"/>
					<xsl:if test="position()=3">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()=7 ">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()=9 or position()=10">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()=7 or position()=8">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>

			<table>
				<caption>EQUIPO 2</caption>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados"/>
					<xsl:if test="position()=2">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()> 3 and position() &lt;7 ">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()>4 and position() &lt; 9">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()> 3 and position() &lt;7 ">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<br />
			<table>
				<caption>Suplentes Equipo 2</caption>
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Dorsal</th>
					<th>Posicion</th>
					<th>Equipo</th>
					<th>Goles</th>
					<th>Asistencias</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Portero']">
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
				<xsl:sort select="partidosjugados"/>
					<xsl:if test="position()=4">
						<tr class="azul">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Defensa']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()=8 ">
						<tr class="violeta">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Centrocampista']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()=11 or position()=12">
						<tr class="verde">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero']">
				<xsl:sort select="goles" data-type="number" order="descending"/>
				<xsl:sort select="asistencias" data-type="number" order="descending"/>
				<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
				<xsl:sort select="minutosjugados" data-type="number" order="descending" />
					<xsl:if test="position()=9 or position()=10">
						<tr class="amarillo">
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="asistencias" /></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<h2>14.- Calcula el resultado final del partido sumando la media de goles que tiene cada jugador en 90 minutos. Muestra el resultado redondeado hacia arriba, de tal forma que si la media de goles de un equipo es 3,15, se redondeará a 4</h2>
			<table>
				<tr>
					<td class="verde">Equipo 1</td>
					
					<xsl:variable name="gLedesma" select="(/jugadores/jugador/goles[../apodo='Jeremías Ledesma'] div /jugadores/jugador/minutosjugados[../apodo='Jeremías Ledesma'])*90" />
					<xsl:variable name="gBerenguer" select="(/jugadores/jugador/goles[../apodo='Berenguer'] div /jugadores/jugador/minutosjugados[../apodo='Berenguer'])*90" />
					<xsl:variable name="gSergio" select="(/jugadores/jugador/goles[../apodo='Sergio Ramos'] div /jugadores/jugador/minutosjugados[../apodo='Sergio Ramos'])*90" />
					<xsl:variable name="gAlba" select="(/jugadores/jugador/goles[../apodo='Jordi Alba'] div /jugadores/jugador/minutosjugados[../apodo='Jordi Alba'])*90" />
					<xsl:variable name="gLlorente" select="(/jugadores/jugador/goles[../apodo='Llorente'] div /jugadores/jugador/minutosjugados[../apodo='Llorente'])*90" />
					<xsl:variable name="gIago" select="(/jugadores/jugador/goles[../apodo='Iago'] div /jugadores/jugador/minutosjugados[../apodo='Iago'])*90" />
					<xsl:variable name="gOcampos" select="(/jugadores/jugador/goles[../apodo='Ocampos'] div /jugadores/jugador/minutosjugados[../apodo='Ocampos'])*90" />
					<xsl:variable name="gRakitic" select="(/jugadores/jugador/goles[../apodo='Rakitic'] div /jugadores/jugador/minutosjugados[../apodo='Rakitic'])*90" />
					<xsl:variable name="gMoreno" select="(/jugadores/jugador/goles[../apodo='Gerard Moreno'] div /jugadores/jugador/minutosjugados[../apodo='Gerard Moreno'])*90" />
					<xsl:variable name="gMessi" select="(/jugadores/jugador/goles[../apodo='Messi'] div /jugadores/jugador/minutosjugados[../apodo='Messi'])*90" />
					<xsl:variable name="gBenzema" select="(/jugadores/jugador/goles[../apodo='Benzema'] div /jugadores/jugador/minutosjugados[../apodo='Benzema'])*90" />
					<xsl:variable name="golesE1" select="$gLedesma + $gBerenguer + $gSergio + $gAlba + $gLlorente + $gIago + $gOcampos + $gRakitic + $gMoreno + $gMessi + $gBenzema" />


					<xsl:variable name="gBounou" select="(/jugadores/jugador/goles[../apodo='Bounou'] div /jugadores/jugador/minutosjugados[../apodo='Bounou'])*90" />
					<xsl:variable name="gGonzalo" select="(/jugadores/jugador/goles[../apodo='Gonzalo Verdú'] div /jugadores/jugador/minutosjugados[../apodo='Gonzalo Verdú'])*90" />
					<xsl:variable name="gKoundé" select="(/jugadores/jugador/goles[../apodo='Koundé'] div /jugadores/jugador/minutosjugados[../apodo='Koundé'])*90" />
					<xsl:variable name="gDarwin" select="(/jugadores/jugador/goles[../apodo='Darwin'] div /jugadores/jugador/minutosjugados[../apodo='Darwin'])*90" />
					<xsl:variable name="gRaul" select="(/jugadores/jugador/goles[../apodo='Raúl'] div /jugadores/jugador/minutosjugados[../apodo='Raúl'])*90" />
					<xsl:variable name="gCanales" select="(/jugadores/jugador/goles[../apodo='Canales'] div /jugadores/jugador/minutosjugados[../apodo='Canales'])*90" />
					<xsl:variable name="gSoler" select="(/jugadores/jugador/goles[../apodo='Soler'] div /jugadores/jugador/minutosjugados[../apodo='Soler'])*90" />
					<xsl:variable name="gSanti" select="(/jugadores/jugador/goles[../apodo='Santi Mina'] div /jugadores/jugador/minutosjugados[../apodo='Santi Mina'])*90" />
					<xsl:variable name="gGriezmann" select="(/jugadores/jugador/goles[../apodo='Griezmann'] div /jugadores/jugador/minutosjugados[../apodo='Griezmann'])*90" />
					<xsl:variable name="gSuarez" select="(/jugadores/jugador/goles[../apodo='Suárez'] div /jugadores/jugador/minutosjugados[../apodo='Suárez'])*90" />
					<xsl:variable name="gJoao" select="(/jugadores/jugador/goles[../apodo='João Félix'] div /jugadores/jugador/minutosjugados[../apodo='João Félix'])*90" />
					<xsl:variable name="golesE2" select="($gBounou) + ($gGonzalo) + ($gKoundé) + ($gDarwin) + ($gRaul) + ($gCanales) + ($gSoler) + ($gSanti) + ($gGriezmann) + ($gSuarez) + ($gJoao)" />
					
					<td class="violeta"><xsl:if test="$golesE1 >0 and $golesE1 &lt;= 1">1</xsl:if>
						<xsl:if test="$golesE1 >1 and $golesE1 &lt;= 2">2</xsl:if>
						<xsl:if test="$golesE1 >2 and $golesE1 &lt;= 3">3</xsl:if>
						<xsl:if test="$golesE1 >3 and $golesE1 &lt;= 4 ">4</xsl:if>
						<xsl:if test="$golesE1 >4 and $golesE1 &lt;= 5">5</xsl:if>
						<xsl:if test="$golesE1 >5 and $golesE1 &lt;= 6">6</xsl:if>
						-
						<xsl:if test="$golesE2 >0 and $golesE2 &lt;= 1">1</xsl:if>
						<xsl:if test="$golesE2 >1 and $golesE2 &lt;= 2">2</xsl:if>
						<xsl:if test="$golesE2 >2 and $golesE2 &lt;= 3">3</xsl:if>
						<xsl:if test="$golesE2 >3 and $golesE2 &lt;= 4">4</xsl:if>
						<xsl:if test="$golesE2 >4 and $golesE2 &lt;= 5">5</xsl:if>
						<xsl:if test="$golesE2 >5 and $golesE2 &lt;= 6">6</xsl:if>
					</td>
				
				<td class="azul">Equipo 2</td>
				</tr>	
			</table>
			<h2>15.- Añade los cálculos de las asistencias, las amarillas y  las rojas que se darán en el partido. </h2>
			<table>
				
				<tr>
					<th>Asistencias</th>
					<td class="verde">Equipo 1</td>
					
					<xsl:variable name="gLedesma" select="(/jugadores/jugador/asistencias[../apodo='Jeremías Ledesma'] div /jugadores/jugador/minutosjugados[../apodo='Jeremías Ledesma'])*90" />
					<xsl:variable name="gBerenguer" select="(/jugadores/jugador/asistencias[../apodo='Berenguer'] div /jugadores/jugador/minutosjugados[../apodo='Berenguer'])*90" />
					<xsl:variable name="gSergio" select="(/jugadores/jugador/asistencias[../apodo='Sergio Ramos'] div /jugadores/jugador/minutosjugados[../apodo='Sergio Ramos'])*90" />
					<xsl:variable name="gAlba" select="(/jugadores/jugador/asistencias[../apodo='Jordi Alba'] div /jugadores/jugador/minutosjugados[../apodo='Jordi Alba'])*90" />
					<xsl:variable name="gLlorente" select="(/jugadores/jugador/asistencias[../apodo='Llorente'] div /jugadores/jugador/minutosjugados[../apodo='Llorente'])*90" />
					<xsl:variable name="gIago" select="(/jugadores/jugador/asistencias[../apodo='Iago'] div /jugadores/jugador/minutosjugados[../apodo='Iago'])*90" />
					<xsl:variable name="gOcampos" select="(/jugadores/jugador/asistencias[../apodo='Ocampos'] div /jugadores/jugador/minutosjugados[../apodo='Ocampos'])*90" />
					<xsl:variable name="gRakitic" select="(/jugadores/jugador/asistencias[../apodo='Rakitic'] div /jugadores/jugador/minutosjugados[../apodo='Rakitic'])*90" />
					<xsl:variable name="gMoreno" select="(/jugadores/jugador/asistencias[../apodo='Gerard Moreno'] div /jugadores/jugador/minutosjugados[../apodo='Gerard Moreno'])*90" />
					<xsl:variable name="gMessi" select="(/jugadores/jugador/asistencias[../apodo='Messi'] div /jugadores/jugador/minutosjugados[../apodo='Messi'])*90" />
					<xsl:variable name="gBenzema" select="(/jugadores/jugador/asistencias[../apodo='Benzema'] div /jugadores/jugador/minutosjugados[../apodo='Benzema'])*90" />
					<xsl:variable name="asistenciasE1" select="$gLedesma + $gBerenguer + $gSergio + $gAlba + $gLlorente + $gIago + $gOcampos + $gRakitic + $gMoreno + $gMessi + $gBenzema" />


					<xsl:variable name="gBounou" select="(/jugadores/jugador/asistencias[../apodo='Bounou'] div /jugadores/jugador/minutosjugados[../apodo='Bounou'])*90" />
					<xsl:variable name="gGonzalo" select="(/jugadores/jugador/asistencias[../apodo='Gonzalo Verdú'] div /jugadores/jugador/minutosjugados[../apodo='Gonzalo Verdú'])*90" />
					<xsl:variable name="gKoundé" select="(/jugadores/jugador/asistencias[../apodo='Koundé'] div /jugadores/jugador/minutosjugados[../apodo='Koundé'])*90" />
					<xsl:variable name="gDarwin" select="(/jugadores/jugador/asistencias[../apodo='Darwin'] div /jugadores/jugador/minutosjugados[../apodo='Darwin'])*90" />
					<xsl:variable name="gRaul" select="(/jugadores/jugador/asistencias[../apodo='Raúl'] div /jugadores/jugador/minutosjugados[../apodo='Raúl'])*90" />
					<xsl:variable name="gCanales" select="(/jugadores/jugador/asistencias[../apodo='Canales'] div /jugadores/jugador/minutosjugados[../apodo='Canales'])*90" />
					<xsl:variable name="gSoler" select="(/jugadores/jugador/asistencias[../apodo='Soler'] div /jugadores/jugador/minutosjugados[../apodo='Soler'])*90" />
					<xsl:variable name="gSanti" select="(/jugadores/jugador/asistencias[../apodo='Santi Mina'] div /jugadores/jugador/minutosjugados[../apodo='Santi Mina'])*90" />
					<xsl:variable name="gGriezmann" select="(/jugadores/jugador/asistencias[../apodo='Griezmann'] div /jugadores/jugador/minutosjugados[../apodo='Griezmann'])*90" />
					<xsl:variable name="gSuarez" select="(/jugadores/jugador/asistencias[../apodo='Suárez'] div /jugadores/jugador/minutosjugados[../apodo='Suárez'])*90" />
					<xsl:variable name="gJoao" select="(/jugadores/jugador/asistencias[../apodo='João Félix'] div /jugadores/jugador/minutosjugados[../apodo='João Félix'])*90" />
					<xsl:variable name="asistenciasE2" select="($gBounou) + ($gGonzalo) + ($gKoundé) + ($gDarwin) + ($gRaul) + ($gCanales) + ($gSoler) + ($gSanti) + ($gGriezmann) + ($gSuarez) + ($gJoao)" />
				
				
					<td class="violeta"><xsl:if test="$asistenciasE1 >0 and $asistenciasE1 &lt;= 1">1</xsl:if>
						<xsl:if test="$asistenciasE1 >1 and $asistenciasE1 &lt;= 2">2</xsl:if>
						<xsl:if test="$asistenciasE1 >2 and $asistenciasE1 &lt;= 3">3</xsl:if>
						<xsl:if test="$asistenciasE1 >3 and $asistenciasE1 &lt;= 4 ">4</xsl:if>
						<xsl:if test="$asistenciasE1 >4 and $asistenciasE1 &lt;= 5">5</xsl:if>
						<xsl:if test="$asistenciasE1 >5 and $asistenciasE1 &lt;= 6">6</xsl:if>
						-
						<xsl:if test="$asistenciasE2 >0 and $asistenciasE2 &lt;= 1">1</xsl:if>
						<xsl:if test="$asistenciasE2 >1 and $asistenciasE2 &lt;= 2">2</xsl:if>
						<xsl:if test="$asistenciasE2 >2 and $asistenciasE2 &lt;= 3">3</xsl:if>
						<xsl:if test="$asistenciasE2 >3 and $asistenciasE2 &lt;= 4">4</xsl:if>
						<xsl:if test="$asistenciasE2 >4 and $asistenciasE2 &lt;= 5">5</xsl:if>
						<xsl:if test="$asistenciasE2 >5 and $asistenciasE2 &lt;= 6">6</xsl:if>
					</td>
					<td class="azul">Equipo 2</td>
				</tr>
				
				<tr>
					<th>Amarillas</th>
					<td class="verde">Equipo 1</td>
					
					<xsl:variable name="gLedesma" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Jeremías Ledesma'] div /jugadores/jugador/minutosjugados[../apodo='Jeremías Ledesma'])*90" />
					<xsl:variable name="gBerenguer" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Berenguer'] div /jugadores/jugador/minutosjugados[../apodo='Berenguer'])*90" />
					<xsl:variable name="gSergio" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Sergio Ramos'] div /jugadores/jugador/minutosjugados[../apodo='Sergio Ramos'])*90" />
					<xsl:variable name="gAlba" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Jordi Alba'] div /jugadores/jugador/minutosjugados[../apodo='Jordi Alba'])*90" />
					<xsl:variable name="gLlorente" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Llorente'] div /jugadores/jugador/minutosjugados[../apodo='Llorente'])*90" />
					<xsl:variable name="gIago" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Iago'] div /jugadores/jugador/minutosjugados[../apodo='Iago'])*90" />
					<xsl:variable name="gOcampos" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Ocampos'] div /jugadores/jugador/minutosjugados[../apodo='Ocampos'])*90" />
					<xsl:variable name="gRakitic" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Rakitic'] div /jugadores/jugador/minutosjugados[../apodo='Rakitic'])*90" />
					<xsl:variable name="gMoreno" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Gerard Moreno'] div /jugadores/jugador/minutosjugados[../apodo='Gerard Moreno'])*90" />
					<xsl:variable name="gMessi" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Messi'] div /jugadores/jugador/minutosjugados[../apodo='Messi'])*90" />
					<xsl:variable name="gBenzema" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Benzema'] div /jugadores/jugador/minutosjugados[../apodo='Benzema'])*90" />
					<xsl:variable name="tarjetasamarillasE1" select="$gLedesma + $gBerenguer + $gSergio + $gAlba + $gLlorente + $gIago + $gOcampos + $gRakitic + $gMoreno + $gMessi + $gBenzema" />


					<xsl:variable name="gBounou" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Bounou'] div /jugadores/jugador/minutosjugados[../apodo='Bounou'])*90" />
					<xsl:variable name="gGonzalo" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Gonzalo Verdú'] div /jugadores/jugador/minutosjugados[../apodo='Gonzalo Verdú'])*90" />
					<xsl:variable name="gKoundé" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Koundé'] div /jugadores/jugador/minutosjugados[../apodo='Koundé'])*90" />
					<xsl:variable name="gDarwin" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Darwin'] div /jugadores/jugador/minutosjugados[../apodo='Darwin'])*90" />
					<xsl:variable name="gRaul" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Raúl'] div /jugadores/jugador/minutosjugados[../apodo='Raúl'])*90" />
					<xsl:variable name="gCanales" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Canales'] div /jugadores/jugador/minutosjugados[../apodo='Canales'])*90" />
					<xsl:variable name="gSoler" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Soler'] div /jugadores/jugador/minutosjugados[../apodo='Soler'])*90" />
					<xsl:variable name="gSanti" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Santi Mina'] div /jugadores/jugador/minutosjugados[../apodo='Santi Mina'])*90" />
					<xsl:variable name="gGriezmann" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Griezmann'] div /jugadores/jugador/minutosjugados[../apodo='Griezmann'])*90" />
					<xsl:variable name="gSuarez" select="(/jugadores/jugador/tarjetasamarillas[../apodo='Suárez'] div /jugadores/jugador/minutosjugados[../apodo='Suárez'])*90" />
					<xsl:variable name="gJoao" select="(/jugadores/jugador/tarjetasamarillas[../apodo='João Félix'] div /jugadores/jugador/minutosjugados[../apodo='João Félix'])*90" />
					<xsl:variable name="tarjetasamarillasE2" select="($gBounou) + ($gGonzalo) + ($gKoundé) + ($gDarwin) + ($gRaul) + ($gCanales) + ($gSoler) + ($gSanti) + ($gGriezmann) + ($gSuarez) + ($gJoao)" />
				
				
					<td class="violeta"><xsl:if test="$tarjetasamarillasE1 >0 and $tarjetasamarillasE1 &lt;= 1">1</xsl:if>
						<xsl:if test="$tarjetasamarillasE1 >1 and $tarjetasamarillasE1 &lt;= 2">2</xsl:if>
						<xsl:if test="$tarjetasamarillasE1 >2 and $tarjetasamarillasE1 &lt;= 3">3</xsl:if>
						<xsl:if test="$tarjetasamarillasE1 >3 and $tarjetasamarillasE1 &lt;= 4 ">4</xsl:if>
						<xsl:if test="$tarjetasamarillasE1 >4 and $tarjetasamarillasE1 &lt;= 5">5</xsl:if>
						<xsl:if test="$tarjetasamarillasE1 >5 and $tarjetasamarillasE1 &lt;= 6">6</xsl:if>
						-
						<xsl:if test="$tarjetasamarillasE2 >0 and $tarjetasamarillasE2 &lt;= 1">1</xsl:if>
						<xsl:if test="$tarjetasamarillasE2 >1 and $tarjetasamarillasE2 &lt;= 2">2</xsl:if>
						<xsl:if test="$tarjetasamarillasE2 >2 and $tarjetasamarillasE2 &lt;= 3">3</xsl:if>
						<xsl:if test="$tarjetasamarillasE2 >3 and $tarjetasamarillasE2 &lt;= 4">4</xsl:if>
						<xsl:if test="$tarjetasamarillasE2 >4 and $tarjetasamarillasE2 &lt;= 5">5</xsl:if>
						<xsl:if test="$tarjetasamarillasE2 >5 and $tarjetasamarillasE2 &lt;= 6">6</xsl:if>
					</td>
					<td class="azul">Equipo 2</td>
				</tr>
				<tr>
					<th>Rojas</th>
					<td class="verde">Equipo 1</td>
					
					<xsl:variable name="gLedesma" select="(/jugadores/jugador/tarjetasrojas[../apodo='Jeremías Ledesma'] div /jugadores/jugador/minutosjugados[../apodo='Jeremías Ledesma'])*90" />
					<xsl:variable name="gBerenguer" select="(/jugadores/jugador/tarjetasrojas[../apodo='Berenguer'] div /jugadores/jugador/minutosjugados[../apodo='Berenguer'])*90" />
					<xsl:variable name="gSergio" select="(/jugadores/jugador/tarjetasrojas[../apodo='Sergio Ramos'] div /jugadores/jugador/minutosjugados[../apodo='Sergio Ramos'])*90" />
					<xsl:variable name="gAlba" select="(/jugadores/jugador/tarjetasrojas[../apodo='Jordi Alba'] div /jugadores/jugador/minutosjugados[../apodo='Jordi Alba'])*90" />
					<xsl:variable name="gLlorente" select="(/jugadores/jugador/tarjetasrojas[../apodo='Llorente'] div /jugadores/jugador/minutosjugados[../apodo='Llorente'])*90" />
					<xsl:variable name="gIago" select="(/jugadores/jugador/tarjetasrojas[../apodo='Iago'] div /jugadores/jugador/minutosjugados[../apodo='Iago'])*90" />
					<xsl:variable name="gOcampos" select="(/jugadores/jugador/tarjetasrojas[../apodo='Ocampos'] div /jugadores/jugador/minutosjugados[../apodo='Ocampos'])*90" />
					<xsl:variable name="gRakitic" select="(/jugadores/jugador/tarjetasrojas[../apodo='Rakitic'] div /jugadores/jugador/minutosjugados[../apodo='Rakitic'])*90" />
					<xsl:variable name="gMoreno" select="(/jugadores/jugador/tarjetasrojas[../apodo='Gerard Moreno'] div /jugadores/jugador/minutosjugados[../apodo='Gerard Moreno'])*90" />
					<xsl:variable name="gMessi" select="(/jugadores/jugador/tarjetasrojas[../apodo='Messi'] div /jugadores/jugador/minutosjugados[../apodo='Messi'])*90" />
					<xsl:variable name="gBenzema" select="(/jugadores/jugador/tarjetasrojas[../apodo='Benzema'] div /jugadores/jugador/minutosjugados[../apodo='Benzema'])*90" />
					<xsl:variable name="tarjetasrojasE1" select="$gLedesma + $gBerenguer + $gSergio + $gAlba + $gLlorente + $gIago + $gOcampos + $gRakitic + $gMoreno + $gMessi + $gBenzema" />


					<xsl:variable name="gBounou" select="(/jugadores/jugador/tarjetasrojas[../apodo='Bounou'] div /jugadores/jugador/minutosjugados[../apodo='Bounou'])*90" />
					<xsl:variable name="gGonzalo" select="(/jugadores/jugador/tarjetasrojas[../apodo='Gonzalo Verdú'] div /jugadores/jugador/minutosjugados[../apodo='Gonzalo Verdú'])*90" />
					<xsl:variable name="gKoundé" select="(/jugadores/jugador/tarjetasrojas[../apodo='Koundé'] div /jugadores/jugador/minutosjugados[../apodo='Koundé'])*90" />
					<xsl:variable name="gDarwin" select="(/jugadores/jugador/tarjetasrojas[../apodo='Darwin'] div /jugadores/jugador/minutosjugados[../apodo='Darwin'])*90" />
					<xsl:variable name="gRaul" select="(/jugadores/jugador/tarjetasrojas[../apodo='Raúl'] div /jugadores/jugador/minutosjugados[../apodo='Raúl'])*90" />
					<xsl:variable name="gCanales" select="(/jugadores/jugador/tarjetasrojas[../apodo='Canales'] div /jugadores/jugador/minutosjugados[../apodo='Canales'])*90" />
					<xsl:variable name="gSoler" select="(/jugadores/jugador/tarjetasrojas[../apodo='Soler'] div /jugadores/jugador/minutosjugados[../apodo='Soler'])*90" />
					<xsl:variable name="gSanti" select="(/jugadores/jugador/tarjetasrojas[../apodo='Santi Mina'] div /jugadores/jugador/minutosjugados[../apodo='Santi Mina'])*90" />
					<xsl:variable name="gGriezmann" select="(/jugadores/jugador/tarjetasrojas[../apodo='Griezmann'] div /jugadores/jugador/minutosjugados[../apodo='Griezmann'])*90" />
					<xsl:variable name="gSuarez" select="(/jugadores/jugador/tarjetasrojas[../apodo='Suárez'] div /jugadores/jugador/minutosjugados[../apodo='Suárez'])*90" />
					<xsl:variable name="gJoao" select="(/jugadores/jugador/tarjetasrojas[../apodo='João Félix'] div /jugadores/jugador/minutosjugados[../apodo='João Félix'])*90" />
					<xsl:variable name="tarjetasrojasE2" select="($gBounou) + ($gGonzalo) + ($gKoundé) + ($gDarwin) + ($gRaul) + ($gCanales) + ($gSoler) + ($gSanti) + ($gGriezmann) + ($gSuarez) + ($gJoao)" />
				
				
					<td class="violeta"><xsl:if test="$tarjetasrojasE1 >0 and $tarjetasrojasE1 &lt;= 1">1</xsl:if>
						<xsl:if test="$tarjetasrojasE1 >1 and $tarjetasrojasE1 &lt;= 2">2</xsl:if>
						<xsl:if test="$tarjetasrojasE1 >2 and $tarjetasrojasE1 &lt;= 3">3</xsl:if>
						<xsl:if test="$tarjetasrojasE1 >3 and $tarjetasrojasE1 &lt;= 4 ">4</xsl:if>
						<xsl:if test="$tarjetasrojasE1 >4 and $tarjetasrojasE1 &lt;= 5">5</xsl:if>
						<xsl:if test="$tarjetasrojasE1 >5 and $tarjetasrojasE1 &lt;= 6">6</xsl:if>
						-
						<xsl:if test="$tarjetasrojasE2 >0 and $tarjetasrojasE2 &lt;= 1">1</xsl:if>
						<xsl:if test="$tarjetasrojasE2 >1 and $tarjetasrojasE2 &lt;= 2">2</xsl:if>
						<xsl:if test="$tarjetasrojasE2 >2 and $tarjetasrojasE2 &lt;= 3">3</xsl:if>
						<xsl:if test="$tarjetasrojasE2 >3 and $tarjetasrojasE2 &lt;= 4">4</xsl:if>
						<xsl:if test="$tarjetasrojasE2 >4 and $tarjetasrojasE2 &lt;= 5">5</xsl:if>
						<xsl:if test="$tarjetasrojasE2 >5 and $tarjetasrojasE2 &lt;= 6">6</xsl:if>
					</td>
					<td class="azul">Equipo 2</td>
				</tr>
			</table>
			<h2>16.- Van a disputar un partido el Atlético de Madrid y el Real Madrid. Pronostica el resultado final teniendo en cuenta los datos estadísticos de los 11 jugadores titulares.</h2>
			<table>
				<tr>
					<td class="verde">Atlético de Madrid</td>
					
					<xsl:variable name="gOblak" select="(/jugadores/jugador/goles[../apodo='Oblak'] div /jugadores/jugador/minutosjugados[../apodo='Oblak'])*90" />
					<xsl:variable name="gSavic" select="(/jugadores/jugador/goles[../apodo='Savic'] div /jugadores/jugador/minutosjugados[../apodo='Savic'])*90" />
					<xsl:variable name="gTrippier" select="(/jugadores/jugador/goles[../apodo='Trippier'] div /jugadores/jugador/minutosjugados[../apodo='Trippier'])*90" />
					<xsl:variable name="gHermoso" select="(/jugadores/jugador/goles[../apodo='Hermoso'] div /jugadores/jugador/minutosjugados[../apodo='Hermoso'])*90" />
					<xsl:variable name="gFelipe" select="(/jugadores/jugador/goles[../apodo='Felipe'] div /jugadores/jugador/minutosjugados[../apodo='Felipe'])*90" />
					<xsl:variable name="gKoke" select="(/jugadores/jugador/goles[../apodo='Koke'] div /jugadores/jugador/minutosjugados[../apodo='Koke'])*90" />
					<xsl:variable name="gLlorente" select="(/jugadores/jugador/goles[../apodo='Llorente'] div /jugadores/jugador/minutosjugados[../apodo='Llorente'])*90" />
					<xsl:variable name="gCorrea" select="(/jugadores/jugador/goles[../apodo='Correa'] div /jugadores/jugador/minutosjugados[../apodo='Correa'])*90" />
					<xsl:variable name="gLemar" select="(/jugadores/jugador/goles[../apodo='Lemar'] div /jugadores/jugador/minutosjugados[../apodo='Lemar'])*90" />
					<xsl:variable name="gJoao" select="(/jugadores/jugador/goles[../apodo='João Félix'] div /jugadores/jugador/minutosjugados[../apodo='João Félix'])*90" />
					<xsl:variable name="gSuarez" select="(/jugadores/jugador/goles[../apodo='Suárez'] div /jugadores/jugador/minutosjugados[../apodo='Suárez'])*90" />
					<xsl:variable name="golesE1" select="$gOblak + $gSavic + $gTrippier + $gHermoso + $gFelipe + $gKoke + $gLlorente + $gCorrea + $gLemar + $gJoao + $gSuarez" />


					<xsl:variable name="gThibaut" select="(/jugadores/jugador/goles[../apodo='Thibaut Courtois'] div /jugadores/jugador/minutosjugados[../apodo='Thibaut Courtois'])*90" />
					<xsl:variable name="gRaphael" select="(/jugadores/jugador/goles[../apodo='Raphael Varane'] div /jugadores/jugador/minutosjugados[../apodo='Raphael Varane'])*90" />
					<xsl:variable name="gFerland" select="(/jugadores/jugador/goles[../apodo='Ferland Mendy'] div /jugadores/jugador/minutosjugados[../apodo='Ferland Mendy'])*90" />
					<xsl:variable name="gLucas" select="(/jugadores/jugador/goles[../apodo='Lucas Vázquez'] div /jugadores/jugador/minutosjugados[../apodo='Lucas Vázquez'])*90" />
					<xsl:variable name="gSergio" select="(/jugadores/jugador/goles[../apodo='Sergio Ramos'] div /jugadores/jugador/minutosjugados[../apodo='Sergio Ramos'])*90" />
					<xsl:variable name="gLuka" select="(/jugadores/jugador/goles[../apodo='Luka Modric'] div /jugadores/jugador/minutosjugados[../apodo='Luka Modric'])*90" />
					<xsl:variable name="gToni" select="(/jugadores/jugador/goles[../apodo='Toni Kroos'] div /jugadores/jugador/minutosjugados[../apodo='Toni Kroos'])*90" />
					<xsl:variable name="gCasemiro" select="(/jugadores/jugador/goles[../apodo='Casemiro'] div /jugadores/jugador/minutosjugados[../apodo='Casemiro'])*90" />
					<xsl:variable name="gFederico" select="(/jugadores/jugador/goles[../apodo='Federico Valverde'] div /jugadores/jugador/minutosjugados[../apodo='Federico Valverde'])*90" />
					<xsl:variable name="gMarco" select="(/jugadores/jugador/goles[../apodo='Marco Asensio'] div /jugadores/jugador/minutosjugados[../apodo='Marco Asensio'])*90" />
					<xsl:variable name="gVinícius" select="(/jugadores/jugador/goles[../apodo='Vinícius Júnior'] div /jugadores/jugador/minutosjugados[../apodo='Vinícius Júnior'])*90" />
					<xsl:variable name="golesE2" select="$gThibaut + $gRaphael +$gFerland + $gLucas +$gSergio +$gLuka + $gToni + $gCasemiro + $gFederico + $gMarco + $gVinícius" />
					
					<td class="violeta"><xsl:if test="$golesE1 >0 and $golesE1 &lt;= 1">1</xsl:if>
						<xsl:if test="$golesE1 >1 and $golesE1 &lt;= 2">2</xsl:if>
						<xsl:if test="$golesE1 >2 and $golesE1 &lt;= 3">3</xsl:if>
						<xsl:if test="$golesE1 >3 and $golesE1 &lt;= 4 ">4</xsl:if>
						<xsl:if test="$golesE1 >4 and $golesE1 &lt;= 5">5</xsl:if>
						<xsl:if test="$golesE1 >5 and $golesE1 &lt;= 6">6</xsl:if>
						-
						<xsl:if test="$golesE2 >0 and $golesE2 &lt;= 1">1</xsl:if>
						<xsl:if test="$golesE2 >1 and $golesE2 &lt;= 2">2</xsl:if>
						<xsl:if test="$golesE2 >2 and $golesE2 &lt;= 3">3</xsl:if>
						<xsl:if test="$golesE2 >3 and $golesE2 &lt;= 4">4</xsl:if>
						<xsl:if test="$golesE2 >4 and $golesE2 &lt;= 5">5</xsl:if>
						<xsl:if test="$golesE2 >5 and $golesE2 &lt;= 6">6</xsl:if>
					</td>
				
				<td class="azul">Real Madrid</td>
				</tr>	
			</table>
			<h2>Vuelve a pronosticar el resultado final del ejercicio 16 teniendo en cuenta que la defensa del Atlético de Madrid reduce un 60% las estadísticas del Real Madrid</h2>
			<table>
				<tr>
					<td class="verde">Atlético de Madrid</td>
					
					<xsl:variable name="gOblak" select="(/jugadores/jugador/goles[../apodo='Oblak'] div /jugadores/jugador/minutosjugados[../apodo='Oblak'])*90" />
					<xsl:variable name="gSavic" select="(/jugadores/jugador/goles[../apodo='Savic'] div /jugadores/jugador/minutosjugados[../apodo='Savic'])*90" />
					<xsl:variable name="gTrippier" select="(/jugadores/jugador/goles[../apodo='Trippier'] div /jugadores/jugador/minutosjugados[../apodo='Trippier'])*90" />
					<xsl:variable name="gHermoso" select="(/jugadores/jugador/goles[../apodo='Hermoso'] div /jugadores/jugador/minutosjugados[../apodo='Hermoso'])*90" />
					<xsl:variable name="gFelipe" select="(/jugadores/jugador/goles[../apodo='Felipe'] div /jugadores/jugador/minutosjugados[../apodo='Felipe'])*90" />
					<xsl:variable name="gKoke" select="(/jugadores/jugador/goles[../apodo='Koke'] div /jugadores/jugador/minutosjugados[../apodo='Koke'])*90" />
					<xsl:variable name="gLlorente" select="(/jugadores/jugador/goles[../apodo='Llorente'] div /jugadores/jugador/minutosjugados[../apodo='Llorente'])*90" />
					<xsl:variable name="gCorrea" select="(/jugadores/jugador/goles[../apodo='Correa'] div /jugadores/jugador/minutosjugados[../apodo='Correa'])*90" />
					<xsl:variable name="gLemar" select="(/jugadores/jugador/goles[../apodo='Lemar'] div /jugadores/jugador/minutosjugados[../apodo='Lemar'])*90" />
					<xsl:variable name="gJoao" select="(/jugadores/jugador/goles[../apodo='João Félix'] div /jugadores/jugador/minutosjugados[../apodo='João Félix'])*90" />
					<xsl:variable name="gSuarez" select="(/jugadores/jugador/goles[../apodo='Suárez'] div /jugadores/jugador/minutosjugados[../apodo='Suárez'])*90" />
					<xsl:variable name="golesE1" select="$gOblak + $gSavic + $gTrippier + $gHermoso + $gFelipe + $gKoke + $gLlorente + $gCorrea + $gLemar + $gJoao + $gSuarez" />


					<xsl:variable name="gThibaut" select="(/jugadores/jugador/goles[../apodo='Thibaut Courtois'] div /jugadores/jugador/minutosjugados[../apodo='Thibaut Courtois'])*90" />
					<xsl:variable name="gRaphael" select="(/jugadores/jugador/goles[../apodo='Raphael Varane'] div /jugadores/jugador/minutosjugados[../apodo='Raphael Varane'])*90" />
					<xsl:variable name="gFerland" select="(/jugadores/jugador/goles[../apodo='Ferland Mendy'] div /jugadores/jugador/minutosjugados[../apodo='Ferland Mendy'])*90" />
					<xsl:variable name="gLucas" select="(/jugadores/jugador/goles[../apodo='Lucas Vázquez'] div /jugadores/jugador/minutosjugados[../apodo='Lucas Vázquez'])*90" />
					<xsl:variable name="gSergio" select="(/jugadores/jugador/goles[../apodo='Sergio Ramos'] div /jugadores/jugador/minutosjugados[../apodo='Sergio Ramos'])*90" />
					<xsl:variable name="gLuka" select="(/jugadores/jugador/goles[../apodo='Luka Modric'] div /jugadores/jugador/minutosjugados[../apodo='Luka Modric'])*90" />
					<xsl:variable name="gToni" select="(/jugadores/jugador/goles[../apodo='Toni Kroos'] div /jugadores/jugador/minutosjugados[../apodo='Toni Kroos'])*90" />
					<xsl:variable name="gCasemiro" select="(/jugadores/jugador/goles[../apodo='Casemiro'] div /jugadores/jugador/minutosjugados[../apodo='Casemiro'])*90" />
					<xsl:variable name="gFederico" select="(/jugadores/jugador/goles[../apodo='Federico Valverde'] div /jugadores/jugador/minutosjugados[../apodo='Federico Valverde'])*90" />
					<xsl:variable name="gMarco" select="(/jugadores/jugador/goles[../apodo='Marco Asensio'] div /jugadores/jugador/minutosjugados[../apodo='Marco Asensio'])*90" />
					<xsl:variable name="gVinícius" select="(/jugadores/jugador/goles[../apodo='Vinícius Júnior'] div /jugadores/jugador/minutosjugados[../apodo='Vinícius Júnior'])*90" />
					<xsl:variable name="golesE2" select="($gThibaut + $gRaphael +$gFerland + $gLucas +$gSergio +$gLuka + $gToni + $gCasemiro + $gFederico + $gMarco + $gVinícius) * 0.60" />
					
					<td class="violeta"><xsl:if test="$golesE1 >0 and $golesE1 &lt;= 1">1</xsl:if>
						<xsl:if test="$golesE1 >1 and $golesE1 &lt;= 2">2</xsl:if>
						<xsl:if test="$golesE1 >2 and $golesE1 &lt;= 3">3</xsl:if>
						<xsl:if test="$golesE1 >3 and $golesE1 &lt;= 4 ">4</xsl:if>
						<xsl:if test="$golesE1 >4 and $golesE1 &lt;= 5">5</xsl:if>
						<xsl:if test="$golesE1 >5 and $golesE1 &lt;= 6">6</xsl:if>
						-
						<xsl:if test="$golesE2 >0 and $golesE2 &lt;= 1">1</xsl:if>
						<xsl:if test="$golesE2 >1 and $golesE2 &lt;= 2">2</xsl:if>
						<xsl:if test="$golesE2 >2 and $golesE2 &lt;= 3">3</xsl:if>
						<xsl:if test="$golesE2 >3 and $golesE2 &lt;= 4">4</xsl:if>
						<xsl:if test="$golesE2 >4 and $golesE2 &lt;= 5">5</xsl:if>
						<xsl:if test="$golesE2 >5 and $golesE2 &lt;= 6">6</xsl:if>
					</td>
				
				<td class="azul">Real Madrid</td>
				</tr>	
			</table>

		</html>
	</xsl:template>
</xsl:stylesheet>
				