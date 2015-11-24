<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://www.elliemae.com/services/pipelinetradecursor">


	<xsl:strip-space elements="*" />

	<xsl:output method="xml" indent="yes" />


	<xsl:template match="tns:CreateTradeCursorRequest">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
			
		</xsl:copy>
	</xsl:template>

	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>		
	</xsl:template>

	
	<xsl:template match="tns:CreateTradeCursorRequest/tns:Fields" />
	
	

</xsl:stylesheet>