<?xml version="1.0"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="xml" encoding="utf-8" indent="no" />

<xsl:key name="mydefault" match="defaultent" use="@id"/>

<xsl:template match="/thakbong">

     <xsl:text>&#10;</xsl:text>
     <thakbong>

          <xsl:copy-of select="name"/>
          <xsl:copy-of select="creator"/>
          <xsl:copy-of select="initiator"/>
          <xsl:copy-of select="responsible"/>
          <xsl:copy-of select="collaborator"/>
          <xsl:copy-of select="description"/>
          <xsl:copy-of select="copyright"/>
          <xsl:copy-of select="definitions"/>
          <xsl:copy-of select="subprojects"/>

          <xsl:for-each select="document">
          <document>

          <xsl:copy-of select="@*"/>

	    <xsl:variable name="defaultid" select="defaultent/@id"/>

     <xsl:for-each select="ent">
	     <ent>
	     <xsl:copy-of select="@*"/>



	     <xsl:choose>
             <xsl:when test="not(admins) and key('mydefault',$defaultid)/admins">
                      <xsl:copy-of select="key('mydefault',$defaultid)/admins"/>
             </xsl:when>
             <xsl:otherwise>
                      <xsl:copy-of select="admins"/>
             </xsl:otherwise>

             </xsl:choose>

	     <xsl:choose>
             <xsl:when test="media">
                      <xsl:copy-of select="media"/>
             </xsl:when>
             </xsl:choose>

	     <xsl:choose>
             <xsl:when test="franke">
                      <xsl:copy-of select="franke"/>
             </xsl:when>
             </xsl:choose>

             <xsl:for-each select="types">
		   <types>
                        <xsl:for-each select="type">
				 <xsl:choose>
				     <xsl:when test="not(@language) and not(@script) and key('mydefault',$defaultid)/type/@language">
					  <xsl:element name="type">
						  <xsl:copy-of select="@*"/>
						  <xsl:copy-of select="key('mydefault',$defaultid)/type/@language"/>
				                  <xsl:value-of select="."/>
					  </xsl:element>
				     </xsl:when>
				     <xsl:otherwise>
				          <xsl:copy-of select="."/>
				     </xsl:otherwise>
			         </xsl:choose>
                        </xsl:for-each>
		    </types>
             </xsl:for-each>

             <xsl:for-each select="geography">
                  <geography>
		  <xsl:copy-of select="@*"/>

                      <xsl:if test="direction">
                           <xsl:copy-of select="direction"/>
                      </xsl:if>

                      <xsl:if test="orientations">
                           <xsl:copy-of select="orientations"/>
                      </xsl:if>

		      <xsl:if test="not(winds) and key('mydefault',$defaultid)/winds">
			      <xsl:copy-of select="key('mydefault',$defaultid)/winds"/>
                      </xsl:if>

                        <xsl:for-each select="pluscode">
				 <xsl:choose>
				     <xsl:when test="not(@crs) and key('mydefault',$defaultid)/pluscode/@crs">
					  <xsl:element name="pluscode">
						  <xsl:copy-of select="@*"/>
						  <xsl:copy-of select="key('mydefault',$defaultid)/pluscode/@crs"/>
						  <xsl:value-of select="."/>
					  </xsl:element>
				     </xsl:when>
				     <xsl:otherwise>
				          <xsl:copy-of select="."/>
				     </xsl:otherwise>
			         </xsl:choose>
                        </xsl:for-each>

                        <xsl:for-each select="longitude">
				 <xsl:choose>
				     <xsl:when test="not(@crs) and key('mydefault',$defaultid)/longitude/@crs">
					  <xsl:element name="longitude">
						  <xsl:copy-of select="@*"/>
						  <xsl:copy-of select="key('mydefault',$defaultid)/longitude/@crs"/>
						  <xsl:value-of select="."/>
					  </xsl:element>
				     </xsl:when>
				     <xsl:otherwise>
				          <xsl:copy-of select="."/>
				     </xsl:otherwise>
			         </xsl:choose>
                        </xsl:for-each>

                        <xsl:for-each select="latitude">
				 <xsl:choose>
				     <xsl:when test="not(@crs)  and key('mydefault',$defaultid)/latitude/@crs">
					     <xsl:element name="latitude">
						  <xsl:copy-of select="@*"/>
						  <xsl:copy-of select="key('mydefault',$defaultid)/latitude/@crs"/>
						  <xsl:value-of select="."/>
					  </xsl:element>
				     </xsl:when>
				     <xsl:otherwise>
				          <xsl:copy-of select="."/>
				     </xsl:otherwise>
			         </xsl:choose>
                        </xsl:for-each>

                  </geography>
             </xsl:for-each>

             <xsl:for-each select="communities">
		    <communities>
                    <xsl:for-each select="community">
		        <community>
			<xsl:copy-of select="@*"/>

                        <xsl:for-each select="communityname">
				 <xsl:choose>
				     <xsl:when test="not(@language) and not(@script) and key('mydefault',$defaultid)/communityname/@language">
					  <xsl:element name="communityname">
						  <xsl:copy-of select="@*"/>
						  <xsl:copy-of select="key('mydefault',$defaultid)/communityname/@language"/>
						  <xsl:value-of select="."/>
					  </xsl:element>
				     </xsl:when>
				     <xsl:otherwise>
				          <xsl:copy-of select="."/>
				     </xsl:otherwise>
			         </xsl:choose>
                                 </xsl:for-each>
                            </community>
                        </xsl:for-each>
                    </communities>
             </xsl:for-each>

             <xsl:for-each select="names">
		    <names>
                        <xsl:for-each select="name">
				 <xsl:choose>
				     <xsl:when test="not(@language) and not(@script) and key('mydefault',$defaultid)/name/@language">
					  <xsl:element name="name">
						  <xsl:copy-of select="@*"/>
						  <xsl:copy-of select="key('mydefault',$defaultid)/name/@language"/>
				                  <xsl:value-of select="."/>
					  </xsl:element>
				     </xsl:when>
				     <xsl:otherwise>
				          <xsl:copy-of select="."/>
				     </xsl:otherwise>
			         </xsl:choose>
                        </xsl:for-each>
                    </names>
             </xsl:for-each>

             <xsl:for-each select="events">
	          <xsl:copy-of select="."/>
             </xsl:for-each>

             <xsl:for-each select="sem">
	          <xsl:copy-of select="."/>
             </xsl:for-each>

             <xsl:for-each select="ref">
	          <xsl:copy-of select="."/>
             </xsl:for-each>

             </ent>
	     <xsl:text>&#10;</xsl:text>
             </xsl:for-each>
          </document>
     </xsl:for-each>

     </thakbong>
</xsl:template>

</xsl:transform>

