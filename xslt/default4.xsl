<?xml version="1.0"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="xml" encoding="utf-8" indent="no" />

<xsl:template match="*">

	        <xsl:choose>

			<xsl:when test="name()='ent' and not(admins)">
			     <xsl:element name="{local-name()}">
                                 <xsl:copy-of select="@*"/>
				 <xsl:copy-of select="../defaultent/admins"/>
                                <xsl:apply-templates select="node()"/>
                             </xsl:element>
                        </xsl:when>
			 <xsl:when test="name()='direction' or name()='agents' or name()='media'">
                                <xsl:copy-of select="."/>
                        </xsl:when>


	                <xsl:otherwise>
			     <xsl:element name="{local-name()}">
                                 <xsl:copy-of select="@*"/>
	                         <xsl:choose>
					 <xsl:when test="name() = 'latitude' and not(@deg)">
						 <xsl:copy-of select="../../../defaultent/latitude/@deg"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'latitude' and not(@crs)">
						 <xsl:copy-of select="../../../defaultent/latitude/@crs"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'longitude' and not(@deg)">
						 <xsl:copy-of select="../../../defaultent/longitude/@deg"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'pluscode' and not(@crs)">
						 <xsl:copy-of select="../../../defaultent/pluscode/@crs"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'pluscode' and not(@digits)">
						 <xsl:copy-of select="../../../defaultent/pluscode/@digits"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'longitude' and not(@crs)">
						 <xsl:copy-of select="../../../defaultent/longitude/@crs"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'event' and not(@eventtype)">
						 <xsl:copy-of select="../../../defaultent/event/@eventtype"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'type' and not(@language)">
						 <xsl:copy-of select="../../../defaultent/type/@language"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'name' and not(@language)">
						 <xsl:copy-of select="../../../defaultent/name/@language"/>
                                         </xsl:when>
					 <xsl:when test="name() = 'communityname' and not(@language)">
						 <xsl:copy-of select="../../../defaultent/communityname/@language"/>
                                         </xsl:when>
	                         </xsl:choose>
                                 <xsl:apply-templates select="node()"/>
                             </xsl:element>
	                </xsl:otherwise>
	        </xsl:choose>

</xsl:template>

</xsl:transform>

