<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:plat="http://www.elliemae.com/encompass/platform">
  <xsl:output method="xml" 
                   omit-xml-declaration="yes" 
                   indent="yes"/> 
  <xsl:strip-space elements="*"/>

<!-- The identity transform. Copy all nodes -->

	<xsl:template match="node()|@*">
	   <xsl:copy>
	     <xsl:apply-templates select="node()|@*"/>	       
	   </xsl:copy>
	</xsl:template>	

	<xsl:template match="plat:LookupFieldsRequest">
		<xsl:element name="plat:LookupRulesGetRequest">
			<xsl:apply-templates/>	
		</xsl:element>
	</xsl:template>
        
    <xsl:template match="plat:FilterColumn[not(plat:Name != '')]"/>
    <xsl:template match="plat:SortColumn[not(plat:Name != '')]"/>

</xsl:stylesheet>