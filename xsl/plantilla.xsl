<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> <!-- Es con que modelo debe interpretar lo que va a leer--> <!-- EL XSL TRANSFORMA EL DOCUMENTO EN HTML Y COMO SE VA A MOSTRAR -->
<xsl:template match="/"> <!--En qué punto empieza a leer el documento / =raiz puede ser /plantilla/componente/dorsal y empieza en el primer dorsal-->
	<html> <!-- intercalaremos html y xsl-->
		<head>
			<link rel="stylesheet" type="text/css" href ="estilos.css" />
		</head>
		<body>
			<h1>PRUEBA 1</h1>
			<table>
				<tr>
					<td>Holis</td>
					<td>Holis 2</td>
				</tr>
				<tr>
					<td>Que tal</td>
					<td>Que tal 2 </td>
				</tr>
			</table>
			<!-- para sacar un dato siempre tenemos que hacer un for-each y uego seleccionar el dato que queremos sacar -->
			<xsl:for-each select="plantilla/componente">

				<xsl:value-of select="nombre" />
				<xsl:value-of select="apellidos" />

			</xsl:for-each>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>