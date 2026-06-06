<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="utf-8" indent="yes" />

<xsl:template match="/thakbong/project">

	<div class='inv'>
	<a class='inv' href='/tml/index.html'>Thakbong</a>:&#032;
	<xsl:for-each select="subprojects/project">
						<xsl:element name="a">
						<xsl:attribute name="href">
				   		<xsl:value-of select="url"/>
						</xsl:attribute>
						<xsl:value-of select="name/@short"/>
						</xsl:element>
						<xsl:text>&#032;|&#032;</xsl:text>
	</xsl:for-each>


	</div>

</xsl:template>
</xsl:stylesheet>
