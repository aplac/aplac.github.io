<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2001/XInclude">
<xsl:output method="text" encoding="utf-8" />

<xsl:param name="delim" select="'&#009;'" />
<xsl:param name="space" select="'&#32;'" />
<xsl:param name="quote" select="'&quot;'" />
<xsl:param name="break" select="'&#xA;'" />

<xsl:template match="/thakbong">

<xsl:text>ID</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>ADMIN1</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>ADMIN1_CODE</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>ADMIN1_TYPE</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>ADMIN2</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>ADMIN2_CODE</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>ADMIN2_TYPE</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>SUPERID</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>PLUSCODE</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>LONGITUDE</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>LATITUDE</xsl:text>
<xsl:value-of select="$delim" />

<xsl:text>LATLONG</xsl:text>
<xsl:value-of select="$delim" />

<xsl:value-of select="$break" />

	<xsl:for-each select="document">
		<xsl:for-each select="ent">
			<xsl:value-of select="@id"/>
			<xsl:value-of select="$delim" />

			<xsl:for-each select="admins">
				<xsl:for-each select="admin[@admintype='1' and @language='English']">
					<xsl:if test="position()=1">
					<xsl:value-of select="."/>
					</xsl:if>

				</xsl:for-each>
				<xsl:value-of select="$delim" />
				<xsl:for-each select="admin[@admintype='1' and @language='English']">
					<xsl:if test="position()=1">
					<xsl:value-of select="@code"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:value-of select="$delim" />
				<xsl:for-each select="admin[@admintype='1' and @language='English']">
					<xsl:if test="position()=1">
					<xsl:value-of select="@adminname"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:value-of select="$delim" />
				<xsl:for-each select="admin[@admintype='2' and @language='English']">
					<xsl:if test="position()=1">
					<xsl:value-of select="."/>
					</xsl:if>
				</xsl:for-each>
				<xsl:value-of select="$delim" />
				<xsl:for-each select="admin[@admintype='2' and @language='English']">
					<xsl:if test="position()=1">
					<xsl:value-of select="@code"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:value-of select="$delim" />
				<xsl:for-each select="admin[@admintype='2' and @script='English']">
					<xsl:if test="position()=1">
					<xsl:value-of select="@adminname"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:value-of select="$delim" />
			</xsl:for-each>

			 <xsl:for-each select="geography">
				<xsl:value-of select="@superid"/>
				<xsl:value-of select="$delim" />
				<xsl:value-of select="pluscode"/>
				<xsl:value-of select="$delim" />
				<xsl:value-of select="longitude"/>
				<xsl:value-of select="$delim" />
				<xsl:value-of select="latitude"/>
				<xsl:value-of select="$delim" />
				<xsl:value-of select="latitude"/> 
				<xsl:value-of select="$space" />
				<xsl:value-of select="longitude"/>
				<xsl:value-of select="$delim" />
			 </xsl:for-each>

			<xsl:value-of select="$break" />
		 </xsl:for-each>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>

