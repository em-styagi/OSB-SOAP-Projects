<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a="http://schemas.microsoft.com/2003/10/Serialization/Arrays"
	xmlns:tns="http://schemas.datacontract.org/2004/07/EllieMae.EMLite.Common"
	xmlns:plat="http://www.elliemae.com/encompass/platform" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:loan="http://www.elliemae.com/services/trade/loan"
	exclude-result-prefixes="i">

	<xsl:output method="xml" encoding="utf-8" indent="no" />

	<xsl:template match="plat:ColumnTags/plat:Item">
		<xsl:element name="loan:ColumnTag"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="plat:FieldList/plat:Item">
		<xsl:element name="loan:Field"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="plat:InvestorStatuses/plat:Item">
		<xsl:element name="loan:InvestorStatus"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="plat:LoanPrograms/plat:Item">
		<xsl:element name="loan:LoanProgram"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="plat:Milestones/plat:Item">
		<xsl:element name="loan:Milestone"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="plat:OccupancyStatuses/plat:Item">
		<xsl:element name="loan:OccupancyStatus"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="tns:*">
		<xsl:element name="loan:{local-name()}"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>

	<xsl:template match="@i:nil">
		<xsl:copy>
			<xsl:apply-templates select="*| node()" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="plat:*">
		<xsl:element name="loan:{local-name()}"
			namespace="http://www.elliemae.com/services/trade/loan">
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>


</xsl:stylesheet>