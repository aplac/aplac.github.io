<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xi="http://www.w3.org/2001/XInclude">

<xsl:output method="xml" indent="yes"/>

   <xsl:template match="stats">
   <html xmlns="http://www.w3.org/1999/xhtml">
        <h3>A short statistical summary of our fieldwork:</h3>
	<table xmlns="http://www.w3.org/1999/xhtml">
	<xsl:apply-templates select="stat"/>
        </table>
</html>
   </xsl:template>

   <xsl:template match="stat">
	   <tr xmlns="http://www.w3.org/1999/xhtml">
	   <td xmlns="http://www.w3.org/1999/xhtml">
	   <xsl:value-of select="@type"/>
	   </td>
	   <td xmlns="http://www.w3.org/1999/xhtml">
	   <xsl:value-of select="."/>
	   </td>
	   </tr>
  </xsl:template>

</xsl:stylesheet>
