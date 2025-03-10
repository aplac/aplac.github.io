<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude" version="1.0">
<xsl:output method="html" encoding="utf-8" indent="yes"/>

<xsl:key name="byid" match="/thakbong/document/ent" use="@id"/>
<xsl:key name="bysuperid" match="/thakbong/document/ent/geography" use="@geotop"/>
<xsl:key name="bysiteid" match="/thakbong/document/ent/geography" use="@siteid"/>

<xsl:template match="/thakbong">
	<xsl:for-each select="document">
		<xsl:for-each select="ent">
			<xsl:if test="starts-with(@id,'s')">
			<xsl:variable name="entid" select="@id"/>
			<xsl:variable name="geotop" select="geography/@geotop"/>

			<xsl:value-of select="srl"/>

			<xsl:text>
</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
			<xsl:text>
</xsl:text>

			<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<link type="text/css" rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
				<title>
					ThakBong Site <xsl:value-of select="@id"/>
					<xsl:text>, </xsl:text>
			<xsl:for-each select="names">
				<xsl:for-each select="name">
				<xsl:value-of select="."/>
				<xsl:text>, </xsl:text>
				</xsl:for-each>
			</xsl:for-each>

			<xsl:for-each select="types">
				<xsl:for-each select="type">
				<xsl:value-of select="."/>
				<xsl:if test="position() &lt; last()">
				<xsl:text>, </xsl:text>
				</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			</title>
			</head>
			<body>

			<div class="inv" xml:base="../../home/oliver/git/aplac.github.io/tml/menu.xml"><a class="inv" href="/tml/index.html">Thakbong</a>: 
	<a href="/tml/menuLandform.html" class="inv">Landform</a> | <a href="/tml/menuSettlement.html" class="inv">Settlement</a> | <a href="/tml/menuHouse.html" class="inv">Houses</a> | <a href="/tml/menuGarden.html" class="inv">Gardens</a> | <a href="/tml/menuFranke.html" class="inv">Wolfgang Franke</a> | <a href="/tml/menuBell.html" class="inv">Bells</a> | <a href="/tml/menuBangkokHokkien.html" class="inv">Hokkien Cemetery</a> | </div>

			<div>

			<xsl:for-each select="admins/adminsys">

				<xsl:variable name="admtop" select="admtop"/>
				<xsl:if test="$admtop != $geotop">
				<xsl:for-each select="key('byid',$admtop)">
					<xsl:element name="a">
					<xsl:attribute name="href">
					<xsl:value-of select="srl"/>
					</xsl:attribute>
					<h3 class="inv">
					Top-Site ID: <xsl:value-of select="$admtop"/>
					</h3>

					<xsl:if test="names/name">
					<div>
					Name: 
					<xsl:for-each select="names">
						<xsl:for-each select="name">
							<xsl:value-of select="."/>
							<xsl:text>, </xsl:text>
						</xsl:for-each>
					</xsl:for-each>
				        </div>
					</xsl:if>

					<div>
					Type: 
					<xsl:for-each select="types">
						<xsl:for-each select="type">
							<xsl:value-of select="."/>
							<xsl:if test="position() &lt; last()">
							<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
					</div>

					</xsl:element>
				</xsl:for-each>
				</xsl:if>

			</xsl:for-each>

				<xsl:for-each select="key('byid',$geotop)">
				<xsl:element name="a">
				<xsl:attribute name="href">
				<xsl:value-of select="srl"/>
				</xsl:attribute>

				<h3 class="inv">
				Top-Site ID: <xsl:value-of select="$geotop"/>
				</h3>

				<xsl:if test="names/name">
				<div>
				Name: 
				<xsl:for-each select="names">
					<xsl:for-each select="name">
					<xsl:value-of select="."/>
					<xsl:text>, </xsl:text>
					</xsl:for-each>
				</xsl:for-each>
			        </div>
				</xsl:if>

				<div>
				Type: 
				<xsl:for-each select="types">
					<xsl:for-each select="type">
					<xsl:value-of select="."/>
					<xsl:if test="position() &lt; last()">
					<xsl:text>, </xsl:text>
					</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			        </div>
				</xsl:element>
				</xsl:for-each>

		<div>
				<h2 class="inv">
				<xsl:value-of select="@id"/>
  				<xsl:text>: </xsl:text>
				<xsl:value-of select="names/name"/>
				</h2>
				<xsl:text>Name: </xsl:text>
				<xsl:for-each select="names">
					<xsl:for-each select="name">
					<xsl:element name="span">
					<xsl:value-of select="."/>
					</xsl:element>
					<xsl:if test="position() &lt; last()">, </xsl:if>
					</xsl:for-each>
				</xsl:for-each>

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

				<xsl:if test="description">
				<xsl:text>Description:  </xsl:text>
				<xsl:for-each select="description">
				<xsl:for-each select="*">
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:for-each>
				</xsl:if>

				<xsl:if test="hypotheses">
				<xsl:text>Hypotheses:  </xsl:text>
				<xsl:for-each select="hypotheses">
					<xsl:for-each select="hypothesis">
						<xsl:for-each select="div">
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				</xsl:if>

				<xsl:for-each select="geography">

				<xsl:if test="orientation">
				<div>
					Orientation:
					<xsl:text> </xsl:text>
					<xsl:for-each select="orientations">
						<xsl:for-each select="orientation">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="@system"/>
							<xsl:if test="position() &lt; last()">, </xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</div>
				</xsl:if>


				<xsl:if test="longitude">
				<div>
					Longitude: 
					<xsl:text> </xsl:text>
					<xsl:value-of select="longitude"/>
				</div>
				</xsl:if>


				<xsl:if test="latitude">
				<div>
					Latitude: 
					<xsl:text> </xsl:text>
					<xsl:value-of select="latitude"/>
				</div>
				</xsl:if>


				<xsl:if test="pluscode">
				<div>
					Pluscode: 
					<xsl:text> </xsl:text>
					<xsl:value-of select="pluscode"/>
				</div>
				</xsl:if>

				<xsl:if test="@concession">
				<div>
					Concession: 
					<xsl:text> </xsl:text>
					<xsl:value-of select="@concession"/>
				</div>
				</xsl:if>

				<xsl:if test="latitude">
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
				</xsl:if>
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

				<xsl:if test="events">
				<xsl:for-each select="events">
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
					<xsl:for-each select="event">
	                <tr>
			<td>
					<xsl:value-of select="@type"/>
					<xsl:text> </xsl:text>
			</td>
			<td>
					<xsl:value-of select="@timefrom"/>
					<xsl:text> </xsl:text>
			</td>
			<td>
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
			</td>
			<td>
						<xsl:for-each select="description">
							<xsl:for-each select="*">
								<xsl:copy-of select="."/>
							</xsl:for-each>
						</xsl:for-each>
			</td>
			</tr>
		</xsl:for-each>
		</table>
	        </div>
	 </xsl:for-each></xsl:if>

				<xsl:for-each select="media">
					<xsl:for-each select="img/@url">
					<xsl:element name="img">
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
	<xsl:if test="starts-with(../@id,'s')">
		<xsl:variable name="subid" select="../@id"/>
		<div>

		<xsl:element name="a">
		<xsl:attribute name="href">
				<xsl:value-of select="../srl"/>
		</xsl:attribute>

			<h3 class="inv">
			<xsl:value-of select="../@id"/>
  			<xsl:text>: </xsl:text>
			<xsl:value-of select="../names/name"/>
			</h3>


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

				<xsl:if test="franke">
				    <div>
				    <xsl:text>Franke ID: </xsl:text>
				    <xsl:value-of select="franke/@frankeid"/>
			            </div>
				</xsl:if>
				<xsl:if test="franke/frankequite">
				    <xsl:value-of select="franke/frankequote"/>
				</xsl:if>

		</xsl:element>
				<xsl:choose>

				<xsl:when test="../media">
				<xsl:for-each select="../media">
					<xsl:for-each select="(img)[position() &lt; 6]">
						<xsl:element name="img">
						<xsl:attribute name="style">width:75%</xsl:attribute>
						<xsl:attribute name="src">
						<xsl:value-of select="concat('https://storage.googleapis.com/',@url)"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
				<xsl:text>This image shows an entity of type </xsl:text>
				<xsl:value-of select="../../types/type"/>
				<xsl:text>.</xsl:text>
				<xsl:if test="../../names/name">
				<xsl:text>Named:  </xsl:text>
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
						<xsl:attribute name="src">
						<xsl:value-of select="concat('https://storage.googleapis.com/',@url)"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
				<xsl:text>This image shows an entity of type </xsl:text>
				<xsl:value-of select="../../types/type"/>
				<xsl:text>. </xsl:text>
				<xsl:if test="../../names/name">
				<xsl:text>Named:  </xsl:text>
				<xsl:value-of select="../../names/name"/>
				</xsl:if>
						</xsl:attribute>
						</xsl:element>
				 	</xsl:for-each>
			 	</xsl:for-each>
			 	</xsl:for-each>
				</xsl:when>
				</xsl:choose>
			</div>
			</xsl:if>
	 	</xsl:for-each>
				<xsl:for-each select="key('bysiteid',$entid)">
					<xsl:element name="div">
						<xsl:attribute name="id">
						<xsl:value-of select="../@id"/>
					        </xsl:attribute>
					<h2 class="inv">
						<xsl:value-of select="../@id"/>
  						<xsl:text>: </xsl:text>
						<xsl:value-of select="../names/name"/>
					</h2>

					<xsl:text>Name: </xsl:text>

					<div>
					<xsl:for-each select="../names">
						<xsl:for-each select="name">
						<xsl:element name="span">
							<xsl:value-of select="."/>
						</xsl:element>
						<xsl:if test="position() &lt; last()">, </xsl:if>
						</xsl:for-each>
					</xsl:for-each>
					</div>

					<div>
					<xsl:for-each select="../types">
						Type: 
						<xsl:for-each select="type">
							<xsl:value-of select="."/>
							<xsl:if test="position() &lt; last()">, </xsl:if>
						</xsl:for-each>
					</xsl:for-each>
					</div>

					<div>
					ID:  
					<xsl:value-of select="../@id"/>
					</div>

					<xsl:if test="../description">
					<xsl:text>Description:  </xsl:text>
					<xsl:for-each select="../description">
						<xsl:for-each select="*">
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</xsl:for-each>
					</xsl:if>
	
					<xsl:if test="../hypotheses">
					<xsl:text>Hypotheses:  </xsl:text>
					<xsl:for-each select="../hypotheses">
						<xsl:for-each select="hypothesis">
							<xsl:for-each select="div">
								<xsl:copy-of select="."/>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					</xsl:if>
	
					<xsl:for-each select="../geography">
						<xsl:if test="orientation">
						<div>
						Orientation:
						<xsl:text> </xsl:text>
						<xsl:for-each select="orientations">
							<xsl:for-each select="orientation">
								<xsl:value-of select="."/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="@system"/>
									<xsl:if test="position() &lt; last()">, </xsl:if>
							</xsl:for-each>
						</xsl:for-each>
						</div>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="../events">
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
						<xsl:for-each select="event">
					        <tr>
						<td>
						<xsl:value-of select="@type"/>
						<xsl:text> </xsl:text>
						</td>
						<td>
						<xsl:value-of select="@timefrom"/>
						<xsl:text> </xsl:text>
						</td>
						<td>
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
						</td>
						<td>
							<xsl:for-each select="description">
								<xsl:for-each select="*">
									<xsl:copy-of select="."/>
								</xsl:for-each>
							</xsl:for-each>
						</td>
						</tr>
						</xsl:for-each>
					</table>
				        </div>
					</xsl:for-each>
					<xsl:for-each select="../media">
			 		<div>
						<xsl:for-each select="img/@url">
						<xsl:element name="img">
						<xsl:attribute name="style">width:75%</xsl:attribute>
						<xsl:attribute name="src">
						<xsl:value-of select="concat('https://storage.googleapis.com/',.)"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
					        <xsl:text>The image shows a</xsl:text>
						</xsl:attribute>
						</xsl:element>
						</xsl:for-each>
					</div>
					</xsl:for-each>
				</xsl:element>
				</xsl:for-each>
				</div>
				</body>
				</html>
				<xsl:text>
				</xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
