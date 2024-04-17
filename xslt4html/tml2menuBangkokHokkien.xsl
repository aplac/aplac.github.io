<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude" version="1.0">
<xsl:output method="html" encoding="utf-8" indent="yes"/>

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>
</xsl:text>

	<html>
	<xsl:for-each select="subprojects">
		<xsl:for-each select="subproject[@id='BangkokHokkien']">

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<link type="text/css" rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
			<title>
			<xsl:value-of select="name"/>
			</title>
		</head>
		</xsl:for-each>
	</xsl:for-each>	
	<body>
	<div class="inv" xml:base="../../home/oliver/git/aplac.github.io/tml/menu.xml"><a class="inv" href="/tml/index.html">Thakbong</a>: 
	<a href="/tml/menuLandform.html" class="inv">Landform</a> | <a href="/tml/menuSettlement.html" class="inv">Settlement</a> | <a href="/tml/menuHouse.html" class="inv">Houses</a> | <a href="/tml/menuGarden.html" class="inv">Gardens</a> | <a href="/tml/menuFranke.html" class="inv">Wolfgang Franke</a> | <a href="/tml/menuBell.html" class="inv">Bells</a> | <a href="/tml/menuBangkokHokkien.html" class="inv">Hokkien Cemetery</a> | </div>
	<xsl:for-each select="subprojects">
		<xsl:for-each select="subproject[@id='BangkokHokkien']">
			<h2>
			<xsl:value-of select="name"/>
			</h2>
			<div>Responsible:
			<xsl:value-of select="responsible"/>
			</div>
			<xsl:for-each select="description">
				<xsl:for-each select="*">
				<xsl:copy-of select="."/>
				</xsl:for-each>
			</xsl:for-each>


		</xsl:for-each>
	</xsl:for-each>

	<ul>

	<xsl:for-each select="document[@id='doc33']">

		<xsl:for-each select="ent">

			<xsl:sort select="event/material"/>
			<xsl:sort select="event/material/@color"/>
			<xsl:sort select="admin/@code"/>
			<xsl:sort select="geography/pluscode"/>
			<xsl:sort select="names/name"/>

			<xsl:choose>

			<xsl:when test="types/type='tombstone' and srl">
			<li>
				<xsl:element name="a">
				<xsl:attribute name="href">
			<xsl:value-of select="srl"/>
				</xsl:attribute>

			<xsl:for-each select="names/name">
				<xsl:sort select="script"/>
				<xsl:sort select="language"/>
				<xsl:value-of select="."/>

			<xsl:if test="position() &lt; last()">,
				 <xsl:text> </xsl:text>
		  	</xsl:if>
			
		</xsl:for-each>
					 <xsl:element name="img">
						<xsl:attribute name="style">
						<xsl:text>width:20%</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="src">
			https://storage.googleapis.com/<xsl:value-of select="media/img/@url"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
						<xsl:text>The image shows a</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

			<xsl:if test="media/img/ocr/corrected">
			<div>
			<xsl:text>OCR:</xsl:text>
			<xsl:value-of select="media/img/ocr/corrected"/>
			</div>
			</xsl:if>
		</li>
		</xsl:when>
		</xsl:choose>

	</xsl:for-each>
	</xsl:for-each>
	</ul>

		<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"/>


	</body>
	</html>

</xsl:template>		
</xsl:stylesheet>
