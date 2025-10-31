<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
	<xsl:apply-templates select="@*|node()[not(self::normalization)]"/>
    </xsl:copy>
  </xsl:template>

<xsl:template match="thakbong/project/name">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <h1><a href="tml.xml">Thakbong 讀墓, A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Culture</a></h1>
    </html>
</xsl:template>


<xsl:template match="definitions/name">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <h1><a href="tml.xml">Thakbong 讀墓, A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Culture</a></h1>
    <h2><xsl:value-of select="."/></h2>
    </html>
  </xsl:template>


<xsl:template match="sitemap/name">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <h1><a href="tml.xml">Thakbong 讀墓, A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Culture</a></h1>
    <h2><xsl:value-of select="."/></h2>
    </html>
  </xsl:template>


  <xsl:template match="ent">
    <ent>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <h3> 
        <xsl:if test="names">
         <xsl:copy> <xsl:apply-templates select="names"/> </xsl:copy>
        </xsl:if>
        <xsl:if test="types">
         <xsl:text> [</xsl:text>
         <xsl:copy>
	 <xsl:apply-templates select="types"/>
         </xsl:copy>
         <xsl:text>]</xsl:text>
        </xsl:if>
        (<xsl:value-of select="@id"/>)
    </h3>
    </html>
    <xsl:copy>
	 <xsl:apply-templates select="./@*|./node()[not(self::names) and not(self::types) and not(self::communities)]"/>
    </xsl:copy>
    </ent>
  </xsl:template>


  <xsl:template match="event">
        <xsl:if test="@type">
	<event>
        <xsl:value-of select="@type"/>,
        <xsl:if test="@day">
            <xsl:value-of select="@day"/> (gregorian
            <xsl:if test="@lunar">
            , lunar: <xsl:value-of select="@lunar"/>
            </xsl:if>
	    )
        </xsl:if>
        <xsl:if test="@timefrom">
        <xsl:value-of select="@timefrom"/> -- <xsl:value-of select="@timeto"/>
        </xsl:if>;
        </event>
        </xsl:if>
  </xsl:template>

  <xsl:template match="motif[text()='broken column']">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <xsl:element name="a">
       <xsl:attribute name="href">
	       <xsl:value-of select="concat('tmlDefinitions.xml','#brokenColumn')"/>
         </xsl:attribute>
	     <xsl:value-of select="."/>
    </xsl:element>
    </html>
  </xsl:template>


  <xsl:template match="types|definiendum">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <xsl:element name="a">
       <xsl:attribute name="id">
          <xsl:value-of select="../@id"/>
       </xsl:attribute>
    </xsl:element>
    </html>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="xi:include">
    <html xmlns="http://www.w3.org/1999/xhtml">
       <xsl:element name="a">
           <xsl:attribute name="href">
               <xsl:value-of select="@href"/>
           </xsl:attribute>
           <xsl:value-of select="@href"/>
       </xsl:element>
    </html>
  </xsl:template>

  <xsl:template match="img[not(measurement)]">
    <html xmlns="http://www.w3.org/1999/xhtml">
       <xsl:element name="a">
           <xsl:attribute name="href">
               <xsl:value-of select="concat('https://storage.googleapis.com/thakbong/fieldwork',@url)"/>
           </xsl:attribute>

           <xsl:choose>
           <xsl:when test="@spec">
               <xsl:element name="span">
                   <xsl:attribute name="style">width:10px</xsl:attribute>
               special image: <xsl:value-of select="@spec"/>
               </xsl:element>
           </xsl:when>

           <xsl:otherwise>
               <xsl:element name="img">
                   <xsl:attribute name="src">
		       <xsl:value-of select="concat('https://storage.googleapis.com/thakbong/fieldwork',substring-before(@url,'DATE'),'quadrini/DATE',substring-after(@url,'DATE'))"/>
                   </xsl:attribute>
                   <xsl:attribute name="title">
                       <xsl:value-of select="@url"/>
                   </xsl:attribute>
               </xsl:element>
           </xsl:otherwise>
           </xsl:choose>
       </xsl:element>
    </html>
  </xsl:template>

  <xsl:template match="geography">
    <xsl:if test="latitude and latitude != 0 and longitude and longitude !=0 and starts-with(../@id, 's')">
      <html xmlns="http://www.w3.org/1999/xhtml">
      <xsl:element name="iframe">
        <xsl:attribute name="src">
        <xsl:value-of select="concat('https://www.openstreetmap.org/export/embed.html?layer=mapnik&amp;marker=',latitude,'%2C',longitude,'&amp;bbox=')"/><xsl:value-of select="longitude - 0.2"/>%2C<xsl:value-of select="latitude - 0.2"/>%2C<xsl:value-of select="longitude + 0.2"/>%2C<xsl:value-of select="latitude + 0.2"/>
        </xsl:attribute>
      </xsl:element>
      </html>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*[not(@*|*) and normalize-space()='']"/>

</xsl:stylesheet>
