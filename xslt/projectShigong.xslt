<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="Vpenghu" select="document('../tml/tmlDocTaiwanPenghu.xml')"/>
  <xsl:variable name="VpenghuXiyu" select="document('../tml/tmlDocTaiwanPenghuXiyu.xml')"/>

  <xsl:template match="document/project">
        <project>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu</h2><hr/><a href="../tml/tmlDocTaiwanPenghu.xml" parse="xml">tmlDocTaiwanPenghu.xml</a></html><xsl:apply-templates select="$Vpenghu//ent[starts-with(@id,'s') and types/type='shigong']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Xiyu</h2><hr/><a href="../tml/tmlDocTaiwanPenghuXiyu.xml" parse="xml">tmlDocTaiwanPenghuXiyu.xml</a></html><xsl:apply-templates select="$VpenghuXiyu//ent[starts-with(@id,'s') and types/type='shigong']"/>

        </project>
  </xsl:template>

  <xsl:template match="description">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


</xsl:stylesheet>
