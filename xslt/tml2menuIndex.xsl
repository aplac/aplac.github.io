<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xi="http://www.w3.org/2001/XInclude">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>&#xa;</xsl:text>

	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<link type='text/css' rel="stylesheet" href="/css/all.css"/>
			<title>Thakbong, A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Cultures</title>
		</head>
	<body>

	<xi:include href="/home/oliver/git/aplac.github.io/tml/menu.xml" parse="xml"/>

	<xsl:for-each select="project">
		<xi:include href="/home/oliver/git/aplac.github.io/xslt4html/tml2project.xsl" parse="xml"/>

		<h3>Sub-Projects, Interests and Responsibilities</h3>
		<xsl:for-each select="subprojects">
			<xsl:for-each select="project">
				<xi:include href="/home/oliver/git/aplac.github.io/xslt4html/tml2project.xsl" parse="xml"/>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>
	<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"></script>
	</body>
	</html>

</xsl:template>		
</xsl:stylesheet>
