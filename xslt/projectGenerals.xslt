<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="Vpenghu" select="document('../tml/tmlDocTaiwanPenghu.xml')"/>
  <xsl:variable name="VpenghuQimei" select="document('../tml/tmlDocTaiwanPenghuQimei.xml')"/>

  <xsl:template match="document/project">

        <project>

	<html style="display:block" xmlns="http://www.w3.org/1999/xhtml">
	<a href="../tml/tmlDocTaiwanPenghu.xml" parse="xml"/>
        </html>
        <xsl:apply-templates select="$Vpenghu//ent[types/type='general system']"/>

	<xi:include href="../tml/tmlDocTaiwanPenghuQimei.xml" parse="xml"/>
        <xsl:apply-templates select="$VpenghuQimei//ent[types/type='general system']"/>

        </project>
  </xsl:template>

  <xsl:template match="description">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


</xsl:stylesheet>
