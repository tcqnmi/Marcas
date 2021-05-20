<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="examen.css"/>
		</head>
		<body>
			<h2>1.- Consulta que muestre los 22 jugadores que más minutos han disputado cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna. Muestra el contenido del documento xml con dos formatos distintos (las filas pares de un color y las impares de otro). Debes mostrar los datos en el siguiente orden: Id de jugador, equipoactual,nombre, dorsal, edad, posición, nacionalidad, minutos disputados, partidos jugados, goles y amarillas. Ordena los datos por los minutos jugados de forma descendente.</h2>
			<table>
				<tr>
					<th>ID Jugador</th>
					<th>Equipo actual</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Edad</th>
					<th>Posicion</th>
					<th>Nacionalidad</th>
					<th>Minutos disputados</th>
					<th>Partidos jugados</th>
					<th>Goles</th>
					<th>Amarillas</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante U.D' and equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 23 and position() mod 2=1">
					<tr  class="impar">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				<xsl:if test=" position() &lt; 23 and position() mod 2=0">
					<tr  class="par">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>

			<h2>2.- Consulta que muestre los 2 porteros que más minutos han disputado cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna; los 8 defensas que más minutos han disputado cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna; los 8 centrocampistas que más minutos han disputado cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna; y los 4 delanteros que más minutos han disputado cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna. Muestra el contenido del documento xml con 4 formatos distintos (uno por cada posición). Debes mostrar los datos en el siguiente orden: Id de jugador, equipo actual, nombre, dorsal, edad, posición, nacionalidad, minutos disputados, partidos jugados, goles y amarillas. Ordena los datos por los minutos jugados de forma descendente.</h2>
			<table>
				<tr>
					<th>ID Jugador</th>
					<th>Equipo actual</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Edad</th>
					<th>Posicion</th>
					<th>Nacionalidad</th>
					<th>Minutos disputados</th>
					<th>Partidos jugados</th>
					<th>Goles</th>
					<th>Amarillas</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Portero' ]">
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>	
				<xsl:if test="position() &lt; 3  ">
					<tr  class="azul">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Defensa' ]">
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 9">
					<tr  class="violeta">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Centrocampista']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 9 ">
					<tr  class="coral">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Delantero']">
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr  class="verde">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.- Consulta que calcule los goles por partido que anota cada delantero y cada centrocampista cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna y haya anotado 10 o más goles. Muestra el contenido del documento xml con dos formatos distintos (las filas pares de un color y las impares de otro). Los goles por partido se calculan dividiendo el número de goles anotados entre los partidos  jugados. Debes mostrar los datos en el siguiente orden: Id de jugador, equipo actual, nombre, dorsal, edad, posición, nacionalidad, minutos disputados, partidos jugados, goles y amarillas. Los números no deben tener más de dos decimales Ordena los datos por los minutos jugados de forma descendente.</h2>
			<table>
				<tr>
					<th>ID Jugador</th>
					<th>Equipo actual</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Edad</th>
					<th>Posicion</th>
					<th>Nacionalidad</th>
					<th>Minutos disputados</th>
					<th>Partidos jugados</th>
					<th>Goles</th>
					<th>Amarillas</th>
					<th>Goles por partido</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante U.D' and  equipoactual!= 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and (posicion='Delantero' or posicion='Centrocampista') and goles>=10]">
				<xsl:sort select="minutosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() mod2=1"> 
					<tr class="impar">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
						<td><xsl:value-of select="round((goles div partidosjugados)*100)div100"/></td>
					</tr>

				</xsl:if>
				<xsl:if test="position() mod2=0"> 
					<tr class="par">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
						<td><xsl:value-of select="round((goles div partidosjugados)*100)div100"/></td>
					</tr>
				</xsl:if>
			</xsl:for-each>
			</table>
			<h2>4.- Consulta que cuente el número de porteros, defensas, centrocampistas y delanteros que tiene el Real Madrid, el F.C. Barcelona, el Athletic Bilbao y el Atlético de Madrid. Crea una tabla para cada equipo con dos columnas, una en la que aparezca la posición y otra el total de jugadores en dicha posición. Añade al final una fila con el total de jugadores del equipo.</h2>
			<table class="violeta">
				<caption>Real Madrid</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Real Madrid']">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero' and ../equipoactual='Real Madrid'])" /></td>
					</tr>
					<tr>
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual='Real Madrid'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual='Real Madrid'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual='Real Madrid'])" /></td>
					</tr>
				</xsl:if>
				
				</xsl:for-each>
			</table>
			<table class="azul">
				<caption>F.C. Barcelona</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona']">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/posicion[../posicion='Portero' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
					<tr >
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
				</xsl:if>
				
				</xsl:for-each>
			</table>
			<table class="verde">
				<caption>Athletic Bilbao</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao']">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
					<tr>
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
				</xsl:if>
				
				</xsl:for-each>
			</table>
			<table class="coral"> 
				<caption>Atletico de Madrid</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Atletico de Madrid']">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero' and ../equipoactual= 'Atletico de Madrid'])" /></td>
					</tr>
					<tr>
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual= 'Atletico de Madrid'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual= 'Atletico de Madrid'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual= 'Atletico de Madrid'])" /></td>
					</tr>

				</xsl:if>
				
				</xsl:for-each>
			</table>
			<br />
			<table class="Violeta">
				<xsl:for-each select="jugadores/jugador">
				<xsl:if test="position()=1">
				<tr>
					<th>Total jugadores</th>
					<td><xsl:value-of select="count(//@idjugador)" /></td>
				</tr>
				</xsl:if>
				</xsl:for-each>
			</table>

			<h2>5.- Consulta que muestre los datos de los 5 jugadores que más partidos hayan jugado de titular cuyo equipo de procedencia contenga las cadenas adri, arcelo, evi y real, hayan anotado entre 1 y 9 goles y hayan dado al menos 1 asistencia. Ordena los resultados por el número de partidos jugados como titular de forma descendente.</h2>
			<table>
				<tr>
					<th>ID Jugador</th>
					<th>Equipo actual</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Edad</th>
					<th>Posicion</th>
					<th>Nacionalidad</th>
					<th>Minutos disputados</th>
					<th>Partidos jugados</th>
					<th>Goles</th>
					<th>Amarillas</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[(contains(equipoproc, arcelo) or contains(equipoproc, adri) or contains(equipoproc, evi) or contains(equipoproc, real)) and goles>=1 and goles &lt;=9 and asistencias>=1]">
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt;=5">

					<tr class="impar">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>

				</xsl:if>
				</xsl:for-each>
			</table>
			
			<h2>Consulta que muestre los 2 porteros que más partidos han jugado de titular cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna; los 8 defensas que más partidos han jugado de titular cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna; los 8 centrocampistas que más partidos han jugado de titular cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna; y los 4 delanteros que más partidos han jugado de titular cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna. Muestra el contenido del documento xml con 4 formatos distintos (uno por cada posición). Debes mostrar los datos en el siguiente orden: Id de jugador, equipo actual, nombre, dorsal, edad, posición, nacionalidad, minutos disputados, partidos jugados, goles y amarillas. Ordena los datos por los minutos jugados de forma descendente.</h2>
			<table>
				<tr>
					<th>ID Jugador</th>
					<th>Equipo actual</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Edad</th>
					<th>Posicion</th>
					<th>Nacionalidad</th>
					<th>Minutos disputados</th>
					<th>Partidos jugados</th>
					<th>Goles</th>
					<th>Amarillas</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Portero' ]">
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>	
				<xsl:if test="position() &lt; 3  ">
					<tr  class="azul">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Defensa' ]">
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 9">
					<tr  class="violeta">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Centrocampista']">
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 9 ">
					<tr  class="coral">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and posicion='Delantero']">
				<xsl:sort select="partidosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() &lt; 5">
					<tr  class="verde">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>

			<h2>7.- Consulta que calcule las asistencias por partido que anota cada delantero y cada centrocampista cuyo equipo actual sea distinto de Levante, Real Valladolid y Osasuna y haya anotado 10 o más goles. Muestra el contenido del documento xml con dos formatos distintos (las filas pares de un color y las impares de otro). Las asistencias por partido se calculan dividiendo el número de asistencias entre los partidos jugados. Debes mostrar los datos en el siguiente orden: Id de jugador, equipo actual, nombre, dorsal, edad, posición, nacionalidad, minutos disputados, partidos jugados, goles, asistencias y asistencias por partido. Los números no deben tener más de dos decimales. Ordena los datos por las asistencias por partido.</h2>
			<table>
				<tr>
					<th>ID Jugador</th>
					<th>Equipo actual</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Edad</th>
					<th>Posicion</th>
					<th>Nacionalidad</th>
					<th>Minutos disputados</th>
					<th>Partidos jugados</th>
					<th>Goles</th>
					<th>Asistencias</th>
					<th>Asistencias por partido</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual != 'Levante U.D' and  equipoactual!= 'Levante' and equipoactual != 'Real Valladolid' and equipoactual != 'Osasuna' and (posicion='Delantero' or posicion='Centrocampista') and goles>=10]">
				<xsl:sort select="asistencias div partidosjugados" data-type="number" order="descending"/>
				<xsl:if test="position() mod2=1"> 
					<tr class="impar">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
						<td><xsl:value-of select="round((asistencias div partidosjugados)*100)div100"/></td>
					</tr>

				</xsl:if>
				<xsl:if test="position() mod2=0"> 
					<tr class="par">
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="equipoactual" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
						<td><xsl:value-of select="round((asistencias div partidosjugados)*100)div100"/></td>
					</tr>
				</xsl:if>
			</xsl:for-each>
			</table>
			<h2>8.- Consulta que cuente el número de porteros, defensas, centrocampistas y delanteros que tiene el Valencia C.F, el F.C. Barcelona, el Athletic Bilbao y el Villarreal C.F. Crea una tabla para cada equipo con dos columnas, una en la que aparezca la posición y otra el total de jugadores en dicha posición. Añade al final una fila con el total de jugadores del equipo.</h2>
			<table class="violeta">
				<caption>Valencia C.F</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero' and ../equipoactual='Valencia C.F'])" /></td>
					</tr>
					<tr>
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual='Valencia C.F'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual='Valencia C.F'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual='Valencia C.F'])" /></td>
					</tr>
				</xsl:if>
				
				</xsl:for-each>
			</table>
			<table class="azul">
				<caption>F.C. Barcelona</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='F.C. Barcelona']">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/posicion[../posicion='Portero' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
					<tr >
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual='F.C. Barcelona'])" /></td>
					</tr>
				</xsl:if>
				
				</xsl:for-each>
			</table>
			<table class="verde">
				<caption>Athletic Bilbao</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador[equipoactual='Athletic Bilbao']">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
					<tr>
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual='Athletic Bilbao'])" /></td>
					</tr>
				</xsl:if>
				
				</xsl:for-each>
			</table>
			<table class="coral"> 
				<caption>Villarreal C.F.</caption>
				<tr>
					<th>Posicion</th>
					<th>Nº Jugadores</th>
				</tr>
				<xsl:for-each select="jugadores/jugador">
				<xsl:if test="position()=1">
					<tr>
						<td>Porteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero' and ../equipoactual= 'Villarreal C.F.'])" /></td>
					</tr>
					<tr>
						<td>Defensas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa' and ../equipoactual= 'Villarreal C.F.'])" /></td>
					</tr>
					<tr>
						<td>Centrocampistas</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista' and ../equipoactual= 'Villarreal C.F.'])" /></td>
					</tr>
					<tr>
						<td>Delanteros</td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero' and ../equipoactual= 'Villarreal C.F.'])" /></td>
					</tr>

				</xsl:if>
				
				</xsl:for-each>
			</table>
			<br />
			<table class="Violeta">
				<xsl:for-each select="jugadores/jugador">
				<xsl:if test="position()=1">
				<tr>
					<th>Total jugadores</th>
					<td><xsl:value-of select="count(//@idjugador)" /></td>
				</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>9.- Consulta que calcule la media de edad de los siguientes equipos: Real Madrid, F.C. Barcelona, Athletic Bilbao, Atlético de Madrid y Villarreal C.F.</h2>
			<table>
				<tr>
					<th>Equipo</th>
					<th>Edad media</th>
				</tr>
				<xsl:for-each select="jugadores/jugador">
				<xsl:if test="position()=1">
					<tr class="violeta">
						<td>Real Madrid</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Real Madrid']) div count(/jugadores/jugador/@idjugador[../equipoactual='Real Madrid']))*100)div 100"/></td>
					</tr>
				</xsl:if>

				<xsl:if test="position()=1">
					<tr class="azul">
						<td>F.C. Barcelona</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='F.C. Barcelona']) div count(/jugadores/jugador/@idjugador[../equipoactual='F.C. Barcelona']))*100)div 100"/></td>
					</tr>
				</xsl:if>

				<xsl:if test="position()=1">
					<tr class="verde">
						<td>Athletic Bilbao</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Athletic Bilbao']) div count(/jugadores/jugador/@idjugador[../equipoactual='Athletic Bilbao']))*100)div 100"/></td>
					</tr>
				</xsl:if>

				<xsl:if test="position()=1">
					<tr class="coral">
						<td>Atlético de Madrid</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Atletico de Madrid']) div count(/jugadores/jugador/@idjugador[../equipoactual='Atletico de Madrid']))*100)div 100"/></td>
					</tr>
				</xsl:if>

				<xsl:if test="position()=1">
					<tr class="amarillo">
						<td>Villarreal C.F.</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Villarreal C.F.']) div count(/jugadores/jugador/@idjugador[../equipoactual='Villarreal C.F.']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				</xsl:for-each>
				
			</table>
			<h2>10.-Consulta que calcule la media de edad por posición de los siguientes equipos: Real Madrid, F.C. Barcelona, Athletic Bilbao, Atlético de Madrid y Villarreal C.F. Añade al final la media total calculada en la consulta anterior </h2>
			<table>
				<tr>
					<th>Equipo</th>
					<th>Posicion</th>
					<th>Edad media</th>
				</tr>
				<xsl:for-each select="jugadores/jugador">
				<xsl:if test="position()=1">
					<tr class="violeta">
						<td>Real Madrid</td>
						<td>Portero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Real Madrid' and ../posicion='Portero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Real Madrid' and ../posicion='Portero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="violeta">
						<td>Real Madrid</td>
						<td>Delantero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Real Madrid' and ../posicion='Delantero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Real Madrid' and ../posicion='Delantero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="violeta">
						<td>Real Madrid</td>
						<td>Defensa</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Real Madrid' and ../posicion='Defensa']) div count(/jugadores/jugador/@idjugador[../equipoactual='Real Madrid' and ../posicion='Defensa']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="violeta">
						<td>Real Madrid</td>
						<td>Centrocampista</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Real Madrid' and ../posicion='Centrocampista']) div count(/jugadores/jugador/@idjugador[../equipoactual='Real Madrid' and ../posicion='Centrocampista']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				
				<xsl:if test="position()=1">
					<tr class="azul">
						<td>F.C. Barcelona</td>
						<td>Portero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='F.C. Barcelona'  and ../posicion='Portero']) div count(/jugadores/jugador/@idjugador[../equipoactual='F.C. Barcelona'  and ../posicion='Portero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td>F.C. Barcelona</td>
						<td>Delantero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='F.C. Barcelona'  and ../posicion='Delantero']) div count(/jugadores/jugador/@idjugador[../equipoactual='F.C. Barcelona'  and ../posicion='Delantero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td>F.C. Barcelona</td>
						<td>Defensa</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='F.C. Barcelona'  and ../posicion='Defensa']) div count(/jugadores/jugador/@idjugador[../equipoactual='F.C. Barcelona'  and ../posicion='Defensa']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="azul">
						<td>F.C. Barcelona</td>
						<td>Centrocampista</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='F.C. Barcelona'  and ../posicion='Centrocampista']) div count(/jugadores/jugador/@idjugador[../equipoactual='F.C. Barcelona'  and ../posicion='Centrocampista']))*100)div 100"/></td>
					</tr>
				</xsl:if>
			
				<xsl:if test="position()=1">
					<tr class="verde">
						<td>Athletic Bilbao</td>
						<td>Portero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Athletic Bilbao' and ../posicion='Portero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Athletic Bilbao' and ../posicion='Portero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="verde">
						<td>Athletic Bilbao</td>
						<td>Delantero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Athletic Bilbao' and ../posicion='Delantero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Athletic Bilbao' and ../posicion='Delantero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="verde">
						<td>Athletic Bilbao</td>
						<td>Defensa</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Athletic Bilbao' and ../posicion='Defensa']) div count(/jugadores/jugador/@idjugador[../equipoactual='Athletic Bilbao' and ../posicion='Defensa']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="verde">
						<td>Athletic Bilbao</td>
						<td>Centrocampista</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Athletic Bilbao' and ../posicion='Centrocampista']) div count(/jugadores/jugador/@idjugador[../equipoactual='Athletic Bilbao' and ../posicion='Centrocampista']))*100)div 100"/></td>
					</tr>
				</xsl:if>

				<xsl:if test="position()=1">
					<tr class="coral">
						<td>Atlético de Madrid</td>
						<td>Portero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Atletico de Madrid' and ../posicion='Portero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Atletico de Madrid' and ../posicion='Portero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="coral">
						<td>Atlético de Madrid</td>
						<td>Delantero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Atletico de Madrid' and ../posicion='Delantero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Atletico de Madrid' and ../posicion='Delantero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="coral">
						<td>Atlético de Madrid</td>
						<td>Defensa</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Atletico de Madrid' and ../posicion='Defensa']) div count(/jugadores/jugador/@idjugador[../equipoactual='Atletico de Madrid' and ../posicion='Defensa']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="coral">
						<td>Atlético de Madrid</td>
						<td>Centrocampista</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Atletico de Madrid' and ../posicion='Centrocampista']) div count(/jugadores/jugador/@idjugador[../equipoactual='Atletico de Madrid' and ../posicion='Centrocampista']))*100)div 100"/></td>
					</tr>
				</xsl:if>

				<xsl:if test="position()=1">
					<tr class="amarillo">
						<td>Villarreal C.F.</td>
						<td>Portero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Villarreal C.F.' and ../posicion='Portero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Villarreal C.F.' and ../posicion='Portero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="amarillo">
						<td>Villarreal C.F.</td>
						<td>Delantero</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Villarreal C.F.' and ../posicion='Delantero']) div count(/jugadores/jugador/@idjugador[../equipoactual='Villarreal C.F.' and ../posicion='Delantero']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="amarillo">
						<td>Villarreal C.F.</td>
						<td>Defensa</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Villarreal C.F.' and ../posicion='Defensa']) div count(/jugadores/jugador/@idjugador[../equipoactual='Villarreal C.F.' and ../posicion='Defensa']))*100)div 100"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="amarillo">
						<td>Villarreal C.F.</td>
						<td>Centrocampista</td>
						<td><xsl:value-of select="round((sum(/jugadores/jugador/edad[../equipoactual='Villarreal C.F.' and ../posicion='Centrocampista']) div count(/jugadores/jugador/@idjugador[../equipoactual='Villarreal C.F.' and ../posicion='Centrocampista']))*100)div 100"/></td>
					</tr>
				</xsl:if>

				<xsl:if test="position()=1">
					<th>Total</th>
					<th><xsl:value-of select="round((sum(//edad)div count(//@idjugador))*100)div 100"/></th>
					
				</xsl:if>
				

				</xsl:for-each>
			</table>

		</body>
	</html>
	
</xsl:template>
</xsl:stylesheet>