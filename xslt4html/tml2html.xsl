<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude" version="1.0">
<xsl:output method="html" encoding="utf-8" indent="yes"/>

<xsl:key name="byid" match="/thakbong/document/ent" use="@id"/>
<xsl:key name="bysuperid" match="/thakbong/document/ent/geography" use="@superid"/>

<xsl:template match="/thakbong">

		<xsl:for-each select="document">

			<xsl:for-each select="ent">
	
				<xsl:value-of select="srl"/>

				<xsl:variable name="geosuperid" select="geography/@superid"/>
				<xsl:variable name="entid" select="@id"/>

				<xsl:text>
</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
				<xsl:text>
</xsl:text>

			<html>
				<head>
					<meta charset="utf-8"/>
					<link type="text/css" rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
				</head>
				<body>

				<div class="inv" xml:base="../../home/oliver/git/aplac.github.io/tml/menu.xml"><a class="inv" href="/tml/index.html">Thakbong</a>: 
	<a href="/tml/menuLandform.html" class="inv">Landform</a> | <a href="/tml/menuSettlement.html" class="inv">Settlement</a> | <a href="/tml/menuHouse.html" class="inv">Houses</a> | <a href="/tml/menuGarden.html" class="inv">Gardens</a> | <a href="/tml/menuFranke.html" class="inv">Wolfgang Franke</a> | <a href="/tml/menuBell.html" class="inv">Bells</a> | <a href="/tml/menuBangkokHokkien.html" class="inv">Hokkien Cemetery</a> | </div>

				<div class="inv">

				<xsl:for-each select="key('byid',$geosuperid)">

				<xsl:element name="a">
				<xsl:attribute name="class">inv</xsl:attribute>
				<xsl:attribute name="href">
				<xsl:value-of select="srl"/>
				</xsl:attribute>
				Top-Entity (ID: <xsl:value-of select="$geosuperid"/>)
				<xsl:for-each select="names">
					<xsl:for-each select="name">
					<xsl:value-of select="."/>
					<xsl:if test="position() &lt; last()">,
					<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="types">
					<xsl:for-each select="type">
					<xsl:value-of select="."/>
					<xsl:if test="position() &lt; last()">,
					<xsl:text> </xsl:text>
					</xsl:if>
					</xsl:for-each>
				</xsl:for-each>

				</xsl:element>
				</xsl:for-each>
		</div>

		<div>
				<h2 class="inv">
				Entity ID:  
				<xsl:value-of select="@id"/>
				</h2>
				<div>
				<xsl:text>Name:  </xsl:text>
				<xsl:for-each select="names">
					<xsl:for-each select="name">
				<xsl:element name="span">
			<xsl:value-of select="."/>
				</xsl:element>
			<xsl:if test="position() &lt; last()">, </xsl:if>
				</xsl:for-each>
				</xsl:for-each>
				</div>

				<div>
				<xsl:for-each select="types">
			 Type: 
					 <xsl:for-each select="type">
			<xsl:value-of select="."/>
			<xsl:if test="position() &lt; last()">, </xsl:if>
			 </xsl:for-each>
			 </xsl:for-each>
				</div>

				<div>
				ID:  
				<xsl:value-of select="@id"/>
		</div>

				<xsl:for-each select="description">
					<xsl:copy-of select="*"/>
				</xsl:for-each>

				<xsl:for-each select="geography">
				<div>
				 	Orientation:
					<xsl:for-each select="orientations">
						<xsl:for-each select="orientation">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="@sys"/>
							<xsl:if test="position() &lt; last()">, </xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				 	</div>
				 	<div>
					Longitude: 
					<xsl:value-of select="longitude"/>
				 </div>
				 <div>
					Latitude: 
					<xsl:value-of select="latitude"/>
				 </div>
				 <div>
					Pluscode: 
					<xsl:value-of select="pluscode"/>
				 </div>

				<xsl:if test="@concession">
				<div>
					Concession: <xsl:value-of select="@concession"/>
				</div>
			 	</xsl:if>

	<div>
		 <xsl:element name="a">
			 <xsl:attribute name="href">
				 <xsl:value-of select="concat('https://www.google.com/search?q=','N',latitude,'E',longitude)"/>
			 </xsl:attribute>
		 Location on Google Maps
		 </xsl:element>
	</div>
	<div>
		<xsl:element name="a">
			<xsl:attribute name="href">
			<xsl:value-of select="concat('https://www.openstreetmap.org/search?query=','N',latitude,'E',longitude,'#map=19/',latitude,'/',longitude)"/>
			</xsl:attribute>
		Location on OpenStreetMap
		</xsl:element>
		</div>
					<xsl:for-each select="winds">
						<xsl:for-each select="wind">
						<div>
						<div>
						<xsl:text>Wind: </xsl:text>
							<xsl:for-each select="names">
								<xsl:for-each select="name">
									<xsl:value-of select="."/>
				 					<xsl:if test="position() &lt; last()">, </xsl:if>
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

				<xsl:for-each select="events">
		<table>
	        <th>
			<td>Event</td>
			<td>Start</td>
			<td>End</td>
			<td>Day</td>
			<td>Lunar Day</td>
			<td>Material</td>
			<td>Technique</td>
			<td>Agents</td>
			<td>Description</td>
		</th>
					<xsl:for-each select="event">
	                <tr>
			<td>
					<xsl:value-of select="@type"/>
				<xsl:text> </xsl:text>
			</td><td>
					<xsl:value-of select="@timefrom"/>
					<xsl:text> </xsl:text>
			</td><td>
					<xsl:value-of select="@timeto"/>
					<xsl:text> </xsl:text>
			</td><td>
					<xsl:value-of select="@day"/>
					<xsl:text> </xsl:text>
			</td><td>
					<xsl:value-of select="@lunar"/>
					<xsl:text> </xsl:text>
			</td><td>
						<xsl:value-of select="material"/>
			<xsl:text> </xsl:text>
						<xsl:value-of select="material/@color"/>
					<xsl:text> </xsl:text>
			</td><td>
						<xsl:value-of select="technique"/>
					<xsl:text> </xsl:text>
						<xsl:value-of select="technique/@tool"/>
			</td><td>
						<xsl:for-each select="agents">
							<xsl:for-each select="agent">
					<xsl:value-of select="@type"/>
					<xsl:text>: </xsl:text>
			        	<xsl:value-of select="."/>
				</xsl:for-each>
			</xsl:for-each>
			</td><td>
						<xsl:for-each select="description">
				<xsl:copy-of select="*"/>
			</xsl:for-each>
			</td>
			</tr>
		</xsl:for-each>
		</table>
	 </xsl:for-each>

				<xsl:for-each select="media">
					<xsl:for-each select="img/@url">
					<xsl:element name="img">
					 <xsl:attribute name="style">width:75%</xsl:attribute>
					 <xsl:attribute name="src">
						 <xsl:value-of select="concat('https://storage.googleapis.com/',.)"/>
					 </xsl:attribute>
					</xsl:element>
			i		</xsl:for-each>
			 	</xsl:for-each>
	 </div>


	 <xsl:for-each select="key('bysuperid',$entid)">
	 <div>

		 <xsl:element name="a">
			 <xsl:attribute name="href">
				 <xsl:value-of select="../srl"/>
			</xsl:attribute>

			 <h3 class="inv">
			 Sub-Entity ID:  
			 <xsl:value-of select="../@id"/>
			 </h3>

	 <xsl:variable name="subid" select="../@id"/>
	</xsl:element>

				<div>
				<xsl:text>Name: </xsl:text>
				<xsl:for-each select="../names">
					<xsl:for-each select="name">
						<xsl:value-of select="."/>
						<xsl:if test="position() &lt; last()">, </xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				</div>

				<div>
				<xsl:text>Type:  </xsl:text>
				<xsl:for-each select="../types">
					<xsl:for-each select="type">
						<xsl:value-of select="."/>
						<xsl:if test="position() &lt; last()">, </xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				</div>

				<xsl:for-each select="../media">
					<xsl:for-each select="img/@url">
						<xsl:element name="img">
						<xsl:attribute name="style">width:75%</xsl:attribute>
						<xsl:attribute name="src">
							<xsl:value-of select="concat('https://storage.googleapis.com/',.)"/>
						</xsl:attribute>
						</xsl:element>
				 	</xsl:for-each>
				 </xsl:for-each>
	
		</div>
		</xsl:for-each>

	<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"/>

			</body>

		</html><xsl:text>
</xsl:text>

	</xsl:for-each>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
