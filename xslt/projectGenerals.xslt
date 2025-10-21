<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="Vpenghu" select="document('../tml/tmlDocTaiwanPenghu.xml')"/>
  <xsl:variable name="VpenghuWangan" select="document('../tml/tmlDocTaiwanPenghuWangan.xml')"/>
  <xsl:variable name="VpenghuHuayu" select="document('../tml/tmlDocTaiwanPenghuHuayu.xml')"/>
  <xsl:variable name="VpenghuQimei" select="document('../tml/tmlDocTaiwanPenghuQimei.xml')"/>

  <xsl:template match="document/project">
        <project>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu</h2><hr/><a href="../tml/tmlDocTaiwanPenghu.xml" parse="xml">tmlDocTaiwanPenghu.xml</a></html><xsl:apply-templates select="$Vpenghu//ent[starts-with(@id,'s') and types/type='general']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Wang'an</h2><hr/><a href="../tml/tmlDocTaiwanPenghuWangan.xml" parse="xml">tmlDocTaiwanPenghuWangan.xml</a></html><xsl:apply-templates select="$VpenghuWangan//ent[starts-with(@id,'s') and types/type='general']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Huayu</h2><hr/><a href="../tml/tmlDocTaiwanPenghuHuayu.xml" parse="xml">tmlDocTaiwanPenghuHuayu.xml</a></html><xsl:apply-templates select="$VpenghuHuayu//ent[starts-with(@id,'s') and types/type='general']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Qimei</h2><hr/><a href="../tml/tmlDocTaiwanPenghuQimei.xml" parse="xml">tmlDocTaiwanPenghuQimei.xml</a></html><xsl:apply-templates select="$VpenghuQimei//ent[starts-with(@id,'s') and types/type='general']"/>
        </project>
  </xsl:template>

  <xsl:template match="description">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


</xsl:stylesheet>
