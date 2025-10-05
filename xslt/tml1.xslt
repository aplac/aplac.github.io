<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="ent">
    <ent>
    <hr style="color:silver"/>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <hr/>
    <h2 style="color:silver;text-decoration-line:underline;margin-bottom:1em"> (id: <xsl:value-of select="@id"/>)</h2>
    </html>
    <xsl:copy>
	    <xsl:apply-templates select="./@*|./node()"/>
    </xsl:copy>
    </ent>
  </xsl:template>

  <xsl:template match="types">
    <xsl:element name="a">
       <xsl:attribute name="id">
          <xsl:value-of select="../@id"/>
       </xsl:attribute>
    </xsl:element>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="xi:include">
    <html style="display:block" xmlns="http://www.w3.org/1999/xhtml">
       <xsl:element name="a">
           <xsl:attribute name="href">
               <xsl:value-of select="@href"/>
           </xsl:attribute>
           <xsl:value-of select="@href"/>
       </xsl:element>
    </html>
  </xsl:template>

  <xsl:template match="img">
    <html xmlns="http://www.w3.org/1999/xhtml">
       <xsl:element name="img">
           <xsl:attribute name="src">
               <xsl:value-of select="concat('https://storage.googleapis.com/thakbong/fieldwork',@url)"/>
           </xsl:attribute>
       </xsl:element>
    </html>
  </xsl:template>

  <xsl:template match="geography">
    <xsl:if test="latitude and latitude != 0 and longitude and longitude !=0 and starts-with(../@id, 's')">
      <html xmlns="http://www.w3.org/1999/xhtml">
      <xsl:element name="iframe">
        <xsl:attribute name="src">
        <xsl:value-of select="concat('https://www.openstreetmap.org/export/embed.html?layer=mapnik&amp;marker=',latitude,'%2C',longitude,'&amp;bbox=')"/><xsl:value-of select="longitude - 0.3"/>%2C<xsl:value-of select="latitude - 0.3"/>%2C<xsl:value-of select="longitude + 0.3"/>%2C<xsl:value-of select="latitude + 0.3"/>
        </xsl:attribute>
      </xsl:element>
      </html>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*[not(@*|*) and normalize-space()='']"/>

</xsl:stylesheet>
