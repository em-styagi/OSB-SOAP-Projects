<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:set="http://www.elliemae.com/services/settingservice" xmlns:plat="http://www.elliemae.com/encompass/platform"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

	<xsl:output omit-xml-declaration="yes" indent="yes" />


	<!-- replace root element in body -->
	<xsl:template match="plat:SettingGetResponse">
			<xsl:element name="set:GetSettingResponse"	namespace="http://www.elliemae.com/services/settingservice">
				<xsl:apply-templates />
			</xsl:element>		
	</xsl:template>

        <xsl:template match="plat:ProductPricingSettingGetResponse">
			<xsl:element name="set:GetProductPricingResponse"	namespace="http://www.elliemae.com/services/settingservice">
				<xsl:apply-templates />
			</xsl:element>		
	</xsl:template>

	<!-- copy all nodes -->
	<xsl:template match="/ | @* | node()">
		<xsl:copy>
			<xsl:apply-templates select="*| node()" />
		</xsl:copy>
	</xsl:template>
	
	
	<!-- Add namespace "set:" to all nodes -->
	<xsl:template match="*">
		<xsl:element name="set:{name()}"
			namespace="http://www.elliemae.com/services/settingservice">
			<xsl:copy-of select="namespace::*" />
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>

	
</xsl:stylesheet>