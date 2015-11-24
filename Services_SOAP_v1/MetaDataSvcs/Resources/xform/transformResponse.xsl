<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pip="http://www.elliemae.com/services/metadata/pipeline" xmlns:tns="http://www.elliemae.com/encompass/platform" >

      <!-- Add prefix "pip:" to all nodes -->
      <xsl:template match="*">
            <xsl:element name="pip:{local-name()}" namespace="http://www.elliemae.com/services/metadata/pipeline">
                  <!-- process attributes -->
                  <xsl:for-each select="@*">
                        <!-- remove attribute prefix -->
                        <xsl:attribute name="{local-name()}">
                        <xsl:value-of select="." />
                  </xsl:attribute>
                  </xsl:for-each>
                  <xsl:apply-templates select="node()|*" />
            </xsl:element>
      </xsl:template>      
      <xsl:template match="tns:PipelineLoanReportFieldDefsGetResponse">
		<xsl:element name="pip:GetPipelineLoanReportFieldDefsResponse">
			<xsl:apply-templates/>	
		</xsl:element>
	</xsl:template>      
</xsl:stylesheet>