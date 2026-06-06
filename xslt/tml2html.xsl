<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2001/XInclude">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:key name="byid" match="/thakbong/document/ent" use="@id"/>
<xsl:key name="bysiteid" match="/thakbong/document/ent/geography" use="@siteid"/>

<xsl:template match="/thakbong">
	<xsl:for-each select="document">
		<xsl:for-each select="ent">
			<xsl:if test="starts-with(@id,'s')">
			<xsl:variable name="entid" select="@id"/>
			<xsl:value-of select="srl"/>

			<xsl:text>&#xa;</xsl:text>
			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<xsl:text>&#xa;</xsl:text>
			<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
				<link type='text/css' rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
				<title>
					Thakbong Site <xsl:value-of select="@id"/>
					<xsl:text>,&#032;</xsl:text>

					<xsl:for-each select="names/name">
						<xsl:value-of select="."/>
						<xsl:text>,&#032;</xsl:text>
					</xsl:for-each>

					<xsl:for-each select="types/type">
						<xsl:value-of select="."/>
						<xsl:if test="position() &lt; last()"><xsl:text>,&#032;</xsl:text></xsl:if>
					</xsl:for-each>
		
				</title>
                                <style> 
.zoom {width:90%}
.nozoom {width:auto}
                                </style>
			</head>
			<body>
			<xi:include href="/home/oliver/git/aplac.github.io/tml/menu.xml" parse="xml"/>

			<div>

				<xsl:if test="geography/latitude">
					<xsl:element name="iframe">
					<xsl:attribute name="style">border:none;width:50%;height:20em;display:block;text-align:center;margin:auto</xsl:attribute>
					<xsl:attribute name="src">
					<xsl:value-of select="concat('https://www.openstreetmap.org/export/embed.html?layer=mapnik&amp;marker=',geography/latitude,'%2C',geography/longitude,'&amp;bbox=')"/><xsl:value-of select="geography/longitude - 0.3"/>%2C<xsl:value-of select="geography/latitude - 0.3"/>%2C<xsl:value-of select="geography/longitude + 0.3"/>%2C<xsl:value-of select="geography/latitude + 0.3"/>
					</xsl:attribute>
				</xsl:element>
				</xsl:if>


				<xsl:if test="names/name and names/name!=''">
				<div>
				<xsl:text>Names:&#032;</xsl:text>
				<xsl:for-each select="names/name">
					<xsl:element name="span">
					<xsl:value-of select="."/>
					</xsl:element>
					<xsl:if test="position() &lt; last()">,&#032;</xsl:if>
				</xsl:for-each>
				</div>
				</xsl:if>

				<xsl:if test="types/type and types/type!= '.'">
				<div>
				<xsl:text>Types:&#032;</xsl:text>
				<xsl:for-each select="types/type">
					<xsl:value-of select="."/>
					<xsl:if test="position() &lt; last()">,&#032;</xsl:if>
				</xsl:for-each>
				</div>
				</xsl:if>

				<xsl:if test="description">
				<xsl:for-each select="description/div">
					<xsl:copy-of select="." />
				</xsl:for-each>
				</xsl:if>

				<xsl:if test="hypotheses/hypothesis/div">
				<xsl:text>Hypotheses: &#032;</xsl:text>
				<xsl:for-each select="hypotheses/hypothesis/div">
					<xsl:copy-of select="." />
				</xsl:for-each>
				</xsl:if>

				<xsl:if test="franke">
				    <div>
				    <xsl:text>Franke ID:&#032;</xsl:text>
				    <xsl:value-of select="franke/@frankeid"/>
			            </div>
				</xsl:if>

				<xsl:if test="franke/frankequote">
				    <xsl:value-of select="franke/frankequote"/>
				</xsl:if>

				<xsl:for-each select="geography">

				<xsl:if test="orientations/orientation">
				<div>
					<xsl:text>Orientation &#032;</xsl:text>
					<xsl:for-each select="orientations/orientation">
						<xsl:value-of select="."/>
						<xsl:text>&#176; from the </xsl:text>
						<xsl:value-of select="@system"/>
						<xsl:if test="position() &lt; last()">,&#032;</xsl:if>
					</xsl:for-each>
				</div>
				</xsl:if>


				<xsl:if test="longitude">
					<div>
					<xsl:text>Longitude &#032;</xsl:text>
					<xsl:value-of select="longitude"/>

					<xsl:if test="latitude">
						<xsl:text>, Latitude &#032;</xsl:text>
						<xsl:value-of select="latitude"/>
					</xsl:if>

					<xsl:if test="pluscode">
						<xsl:text>, Pluscode&#032;</xsl:text>
						<xsl:value-of select="pluscode"/>
					</xsl:if>

					</div>
				</xsl:if>

				<xsl:if test="@concession">
				<div>
					Concession: 
					<xsl:text>&#032;</xsl:text>
					<xsl:value-of select="@concession"/>
				</div>
				</xsl:if>

				<xsl:for-each select="winds">
						<xsl:for-each select="wind">
						<div>
						<div>
						<xsl:text>Wind: </xsl:text>
							<xsl:for-each select="names">
								<xsl:for-each select="name">
									<xsl:value-of select="."/>
				 					<xsl:if test="position() &lt; last()">,&#032;</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</div>

							<xsl:for-each select="measurements">
								<xsl:for-each select="measurement">
								<textarea>
								<xsl:copy-of select="."/>
								</textarea>
								</xsl:for-each>
							</xsl:for-each>

						</div>
						</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>

				<xsl:if test="events/event[@type !='']">
		<div>
		<table>
	        <tr>
			<th>Event</th>
			<th>Start</th>
			<th>End</th>
			<th>Day</th>
			<th>Lunar Day</th>
			<th>Material</th>
			<th>Technique</th>
			<th>Agents</th>
			<th>Description</th>
		</tr>
					<xsl:for-each select="events/event">
	                <tr>
			<td>
					<xsl:value-of select="@type"/>
					<xsl:text>&#032;</xsl:text>
			</td>
			<td>
					<xsl:value-of select="@timefrom"/>
					<xsl:text>&#032;</xsl:text>
			</td>
			<td>
					<xsl:value-of select="@timeto"/>
					<xsl:text>&#032;</xsl:text>
			</td><td>
					<xsl:value-of select="@day"/>
					<xsl:text>&#032;</xsl:text>
			</td><td>
					<xsl:value-of select="@lunar"/>
					<xsl:text>&#032;</xsl:text>
			</td><td>
						<xsl:value-of select="material"/>
						<xsl:text>&#032;</xsl:text>
						<xsl:value-of select="material/@color"/>
						<xsl:text>&#032;</xsl:text>
			</td><td>
						<xsl:value-of select="technique"/>
						<xsl:text>&#032;</xsl:text>
						<xsl:value-of select="technique/@tool"/>
			</td><td>
						<xsl:for-each select="agents/agent">
			        			<xsl:value-of select="."/>
                                                        <xsl:if test="@refid='con1'"><xsl:text>Oliver Streiter</xsl:text></xsl:if> 
                                                        <xsl:if test="@refid='con2'"><xsl:text>Yoann Goudin</xsl:text></xsl:if> 
						        <xsl:if test="position() &lt; last()"><xsl:text>,&#032;</xsl:text></xsl:if>
						</xsl:for-each>
			</td>
			<td>
						<xsl:if test="description">
							<xsl:for-each select="descrription/div">
								<xsl:copy-of select="." />
							</xsl:for-each>
						</xsl:if>
			</td>
			</tr>
		</xsl:for-each>
		</table>
	        </div>
	 </xsl:if>

	<xsl:for-each select="media">

		<xsl:for-each select="img/@url">
				<xsl:element name="img">
				<xsl:attribute name="loading">lazy</xsl:attribute>
				<xsl:attribute name="style">width:75%</xsl:attribute>
				<xsl:attribute name="src">
				<xsl:value-of select="concat('https://storage.googleapis.com/',.)"/>
				</xsl:attribute>
				<xsl:attribute name="alt">
			        <xsl:text>The image shows a</xsl:text>
				</xsl:attribute>
				</xsl:element>
		i		</xsl:for-each>
		 	</xsl:for-each>

	</div>

	<xsl:for-each select="key('bysuperid',$entid)">
		<xsl:variable name="subid" select="../@id"/>
		<div>

		<xsl:element name="a">
		<xsl:attribute name="href">
				<xsl:value-of select="../srl"/>
		</xsl:attribute>

				<div>
				<xsl:text>Name:&#032;</xsl:text>

				<xsl:for-each select="../names">
					<xsl:for-each select="name">
						<xsl:value-of select="."/>
						<xsl:if test="position() &lt; last()">,&#032;</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				</div>


				<div>
				<xsl:text>Types:&#032;</xsl:text>
				<xsl:for-each select="../types">
					<xsl:for-each select="type">
						<xsl:value-of select="."/>
						<xsl:if test="position() &lt; last()">,&#032;</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				</div>

				<xsl:if test="../hypotheses/hypothesis/div">
				<xsl:text>Hypotheses: &#032;</xsl:text>
				<xsl:for-each select="../hypotheses/hypothesis/div">
					<xsl:copy-of select="." />
				</xsl:for-each>
				</xsl:if>

				<xsl:if test="../franke">
				    <div>
				    <xsl:text>Franke ID:&#032;</xsl:text>
				    <xsl:value-of select="../franke/@frankeid"/>
			            </div>
				</xsl:if>
				<xsl:if test="../franke/frankequote">
				    <xsl:value-of select="../franke/frankequote"/>
				</xsl:if>

		</xsl:element>
				<xsl:choose>

				<xsl:when test="../media">
				<xsl:for-each select="../media">
					<xsl:for-each select="(img)[position() &lt; 6]">
						<xsl:element name="img">
						<xsl:attribute name="style">width:75%</xsl:attribute>
					        <xsl:attribute name="loading">lazy</xsl:attribute>
						<xsl:attribute name="src">
						<xsl:value-of select="concat('https://storage.googleapis.com/',@url)"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
				<xsl:text>This image shows an entity of type&#032;</xsl:text>
				<xsl:value-of select="../../types/type"/>
				<xsl:text>.</xsl:text>
				<xsl:if test="../../names/name">
				<xsl:text>Name: &#032;</xsl:text>
				<xsl:value-of select="../../names/name"/>
				</xsl:if>
						</xsl:attribute>
						</xsl:element>
				 	</xsl:for-each>
				</xsl:for-each>
				</xsl:when>

				<xsl:when test="not(../media)">
				<xsl:for-each select="key('bysuperid',$subid)">
				<xsl:for-each select="../media">
					<xsl:for-each select="(img)[position() &lt; 2]">
						<xsl:element name="img">
						<xsl:attribute name="style">width:75%</xsl:attribute>
					        <xsl:attribute name="loading">lazy</xsl:attribute>
						<xsl:attribute name="src">
						<xsl:value-of select="concat('https://storage.googleapis.com/',@url)"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
				<xsl:text>This image shows an entity of type&#032;</xsl:text>
				<xsl:value-of select="../../types/type"/>
				<xsl:text>.&#032;</xsl:text>
				<xsl:if test="../../names/name">
				<xsl:text>Name: &#032;</xsl:text>
				<xsl:value-of select="../../names/name"/>
				</xsl:if>
						</xsl:attribute>
						</xsl:element>
				 	</xsl:for-each>
			 	</xsl:for-each>
			 	</xsl:for-each>
				</xsl:when>
				</xsl:choose>
	
				        <xsl:if test="../events/event[@type !='']">
						<div>
						<table>
      			 			<tr>
						<th>Event</th>
						<th>Start</th>
						<th>End</th>
						<th>Day</th>
						<th>Lunar Day</th>
						<th>Material</th>
						<th>Technique</th>
						<th>Agents</th>
						<th>Description</th>
						</tr>
						<xsl:for-each select="../events/event">
					        <tr>
						<td>
						<xsl:value-of select="@type"/>
						<xsl:text>&#032;</xsl:text>
						</td>
						<td>
						<xsl:value-of select="@timefrom"/>
						<xsl:text>&#032;</xsl:text>
						</td>
						<td>
						<xsl:value-of select="@timeto"/>
						<xsl:text>&#032;</xsl:text>
						</td><td>
						<xsl:value-of select="@day"/>
						<xsl:text>&#032;</xsl:text>
						</td><td>
						<xsl:value-of select="@lunar"/>
						<xsl:text>&#032;</xsl:text>
						</td><td>
						<xsl:value-of select="material"/>
						<xsl:text>&#032;</xsl:text>
						<xsl:value-of select="material/@color"/>
						<xsl:text>&#032;</xsl:text>
						</td><td>
						<xsl:value-of select="technique"/>
						<xsl:text>&#032;</xsl:text>
						<xsl:value-of select="technique/@tool"/>
						</td><td>
							<xsl:for-each select="agents/agent">
					        		<xsl:value-of select="."/>
                                                                <xsl:if test="@refid='con1'"><xsl:text>Oliver Streiter</xsl:text></xsl:if> 
                                                                <xsl:if test="@refid='con2'"><xsl:text>Yoann Goudin</xsl:text></xsl:if> 
						                <xsl:if test="position() &lt; last()"><xsl:text>,&#032;</xsl:text></xsl:if>
							</xsl:for-each>
						</td>
						<td>
							<xsl:for-each select="description">
								<xsl:for-each select="*">
									<xsl:copy-of select="." />
								</xsl:for-each>
							</xsl:for-each>
						</td>
						</tr>
						</xsl:for-each>
					</table>
				        </div>
					</xsl:if>
					</div>
				</xsl:for-each>
                        </body>
                        </html>
			</xsl:if>
	 	</xsl:for-each>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
