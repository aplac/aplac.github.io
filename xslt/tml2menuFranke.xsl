<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xi="http://www.w3.org/2001/XInclude">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>&#xa;</xsl:text>

	<html>

	<xsl:for-each select="project">
		<xsl:for-each select="subprojects">
			<xsl:for-each select="project[@id='franke']">

			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<link type='text/css' rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
				<title>
				<xsl:value-of select="name"/>
				</title>
			</head>

			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>

		<body>

	<xsl:for-each select="project">
		<xi:include href="/home/oliver/git/aplac.github.io/tml/menu.xml" parse="xml"/>
		<xsl:for-each select="subprojects">
			<xsl:for-each select="project[@id='franke']">
				<xi:include href="/home/oliver/git/aplac.github.io/xslt4html/tml2project.xsl" parse="xml"/>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>

	<h2>Wolfgang Franke Id</h2>

	<div>
	<ul>

	<xsl:for-each select="document">
		<xsl:for-each select="ent">
			<xsl:sort select="admin/@code"/>
			<xsl:sort select="geography/pluscode"/>
			<xsl:sort select="names/name/@language"/>
			<xsl:sort select="names/name/@script"/>
			<xsl:sort select="names/name"/>

			<xsl:if test="franke/@frankeid and srl">
			<li>
			<xsl:element name="a">
			<xsl:attribute name="href">
			<xsl:value-of select="srl"/>
			</xsl:attribute>
			<xsl:value-of select="admin/@code"/>
			<xsl:text>:&#032;</xsl:text>
			<xsl:value-of select="franke/@vol"/>
			<xsl:text>&#032;</xsl:text>
			<xsl:value-of select="franke/@frankeid"/>
			<xsl:text>&#032;</xsl:text>
			<xsl:for-each select="names/name">
				<xsl:sort select="language"/>
				<xsl:sort select="script"/>
				<xsl:value-of select="."/>
				<xsl:if test="position() &lt; last()">
					<xsl:text>&#032;</xsl:text>
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
		</xsl:if>

		</xsl:for-each>
	</xsl:for-each>
	</ul>
	</div>

		<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"></script>


	</body>
	</html>

</xsl:template>		
</xsl:stylesheet>
