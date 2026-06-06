<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>

  <xsl:template match="geography">
    <xsl:if test="latitude and latitude != 0 and longitude and longitude !=0 and starts-with(../@id, 's')">
      <html xmlns="http://www.w3.org/1999/xhtml">
      <xsl:element name="iframe">
        <xsl:attribute name="src">
        <xsl:value-of select="concat('https://www.openstreetmap.org/export/embed.html?layer=mapnik&amp;marker=',latitude,'%2C',longitude,'&amp;bbox=')"/><xsl:value-of select="longitude - 0.2"/>%2C<xsl:value-of select="latitude - 0.2"/>%2C<xsl:value-of select="longitude + 0.2"/>%2C<xsl:value-of select="latitude + 0.2"/>
        </xsl:attribute>
      </xsl:element>
      </html>
    </xsl:if>
    <xsl:copy>
	 <xsl:apply-templates select="./@*|./node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>

