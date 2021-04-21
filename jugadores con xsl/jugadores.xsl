<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Vamos a abrir el documento con las reglas de esa web -->
<xsl:template match="/"> <!-- va a leer desde donde indicamos (raiz en este caso /jugadores seria desde jugadores) -->
    <html> <!-- comenzamos en modo html -->
        <head>
            <link rel="stylesheet" type="text/css" href="jugadores.css"/> <!--indicamos el css de estilo que vamos a poner--> <!-- si lo haciamos solo con css sin xsl nos mostraba toda la info no podiamos filtrar -->
        </head>
        <body>
            <h1>Plantilla del atlético</h1>
            <h2>1.- Obtener apodo, nombre , dorsal y posicion de cada jugador </h2>
            <table>
            	<tr>
            		<th>Dorsal</th>
            		<th>Apodo</th>
            		<th>Nombre</th>
            		<th>Posición</th>
            	</tr>
            	<xsl:for-each select="jugadores/jugador" ><!-- con esto le decimos que empiece a buscar en cada jugador-->
            		<tr>
            			<td class="dorsal"><xsl:value-of select="dorsal" /></td>
            			<td class="apodo"><xsl:value-of select="apodo" /></td> 
            			<td class="nombre"><xsl:value-of select="nombre" /></td>
            			<td class="posicion"><xsl:value-of select="posicion" /></td>
						<!-- extrae el valor que indiquemos LLEVA AUTOCIERRE, podemos ponero en el orden que nos pete-->
            		</tr>
            	</xsl:for-each>
            </table>
            <h2>2.- Obtener apodo, dorsal, posición y estadísticas de cada jugador</h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador" >

            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            	
            </table>
            <h2>3.- Ordenar los datos anteriores pero ordenarlos por los goles de forma descendiente</h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador" >

            		<xsl:sort select="goles" data-type="number" order="descending" />
            		<!-- Ordenamos los datos, por defecto ASCII ascendente, si son numericos debemos indicar el data type y si queremos descendiente añadir descending  -->
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            	
            </table>
            <h2>4.- Obtener apodo, dorsal, posición y estadísticas y ordenar por la posición del jugador</h2>
             <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador" >

            		<xsl:sort select="posicion"  />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>5.- Obtener apodo, dorsal, posición y estadísticas y ordenar por el dorsal del jugador de forma descendente</h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador" >

            		<xsl:sort select="posicion" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>6.- Obtener apodo, dorsal, posición y estadísticas y ordenar por la posición del jugador y después por el número de goles anotados de forma descendente y cuando haya empate de goles ordena por el apodo</h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador" >

            		<xsl:sort select="posicion" />
            		<xsl:sort select="goles" data-type="number" order="descending" />
            		<xsl:sort select="apodo" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>7.- Obtener apodo, dorsal, posición y estadísticas y ordenar los datos por el número de tarjetas amarillas y despues por el numero de tarjetas rojas en caso de empate ordenar al final por posición de forma descendente </h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador" >

            		<xsl:sort select="tarjetasamarillas" data-type="number" order="descending"/>
            		<xsl:sort select="tarjetasrojas" data-type="number" order="descending" />
            		<xsl:sort select="posicion" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h1>Filtrado de datos en el for each</h1>
            <h2>8.- Obtener apodo, dorsal, posicion y estadisticas de los jugadores cuya posición sea delantero, ordenar los datos por el número de goles de forma descendente </h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[posicion = 'Delantero']" >

            		<xsl:sort select="goles" data-type="number" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>9.- Obtener apodo, dorsal, posicion y estadisticas de los jugadores cuya posición sea delantero o centrocampista y ordenar los datos por el número de goles de forma descendente </h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[posicion = 'Delantero' or posicion='Centrocampista']" >
            		<!-- colocamos la condicion por la que filtramos en el foreach dentro de un corchete-->

            		<xsl:sort select="goles" data-type="number" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>10 A.- Obtener apodo, dorsal, posicion y estadisticas de los jugadores cuya posición sea delantero o centrocampista y haya anotado más de 5 goles, ordenar los datos por el número de goles de forma descendente </h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[(posicion = 'Delantero' or posicion='Centrocampista') and goles >= 5]" >
            		<!-- colocamos la condicion por la que filtramos en el foreach dentro de un corchete-->

            		<xsl:sort select="goles" data-type="number" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>10 B.- Obtener apodo, dorsal, posicion y estadisticas de los jugadores cuya posición sea delantero o centrocampista, haya anotado más de 5 goles, haya dado  5 asistencias o más y el dorsal sea mayor que 5 y menor que 15, ordenar los datos por el número de goles de forma descendente </h2>
            <table>
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posición</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[(posicion = 'Delantero' or posicion='Centrocampista') and goles >= 5 and asistencias>=5 and (dorsal > 5 and dorsal &lt; 15)]" >
            	<!-- el < se hace con &lt; -->
            		

            		<xsl:sort select="goles" data-type="number" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td> 
            			<td ><xsl:value-of select="posicion" /></td>
            			<td ><xsl:value-of select="partidosjugados" /></td>
            			<td ><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>11.- Obtener apodo, la fecha de nacimiento, el equipo de procedencia, el dorsal, la posición, los partidos jugados, los partidos jugados como titular, las amarillas, las rojas, las asistencias y los goles de los jugadores. Obten solo los jugadores cuya posición sea Centrocampista y ordena los datos por el número de goles anotados de forma descendente</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[posicion='Centrocampista'] "> 
            		

            		<xsl:sort select="goles" data-type="number" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>12.- Obtener los datos de los jugadores cuyo apodo sea hermoso</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[apodo='Hermoso'] "> 
            		

            		<xsl:sort select="goles" data-type="number" order="descending" />
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>13.- Obtener los datos de los jugadores cuyo apodo sea Hermoso, Suárez, Saúl o Savic, ordenar los datos por el número de goles, seguido de las amarillas y de las rojas</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[apodo='Hermoso' or apodo='Suárez' or apodo='Saúl' or apodo='Savic'] "> 
            		
				<xsl:sort select="goles" data-type="number" order="descending" />
				<xsl:sort select="tarjetasamarillas" data-type="number" order="descending" />
				<xsl:sort select="tarjetasrojas" data-type="number" order="descending" />
            		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>14.- Obtener los datos de los jugadores que sean delanteros y su podo no sea Suárez, ordena los datos por el numero de goles de forma ascendente seguido de las tarjetas amarillas de forma descendente</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador[posicion = 'Delantero' and apodo!= 'Suárez'] "> 
            		
				<xsl:sort select="goles" data-type="number"  />
				<xsl:sort select="tarjetasamarillas" data-type="number" order="descending" />
				         		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>15.- Obtener los datos de los jugadores cuyo apodo sea Hermoso, Suárez, Saúl o Savic. Ordenar los datos por el número de goles seguido de las amarillas y las rojas</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador"> 
            		
				<xsl:sort select="goles" data-type="number"  />
				<xsl:sort select="tarjetasamarillas" data-type="number" order="descending" />
				<xsl:sort select="tarjetasrojas" data-type="number" order="descending" />
				<xsl:if test=" apodo='Hermoso' or apodo='Suárez' or apodo='Saúl' or apodo='Savic' ">
				         		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:if>
            	</xsl:for-each>
            </table>
            <h2>16.- Obtener el número de línea de un regisrtro (position() devuelve el número de línea)</h2>
            <table class="table2">
            	<tr>
            		<th>Número de Línea</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">     		
            		
            		<tr>
            			<td class="apodo"><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>

            	</xsl:for-each>
            </table>
            <h2>16 (BIS).- Obtener el número de línea de un regisrtro. Obtener solo los delanteros y ordenar por los goles anotados de forma descendente</h2>
            <table class="table2">
            	<tr>
            		<th>Número de Línea</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="goles" data-type="number" order="descending" />
            	<xsl:if test="posicion = 'Delantero'">     		
            		
            		<tr>
            			<td class="apodo"><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>17.- Obtener los 3 máximos goleadores del equipo. Ordenar los datos por el número de goles anotados de forma  descendente</h2>
            <table class="table2">
            	<tr>
            		<th>Número de Línea</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="goles" data-type="number" order="descending" />
            	<xsl:if test="position()>0 and position() &lt;4">     		
            		
            		<tr>
            			<td class="apodo"><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>18.- Obtener los datos de los jugadores del equipo y ordenarlos por número de goles de forma descendente. Pintar las filas pares de un color y las impares de otro</h2>
            <table class="table2">
            	<tr>
            		<th>Número de Línea</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="dorsal" data-type="number" order="ascending" />
            	<xsl:if test="position() mod 2= 1">     		
            		
            		<tr class="nombre">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position() mod 2= 0">     		
            		
            		<tr class="apodo">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>19.- Obtener los datos de los jugadores del equipo y ordenarlos por número de goles de forma descendente. Pintar las filas pares de un color y las impares de otro y pintar a Suárez de un color diferente a los otros</h2>
            <table class="table2">
            	<tr>
            		<th>Número de Línea</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="dorsal" data-type="number" order="ascending" />
            	<xsl:if test="position() mod 2= 1 and apodo!='Suárez'">     		
            		
            		<tr class="nombre">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position() mod 2= 0 and apodo!='Suárez'">     		
            		
            		<tr class="apodo">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="apodo = 'Suárez'">     		
            		
            		<tr class="posicion">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>20.- Obtener los datos de los jugadores del equipo y ordenarlos por número de dorsal de forma ascendente. Pintar las filas pares de un color y las impares de otro y pintar a Suárez y a Joao de un color diferente a los otros</h2>
            <table class="table2">
            	<tr>
            		<th>Número de Línea</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="dorsal" data-type="number" order="ascending" />
            	<xsl:if test="position() mod 2= 1 and (apodo!='Suárez' or apodo!='João Félix')">     		
            		
            		<tr class="nombre">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position() mod 2= 0 and(apodo!='Suárez' or apodo!='João Félix')">     		
            		
            		<tr class="apodo">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="apodo = 'Suárez'">     		
            		
            		<tr class="posicion">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="apodo = 'João Félix'">     		
            		
            		<tr class="joao">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>21.- Obtener los datos de los jugadores del equipo y ordenarlos por posición y dorsal. Pintar las filas pares de un color y las impares de otro y pintar a Suárez y a Joao de un color diferente a los otros</h2>
            <table class="table2">
            	<tr>
            		<th>Número de Línea</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="posicion"/>
            	<xsl:sort select="dorsal" data-type="number" order="ascending" />
            	<xsl:if test="position() mod 2= 1 and (apodo!='Suárez' or apodo!='João Félix')">     		
            		
            		<tr class="nombre">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position() mod 2= 0 and(apodo!='Suárez' or apodo!='João Félix')">     		
            		
            		<tr class="apodo">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="apodo = 'Suárez'">     		
            		
            		<tr class="posicion">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="apodo = 'João Félix'">     		
            		
            		<tr class="joao">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>22.- Filtrado de los jugadores que se llaman koke, llorente y los que procedan de barca y del benfica oredenados por el número de goles anotados</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="goles" data-type="number" order="descending" />
            	<xsl:if test="apodo='Suárez' or apodo='Koke' or apodo='Llorente' or apodo='Felipe' or equipoproc='F.C. Barcelona' or equipoproc='Benfica'">     		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>23.- Jugadores que hayan jugado más de 10 patidos de titular, hayan dado asistencias, hayan anotado 5 o más goles y su posición sea delantero o centrocampisto , o que su equipo de procedencia sea Dalian Professional FC. Ordena los datos por el número de partidos jugados como titular seguido de los goles anotados</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="partidosjugadostitular" data-type="number" order="descending" />
            	<xsl:sort select="goles" data-type="number" order="descending" />
            	<xsl:if test="(partidosjugados>10 and asistencias>0 and goles>5 and (posicion='Delantero' or posicion='Centrocampista')) or equipoproc='Dalian Professional FC'">     		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>Contiene cadenas de caracteres</h2>
            <h2>24.- Obtener los jugadores cuyo equipo de procedencia contenga la cadena 'al' y ordenar por el dorsal de forma descendiente </h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="dorsal" data-type="number" order="descending" />
            	<xsl:if test="contains(equipoproc, 'al')">   <!-- contains(equipoproc, 'al') funcion utilzada para buscar una cadena de caracteres-->   		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
          
            <h2>25.- Obtener los jugadores nacidos en 1995. Ordenar los datos por el dorsal de forma ascendente</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="dorsal" data-type="number" order="ascending" />
            	<xsl:if test="contains(fechanac, '1995')">   <!-- Fechas: igual que cadenas -->   		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>26.- Obtener los jugadores cuyo equipo de procedencia empiece por A, B o P Ordenar los datos por el equipo de procedencia</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="equipoproc"/>
            	<xsl:if test="starts-with(equipoproc,'A') or starts-with(equipoproc,'B' ) or starts-with(equipoproc,'P')">   <!--Buscar que empiece por algo -->   		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>Obtener atributos de un registro</h2>
            <h2>27.- Mostrar los jugadores junto con el idjugador y ordenarlos por el idjugador</h2>
            <table class="table2">
            	<tr>
            		<th>Id jugador</th>
            		<th>Apodo</th>
            		<th>Fecha de nacimiento</th>
            		<th>Equipo procedencia</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Partidos titular</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="@idjugador"/>
            			
            		
            		<tr>
            			
            			<td ><xsl:value-of select="@idjugador" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="fechanac" /></td> 
            			<td ><xsl:value-of select="equipoproc" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="partidosjugadostitular" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	
              </xsl:for-each>
            </table>
            <h2>Datos calculados</h2>
            <h2>28.- Añadir un nuevo registro llamado actualización de amarillas. Para calcular este registro se utilizará el siguiente criterio: si la posición es defensa suma 2 tarjetas amarillas a los jugadores que hayan jugado más de 10 partidos. Muestra todos los jugadores del equipo y ordenalos por el número de amarillas.</h2>
            <table class="table2">
            	<tr>
            		<th>Numero línea</th>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Amarillas</th>
            		<th>Actualización de amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="tarjetasamarillas" data-type="number" order="descending" />
            	<xsl:if test="posicion='Defensa' and partidosjugados>10 ">
            			
            		<tr class="apodo">
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						<td ><xsl:value-of select="tarjetasamarillas +2" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion='Defensa' and partidosjugados &lt;=10 or posicion !='Defensa'">
            			
            		<tr>
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						<td><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            		</tr>
            	</xsl:if>

              </xsl:for-each>
            </table>
            <h2>29.- Añadir la valoración del jugador en función de los goles y las asistencias. Se calcula multiplicando por 1,2 el número de goles y asistencias en los delanteros, por 1,4 en los centrocampistas y por 1,6 en los defensas y por 50 los porteros. Ordenar los resultados por la posicion y seguido por la  valoración y utilizar la función redondeo</h2>
            <!-- REDONDEO: ponemos round (()*100)div100 [Multipliamos por 100 y dividimos por 100] -->
            <table class="table2">
            	<tr>
            		<th>Numero de línea</th>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            		<th>Valoración 1</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="posicion"/>
            	<xsl:sort select="goles+asistencias" data-type="number" order="descending" />
            	<!-- para ordenar como no podemos hacer referencia a valoracion lo más similar que podemos hacer es goles + asistencias -->
            	<xsl:if test="posicion = 'Delantero' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.2)*100)div100" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Centrocampista' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.4)*100) div100" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Defensa' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.6)*100)div100" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Portero' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 50)*100)div100" /></td>
            		</tr>
            	</xsl:if>
            	
              </xsl:for-each>
            </table>
            <h2>30.- Añadir la valoración del jugador en función de los goles, las asistencias, las amarillas y las rojas. La valoración se calcula en función de la posición del jugador:
                  <ul>
                        <li>Delantero: multiplicando por 1,2 el número de goles y asistencias y restando el número de tarjetas amarillas por 1,4 y el número de rojas por 1,8.</li>

                        <li>Centrocampistas: multiplicando por 1,4 el número de goles y asistencias y restando el número de tarjetas amarillas por 1,2 y el número de rojas por 1,6.</li>

                        <li>Defensas: multiplicando por 1,6 el número de goles y asistencias y restando el número de tarjetas amarillas por 1,2 y el número de rojas por 1,4.</li>
                        <li>Portero: multiplicando por 50 el número de goles y asistencias y restando el número de tarjetas amarillas por 1,5 y el número de rojas por 2.</li>
                  </ul>
            </h2>
            
            <table class="table2">
            	<tr>
            		<th>Numero de línea</th>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            		<th>Valoración 1</th>
            		<th>Valoración 2</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="posicion"/>
            	<xsl:sort select="goles+asistencias" data-type="number" order="descending" />
            	<!-- para ordenar como no podemos hacer referencia a valoracion lo más similar que podemos hacer es goles + asistencias -->
            	<xsl:if test="posicion = 'Delantero' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            			<td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.2)*100)div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 1.2 - tarjetasamarillas*1.4 -  tarjetasrojas+1.8)*100)div100" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Centrocampista' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.4)*100) div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 1.4 - tarjetasamarillas*1.2 -  tarjetasrojas+1.6)*100)div100" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Defensa' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.6)*100)div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 1.6 - tarjetasamarillas*1.2 -  tarjetasrojas+1.4)*100)div100" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Portero' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 50)*100)div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 50 - tarjetasamarillas*1.5 -  tarjetasrojas+2)*100)div100" /></td>
            		</tr>
            	</xsl:if>
            	
              </xsl:for-each>
            </table>
            <h2>31.- Calcula la diferencia entre ambas valoraciones
            </h2>
            
            <table class="table2">
            	<tr>
            		<th>Numero de línea</th>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            		<th>Valoración 1</th>
            		<th>Valoración 2</th>
            		<th>Diferencia entre valoraciones </th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="posicion"/>
            	<xsl:sort select="goles+asistencias" data-type="number" order="descending" />
            	<!-- para ordenar como no podemos hacer referencia a valoracion lo más similar que podemos hacer es goles + asistencias -->
            	<xsl:if test="posicion = 'Delantero'">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            			<td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.2)*100)div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 1.2 - tarjetasamarillas*1.4 -  tarjetasrojas*1.8)*100)div100" /></td>
            			<td class="posicion"><xsl:value-of select="round((round(((goles + asistencias) * 1.2)*100)div100) -(round(((goles + asistencias) * 1.2 - tarjetasamarillas*1.4 -  tarjetasrojas*1.8)*100)div100)) " />  </td>
            		</tr>
            	</xsl:if>
            	
            	<xsl:if test="posicion = 'Centrocampista' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td><td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.4)*100) div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 1.4 - tarjetasamarillas*1.2 -  tarjetasrojas*1.6)*100)div100" /></td>
            			<td class="posicion"><xsl:value-of select="round((round(((goles + asistencias) * 1.4)*100) div100)-(round(((goles + asistencias) * 1.4 - tarjetasamarillas*1.2 -  tarjetasrojas*1.6)*100)div100))" /></td>

            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Defensa' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            			<td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.6)*100)div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 1.6 - tarjetasamarillas*1.2 -  tarjetasrojas*1.4)*100)div100" /></td>
            			<td class="posicion"><xsl:value-of select="round((round(((goles + asistencias) * 1.6)*100)div100)-(round(((goles + asistencias) * 1.6 - tarjetasamarillas*1.2 -  tarjetasrojas*1.4)*100)div100))" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="posicion = 'Portero' ">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            			<td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 50)*100)div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 50 - tarjetasamarillas*1.5 -  tarjetasrojas+2)*100)div100" /></td>
            			<td class="posicion"><xsl:value-of select="round(((goles + asistencias) * 50)-(goles + asistencias) * 50 - tarjetasamarillas*1.5 -  tarjetasrojas+2)" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>32.- Obten los jugadores cuya segunda valoracion calculada sea mayor que 10 y su poisicion sea delantero</h2>
            <table class="table2">
            	<tr>
            		<th>Numero de línea</th>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            		<th>Valoración 1</th>
            		<th>Valoración 2</th>
            		<th>Diferencia entre valoraciones </th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="posicion"/>
            	<xsl:sort select="goles+asistencias" data-type="number" order="descending" />
            	<!-- para ordenar como no podemos hacer referencia a valoracion lo más similar que podemos hacer es goles + asistencias -->
            	<xsl:if test="posicion = 'Delantero' and (goles + asistencias) * 1.2 - tarjetasamarillas*1.4 -  tarjetasrojas*1.8 >10">
            			
            		<tr> 
            			<td><xsl:value-of select="position()" /></td>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
						
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            			<td class="dorsal"><xsl:value-of select="round(((goles + asistencias) * 1.2)*100)div100" /></td>
            			<td class="apodo"><xsl:value-of select="round(((goles + asistencias) * 1.2 - tarjetasamarillas*1.4 -  tarjetasrojas*1.8)*100)div100" /></td>
            			<td class="posicion"><xsl:value-of select="round((round(((goles + asistencias) * 1.2)*100)div100) -(round(((goles + asistencias) * 1.2 - tarjetasamarillas*1.4 -  tarjetasrojas*1.8)*100)div100)) " />  </td>
            		</tr>
            	
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>33.- Calcular cada cuantos minutos mete gol un jugador. Solo válidos los que hayan metido goles. Calcula al final cuantos minuto por gol</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            		<th>Minutos por gol (int)</th>
            		<th>Minutos por gol (float) </th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="minutosjugados div goles" data-type="number" order="descending"/>
            	<xsl:if test="goles > 0">      		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            			<td><xsl:value-of select=" round((minutosjugados div goles)*1)div 1"/> minutos por gol</td>
            			<!-- cuando queriamos los decimales multiplicabamos por 100 y dividiamos por 100 cuando no los queremos multiplicamos por 1 y dividimos entre 1 -->
            			<td><xsl:value-of select=" round((minutosjugados div goles)*100)div 100"/> minutos por gol</td>

            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>34.- Haz lo mismo con las asistencias, las amarillas y las rojas</h2>
            <table class="table2">
            	<tr>
            		<th>Apodo</th>
            		<th>Dorsal</th>
            		<th>Posicion</th>
            		<th>Partidos jugados</th>
            		<th>Minutos jugados</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            		<th>Minutos por amarilla</th>
            		
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:sort select="minutosjugados div goles" data-type="number" order="descending"/>
            	<xsl:if test="tarjetasamarillas > 0">      		
            		
            		<tr>
            			<td ><xsl:value-of select="apodo" /></td>
            			<td ><xsl:value-of select="dorsal" /></td>
            			<td ><xsl:value-of select="posicion" /></td>
						<td ><xsl:value-of select="partidosjugados" /></td>
						<td><xsl:value-of select="minutosjugados" /></td>
						<td ><xsl:value-of select="tarjetasamarillas" /></td>
            			<td ><xsl:value-of select="tarjetasrojas" /></td>
            			<td ><xsl:value-of select="asistencias" /></td>
            			<td ><xsl:value-of select="goles" /></td>
            			<td><xsl:value-of select=" round((minutosjugados div tarjetasamarillas)*1)div 1"/> amarillas por gol</td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>35.- Calcula el total de goles, asistencias, amarillas y rojas que tiene el equipo</h2>
            <table>
            	<tr>
            		<th>Equipo</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	
            		
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:if test="position()=1">
            		<tr>
            			<td ><xsl:value-of select="equipoactual" /></td>
						<td ><xsl:value-of select="sum(//tarjetasamarillas)" /></td>
            			<td ><xsl:value-of select="sum(//tarjetasrojas)" /></td>
            			<td ><xsl:value-of select="sum(//asistencias)" /></td>
            			<td ><xsl:value-of select="sum(//goles)" /></td>
            			<!-- SUMAR TODOS LOS VALORES -> sum (//elvalor) // recorre todos los registros dentro de jugadores  COUNT cuenta el número de registros -->

            		</tr>
            	</xsl:if>
             	</xsl:for-each>
            </table>
            <h2>36.- Calcula el total de goles, asistencias, amarillas y rojas de los delanteros del equipo</h2>
            <table class="table2">
            	<tr>
            		<th>Equipo</th>
            		<th>Posicion</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			<td ><xsl:value-of select="equipoactual" /></td>
            			<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Delantero']"/></td>
						<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasamarillas[../posicion='Delantero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasrojas[../posicion='Delantero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/asistencias[../posicion='Delantero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/goles[../posicion='Delantero'])" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>37.- Calcula el total de goles, asistencias, amarillas y rojas que tienen los jugadores del equipo divididos por posicion.(38) Añade al final el total</h2>
            <table class="table2">
            	<tr>
            		<th>Equipo</th>
            		<th>Posicion</th>
            		<th>Amarillas</th>
            		<th>Rojas</th>
            		<th>Asistencias</th>
            		<th>Goles</th>
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			<td ><xsl:value-of select="equipoactual" /></td>
            			<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Portero']"/></td>
						<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasamarillas[../posicion='Portero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasrojas[../posicion='Portero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/asistencias[../posicion='Portero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/goles[../posicion='Portero'])" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			<td ><xsl:value-of select="equipoactual" /></td>
            			<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Defensa']"/></td>
						<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasamarillas[../posicion='Defensa'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasrojas[../posicion='Defensa'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/asistencias[../posicion='Defensa'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/goles[../posicion='Defensa'])" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			<td ><xsl:value-of select="equipoactual" /></td>
            			<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Centrocampista']"/></td>
						<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasamarillas[../posicion='Centrocampista'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasrojas[../posicion='Centrocampista'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/asistencias[../posicion='Centrocampista'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/goles[../posicion='Centrocampista'])" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			<td ><xsl:value-of select="equipoactual" /></td>
            			<td><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Delantero']"/></td>
						<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasamarillas[../posicion='Delantero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/tarjetasrojas[../posicion='Delantero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/asistencias[../posicion='Delantero'])" /></td>
            			<td ><xsl:value-of select="sum(/jugadores/jugador/goles[../posicion='Delantero'])" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			<td ><xsl:value-of select="equipoactual" /></td>
            			<td>Total</td>
						<td ><xsl:value-of select="sum(//tarjetasamarillas)" /></td>
            			<td ><xsl:value-of select="sum(//tarjetasrojas)" /></td>
            			<td ><xsl:value-of select="sum(//asistencias)" /></td>
            			<td ><xsl:value-of select="sum(//goles)" /></td>
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>39.- Calcula el total de jugadores del equipo agrupados por posicion. Añade al final el número total de jugadores del equipo </h2>
            <table class="table2">
            	<tr>
            		
            		<th>Posicion</th>
            		<th>Jugadores</th>
            		
            	</tr>

            	<xsl:for-each select="jugadores/jugador">
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			
            			<td class="apodo"><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Portero']"/></td>
						<td class="nombre" ><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Portero'])" /></td>
            			
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			
            			<td class="apodo"><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Defensa']"/></td>
						<td class="nombre"><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Defensa'])" /></td>
            			
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			
            			<td class="apodo"><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Centrocampista']"/></td>
						<td class="nombre"><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Centrocampista'])" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			
            			<td class="apodo"><xsl:value-of select="/jugadores/jugador/posicion[../posicion='Delantero']"/></td>
						<td class="nombre"><xsl:value-of select="count(/jugadores/jugador/posicion[../posicion='Delantero'])" /></td>
            		</tr>
            	</xsl:if>
            	<xsl:if test="position()=1">      		
            		
            		<tr>
            			
            			<td class="apodo">Total</td>
						<td class="nombre"><xsl:value-of select="count(//@idjugador)" /></td>
            			
            		</tr>
            	</xsl:if>
              </xsl:for-each>
            </table>
            <h2>40.- Calcula la media de goles por jugador anotados por el equipo</h2>
            <table class="table2">
            	<tr>
            		<th>Goles por jugador</th>
            	</tr> 
            	<tr>
            		
            		<xsl:for-each select="jugadores/jugador">
            		<xsl:if test="position()=1">
            			<td class="posicion">
            			<p><xsl:value-of select="round((sum(//goles) div count(//@idjugador))*100 )div100" /></p>
            			</td>
            		</xsl:if>
            		</xsl:for-each>
            		
            	</tr>
            </table> 
            <h2>41.- Calcula cada  cuantos minutos mete un gol el equipo. Para ello divide el total de minutos disputados entre el total de goles anotados</h2>
            <xsl:for-each select="jugadores/jugador">
            		<xsl:if test="position()=1">
            			
            			<p><xsl:value-of select="round(((sum(//minutosjugados) div 11) div sum(//goles))*100 )div100" /></p>
            			
            		</xsl:if>
            		</xsl:for-each>

        </body>
    </html>
</xsl:template>
</xsl:stylesheet>