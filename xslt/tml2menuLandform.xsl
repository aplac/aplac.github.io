<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2001/XInclude">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>&#xa;</xsl:text>

	<html>
	<xsl:for-each select="project">
		<xsl:for-each select="subprojects">
			<xsl:for-each select="project[@id='landforms']">

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

	<xi:include href="/home/oliver/git/aplac.github.io/tml/menu.xml" parse="xml"/>

	<xsl:for-each select="project">
		<xsl:for-each select="subprojects">
			<xsl:for-each select="project[@id='landforms']">
                                <xi:include href="/home/oliver/git/aplac.github.io/xslt4html/tml2project.xsl" parse="xml"/>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>

	<h2>Thakbong Landform Search</h2>

	<ul>
	<xsl:for-each select="document">
		<xsl:for-each select="ent">

			<xsl:sort select="admin/@code"/>
			<xsl:sort select="geography/pluscode"/>
			<xsl:sort select="names/name/@language"/>
			<xsl:sort select="names/name/@script"/>
			<xsl:sort select="names/name"/>

			<xsl:variable name="is_landform" select="types[type='landform']/type/text()" />
			<xsl:choose>
			<xsl:when test="$is_landform !='' and srl">
			<li>
			<xsl:element name="a">
			<xsl:attribute name="href">
			<xsl:value-of select="srl"/>
		 	</xsl:attribute>
			<xsl:value-of select="admin/@code"/>
			<xsl:text>:&#032;</xsl:text>
			<xsl:for-each select="names/name">
				<xsl:sort select="language"/>
				<xsl:sort select="script"/>
			<xsl:value-of select="."/>
			<xsl:if test="position() &lt; last()">,
				 <xsl:text>&#032;</xsl:text>
						 </xsl:if>
					 </xsl:for-each>
				 </xsl:element>
			</li>
			</xsl:when>
			</xsl:choose>

		</xsl:for-each>
	</xsl:for-each>
	</ul>

	<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"></script>


  </body>
  </html>

</xsl:template>		
</xsl:stylesheet>
