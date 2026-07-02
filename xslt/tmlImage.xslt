<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>


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
    <xsl:copy>
        <xsl:apply-templates select="*"/>
    </xsl:copy>
  </xsl:template>

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
