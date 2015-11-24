<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:loan="http://www.elliemae.com/services/LoanRuleSvc" xmlns:plat="http://www.elliemae.com/encompass/platform"
	xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

	<xsl:output omit-xml-declaration="yes" indent="yes" />


	<!-- replace root element in body -->
	<xsl:template match="plat:RoleAssignableUserSettingGetResponse">
			<xsl:element name="loan:GetRoleAssignableUserSettingResponse"	namespace="http://www.elliemae.com/services/LoanRuleSvc">
				<xsl:apply-templates />
			</xsl:element>		
	</xsl:template>

	<xsl:template match="plat:RoleAssignableGroupSetting">
		<xsl:element name="loan:RoleAssignableUserGroups">
			<xsl:apply-templates/>	
		</xsl:element>
	</xsl:template>

	<xsl:template match="a:string">
		<xsl:element name="loan:Group">
			<xsl:apply-templates/>	
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="plat:RoleAssignableUserSetting">
		<xsl:element name="loan:RoleAssignableUserProfiles">
			<xsl:apply-templates/>	
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
			namespace="http://www.elliemae.com/services/LoanRuleSvc">
			<xsl:copy-of select="namespace::*" />
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>