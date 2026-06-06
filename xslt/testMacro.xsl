<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:key name="typebyid" match="/thakbong/patterns/types" use="@id"/>

<xsl:template match="/thakbong">

    <xsl:for-each select="ent">

        <xsl:variable name="typeid" select="types/@id"/>

      <h3>Thakbong </h3>
      <xsl:value-of select="name"/>

      <xsl:copy-of select="key('typebyid',$typeid)">
	<xsl:apply-templates select="@*|node()"/>
      </xsl:copy-of>

      <xsl:copy-of select="types[type]">
	<xsl:apply-templates select="@*|node()"/>
      </xsl:copy-of>

    </xsl:for-each>

</xsl:template>
</xsl:stylesheet>
