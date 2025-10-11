<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="tml1.xslt"/>

  <xsl:variable name="V1" select="document('../tml/tmlDocThailandBangkok.xml')"/>
  <xsl:variable name="V2" select="document('../tml/tmlDocMacao.xml')"/>
  <xsl:variable name="V3" select="document('../tml/tmlDocTaiwanJinmen.xml')"/>
  <xsl:variable name="V4" select="document('../tml/tmlDocTaiwanPenghuDachang.xml')"/>

  <xsl:template match="document/project">
        <project>
		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Bangkok</h2><hr/><a href="../tml/tmlDocThailandBangkok.xml.xml" parse="xml">tmlDocThailandBangkok.xml.xml</a></html><xsl:apply-templates select="$V1//ent[starts-with(@id,'o') and types/type='shigandang']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Okinawa</h2><hr/><a href="../tml/tmlDocJapanOkinawa.xml" parse="xml">tmlDocJapanOkinawa.xml</a></html><xsl:apply-templates select="$V2//ent[starts-with(@id,'o') and types/type='shigandang']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Macao</h2><hr/><a href="../tml/tmlDocMacao.xml" parse="xml">tmlDocMacao.xml</a></html><xsl:apply-templates select="$V3//ent[starts-with(@id,'o') and types/type='shigandang']"/>

		<html xmlns="http://www.w3.org/1999/xhtml"><h2>Penghu</h2><hr/><a href="../tml/tmlDocTaiwanPenghuDachang.xml" parse="xml">tmlDocTaiwanPenghuDachang.xml</a></html><xsl:apply-templates select="$V4//ent[starts-with(@id,'o') and types/type='shigandang']"/>
        </project>
  </xsl:template>

  <xsl:template match="description">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
