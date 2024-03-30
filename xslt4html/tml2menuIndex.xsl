<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>&#xa;</xsl:text>

	<html>
		<head>
			<meta charset="utf-8"/>
		<link type='text/css' rel="stylesheet" href="/css/all.css"/>
		</head>
	<body>

	<xsl:for-each select="subprojects">
		<div class='inv'>
		<xsl:for-each select="subproject">
			<xsl:element name="a">
				<xsl:attribute name="href">
				<xsl:value-of select="url"/>
				</xsl:attribute>
				<xsl:value-of select="name/@short"/>			 
			</xsl:element>
			<xsl:text>&#032;|&#032;</xsl:text>
		</xsl:for-each>
		 </div>
	</xsl:for-each>


	<h1>Thakbong</h1>
	<h2>A Research and Documentation Project at APLAC, 
		the Research Center for Asia Pacific Languages and Cultures</h2>
	<div></div>


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
			<xsl:text>&#032;</xsl:text>
			<xsl:value-of select="chinese"/>
			<xsl:if test="position() &lt; last()">
			<xsl:text>,&#032;</xsl:text>
		 	</xsl:if>
		</xsl:for-each>
	</xsl:for-each>


	<h3>Project Description</h3>
	<xsl:copy-of select="description"/>

	<xsl:for-each select="subprojects">

		<h3>Sub-Projects, Interests and Responsibilities</h3>
		<xsl:copy-of select="description"/>

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
	 		<xsl:copy-of select="description"/>
			</xsl:element>

		</xsl:for-each>

	</xsl:for-each>


	<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"></script>
	</body>
	</html>

</xsl:template>		
</xsl:stylesheet>
