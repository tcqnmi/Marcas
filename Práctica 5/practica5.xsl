<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="Practica5.css"/>
		</head>
		<body>
			<h2>Obtener 4 tablas con todos los resultados de las jornadas 24, 25, 26 y 27 del xml. Divide la página para que queden dos jornadas seguidas de otras dos. Crea un estilo para aplicarlo al título de cada tabla, otro para los equipos y otro para el resultado. Los elementos han de mostrarse en este orden:
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
							<tr>
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR24')">
								<tr>
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
							<tr>
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR25')">
								<tr>
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
							<tr>
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR26')">
								<tr>
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
							<tr>
								<th>Equipo local</th>
								<th>Resultado</th>
								<th>Equipo visitante</th>
							</tr>
							<xsl:for-each select="competicion/jornada/partidos/partido" >
								<xsl:if test="starts-with(@idpartido, 'PAR27')">
								<tr>
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

		</body>
	</html>
</xsl:template>
</xsl:stylesheet>