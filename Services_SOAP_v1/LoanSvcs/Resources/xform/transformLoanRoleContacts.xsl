<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />

	<xsl:template match="/">
		<Contacts>
			<xsl:for-each select="Loan/MilestoneLogs/MilestoneLog">
				<xsl:if test="LoanAssociate/RoleName">
					<Contact>
						<ContactId>
							<xsl:value-of select="concat('Role.',Guid)" />
						</ContactId>
						<ContactType>Role</ContactType>
						<ContactTypeName>
							<xsl:value-of
								select="translate(normalize-space(LoanAssociate/RoleName),' ','')" />
						</ContactTypeName>
						<xsl:if test="LoanAssociate/Name">
							<FullName>
								<xsl:value-of select="LoanAssociate/Name" />
							</FullName>
						</xsl:if>
						<xsl:if test="LoanAssociate/Phone">
							<Phone>
								<xsl:value-of select="LoanAssociate/Phone" />
							</Phone>
						</xsl:if>
						<xsl:if test="LoanAssociate/CellPhone">
							<Cell>
								<xsl:value-of select="LoanAssociate/CellPhone" />
							</Cell>
						</xsl:if>
						<xsl:if test="LoanAssociate/Email">
							<Email>
								<xsl:value-of select="LoanAssociate/Email" />
							</Email>
						</xsl:if>
						<xsl:if test="LoanAssociate/Fax">
							<Fax>
								<xsl:value-of select="LoanAssociate/Fax" />
							</Fax>
						</xsl:if>
						<RoleName>
							<xsl:value-of select="LoanAssociate/RoleName" />
						</RoleName>
						<xsl:if test="Stage">
							<Stage>
								<xsl:value-of select="Stage" />
							</Stage>
						</xsl:if>
						<xsl:if test="LoanAssociate/WriteAccess">
							<xsl:choose>
								<xsl:when test="LoanAssociate/WriteAccess = 'Y'">
									<WriteAccess>true</WriteAccess>
								</xsl:when>
								<xsl:otherwise>
									<WriteAccess>false</WriteAccess>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</Contact>
				</xsl:if>
			</xsl:for-each>
			
		    <xsl:for-each select="Loan/MilestoneFreeRoleLogs/MilestoneFreeRoleLog">
				<xsl:if test="LoanAssociate/RoleName">
					<Contact>
						<ContactId>
							<xsl:value-of select="concat('Role.',Guid)" />
						</ContactId>
						<ContactType>Role</ContactType>
						<ContactTypeName>
							<xsl:value-of
								select="translate(normalize-space(LoanAssociate/RoleName),' ','')" />
						</ContactTypeName>
						<xsl:if test="LoanAssociate/Name">
							<FullName>
								<xsl:value-of select="LoanAssociate/Name" />
							</FullName>
						</xsl:if>
						<xsl:if test="LoanAssociate/Phone">
							<Phone>
								<xsl:value-of select="LoanAssociate/Phone" />
							</Phone>
						</xsl:if>
						<xsl:if test="LoanAssociate/CellPhone">
							<Cell>
								<xsl:value-of select="LoanAssociate/CellPhone" />
							</Cell>
						</xsl:if>
						<xsl:if test="LoanAssociate/Email">
							<Email>
								<xsl:value-of select="LoanAssociate/Email" />
							</Email>
						</xsl:if>
						<xsl:if test="LoanAssociate/Fax">
							<Fax>
								<xsl:value-of select="LoanAssociate/Fax" />
							</Fax>
						</xsl:if>
						<RoleName>
							<xsl:value-of select="LoanAssociate/RoleName" />
						</RoleName>
						<xsl:if test="Stage">
							<Stage>
								<xsl:value-of select="Stage" />
							</Stage>
						</xsl:if>
						<xsl:if test="LoanAssociate/WriteAccess">
							<xsl:choose>
								<xsl:when test="LoanAssociate/WriteAccess = 'Y'">
									<WriteAccess>true</WriteAccess>
								</xsl:when>
								<xsl:otherwise>
									<WriteAccess>false</WriteAccess>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</Contact>
				</xsl:if>
			</xsl:for-each>
		</Contacts>
	</xsl:template>
</xsl:stylesheet>