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
				<xsl:attribute name="href"><xsl:value-of select="srl"/></xsl:attribute>
					Top-Entity (ID: <xsl:value-of select="$geosuperid"/>)

				<xsl:choose>
				<xsl:when test="names/name">
			<xsl:for-each select="names/name">
				  <xsl:value-of select="."/>
				  <xsl:if test="position() &lt; last()">,
					<xsl:text> </xsl:text>
					  </xsl:if>
				</xsl:for-each>
				</xsl:when>
				<xsl:when test="types/name">
			<xsl:for-each select="types/type">
				  <xsl:value-of select="."/>
				  <xsl:if test="position() &lt; last()">,
					<xsl:text> </xsl:text>
					  </xsl:if>
				</xsl:for-each>
				</xsl:when>
			</xsl:choose>

			  </xsl:element>
			  </xsl:for-each>
		</div>

	  <div>
	  <h2 class="inv">Entity (ID: <xsl:value-of select="@id"/>)</h2>


	  <xsl:for-each select="names">
	  Name:  
	  <xsl:for-each select="name">
		<xsl:element name="span">
	<xsl:value-of select="."/>
		</xsl:element>
	<xsl:if test="position() &lt; last()">, </xsl:if>
	  </xsl:for-each>
	  <br/>
	  </xsl:for-each>

	 <xsl:for-each select="types">
	 Type: 
	 <xsl:for-each select="type">
	<xsl:value-of select="."/>
	<xsl:if test="position() &lt; last()">, </xsl:if>
	 </xsl:for-each>
	 <br/>
	 </xsl:for-each>

	 ID:  <xsl:value-of select="@id"/><br/>

	 <xsl:choose>
	 <xsl:when test="geography/longitude">
	 <xsl:for-each select="geography">
	 Orientation:
		 <xsl:for-each select="orientations/orientation">
				  <xsl:value-of select="."/>
				  <xsl:text> </xsl:text>
				  <xsl:value-of select="@sys"/>
				  <xsl:if test="position() &lt; last()">, </xsl:if>
			 </xsl:for-each><br/>
	 Longitude: <xsl:value-of select="longitude"/><br/> 
	 Latitude: <xsl:value-of select="latitude"/><br/>
	 Pluscode: <xsl:value-of select="pluscode"/><br/>

	 <xsl:if test="@concession">
	 Concession: <xsl:value-of select="@concession"/><br/>
         </xsl:if>

		 <xsl:element name="a">
			 <xsl:attribute name="href">
				 <xsl:value-of select="concat('https://www.google.com/search?q=','N',latitude,'E',longitude)"/>
			 </xsl:attribute>
		 Location on Google Maps<br/>
		 </xsl:element>
		 <xsl:element name="a">
			 <xsl:attribute name="href">
			 <xsl:value-of select="concat('https://www.openstreetmap.org/search?query=','N',latitude,'E',longitude,'#map=19/',latitude,'/',longitude)"/>
			 </xsl:attribute>
		 Location on OpenStreetMap<br/>
		 </xsl:element>
	 <xsl:for-each select="winds/wind">
			 Wind: 

			 <xsl:for-each select="names/name">
					 <xsl:value-of select="."/>
				 <xsl:if test="position() &lt; last()">, </xsl:if>
			 </xsl:for-each><br/>

			 <xsl:for-each select="measurements/measurement">
			 <textarea>
					 <xsl:copy-of select="."/>
				 </textarea>
				 </xsl:for-each>

		 </xsl:for-each>
	 </xsl:for-each>
	 </xsl:when>
	 </xsl:choose>

	  <xsl:for-each select="events/event">
		  <xsl:value-of select="./@eventtype"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="./@timefrom"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="./@timeto"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="./@day"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="./@lunar"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="material"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="material/@color"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="technique"/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="technique/@tool"/>
		 <xsl:for-each select="agents/agent">
		  <xsl:value-of select="."/>
				  <xsl:text> </xsl:text>
		  <xsl:value-of select="./@type"/>
		 </xsl:for-each>
	 <br/>
	 </xsl:for-each>

	  <xsl:for-each select="media/img/@url">
		<xsl:element name="img">
		 <xsl:attribute name="style">width:75%</xsl:attribute>
		 <xsl:attribute name="src">
			 <xsl:value-of select="concat('https://storage.googleapis.com/',.)"/>
		 </xsl:attribute>
		</xsl:element>
	 </xsl:for-each>

	 </div>

	 <div>


	 <xsl:for-each select="key('bysuperid',$entid)">

	 <xsl:element name="a">
	 <xsl:attribute name="href"><xsl:value-of select="srl"/></xsl:attribute>

	 <h3 class="inv">Sub-Entity (ID: <xsl:value-of select="../@id"/>)</h3>
	 <xsl:variable name="subid" select="../@id"/>

	 <xsl:choose>
		 <xsl:when test="../names/name">
		 <xsl:for-each select="../names/name">
			  <xsl:value-of select="."/>
			  <xsl:if test="position() &lt; last()">, </xsl:if>
			 </xsl:for-each>
		 <br/>
			 </xsl:when>
	 </xsl:choose>

	 <xsl:choose>
		 <xsl:when test="../types/type">
			 Type: 
		 <xsl:for-each select="../types/type">
			<xsl:value-of select="."/>
			<xsl:if test="position() &lt; last()">, </xsl:if>
			 </xsl:for-each>
		 <br/>
			 </xsl:when>
	 </xsl:choose>

	 <xsl:for-each select="../media/img/@url">
		<xsl:element name="img">
		 <xsl:attribute name="style">width:75%</xsl:attribute>
		 <xsl:attribute name="src">
			 <xsl:value-of select="concat('https://storage.googleapis.com/',.)"/>
		 </xsl:attribute>
		</xsl:element>
	 </xsl:for-each>

	  <xsl:for-each select="key('bysuperid',$subid)">
		<xsl:for-each select="../media/img/@url">
		<xsl:element name="img">
		 <xsl:attribute name="style">width:75%</xsl:attribute>
		 <xsl:attribute name="src">
			 <xsl:value-of select="concat('https://storage.googleapis.com/',.)"/>
		 </xsl:attribute>
		</xsl:element>
		</xsl:for-each>
	 </xsl:for-each>

	</xsl:element>
	</xsl:for-each>
	</div>

				<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"/>

			</body>

		</html><xsl:text>
</xsl:text>

	</xsl:for-each>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
