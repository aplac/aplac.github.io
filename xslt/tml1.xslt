<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>

<xsl:include href="tmlImage.xslt"/>
<xsl:include href="tmlGeography.xslt"/>
<xsl:include href="tmlInclude.xslt"/>
<xsl:include href="tmlStat.xslt"/>
<xsl:include href="tmlIsland.xslt"/>

<xsl:template match="@*[not(local-name() = 'id') 
                        and not(local-name() = 'geotop') 
                        and not(self::processing-instruction()) and
	                        not(local-name() = 'direct') and 
	                        not(local-name() = 'indirect') and 
	                        not(local-name() = 'cross') and 
	                        not(local-name() = 'siteid') and 
	                        not(local-name() = 'longitude') and 
	                        not(local-name() = 'latitude') and 
	                        not(self::siteid) and
	                        not(self::geotop) and
	                        not(self::id) and
	                        not(self::ent) and
	                        not(self::event) and
	                        not(self::thakbong) and
	                        not(self::document) and
	                        not(self::parse) and
	                        not(self::href) and
	                        not(self::html) and
	                        not(self::table) and
	                        not(self::island) and
	                        not(self::projects) and
	                        not(self::definitions) and
	                        not(self::examples) and
	                        not(self::practice) and
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
	                       and not(self::processing-instruction())
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
	                       and not(self::thakbong) 
	                       and not(self::island) 
	                       and not(self::practice) 
	                       and not(self::td) 
	                       and not(self::th) 
	                       and not(self::tr) 
	                       and not(self::ent) 
	                       and not(self::document) 
	                       and not(self::projects)
	                       and not(self::examples) 
	                       and not(self::definitions) 
	                       ]">
        <xsl:if test="@REF">
            <xsl:copy>
		    <xsl:apply-templates select="*|@*"/>
            </xsl:copy>
        </xsl:if>
        <xsl:if test="normalize-space(.) and not(*) and not(@REF)">
		<xsl:element name="{local-name(.)}">
            <xsl:value-of select="local-name(.)"/>:
            <xsl:value-of select="."/>
            <xsl:if test="@*">
	        [<xsl:apply-templates select="@*"/>]
            </xsl:if>
    </xsl:element>
        </xsl:if>
        <xsl:if test="* and not(@REF)">
            <xsl:copy>
            <xsl:value-of select="local-name(.)"/>:
	    <xsl:apply-templates select="*"/>
            </xsl:copy>
        </xsl:if>
  </xsl:template>

<xsl:template match="document|thakbong|examples|definitions|projects">
    <xsl:copy-of select="/processing-instruction('xml-stylesheet')"/>
    <xsl:copy>
    <ent>
    <html xmlns="http://www.w3.org/1999/xhtml">
	    <h1 style="padding:2ex">
		    <a class="inv" href="tml.xml">Thakbong 讀墓, A Research and Documentation Project at APLAC, the Research Center for Asia Pacific Languages and Culture</a>
	    </h1>
    </html>
    <xsl:apply-templates select="description"/>
    <xsl:apply-templates select="ent"/>
    <xsl:apply-templates select="def"/>
    <xsl:apply-templates select="project"/>
    <xsl:apply-templates select="example"/>
    <xsl:apply-templates select="sitemap"/>
    <xsl:apply-templates select="person"/>
    <xsl:apply-templates select="definition"/>
 </ent>
 </xsl:copy>
</xsl:template>

  <xsl:template match="ent">
    <ent>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <h3> 
        <xsl:if test="names">
         <xsl:apply-templates select="names"/>
        </xsl:if>
        <xsl:if test="types">
        <xsl:apply-templates select="types"/>
        </xsl:if>
	 <div class='inv' style="text-align:right">
	<xsl:if test="starts-with(@id,'s')"> Site </xsl:if>
	<xsl:if test="starts-with(@id,'o')"> Object </xsl:if>
	 ID: <xsl:value-of select="@id"/>
        </div>
    </h3>
         <xsl:apply-templates select="admins"/>
         <xsl:apply-templates select="stats"/>
         <xsl:apply-templates select="geography"/>
    </html>
    <xsl:apply-templates select="node()[
              not(self::names) and 
              not(self::types) and 
              not(self::geography) and 
              not(self::admins) and 
	      not(self::stats)]"/>
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
    <xsl:element name="a">
       <xsl:attribute name="id">
          <xsl:value-of select="../@id"/>
       </xsl:attribute>
    </xsl:element>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
