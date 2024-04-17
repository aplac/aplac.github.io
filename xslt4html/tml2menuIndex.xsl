<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude" version="1.0">
<xsl:output method="html" encoding="utf-8" indent="yes"/>

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>
</xsl:text>

	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<link type="text/css" rel="stylesheet" href="/css/all.css"/>
			<title>Thakbong, A Research and Documentation Project at APLAC,
                the Research Center for Asia Pacific Languages and Cultures</title>
		</head>
	<body>

	<div class="inv" xml:base="../../home/oliver/git/aplac.github.io/tml/menu.xml"><a class="inv" href="/tml/index.html">Thakbong</a>: 
	<a href="/tml/menuLandform.html" class="inv">Landform</a> | <a href="/tml/menuSettlement.html" class="inv">Settlement</a> | <a href="/tml/menuHouse.html" class="inv">Houses</a> | <a href="/tml/menuGarden.html" class="inv">Gardens</a> | <a href="/tml/menuFranke.html" class="inv">Wolfgang Franke</a> | <a href="/tml/menuBell.html" class="inv">Bells</a> | <a href="/tml/menuBangkokHokkien.html" class="inv">Hokkien Cemetery</a> | </div>

	<div>
	<h1>Thakbong</h1>
	<h2>A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Cultures</h2>
	</div>


	<div>Creator:
		<xsl:value-of select="creator"/>
	</div>
	<div>Project Initiators:
		<xsl:value-of select="initiator"/>
	</div>
	<div>Responsible:
		<xsl:value-of select="responsible"/>
	</div>
	<div>Collaborators:
	</div>

		<xsl:for-each select="collaborator">
			<xsl:for-each select="collab">
				<xsl:sort select="latin"/>
				<xsl:value-of select="latin"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="chinese"/>
				<xsl:if test="position() &lt; last()">
				<xsl:text>, </xsl:text>
			 	</xsl:if>
			</xsl:for-each>
		</xsl:for-each>


	<h3>Project Description</h3>
		<xsl:for-each select="description">
			<xsl:for-each select="*">
			<xsl:copy-of select="."/>
			</xsl:for-each>
		</xsl:for-each>


		<h3>Sub-Projects, Interests and Responsibilities</h3>

	<xsl:for-each select="subprojects">

		<xsl:for-each select="subproject">

			<h4>
			<xsl:value-of select="name"/>
			</h4>

			<div>Responsibe:
			<xsl:value-of select="responsible"/>
			</div>

			<xsl:element name="a">
			<xsl:attribute name="href">
			<xsl:value-of select="url"/>
			</xsl:attribute>
			<xsl:for-each select="description">
				<xsl:for-each select="*">
				<xsl:copy-of select="."/>
				</xsl:for-each>
			</xsl:for-each>
			</xsl:element>

		</xsl:for-each>
	</xsl:for-each>


	<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"/>
	</body>
	</html>

</xsl:template>		
</xsl:stylesheet>
