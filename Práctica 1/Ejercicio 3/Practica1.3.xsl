<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="Practica1.3.css"/>
		</head>
		<body>
			<h2>3.A. Consulta que muestre el contenido del documento xml con dos formatos distintos (las filas pares de un color y las impares de otro). Debes mostrar los datos en el siguiente orden: idjugador, dorsal, nombre, edad, posición, nacionalidad, goles y amarillas. Ordena los datos por el dorsal de forma descendente.</h2>
			<table>
				<tr>
					<th>IdJugador</th>
					<th>Dorsal</th>
					<th>Nombre</th>
					<th>Edad</th>
					<th>Posición</th>
					<th>Nacionalidad</th>
					<th>Goles</th>
					<th>Amarillas</th>
				</tr>
				<xsl:for-each select="jugadores/jugador" >
				<xsl:sort select="dorsal" data-type="number" order="Descending" />
				<xsl:if test="position() mod2=1">
				<tr class="impar">
					
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					
				</tr>
				</xsl:if>
				<xsl:if test="position() mod2=0">
				<tr class="par">
					
						<td><xsl:value-of select="@idjugador" /></td>
						<td><xsl:value-of select="dorsal" /></td>
						<td><xsl:value-of select="nombre" /></td>
						<td><xsl:value-of select="edad" /></td>
						<td><xsl:value-of select="posicion" /></td>
						<td><xsl:value-of select="nacionalidad" /></td>
						<td><xsl:value-of select="goles" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
					
				</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.B. Modifica la consulta anterior aplicándole un estilo distinto al registro de Pablo Maffeo y otro al registro de Javier Ontiveros. Ordena los datos por edad de forma descendente.</h2>
			<table>
				<tr>
					<th>IdJugador</th>
					<th>Dorsal</th>
					<th>Nombre</th>
					<th>Edad</th>
					<th>Posición</th>
					<th>Nacionalidad</th>
					<th>Goles</th>
					<th>Amarillas</th>
				</tr>
				<xsl:for-each select="jugadores/jugador" >
				<xsl:sort select="edad" data-type="number" order="descending" />
				<xsl:if test="position() mod2=1 and nombre!='Pablo Maffeo' and nombre!='Javier Ontiveros'">
					<tr class="impar">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
						
					</tr>
				</xsl:if>
				<xsl:if test="position() mod2=0 and nombre!='Pablo Maffeo' and nombre!='Javier Ontiveros'">
					<tr class="par">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
						
					</tr>
				</xsl:if>
				<xsl:if test="nombre='Pablo Maffeo'">
					<tr class="pablo">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
						
					</tr>
				</xsl:if>
				<xsl:if test="nombre='Javier Ontiveros'">
					<tr class="javier">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="goles" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
						
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.C. Consulta que muestre los datos de los jugadores cuya posición sea delantero y haya anotado más de dos goles. Ordena los datos por el número de goles anotados de forma descendente. Filtra los datos en el for-each.</h2>
			<table>
				<tr>
					<th>IdJugador</th>
					<th>Apodo</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Fecha nacimiento</th>
					<th>Nacionalidad</th>
					<th>Equipo de procedencia</th>
					<th>Equipo actual</th>
					<th>Partidos jugados</th>
					<th>Minutos jugados</th>
					<th>Partidos jugados como titular</th>
					<th>Amarillas</th>
					<th>Rojas</th>
					<th>Asistencias</th>
					<th>Goles</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador [posicion='Delantero' and goles>2] " >
				<xsl:sort select="goles" data-type="number" order="Descending" />
					<tr class="impar">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="fechanac" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="equipoproc" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							<td><xsl:value-of select="goles" /></td>
							
						
					</tr>
				</xsl:for-each>
			</table>
			<h2>3.D. Consulta que muestre los datos de los jugadores cuya posición sea delantero y haya anotado más de dos goles. Ordena los datos por el número de goles anotados de forma descendente. Filtra los datos con un if.</h2>
			<table>
				<tr>
					<th>IdJugador</th>
					<th>Apodo</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Fecha nacimiento</th>
					<th>Nacionalidad</th>
					<th>Equipo de procedencia</th>
					<th>Equipo actual</th>
					<th>Partidos jugados</th>
					<th>Minutos jugados</th>
					<th>Partidos jugados como titular</th>
					<th>Amarillas</th>
					<th>Rojas</th>
					<th>Asistencias</th>
					<th>Goles</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador  " >
				<xsl:sort select="goles" data-type="number" order="Descending" />
				<xsl:if test="posicion='Delantero' and goles>2 ">
					<tr class="par">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="fechanac" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="equipoproc" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							<td><xsl:value-of select="goles" /></td>
							
						
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.E. Consulta que muestre los datos de los jugadores cuyo equipo de procedencia sea el Deportivo de la Coruña, el Osasuna o el Levante, hayan jugado más de 10 partidos, hayan disputado más de 500 minutos y tengan más de 20 años y menos de 30. Añade a la tabla los elementos que intervienen en esta consulta para poder comprobar el correcto funcionamiento de la misma.</h2>
			<table>
				<tr>
					<th>IdJugador</th>
					<th>Apodo</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Fecha nacimiento</th>
					<th>Nacionalidad</th>
					<th>Equipo de procedencia</th>
					<th>Equipo actual</th>
					<th>Partidos jugados</th>
					<th>Minutos jugados</th>
					<th>Partidos jugados como titular</th>
					<th>Amarillas</th>
					<th>Rojas</th>
					<th>Asistencias</th>
					<th>Goles</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador  " >
				<xsl:if test="(equipoproc='Deportivo la Coruña' or equipoproc='Levante' or equipoproc='Osasuna') and partidosjugados>10 and minutosjugados>500 and edad>20 and edad &lt; 30 ">
					<tr class="impar">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="fechanac" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="equipoproc" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							<td><xsl:value-of select="goles" /></td>
							
						
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.F. Consulta que muestre los jugadores cuyo año de nacimiento sea 1990, 1991, 1992, 1993, 1994 o 1995. Ordena los datos por la posición del jugador seguido de los minutos disputados.</h2>
			<table>
				<tr>
					<th>IdJugador</th>
					<th>Apodo</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Fecha nacimiento</th>
					<th>Nacionalidad</th>
					<th>Equipo de procedencia</th>
					<th>Equipo actual</th>
					<th>Partidos jugados</th>
					<th>Minutos jugados</th>
					<th>Partidos jugados como titular</th>
					<th>Amarillas</th>
					<th>Rojas</th>
					<th>Asistencias</th>
					<th>Goles</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador  " >
				<xsl:sort select="posicion" />
				<xsl:sort select="minutosjugados" data-type="number" />
				<xsl:if test="(contains(fechanac,1990) or contains(fechanac,1991) or contains(fechanac,1992) or contains(fechanac,1993) or contains(fechanac,1994) or contains(fechanac,1995))and position() mod 2=1 ">
					<tr class="impar">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="fechanac" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="equipoproc" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							<td><xsl:value-of select="goles" /></td>
							
						
					</tr>
				</xsl:if>
				<xsl:if test="(contains(fechanac,1990) or contains(fechanac,1991) or contains(fechanac,1992) or contains(fechanac,1993) or contains(fechanac,1994) or contains(fechanac,1995))and position() mod 2 =0 ">
					<tr class="par">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="fechanac" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="equipoproc" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							<td><xsl:value-of select="goles" /></td>
							
						
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.G. Consulta que muestre los jugadores cuyo país de procedencia no sea España. Ordena los datos por el dorsal de forma ascendente.</h2>
			<table>
				<tr>
					<th>IdJugador</th>
					<th>Apodo</th>
					<th>Nombre</th>
					<th>Dorsal</th>
					<th>Posición</th>
					<th>Edad</th>
					<th>Fecha nacimiento</th>
					<th>Nacionalidad</th>
					<th>Equipo de procedencia</th>
					<th>Equipo actual</th>
					<th>Partidos jugados</th>
					<th>Minutos jugados</th>
					<th>Partidos jugados como titular</th>
					<th>Amarillas</th>
					<th>Rojas</th>
					<th>Asistencias</th>
					<th>Goles</th>
					
				</tr>
				<xsl:for-each select="jugadores/jugador  " >
				<xsl:sort select="dorsal" data-type="number" order="descending" />
				<xsl:if test="nacionalidad != 'España'and position() mod 2 =1 ">
					<tr class="impar">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="fechanac" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="equipoproc" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							<td><xsl:value-of select="goles" /></td>
							
						
					</tr>
				</xsl:if>
				<xsl:if test="nacionalidad != 'España' and position() mod 2 =0 ">
					<tr class="par">
						
							<td><xsl:value-of select="@idjugador" /></td>
							<td><xsl:value-of select="apodo" /></td>
							<td><xsl:value-of select="nombre" /></td>
							<td><xsl:value-of select="dorsal" /></td>
							<td><xsl:value-of select="posicion" /></td>
							<td><xsl:value-of select="edad" /></td>
							<td><xsl:value-of select="fechanac" /></td>
							<td><xsl:value-of select="nacionalidad" /></td>
							<td><xsl:value-of select="equipoproc" /></td>
							<td><xsl:value-of select="equipoactual" /></td>
							<td><xsl:value-of select="partidosjugados" /></td>
							<td><xsl:value-of select="minutosjugados" /></td>
							<td><xsl:value-of select="partidosjugadostitular" /></td>
							<td><xsl:value-of select="tarjetasamarillas" /></td>
							<td><xsl:value-of select="tarjetasrojas" /></td>
							<td><xsl:value-of select="asistencias" /></td>
							<td><xsl:value-of select="goles" /></td>
							
						
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.H. Consulta que cuente el número de porteros, defensas, centrocampistas y delanteros que tiene el equipo. Crea una tabla con dos filas, una en la que aparezca la posición y otra el total de jugadores en dicha posición. Añade al final una fila con el total de jugadores del equipo.</h2>
			<table>
				<tr>
					<th>Posición</th>
					<th>Total</th>
				</tr>
				<xsl:for-each select="jugadores/jugador">
				<xsl:if test="position()=1">
					<tr class="impar">
						<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Portero']"/></td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero'])"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="par">
						<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Defensa']"/></td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa'])"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="impar">
						<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Centrocampista']"/></td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista'])"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="par">
						<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Delantero']"/></td>
						<td><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero'])"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position()=1">
					<tr class="impar">
						<td><xsl:value-of select="equipoactual"/></td>
						<td><xsl:value-of select="count(//@idjugador)"/></td>
					</tr>
				</xsl:if>

				</xsl:for-each>
			</table>

		</body>
	</html>
</xsl:template>
</xsl:stylesheet>