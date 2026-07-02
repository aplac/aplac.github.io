<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:key name="island" match="ent/geography/island" use="@ID" />
<xsl:variable name="tmlDictionary" select="document('../tml/tmlDocDictionary.xml')" />

    <xsl:template match="island">
    <xsl:if test="not(@REF)">
        <xsl:copy>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:if>
    <xsl:if test="@REF">
	island:
	<xsl:variable name="thisRef" select="@REF" />
	<xsl:for-each select="$tmlDictionary">
	    <xsl:apply-templates select="key('island',$thisRef)" />
        </xsl:for-each>
    </xsl:if>

  </xsl:template>

</xsl:stylesheet>
