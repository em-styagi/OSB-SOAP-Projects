<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://www.elliemae.com/services/trade/loan"
	xmlns:loan="http://www.elliemae.com/services/trade/loan"
	xmlns:ell="http://schemas.datacontract.org/2004/07/EllieMae.EMLite.Common">

	<xsl:template
		match="loan:ColumnTag|loan:Field|loan:InvestorStatus|loan:LoanProgram|loan:Milestone|loan:OccupancyStatus">
		<xsl:element name="plat:Item" namespace="http://www.elliemae.com/encompass/platform">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:LTVRange/loan:maxValue">
		<xsl:element name="ell:maxValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:LTVRange/loan:minValue">
		<xsl:element name="ell:minValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:NoteRateRange/loan:maxValue">
		<xsl:element name="ell:maxValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:NoteRateRange/loan:minValue">
		<xsl:element name="ell:minValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:TermRange/loan:maxValue">
		<xsl:element name="ell:maxValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:TermRange/loan:minValue">
		<xsl:element name="ell:minValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:LoanAmount/loan:maxValue">
		<xsl:element name="ell:maxValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="loan:LoanAmount/loan:minValue">
		<xsl:element name="ell:minValue">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<!-- Add prefix "plat:" to all nodes -->
	<xsl:template match="tns:*">
		<xsl:element name="plat:{local-name()}"
			namespace="http://www.elliemae.com/encompass/platform">
			<xsl:apply-templates select="node()|@*" />
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>