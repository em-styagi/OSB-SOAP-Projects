<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />

	<xsl:template match="/">
		<Contacts>
			<xsl:for-each select="Loan/Applications/Application">
				<xsl:if test="Borrower">
					<Contact>
						<BorrowerPairId>
							<xsl:value-of select="position()" />
						</BorrowerPairId>
						<xsl:if test="Borrower/MobilePhone">
							<Cell>
								<xsl:value-of select="Borrower/MobilePhone" />
							</Cell>
						</xsl:if>
						<ContactId>
							<xsl:value-of select="concat('Borrower.',Borrower/AltId)" />
						</ContactId>
						<ContactType>Borrower</ContactType>
						<ContactTypeName>Borrower</ContactTypeName>
						<xsl:if test="Borrower/EmailAddressText">
							<Email>
								<xsl:value-of select="Borrower/EmailAddressText" />
							</Email>
						</xsl:if>
						<xsl:if test="Borrower/PersonFaxNumber">
							<Fax>
								<xsl:value-of select="Borrower/PersonFaxNumber" />
							</Fax>
						</xsl:if>
						<xsl:if test="Borrower/FirstName">
							<FirstName>
								<xsl:value-of select="Borrower/FirstName" />
							</FirstName>
						</xsl:if>
						<xsl:if test="Borrower/HomePhoneNumber">
							<HomePhone>
								<xsl:value-of select="Borrower/HomePhoneNumber" />
							</HomePhone>
						</xsl:if>
						<xsl:if test="Borrower/LastName">
							<LastName>
								<xsl:value-of select="Borrower/LastName" />
							</LastName>
						</xsl:if>
						<xsl:if test="Borrower/MiddleName">
							<MiddleName>
								<xsl:value-of select="Borrower/MiddleName" />
							</MiddleName>
						</xsl:if>
						<xsl:if test="Borrower/No3rdPartyEmailIndicator">
							<No3rdPartyEmailIndicator>
								<xsl:value-of select="Borrower/No3rdPartyEmailIndicator" />
							</No3rdPartyEmailIndicator>
						</xsl:if>
						<xsl:if test="Borrower/SuffixToName">
							<SuffixToName>
								<xsl:value-of select="Borrower/SuffixToName" />
							</SuffixToName>
						</xsl:if>
						<xsl:for-each select="Residences/Residence">
							<xsl:if test="ApplicantType ='Borrower' and ResidencyType ='Current' ">
								<xsl:if test="AddressStreetLine1">
									<Address>
										<xsl:value-of select="AddressStreetLine1" />
									</Address>
								</xsl:if>
								<xsl:if test="AddressCity">
									<City>
										<xsl:value-of select="AddressCity" />
									</City>
								</xsl:if>
								<xsl:if test="AddressPostalCode">
									<PostalCode>
										<xsl:value-of select="AddressPostalCode" />
									</PostalCode>
								</xsl:if>
								<xsl:if test="AddressState">
									<State>
										<xsl:value-of select="AddressState" />
									</State>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="Employment/Employment">
							<xsl:if test="Owner ='Borrower'">
								<xsl:if test="PhoneNumber">
									<BusinessPhone>
										<xsl:value-of select="PhoneNumber" />
									</BusinessPhone>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					</Contact>
				</xsl:if>
				<xsl:if test="Coborrower">
					<Contact>
						<BorrowerPairId>
							<xsl:value-of select="position()" />
						</BorrowerPairId>
						<xsl:if test="Coborrower/MobilePhone">
							<Cell>
								<xsl:value-of select="Coborrower/MobilePhone" />
							</Cell>
						</xsl:if>
						<ContactId>
							<xsl:value-of select="concat('Borrower.',Coborrower/AltId)" />
						</ContactId>
						<ContactType>Borrower</ContactType>
						<ContactTypeName>Coborrower</ContactTypeName>
						<xsl:if test="Coborrower/EmailAddressText">
							<Email>
								<xsl:value-of select="Coborrower/EmailAddressText" />
							</Email>
						</xsl:if>
						<xsl:if test="Coborrower/PersonFaxNumber">
							<Fax>
								<xsl:value-of select="Coborrower/PersonFaxNumber" />
							</Fax>
						</xsl:if>
						<xsl:if test="Coborrower/FirstName">
							<FirstName>
								<xsl:value-of select="Coborrower/FirstName" />
							</FirstName>
						</xsl:if>
						<xsl:if test="Coborrower/HomePhoneNumber">
							<HomePhone>
								<xsl:value-of select="Coborrower/HomePhoneNumber" />
							</HomePhone>
						</xsl:if>
						<xsl:if test="Coborrower/LastName">
							<LastName>
								<xsl:value-of select="Coborrower/LastName" />
							</LastName>
						</xsl:if>
						<xsl:if test="Coborrower/MiddleName">
							<MiddleName>
								<xsl:value-of select="Coborrower/MiddleName" />
							</MiddleName>
						</xsl:if>
						<xsl:if test="Coborrower/No3rdPartyEmailIndicator">
							<No3rdPartyEmailIndicator>
								<xsl:value-of select="Coborrower/No3rdPartyEmailIndicator" />
							</No3rdPartyEmailIndicator>
						</xsl:if>
						<xsl:if test="Coborrower/SuffixToName">
							<SuffixToName>
								<xsl:value-of select="Coborrower/SuffixToName" />
							</SuffixToName>
						</xsl:if>
						<xsl:for-each select="Residences/Residence">
							<xsl:if test="ApplicantType ='CoBorrower' and ResidencyType ='Current' ">
								<xsl:if test="AddressStreetLine1">
									<Address>
										<xsl:value-of select="AddressStreetLine1" />
									</Address>
								</xsl:if>
								<xsl:if test="AddressCity">
									<City>
										<xsl:value-of select="AddressCity" />
									</City>
								</xsl:if>
								<xsl:if test="AddressPostalCode">
									<PostalCode>
										<xsl:value-of select="AddressPostalCode" />
									</PostalCode>
								</xsl:if>
								<xsl:if test="AddressState">
									<State>
										<xsl:value-of select="AddressState" />
									</State>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="Employment/Employment">
							<xsl:if test="Owner ='CoBorrower'">
								<xsl:if test="PhoneNumber">
									<BusinessPhone>
										<xsl:value-of select="PhoneNumber" />
									</BusinessPhone>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					</Contact>
				</xsl:if>
			</xsl:for-each>
		</Contacts>
	</xsl:template>
</xsl:stylesheet>