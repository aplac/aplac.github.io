<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>

  <xsl:template match="include">
    <html xmlns="http://www.w3.org/1999/xhtml">
       <xsl:element name="a">
           <xsl:attribute name="href">
               <xsl:value-of select="@href"/>
           </xsl:attribute>
           <xsl:value-of select="@href"/>
       </xsl:element>
    </html>
        <xsl:apply-templates select="node()"/>
  </xsl:template>

  <xsl:template match="xi:include">
    <html xmlns="http://www.w3.org/1999/xhtml">
       <xsl:element name="a">
           <xsl:attribute name="href">
               <xsl:value-of select="@href"/>
           </xsl:attribute>
           <xsl:value-of select="@href"/>
       </xsl:element>
    </html>
    <xsl:copy>
        <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
