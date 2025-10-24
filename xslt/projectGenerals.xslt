<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="Vpenghu" select="document('../tml/tmlDocTaiwanPenghu.xml')"/>
  <xsl:variable name="VpenghuLongmen" select="document('../tml/tmlDocTaiwanPenghuLongmen.xml')"/>
  <xsl:variable name="VpenghuJianshan" select="document('../tml/tmlDocTaiwanPenghuJianshan.xml')"/>
  <xsl:variable name="VpenghuHongluo" select="document('../tml/tmlDocTaiwanPenghuHongluo.xml')"/>
  <xsl:variable name="VpenghuXixi" select="document('../tml/tmlDocTaiwanPenghuXixi.xml')"/>
  <xsl:variable name="VpenghuWangan" select="document('../tml/tmlDocTaiwanPenghuWangan.xml')"/>
  <xsl:variable name="VpenghuHuayu" select="document('../tml/tmlDocTaiwanPenghuHuayu.xml')"/>
  <xsl:variable name="VpenghuQimei" select="document('../tml/tmlDocTaiwanPenghuQimei.xml')"/>

  <xsl:template match="document/project">
        <project>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu</h2><hr/><a href="../tml/tmlDocTaiwanPenghu.xml" parse="xml">tmlDocTaiwanPenghu.xml</a></html><xsl:apply-templates select="$Vpenghu//ent[starts-with(@id,'s') and types/type='general']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Longmen</h2><hr/><a href="../tml/tmlDocTaiwanPenghuLongmen.xml" parse="xml">tmlDocTaiwanPenghuLongmen.xml</a></html><xsl:apply-templates select="$VpenghuLongmen//ent[starts-with(@id,'s') and types/type='general']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Jianshan</h2><hr/><a href="../tml/tmlDocTaiwanPenghuJianshan.xml" parse="xml">tmlDocTaiwanPenghuJianshan.xml</a></html><xsl:apply-templates select="$VpenghuJianshan//ent[starts-with(@id,'s') and types/type='general']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Hongluo</h2><hr/><a href="../tml/tmlDocTaiwanPenghuHongluo.xml" parse="xml">tmlDocTaiwanPenghuHongluo.xml</a></html><xsl:apply-templates select="$VpenghuHongluo//ent[starts-with(@id,'s') and types/type='general']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu, Xixi</h2><hr/><a href="../tml/tmlDocTaiwanPenghuXixi.xml" parse="xml">tmlDocTaiwanPenghuXixi.xml</a></html><xsl:apply-templates select="$VpenghuXixi//ent[starts-with(@id,'s') and types/type='general']"/>

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
