<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:plat="http://www.elliemae.com/encompass/platform">

<!-- The identity transform. Copy all nodes -->
	<xsl:template match="/ | @* | node()" name="identity">
	   <xsl:copy>
	     <xsl:apply-templates select="*| node()"/>	       
	   </xsl:copy>
	</xsl:template>	
	

	<xsl:template match="plat:LookupRulesGetResponse">
		<xsl:element name="plat:LookupFieldsResponse">
			<xsl:apply-templates/>	
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="plat:RuleItem">
		<xsl:element name="plat:Rule">
			<xsl:apply-templates/>	
		</xsl:element>
	</xsl:template>

	<xsl:template match="plat:FieldSearchRuleId">
		<xsl:element name="plat:Id">
			<xsl:apply-templates/>	
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>