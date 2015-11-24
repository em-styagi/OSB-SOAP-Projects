<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:loan="http://www.elliemae.com/services/LoanRuleSvc" xmlns:plat="http://www.elliemae.com/encompass/platform"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

	<xsl:output omit-xml-declaration="yes" indent="yes" />


	<!-- replace root element in body -->
	
	<xsl:template match="plat:PipelineViewsSaveResponse">
			<xsl:element name="loan:SavePipelineViewsResponse"	namespace="http://www.elliemae.com/services/loanpipeline">
				<xsl:apply-templates />
			</xsl:element>		
	</xsl:template>
	
	
	<xsl:template match="plat:Payload">
			<xsl:element name="loan:GetPipelineViewsResponse"	namespace="http://www.elliemae.com/services/loanpipeline">
				<xsl:apply-templates />
			</xsl:element>		
	</xsl:template>
	

	<!-- copy all nodes -->
	<xsl:template match="/ | @* | node()">
		<xsl:copy>
			<xsl:apply-templates select="*| node()" />
		</xsl:copy>
	</xsl:template>
	
	
	<!-- Add namespace "loan:" to all nodes -->
	<xsl:template match="*">
		<xsl:element name="loan:{name()}"
			namespace="http://www.elliemae.com/services/loanpipeline">
			<xsl:copy-of select="namespace::*" />
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>

	
</xsl:stylesheet>