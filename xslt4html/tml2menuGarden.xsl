<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude" version="1.0">
<xsl:output method="html" encoding="utf-8" indent="yes"/>

<xsl:template match="/thakbong">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:text>
</xsl:text>

	<html>

	<xsl:for-each select="project">
		<xsl:for-each select="subprojects">
			<xsl:for-each select="project[@id='gardens']">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<link type="text/css" rel="stylesheet" href="https://aplac.github.io/css/all.css"/>
				<title>
				<xsl:value-of select="name"/>
				</title>	
			</head>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>

	<body>

	<div class="inv" xml:base="../../home/oliver/git/aplac.github.io/tml/menu.xml"><a class="inv" href="/tml/index.html">Thakbong</a>: 
	<a href="/tml/menuLandform.html" class="inv">Landform</a> | <a href="/tml/menuSettlement.html" class="inv">Settlement</a> | <a href="/tml/menuHouse.html" class="inv">Houses</a> | <a href="/tml/menuGarden.html" class="inv">Gardens</a> | <a href="/tml/menuFranke.html" class="inv">Wolfgang Franke</a> | <a href="/tml/menuBell.html" class="inv">Bells</a> | <a href="/tml/menuBangkokHokkien.html" class="inv">Hokkien Cemetery</a> | </div>

	<xsl:for-each select="project">
		<xsl:for-each select="subprojects">
			<xsl:for-each select="project[@id='gardens']">
	                        <div xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xml:base="../../home/oliver/git/aplac.github.io/xslt4html/tml2project.xsl">

				<xsl:if test="name">
				<h2>
				<xsl:value-of select="name"/>
				</h2>
				</xsl:if>

				<xsl:if test="creator">
				<div>Project Creator:
				<xsl:value-of select="creator"/>
				</div>
				</xsl:if>

				<xsl:if test="initiator">
				<div>Project Initiators:
				<xsl:value-of select="initiator"/>
				</div>
				</xsl:if>

				<xsl:if test="responsible">
				<div>Responsible:
				<xsl:value-of select="responsible"/>
				</div>	
				</xsl:if>

				<xsl:if test="collaborator">
				<div>Collaborators:
				</div>
				<xsl:for-each select="collaborator">
					<xsl:for-each select="collab">
						<xsl:sort select="latin"/>
						<xsl:value-of select="latin"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="chinese"/>
						<xsl:if test="position() &lt; last()">
						<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			 	</xsl:if>

				<xsl:for-each select="description">
					<xsl:for-each select="*">
					<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:for-each>
	


				<xsl:if test="archives/archive">
				<ul>
				<xsl:for-each select="archives">
	
						<h2>Related Archives:</h2>
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
			 	</xsl:if>
			</div>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>


	<h2>Thakbong Garden Search</h2>

	<ul>
	<xsl:for-each select="document">
		<xsl:for-each select="ent">
			<xsl:sort select="admin/@code"/>
			<xsl:sort select="geography/pluscode"/>
			<xsl:sort select="communities/community/communityname"/>

			<xsl:variable name="is_caizhai" select="types[type='caizhai']/type/text()"/>
                        <xsl:choose>   
                        <xsl:when test="$is_caizhai !='' and srl">

		        <li>
			<xsl:element name="a">
			<xsl:attribute name="href">
			<xsl:value-of select="srl"/>
			</xsl:attribute>
			<xsl:value-of select="admin/@code"/>
			<xsl:text>: </xsl:text>

			<xsl:for-each select="communities/community/communityname">
				<xsl:sort select="language"/>
				<xsl:sort select="script"/>
				<xsl:value-of select="."/>
			 	<xsl:if test="position() &lt; last()">,
				<xsl:text> </xsl:text>
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

		<script type="text/javascript" src="https://aplac.github.io/js/leftright.js"/>


	</body>
	</html>

</xsl:template>		
</xsl:stylesheet>
