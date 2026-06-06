<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tmlImage.xslt"/>
  <xsl:include href="tmlGeography.xslt"/>
  <xsl:include href="tmlInclude.xslt"/>
  <xsl:include href="tmlStat.xslt"/>

  <xsl:template match="@*|node()[not(self::img) 
	                     and not(self::col)
	                     and not(self::stat)
	                     and not(self::hmtl)
	                     and not(self::table)
	                     and not(self::stats)
	                     and not(self::geography)
	                     and not(self::include)
	                     and not(self::events)
	                     and not(self::culturaldomain)
	                     and not(self::examples)]">
    <xsl:copy>
        <xsl:if test="node()">
        <xsl:value-of select="local-name(.)"/>:
        <xsl:apply-templates select="node()"/>
        </xsl:if>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
