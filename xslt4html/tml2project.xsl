<?xml version="1.0"?>
<div xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
