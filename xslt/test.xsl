<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/archipelago">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>&#xa;</xsl:text>

    <html>
        <head>
           <meta charset="utf-8"/>
           <link type='text/css' rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
        </head>
    <body>

    <ul>
    <xsl:for-each select="ent">
	    <xsl:sort select="geography/pluscode"/>
	    <xsl:sort select="names/name"/>

        <xsl:choose>
		<xsl:when test="types/type[1]='archipelago'">
		<li>
                  <xsl:element name="a">
                  <xsl:attribute name="srl">
	             <xsl:value-of select="srl"/>
                  </xsl:attribute>
		  <xsl:for-each select="names/name">
	                  <xsl:value-of select="."/>
			  <xsl:if test="position() &lt; last()">,<xsl:text>&#032;</xsl:text>
                          </xsl:if>
                      </xsl:for-each>
                  </xsl:element>
		</li>

		<li>
			sub:

		<xsl:variable name="subid" select="@subid"/>
		<xsl:for-each select="/archipelago/ent[@id=$subid]">
			found!
			<xsl:value-of select="names/name"/>
		</xsl:for-each>

		</li>
		<li>
			super:
		<xsl:variable name="superid" select="@superid"/>
		<xsl:for-each select="/archipelago/ent[@id=$superid]">
			found!
			<xsl:value-of select="names/name"/>
		</xsl:for-each>
		</li>
        </xsl:when>
        </xsl:choose>

   </xsl:for-each>
   </ul>

        <script type="text/javascript" src="https://aplac.github.io/js/leftright.js"></script>


   </body>
   </html>

</xsl:template>        
</xsl:stylesheet>
