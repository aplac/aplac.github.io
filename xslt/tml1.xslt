<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>

<xsl:include href="tmlImage.xslt"/>
<xsl:include href="tmlGeography.xslt"/>
<xsl:include href="tmlInclude.xslt"/>
<xsl:include href="tmlStat.xslt"/>

<xsl:template match="html"><xsl:copy-of select="." /></xsl:template>

<xsl:template match="@*[not(local-name() = 'id') and 
                        not(local-name() = 'geotop') and 
	                        not(local-name() = 'direct') and 
	                        not(local-name() = 'indirect') and 
	                        not(local-name() = 'cross') and 
	                        not(local-name() = 'siteid') and 
	                        not(local-name() = 'ucd') and 
	                        not(local-name() = 'longitude') and 
	                        not(local-name() = 'latitude') and 
	                        not(self::parse) and
	                        not(self::href) and
	                        not(self::html) and
	                        not(self::table) and
	                        not(self::a) and
	                        not(self::include) and
	                        not(self::stats) and
	                        not(self::stat) and
	                        not(self::col)]">
    <xsl:element name="{name()}">
	    <xsl:value-of select="."/>
    </xsl:element>
</xsl:template>

<xsl:template match="@*|node()[not(self::img) 
                               and not(self::parse)
                               and not(self::href)
                               and not(self::col)
                               and not(self::geography)
                               and not(self::include) 
                               and not(self::stats) 
                               and not(self::stat) 
                               and not(self::ent) 
	                       and not(self::event) 
	                       and not(self::geography) 
	                       and not(self::html) 
	                       and not(self::a) 
	                       and not(self::table) 
	                       and not(self::td) 
	                       and not(self::th) 
	                       and not(self::tr) 
	                       and not(self::document) 
	                       and not(self::definitions) 
	                       and not(self::projects)]">
    <xsl:copy>
        <xsl:if test="node()">
            <xsl:value-of select="local-name(.)"/>:
	    <xsl:apply-templates select="node()"/>
        </xsl:if>
        <xsl:if test="not(node()) and @*">
	    [<xsl:apply-templates select="@*"/>]
        </xsl:if>
    </xsl:copy>
  </xsl:template>

<xsl:template match="thakbong/project/name">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <h1><a class="inv" href="tml.xml">Thakbong 讀墓, A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Culture</a></h1>
    </html>
</xsl:template>

<xsl:template match="*[self::definitions or self::document or self::projects]">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <h1 style="padding:2ex"><a class="inv" href="tml.xml">Thakbong 讀墓, A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Culture</a></h1>
    <xsl:copy>
	 <xsl:apply-templates select="ent"/>
	 <xsl:apply-templates select="def"/>
	 <xsl:apply-templates select="project"/>
    </xsl:copy>
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
         <xsl:copy> <xsl:apply-templates select="types"/> </xsl:copy>
        </xsl:if>
	 <div class='inv' style="text-align:right">
	<xsl:if test="starts-with(@id,'s')"> Site </xsl:if>
	<xsl:if test="starts-with(@id,'o')"> Object </xsl:if>

	 ID: <xsl:value-of select="@id"/>
 </div>
    </h3>
         <xsl:copy> <xsl:apply-templates select="admins"/> </xsl:copy>
         <xsl:copy> <xsl:apply-templates select="stats"/> </xsl:copy>
    </html>
    <xsl:copy>
	 <xsl:apply-templates select="./@*|./node()[not(self::names) and not(self::types) and not(self::admins) and not(self::stats)]"/>
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

  <xsl:template match="*[not(self::stats) and 
                         not(self::html) and
                         not(self::table) and
                         not(self::include) and
                         not(self::stat) and not(@*|*) and normalize-space()='']"/>

  <xsl:template match="col">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <xsl:element name="span">
       <xsl:attribute name="style">
               <xsl:value-of select="@style"/>
       </xsl:attribute>
     <xsl:value-of select="."/>,
    </xsl:element>
    </html>
  </xsl:template>

</xsl:stylesheet>
