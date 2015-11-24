<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:tns="http://www.elliemae.com/encompass/platform">
		
	 <!-- Add prefix "user:" to all nodes-->
	 <xsl:template match="tns:*">
	 	<xsl:element name="user:{local-name()}" namespace= "http://www.elliemae.com/services/settingservice">
	       <xsl:apply-templates select="node()|@*"/>		   
	  </xsl:element>
	 </xsl:template>
	 
</xsl:stylesheet>