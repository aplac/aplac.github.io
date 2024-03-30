<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>&#xa;</xsl:text>

	<html>
		<head>
			<meta charset="utf-8"/>
			<link type='text/css' rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
		</head>
	<body>


	<xsl:for-each select="subprojects">
		<div class='inv'>
		<xsl:for-each select="subproject">
			<xsl:element name="a">
				<xsl:attribute name="href">
				<xsl:value-of select="url"/>
				</xsl:attribute>
				<xsl:value-of select="name/@short"/>			 
			</xsl:element>
			<xsl:text>&#032;|&#032;</xsl:text>
		</xsl:for-each>
		</div>


		<xsl:for-each select="subproject[@id='houses']">

			<h2>
			<xsl:value-of select="name"/>
			</h2>

			<div>Responsible:
			<xsl:value-of select="responsible"/>
			</div>	

			<xsl:copy-of select="description"/>

			<h2>Related Archives:</h2>

			<ul>
			<xsl:for-each select="archives">

				<xsl:for-each select="archive">

					<li>Archive Name:
					<xsl:value-of select="name"/>
					</li>

					<li>Archive URL:
					<xsl:element name="a">
					<xsl:attribute name="href">
					<xsl:value-of select="url"/>
					</xsl:attribute>
					<xsl:value-of select="url"/>
					</xsl:element>
					</li>

					<xsl:for-each select="repository">
						
						<li>Repository Name:
						<xsl:value-of select="name"/>
						</li>

						<li>Repository URL:
						<xsl:element name="a">
						<xsl:attribute name="href">
						<xsl:value-of select="url"/>
						</xsl:attribute>
						<xsl:value-of select="url"/>
						</xsl:element>
						</li>
			
						<li>Repository Update:
						<xsl:value-of select="update"/>
						</li>

						<li>Number of Entries:
						<xsl:value-of select="entities"/>
						</li>

						<xsl:for-each select="format">
							<li>Format:
							<xsl:value-of select="."/>
						</li>
					        </xsl:for-each>

					</xsl:for-each>

				</xsl:for-each>

			</xsl:for-each>
			</ul>

		</xsl:for-each>

	</xsl:for-each>

	<h2>Thakbong House Search</h2>

	<div>
	<ul>
	<xsl:for-each select="document">
		<xsl:for-each select="ent">
			<xsl:sort select="admin/@code"/>
			<xsl:sort select="geography/pluscode"/>
			<xsl:sort select="communities/community/communityname"/>

			<xsl:choose>
			<xsl:when test="types/type='house'">
			<li>

			<xsl:element name="a">
			<xsl:attribute name="href">
			<xsl:value-of select="srl"/>
			</xsl:attribute>

			<xsl:for-each select="communities/community/communityname">
				<xsl:sort select="script"/>
				<xsl:sort select="language"/>
				<xsl:value-of select="."/>

			<xsl:if test="position() &lt; last()">,
				<xsl:text>&#032;</xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:element>
			Pluscode:
			<xsl:value-of select="geography/pluscode"/>
			</li>
			</xsl:when>
			</xsl:choose>

		</xsl:for-each>
	</xsl:for-each>
	</ul>
	</div>

	<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"/>


	</body>
	</html>

</xsl:template>		
</xsl:stylesheet>
