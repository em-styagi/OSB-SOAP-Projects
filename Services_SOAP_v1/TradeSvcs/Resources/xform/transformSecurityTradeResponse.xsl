<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:plat="http://www.elliemae.com/encompass/platform">

	<xsl:output method="xml" encoding="utf-8" indent="no" />

	<xsl:template match="plat:*">
		<xsl:element name="loan:{local-name()}"
			namespace="http://www.elliemae.com/services/trade/security">
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>


</xsl:stylesheet>