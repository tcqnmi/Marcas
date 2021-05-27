<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="Practica5.css"/>
		</head>
		<body>
			<h2>1.- Obtener 4 tablas con todos los resultados de las jornadas 24, 25, 26 y 27 del xml. Divide la página para que queden dos jornadas seguidas de otras dos. Crea un estilo para aplicarlo al título de cada tabla, otro para los equipos y otro para el resultado. Los elementos han de mostrarse en este orden:
				<ul>
					<li>Título de la tabla: Número de la jornada seguido de la fecha de la jornada.</li>
					<li>Equipo local, resultado, equipo visitante.</li>
				</ul>
			</h2>
			<table class="table1">
				<tr>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR024']">
							<caption>Jornada 24 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="azul">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR24')">
								<tr class="azul">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR025']">
							<caption>Jornada 25 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="verde">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR25')">
								<tr class="verde">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR026']">
							<caption>Jornada 26 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="violeta">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR26')">
								<tr class="violeta">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR027']">
							<caption>Jornada 27 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="amarillo">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR27')">
								<tr class="amarillo">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
				</tr>
			</table>
			<h2>2.-Añade la clasificación de la competición y ordénala por puntos. Los puntos han de calcularse de la siguiente forma: Partidos ganados otorgan 3 puntos, partidos empatados otorgan 1 punto y partidos perdidos otorgan 0 puntos. Ordena la clasificación por puntos y después por diferencia de goles (goles a favor menos goles en contra). Crea un estilo para aplicarlo al equipo que va lider, otro para los equipos de champions, otro para los de europa league, otro para los equipos que están en descenso y otro para el resto de equipos (podéis utilizar los colores que usan las webs deportivas). Los elementos han de mostrarse en el siguiente orden: posición, equipo, puntos, partidos jugados, partidos ganados, partidos perdidos, partidos empatados, goles a favor y goles en contra. </h2>
			<table>
				<tr>
					<th>Posición</th>
					<th>Equipo</th>
					<th>Puntos</th>
					<th>Partidos jugados</th>
					<th>Partidos ganados</th>
					<th>Partidos perdidos</th>
					<th>Partidos empatados</th>
					<th>Goles a favor </th>
					<th>Goles en contra</th>
				</tr>
				<xsl:for-each select="competicion/jornada/clasificacion/equipo_clasificacion" >
					<xsl:sort select="ganados*3 + empatados*1" data-type="number" order="descending" />
					<xsl:sort select="favor-contra" data-type="number" order="descending"/>
					<xsl:variable name="puntos" select="ganados*3 + empatados*1" />
					<xsl:if test="position()=1" >
						<tr class="oro">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>1 and position()&lt;4" >
						<tr class="plata">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>4" >
						<tr class="bronce">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<h2>3.- Añade las clasificaciones de goleadores, remates, pases, asistencias y recuperaciones. Muestra los resultados en el siguiente orden: nombre, equipo y número. Deben aparecer tres clasificaciones en una fila y dos en otra. Puedes crear estilos para realizar el ejercicio o reutilizar los creados hasta ahora.  </h2>
			<table class="table1">
				<tr>
					<td>
						<table class="table2">
							<caption>Goleadores</caption>
							<tr>
								<th>Nombre</th>
								<th>Equipo</th>
								<th>Goles</th>
							</tr>
							<xsl:for-each select="competicion/jornada/estadisticas/goles" >
								<tr class="violeta">
									<td><xsl:value-of select="nombre" /></td>
									<td><xsl:value-of select="numero" /></td>
									<td><xsl:value-of select="equipo" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<caption>Remates</caption>
							<tr>
								<th>Nombre</th>
								<th>Equipo</th>
								<th>Goles</th>
							</tr>
							<xsl:for-each select="competicion/jornada/estadisticas/remates" >
								<tr class="azul">
									<td><xsl:value-of select="nombre" /></td>
									<td><xsl:value-of select="numero" /></td>
									<td><xsl:value-of select="equipo" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<caption>Pases</caption>
							<tr>
								<th>Nombre</th>
								<th>Equipo</th>
								<th>Goles</th>
							</tr>
							<xsl:for-each select="competicion/jornada/estadisticas/pases" >
								<tr class="verde">
									<td><xsl:value-of select="nombre" /></td>
									<td><xsl:value-of select="numero" /></td>
									<td><xsl:value-of select="equipo" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="table2">
							<caption>Asistencias</caption>
							<tr>
								<th>Nombre</th>
								<th>Equipo</th>
								<th>Goles</th>
							</tr>
							<xsl:for-each select="competicion/jornada/estadisticas/asistencias" >
								<tr class="naranja">
									<td><xsl:value-of select="nombre" /></td>
									<td><xsl:value-of select="numero" /></td>
									<td><xsl:value-of select="equipo" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<caption>Recuperaciones</caption>
							<tr>
								<th>Nombre</th>
								<th>Equipo</th>
								<th>Goles</th>
							</tr>
							<xsl:for-each select="competicion/jornada/estadisticas/recuperaciones" >
								<tr class="amarillo">
									<td><xsl:value-of select="nombre" /></td>
									<td><xsl:value-of select="numero" /></td>
									<td><xsl:value-of select="equipo" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
				</tr>
			</table>
			<h2>4.- Partiendo del ejercicio 1, añade la ciudad en la que se celebra el partido y ordena los datos alfabéticamente por la ciudad en la que se disputa. Añade la ciudad a la derecha de todos los datos de la tabla</h2>
			<table class="table1">
				<tr>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR024']">
							<caption>Jornada 24 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="azul">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
								<th>Ciudad</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
							<xsl:sort select="local/@localidad" />
								<xsl:if test="starts-with(@idpartido, 'PAR24')">
								<tr class="azul">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
									<td><xsl:value-of select="local/@localidad" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR025']">
							<caption>Jornada 25 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="verde">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
								<th>Ciudad</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
							<xsl:sort select="local/@localidad" />
								<xsl:if test="starts-with(@idpartido, 'PAR25')">
								<tr class="verde">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
									<td><xsl:value-of select="local/@localidad" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR026']">
							<caption>Jornada 26 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="violeta">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
								<th>Ciudad</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
							<xsl:sort select="local/@localidad" />
								<xsl:if test="starts-with(@idpartido, 'PAR26')">
								<tr class="violeta">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
									<td><xsl:value-of select="local/@localidad" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR027']">
							<caption>Jornada 27 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="amarillo">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
								<th>Ciudad</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
							<xsl:sort select="local/@localidad" />
								<xsl:if test="starts-with(@idpartido, 'PAR27')">
								<tr class="amarillo">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
									<td><xsl:value-of select="local/@localidad" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
				</tr>
			</table>
			<h2>5.- Partiendo del ejercicio 2 crea tres tablas en las que ordenes los datos de la siguiente manera:
				<ul>
					<li>Tabla 1: Ordénala por goles a favor seguido de goles en contra.</li>
					<li>Tabla 2: Ordénala por goles en contra seguido de los partidos perdidos.</li>
					<li>Tabla 3: Ordénala por partidos ganados, seguido de los partidos empatados.</li>
				</ul>
			</h2>
			<table>
				<caption>Tabla 1</caption>
				<tr>
					<th>Posición</th>
					<th>Equipo</th>
					<th>Puntos</th>
					<th>Partidos jugados</th>
					<th>Partidos ganados</th>
					<th>Partidos perdidos</th>
					<th>Partidos empatados</th>
					<th>Goles a favor </th>
					<th>Goles en contra</th>
				</tr>
				<xsl:for-each select="competicion/jornada/clasificacion/equipo_clasificacion" >
					<xsl:sort select="favor" data-type="number" order="descending" />
					<xsl:sort select="contra" data-type="number" order="descending"/>
					<xsl:variable name="puntos" select="ganados*3 + empatados*1" />
					<xsl:if test="position()=1" >
						<tr class="oro">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>1 and position()&lt;4" >
						<tr class="plata">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>4" >
						<tr class="bronce">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<table>
				<caption>Tabla 2</caption>
				<tr>
					<th>Posición</th>
					<th>Equipo</th>
					<th>Puntos</th>
					<th>Partidos jugados</th>
					<th>Partidos ganados</th>
					<th>Partidos perdidos</th>
					<th>Partidos empatados</th>
					<th>Goles a favor </th>
					<th>Goles en contra</th>
				</tr>
				<xsl:for-each select="competicion/jornada/clasificacion/equipo_clasificacion" >
					<xsl:sort select="contra" data-type="number" order="descending" />
					<xsl:sort select="perdidos" data-type="number" order="descending"/>
					<xsl:variable name="puntos" select="ganados*3 + empatados*1" />
					<xsl:if test="position()=1" >
						<tr class="oro">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>1 and position()&lt;4" >
						<tr class="plata">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>4" >
						<tr class="bronce">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<table>
				<caption>Tabla 3</caption>
				<tr>
					<th>Posición</th>
					<th>Equipo</th>
					<th>Puntos</th>
					<th>Partidos jugados</th>
					<th>Partidos ganados</th>
					<th>Partidos perdidos</th>
					<th>Partidos empatados</th>
					<th>Goles a favor </th>
					<th>Goles en contra</th>
				</tr>
				<xsl:for-each select="competicion/jornada/clasificacion/equipo_clasificacion" >
					<xsl:sort select="ganados" data-type="number" order="descending" />
					<xsl:sort select="empatados" data-type="number" order="descending"/>
					<xsl:variable name="puntos" select="ganados*3 + empatados*1" />
					<xsl:if test="position()=1" >
						<tr class="oro">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>1 and position()&lt;4" >
						<tr class="plata">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
					<xsl:if test="position()>4" >
						<tr class="bronce">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>

						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
			<h2>6.- Muestra todos los partidos que se hayan jugado en Valencia, los hayan jugado el Valencia, el Villarreal o el Levante como local o visitante</h2>
			<table>
				<tr>
					<th>Local</th>
					<th>Visitante</th>
					<th>Resultado</th>
				</tr>
				<xsl:for-each select="competicion/jornada/partidos/partido">
					<xsl:if test=" local/@localidad='Valencia' and  (visitante= 'Valencia' or visitante= 'Villarreal FC' or visitante='Levante UD' or local='Valencia CF' or local='Villarreal FC' or local= 'Levante UD')">
					<tr class="violeta">
						<td><xsl:value-of select="local" /></td>
						<td><xsl:value-of select="visitante" /></td>
						<td><xsl:value-of select="resultado" /></td>
					</tr>
					</xsl:if>
				</xsl:for-each>

			</table>
			<h2>7.- Partiendo del ejercicio 1, crea una condición para que muestre en el color que tú quieras el nombre de tu equipo favorito (ojo, sólo el nombre, el resto de datos tienen que quedarse con el color que tenían antes)</h2>
			<table class="table1">
				<tr>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR024']">
							<caption>Jornada 24 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="azul">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR24')">
								<tr class="azul">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="local='RC Celta'">
								<tr>
									<td class="oro"><xsl:value-of select="local" /></td>
									<td class="azul"><xsl:value-of select="resultado" /></td>
									<td class="azul"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="visitante='RC Celta'">
								<tr>
									<td class="azul"><xsl:value-of select="local" /></td>
									<td class="azul"><xsl:value-of select="resultado" /></td>
									<td class="oro"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR025']">
							<caption>Jornada 25 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="verde">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR25')">
								<tr class="verde">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="local='RC Celta'">
								<tr>
									<td class="oro"><xsl:value-of select="local" /></td>
									<td class="verde"><xsl:value-of select="resultado" /></td>
									<td class="verde"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="visitante='RC Celta'">
								<tr>
									<td class="verde"><xsl:value-of select="local" /></td>
									<td class="verde"><xsl:value-of select="resultado" /></td>
									<td class="oro"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR026']">
							<caption>Jornada 26 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="violeta">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR26')">
								<tr class="violeta">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="local='RC Celta'">
								<tr>
									<td class="oro"><xsl:value-of select="local" /></td>
									<td class="violeta"><xsl:value-of select="resultado" /></td>
									<td class="violeta"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="visitante='RC Celta'">
								<tr>
									<td class="violeta"><xsl:value-of select="local" /></td>
									<td class="violeta"><xsl:value-of select="resultado" /></td>
									<td class="oro"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
					<td>
						<table class="table2">
							<xsl:for-each select="competicion/jornada[@idjornada='JOR027']">
							<caption>Jornada 27 (<xsl:value-of select="fecha/dia"/> de <xsl:value-of select="fecha/mes"/> and <xsl:value-of select="fecha/anio" />) </caption>
							</xsl:for-each>
							<tr class="amarillo">
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR27')">
								<tr class="amarillo">
									<td><xsl:value-of select="local" /></td>
									<td><xsl:value-of select="resultado" /></td>
									<td><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="local='RC Celta'">
								<tr>
									<td class="oro"><xsl:value-of select="local" /></td>
									<td class="amarillo"><xsl:value-of select="resultado" /></td>
									<td class="amarillo"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
								<xsl:if test="visitante='RC Celta'">
								<tr>
									<td class="amarillo"><xsl:value-of select="local" /></td>
									<td class="amarillo"><xsl:value-of select="resultado" /></td>
									<td class="oro"><xsl:value-of select="visitante" /></td>
								</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</td>
				</tr>
			</table>
			<h2>8.- Aunque solo poseemos los datos de las últimas jornadas, según los datos de la clasificación, obtén la media de goles por partido de la competición teniendo en cuenta que podemos obtener el número total de goles anotados y el número total de partidos disputados.  </h2>
			<table>
				<tr>
					<th>Media de goles por partido</th>
					<xsl:for-each select="competicion/jornada/clasificacion">
						<xsl:if test="position()=1">
							<td class="violeta"><xsl:value-of select="round(((sum(equipo_clasificacion/favor)) div (sum(equipo_clasificacion/disputados)))*100)div 100" /></td>
						</xsl:if>
				</xsl:for-each>
				</tr>
			</table>
			<h2>Obtén el número total de partidos empatados de la competición.</h2>
			<table>
				<tr>
					<th>Partidos empatados</th>
					<xsl:for-each select="competicion/jornada/clasificacion">
							<td class="violeta"><xsl:value-of select="count(equipo_clasificacion/empatados) div 2" /></td>
						
				</xsl:for-each>
				</tr>
			</table>
			<h2>Partiendo del ejercicio 2 crea una tabla añadiendo la diferencia de goles y recalcula los puntos multiplicando por 2 el número de goles a favor y por -1 el número de goles en contra. Ordena los datos por este último dato calculado. No elimines ningún dato de la tabla del ejercicio 2.</h2>
			<table>
				<tr>
					<th>Posición</th>
					<th>Equipo</th>
					<th>Puntos</th>
					<th>Partidos jugados</th>
					<th>Partidos ganados</th>
					<th>Partidos perdidos</th>
					<th>Partidos empatados</th>
					<th>Goles a favor </th>
					<th>Goles en contra</th>
					<th>Diferencia entre goles</th>
				</tr>
				<xsl:for-each select="competicion/jornada/clasificacion/equipo_clasificacion" >
					<xsl:sort select="favor*2 + contra*-1" data-type="number" order="descending" />
					
					<xsl:variable name="puntos" select="favor*2 + contra*-1" />
					<xsl:variable name="diferencia" select="favor - contra" />
					<xsl:if test="position()=1" >
						<tr class="oro">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>
							<td><xsl:value-of select="$diferencia"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()>1 and position()&lt;4" >
						<tr class="plata">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>
							<td><xsl:value-of select="$diferencia"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="position()>4" >
						<tr class="bronce">
							<td><xsl:value-of select="position()"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="$puntos"/></td>
							<td><xsl:value-of select="disputados"/></td>
							<td><xsl:value-of select="ganados"/></td>
							<td><xsl:value-of select="perdidos"/></td>
							<td><xsl:value-of select="empatados"/></td>
							<td><xsl:value-of select="favor"/></td>
							<td><xsl:value-of select="contra"/></td>
							<td><xsl:value-of select="$diferencia"/></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>