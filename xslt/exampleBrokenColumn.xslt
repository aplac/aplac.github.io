<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="V1" select="document('../tml/tmlDocBelgium.xml')"/>
  <xsl:variable name="V2" select="document('../tml/tmlDocHongKong.xml')"/>

  <xsl:template match="document/project">
        <project>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Belgium</h2><hr/><a href="../tml/tmlDocBelgium.xml" parse="xml">tmlDocBelgium.xml</a></html><xsl:apply-templates select="$V1//ent/media[starts-with(../@id,'o') and ../sem/fig/motifs/motif='broken column']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>HongKong</h2><hr/><a href="../tml/tmlDocHongKong.xml" parse="xml">tmlDocHongKong.xml</a></html><xsl:apply-templates select="$V2//ent/media[starts-with(../@id,'o') and ../sem/fig/motifs/motif='broken column']"/>

        </project>
  </xsl:template>

  <xsl:template match="description">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
