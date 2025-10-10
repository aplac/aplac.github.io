<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="Vpenghu" select="document('../data/tmlDocBelgium.xml')"/>

  <xsl:template match="document">
        <document>
        <xsl:apply-templates select="$Vpenghu//ent[types/type='tomb']"/>
        </document>
  </xsl:template>

</xsl:stylesheet>
