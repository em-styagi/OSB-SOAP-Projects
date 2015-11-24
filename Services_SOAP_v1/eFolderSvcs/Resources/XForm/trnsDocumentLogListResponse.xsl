<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:efol="http://www.elliemae.com/services/efolder" xmlns:plat="http://www.elliemae.com/encompass/platform"
	xmlns:i="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

	<xsl:output omit-xml-declaration="yes" indent="yes" />


	<!-- replace root element in body -->
	<xsl:template match="plat:DocumentLogList">
			<xsl:element name="efol:DocumentLogList"	namespace="http://www.elliemae.com/services/efolder">
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
		<xsl:element name="efol:{name()}"
			namespace="http://www.elliemae.com/services/efolder">
			<xsl:copy-of select="namespace::*" />
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>