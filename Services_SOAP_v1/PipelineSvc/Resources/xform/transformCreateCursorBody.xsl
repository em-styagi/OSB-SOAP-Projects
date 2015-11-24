<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://www.elliemae.com/services/pipelinecursor">


	<xsl:strip-space elements="*" />

	<xsl:output method="xml" indent="yes" />


	<xsl:template match="tns:CreatePipelineCursorRequest">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
			
		</xsl:copy>
	</xsl:template>

	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>		
	</xsl:template>

	
	
	<xsl:template match="tns:CreatePipelineCursorRequest/tns:Filter">
		<Filter>
		<xsl:if test="tns:FilterCriterion">
		
			<xsl:for-each select="tns:FilterCriterion">
			
			<xsl:variable name="e" select="current()" />
			
			
			<FilterCriterion>
				<xsl:if test="$e/tns:FieldType">
					<DataType><xsl:value-of select="$e/tns:FieldType" /></DataType> 
		     	</xsl:if>  
		     	       
	            <xsl:if test="$e/tns:OpType">
	            	<EvaluationOperator><xsl:value-of select="$e/tns:OpType" /></EvaluationOperator>
	            </xsl:if>
	            	
	            <xsl:if test="$e/tns:CriterionName">
	            <Field><xsl:value-of select="$e/tns:CriterionName" /></Field>
	            </xsl:if>
	            
	            <xsl:if test="$e/tns:LeftParenthesis">
	        	    <LeftParenthesis><xsl:value-of select="$e/tns:LeftParenthesis" /></LeftParenthesis>
	            </xsl:if>
	            
	            <xsl:if test="$e/tns:JointToken">
	            	<LogicalOperator><xsl:value-of select="$e/tns:JointToken" /></LogicalOperator>
	            </xsl:if>
	            	
	            <xsl:if test="$e/tns:ValueTo">
	            	<MaxRange><xsl:value-of select="$e/tns:ValueTo" /></MaxRange>
	            </xsl:if>
	            	
	            <xsl:if test="$e/tns:ValueFrom">
	            	<MinRange><xsl:value-of select="$e/tns:ValueFrom" /></MinRange>
	            </xsl:if>
	            
	            <xsl:if test="$e/tns:FieldDescription">
	            	<Name><xsl:value-of select="$e/tns:FieldDescription" /></Name>
	            </xsl:if>
	            
	            <xsl:if test="$e/tns:RightParenthesis">
	            	<RightParenthesis><xsl:value-of select="$e/tns:RightParenthesis" /></RightParenthesis>
	            </xsl:if>
			
			</FilterCriterion>
			</xsl:for-each>
			  </xsl:if>
		</Filter>
	</xsl:template>
	
	<xsl:template match="tns:CreatePipelineCursorRequest/tns:Fields" />
	
	

</xsl:stylesheet>