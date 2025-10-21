<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="V1" select="document('../tml/tmlDocMalaysia.xml')"/>
  <xsl:variable name="V2" select="document('../tml/tmlDocThailand.xml')"/>
  <xsl:variable name="V3" select="document('../tml/tmlDocTaiwanPenghu.xml')"/>

  <xsl:template match="document/project">
        <project>
		<html xmlns="http://www.w3.org/1999/xhtml">
		<h2>Malaysia</h2><hr/>
		<a href="../tml/tmlDocMalaysia.xml" parse="xml">tmlDocMalaysia.xml</a>
	        </html>
	        <xsl:apply-templates select="$V1//ent[types/type='huiguan']"/>


		<html xmlns="http://www.w3.org/1999/xhtml">
			<h2>Thailand</h2><hr/>
			<a href="../tml/tmlDocThailand.xml" parse="xml">tmlDocThailand.xml</a></html><xsl:apply-templates select="$V2//ent[types/type='huiguan']"/>

		<html xmlns="http://www.w3.org/1999/xhtml">
			<h2>Penghu, Magong</h2><hr/>
			<a href="../tml/tmlDocTaiwanPenghu.xml" parse="xml">tmlDocTaiwanPenghu.xml</a></html><xsl:apply-templates select="$V3//ent[types/type='huiguan']"/>

        </project>
  </xsl:template>

  <xsl:template match="description">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
