<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />

	<xsl:template match="/">
	
	  <!-- Variables List -->
	    <xsl:variable name="LenderCaseIdentifier"><xsl:value-of select="Loan/LenderCaseIdentifier"/></xsl:variable>
	    <xsl:variable name="TitleCompanyName"><xsl:value-of select="Loan/ClosingCost/TitleCompanyName"/></xsl:variable>
	    <xsl:variable name="EscrowCompanyName"><xsl:value-of select="Loan/ClosingCost/EscrowCompanyName"/></xsl:variable>
	    <xsl:variable name="BuyersAttorneyCompanyName"><xsl:value-of select="Loan/Fees/Fee[FeeType = 'AttorneyFee']/PaidToName"/></xsl:variable>
        <xsl:variable name="HazardInsuranceCompanyName"><xsl:value-of select="Loan/Fees/Fee[FeeType = 'HazardInsurancePremium']/PaidToName"/></xsl:variable>
	    <xsl:variable name="MortgageInsuranceCompanyName"><xsl:value-of select="Loan/Fees/Fee[FeeType = 'MortgageInsurancePremium']/PaidToName"/></xsl:variable>
	    <xsl:variable name="CreditCompanyName"><xsl:value-of select="Loan/Fees/Fee[FeeType = 'CreditReportFee']/PaidToName"/></xsl:variable>
	    <xsl:variable name="UnderWriterCompanyName"><xsl:value-of select="Loan/Fees/Fee[FeeType = 'UnderwritingFee']/PaidToName"/></xsl:variable>
	    <xsl:variable name="DocSigningCompanyName"><xsl:value-of select="Loan/Fees/Fee[FeeType = 'DocPrepFee']/PaidToName"/></xsl:variable>
	    <xsl:variable name="FloodInsuranceCompanyName"><xsl:value-of select="Loan/Fees/Fee[FeeType = 'FloodInsuranceReserv']/PaidToName"/></xsl:variable>
	    


		<Contacts>
			<!-- Borrower Contact List -->
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
						<xsl:if test="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressStreetLine1">
							<Address>
									<xsl:value-of select="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressStreetLine1" />
							</Address>
						</xsl:if>
						<xsl:if test="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressCity">
							<City>
								   <xsl:value-of select="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressCity" />
							</City>
						</xsl:if>
						<xsl:if test="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressPostalCode">
							<PostalCode>
									<xsl:value-of select="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressPostalCode" />
							</PostalCode>
						</xsl:if>
					    <xsl:if test="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressState">
							<State>
								   <xsl:value-of select="Residences/Residence[ApplicantType = 'Borrower'and ResidencyType ='Current']/AddressState" />
							</State>
						</xsl:if>
						<xsl:if test="Employment/Employment[Owner ='Borrower']/PhoneNumber">
							<BusinessPhone>
								  <xsl:value-of select="Employment/Employment[Owner ='Borrower']/PhoneNumber" />
						    </BusinessPhone>
						</xsl:if>
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
						<xsl:if test="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressStreetLine1">
							<Address>
									<xsl:value-of select="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressStreetLine1" />
							</Address>
						</xsl:if>
						<xsl:if test="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressCity">
							<City>
								   <xsl:value-of select="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressCity" />
							</City>
						</xsl:if>
						<xsl:if test="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressPostalCode">
							<PostalCode>
									<xsl:value-of select="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressPostalCode" />
							</PostalCode>
						</xsl:if>
					    <xsl:if test="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressState">
							<State>
								   <xsl:value-of select="Residences/Residence[ApplicantType = 'CoBorrower'and ResidencyType ='Current']/AddressState" />
							</State>
						</xsl:if>
						<xsl:if test="Employment/Employment[Owner ='CoBorrower']/PhoneNumber">
							<BusinessPhone>
								  <xsl:value-of select="Employment/Employment[Owner ='CoBorrower']/PhoneNumber" />
						    </BusinessPhone>
						</xsl:if>
					</Contact>
				</xsl:if>
			</xsl:for-each>
			<!-- Role Contact List -->
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
			<!-- Role Legacy Contact List -->
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
			<!-- Provider Contact List -->
			<xsl:for-each select="Loan/Contacts/Contact">
				<Contact>
					<xsl:if test="ABA">
						<ABA>
							<xsl:value-of select="ABA" />
						</ABA>
					</xsl:if>
					<xsl:if test="AccountName">
						<AccountName>
							<xsl:value-of select="AccountName" />
						</AccountName>
					</xsl:if>
					<xsl:if test="AddToCdContactInfo">
						<AddToCdContactInfo>
							<xsl:value-of select="AddToCdContactInfo" />
						</AddToCdContactInfo>
					</xsl:if>
					<xsl:if test="Address">
						<Address>
							<xsl:value-of select="Address" />
						</Address>
					</xsl:if>
					<xsl:if test="BizLicenseAuthDate">
						<BizLicenseAuthDate>
							<xsl:value-of select="BizLicenseAuthDate" />
						</BizLicenseAuthDate>
					</xsl:if>
					<xsl:if test="BizLicenseAuthName">
						<BizLicenseAuthName>
							<xsl:value-of select="BizLicenseAuthName" />
						</BizLicenseAuthName>
					</xsl:if>
					<xsl:if test="BizLicenseAuthStateCode">
						<BizLicenseAuthStateCode>
							<xsl:value-of select="BizLicenseAuthStateCode" />
						</BizLicenseAuthStateCode>
					</xsl:if>
					<xsl:if test="BizLicenseAuthType">
						<BizLicenseAuthType>
							<xsl:value-of select="BizLicenseAuthType" />
						</BizLicenseAuthType>
					</xsl:if>
					<xsl:if test="BizLicenseNumber and ContactType != 'INVESTOR' and ContactType != 'LENDER_INVESTOR' and ContactType != 'APPRAISAL_COMPANY' and ContactType != 'BROKER' and ContactType != 'SETTLEMENT_AGENT'">
						<BizLicenseNumber>
							<xsl:value-of select="BizLicenseNumber" />
						</BizLicenseNumber>
					</xsl:if>
					<xsl:if test="BusinessPhone">
						<BusinessPhone>
							<xsl:value-of select="BusinessPhone" />
						</BusinessPhone>
					</xsl:if>
					<xsl:if test="CategoryName">
						<CategoryName>
							<xsl:value-of select="CategoryName" />
						</CategoryName>
					</xsl:if>
					<xsl:if test="Cell">
						<Cell>
							<xsl:value-of select="Cell" />
						</Cell>
					</xsl:if>
					<xsl:if test="City">
						<City>
							<xsl:value-of select="City" />
						</City>
					</xsl:if>
					<xsl:if test="Comments">
						<Comments>
							<xsl:value-of select="Comments" />
						</Comments>
					</xsl:if>
					<xsl:if test="CompanyId">
						<CompanyId>
							<xsl:value-of select="CompanyId" />
						</CompanyId>
					</xsl:if>
					<xsl:if test="Name and ContactType != 'SELLER' and ContactType != 'SELLER2' and ContactType != 'SELLER3' and ContactType != 'SELLER4' and ContactType != 'BROKER_LENDER'
					               and ContactType != 'LOAN_PROCESSOR' and ContactType != 'LOAN_OFFICER' and ContactType != 'BROKER_LENDERSsnCompanyAgent' and ContactType != 'MORTGAGEE' and ContactType != 'LOAN_CLOSER' 
					               and ContactType != 'LOAN_UNDERWRITER' and ContactType != 'BROKER_LENDERSsnCompany'">
						<CompanyId>
							<xsl:value-of select="Name" />
						</CompanyId>
					</xsl:if>
					<ContactId>
						<xsl:value-of select="concat('Provider.',Id)" />
					</ContactId>
					<ContactType>Provider</ContactType>
					<xsl:if test="ContactName">
						<ContactName>
							<xsl:value-of select="ContactName" />
						</ContactName>
					</xsl:if>
					<xsl:if test="ContactNMLSNo">
						<ContactNMLSNo>
							<xsl:value-of select="ContactNMLSNo" />
						</ContactNMLSNo>
					</xsl:if>
					<xsl:if test="ContactTitle">
						<ContactTitle>
							<xsl:value-of select="ContactTitle" />
						</ContactTitle>
					</xsl:if>
					<xsl:if test="Email">
						<Email>
							<xsl:value-of select="Email" />
						</Email>
					</xsl:if>
					<xsl:if test="Fax">
						<Fax>
							<xsl:value-of select="Fax" />
						</Fax>
					</xsl:if>
					<xsl:if test="LineItemNumber">
						<LineItemNumber>
							<xsl:value-of select="LineItemNumber" />
						</LineItemNumber>
					</xsl:if>
					<xsl:if test="Name and ContactType = 'SELLER' and ContactType = 'SELLER2' and ContactType = 'SELLER3' and ContactType = 'SELLER4'">
						<FullName>
							<xsl:value-of select="Name" />
						</FullName>
					</xsl:if>
					<xsl:if test="HomePhone">
						<HomePhone>
							<xsl:value-of select="HomePhone" />
						</HomePhone>
					</xsl:if>
					<xsl:if test="NmlsLicense">
						<NmlsLicense>
							<xsl:value-of select="NmlsLicense" />
						</NmlsLicense>
					</xsl:if>
					<xsl:if test="OrganizationState">
						<OrganizationState>
							<xsl:value-of select="OrganizationState" />
						</OrganizationState>
					</xsl:if>
					<xsl:if test="OrganizationType and ContactType != 'ASSIGNTO'">
						<OrganizationType>
							<xsl:value-of select="OrganizationType" />
						</OrganizationType>
					</xsl:if>
					<xsl:if test="PersonalLicenseAuthDate">
						<PersonalLicenseAuthDate>
							<xsl:value-of select="PersonalLicenseAuthDate" />
						</PersonalLicenseAuthDate>
					</xsl:if>
					<xsl:if test="PersonalLicenseAuthName">
						<PersonalLicenseAuthName>
							<xsl:value-of select="PersonalLicenseAuthName" />
						</PersonalLicenseAuthName>
					</xsl:if>
					<xsl:if test="PersonalLicenseAuthStateCode">
						<PersonalLicenseAuthStateCode>
							<xsl:value-of select="PersonalLicenseAuthStateCode" />
						</PersonalLicenseAuthStateCode>
					</xsl:if>
					<xsl:if test="PersonalLicenseAuthType">
						<PersonalLicenseAuthType>
							<xsl:value-of select="PersonalLicenseAuthType" />
						</PersonalLicenseAuthType>
					</xsl:if>
					<xsl:if test="PersonalLicenseNumber">
						<PersonalLicenseNumber>
							<xsl:value-of select="PersonalLicenseNumber" />
						</PersonalLicenseNumber>
					</xsl:if>
					<xsl:if
						test="Phone and ContactType != 'SELLER' and ContactType != 'SELLER2' and ContactType != 'SELLER3' and ContactType != 'SELLER4'">
						<Phone>
							<xsl:value-of select="Phone" />
						</Phone>
					</xsl:if>
					<xsl:if test="Phone2">
						<Phone2>
							<xsl:value-of select="Phone2" />
						</Phone2>
					</xsl:if>
					<xsl:if test="PostalCode">
						<PostalCode>
							<xsl:value-of select="PostalCode" />
						</PostalCode>
					</xsl:if>
					<xsl:if test="RecCity">
						<RecCity>
							<xsl:value-of select="RecCity" />
						</RecCity>
					</xsl:if>
					<xsl:if test="ReferenceNumber and ContactType != 'BROKER' and ContactType != 'ASSIGNTO'">
						<ReferenceNumber>
							<xsl:value-of select="ReferenceNumber" />
						</ReferenceNumber>
					</xsl:if>
					<xsl:if test="Relationship">
						<Relationship>
							<xsl:value-of select="Relationship" />
						</Relationship>
					</xsl:if>
					<xsl:if test="SettlementAgent">
						<SettlementAgent>
							<xsl:value-of select="SettlementAgent" />
						</SettlementAgent>
					</xsl:if>
					<xsl:if test="State">
						<State>
							<xsl:value-of select="State" />
						</State>
					</xsl:if>
					<xsl:if test="TaxID">
						<TaxID>
							<xsl:value-of select="TaxID" />
						</TaxID>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="ContactType = 'LENDER_INVESTOR'">
							<ContactTypeName>LenderInvestor</ContactTypeName>
                            <xsl:if test="$LenderCaseIdentifier !=''">
								<ReferenceNumber>
									<xsl:value-of select="$LenderCaseIdentifier" />
								</ReferenceNumber>
							</xsl:if>
							<xsl:if test="License">
							   <BizLicenseNumber>
								   <xsl:value-of select="License" />
							   </BizLicenseNumber>
					       </xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'ESCROW_COMPANY'">
							<ContactTypeName>EscrowCompany</ContactTypeName>
						     <xsl:if test="$EscrowCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$EscrowCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'APPRAISAL_COMPANY'">
							<ContactTypeName>AppraisalCompany</ContactTypeName>
							<xsl:if test="License">
							   <BizLicenseNumber>
								   <xsl:value-of select="License" />
							   </BizLicenseNumber>
					       </xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'TITLE_COMPANY'">
							<ContactTypeName>TitleCompany</ContactTypeName>
							<xsl:if test="$TitleCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$TitleCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'BUYERS_ATTORNEY'">
							<ContactTypeName>BuyersAttorney</ContactTypeName>
							<xsl:if test="$BuyersAttorneyCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$BuyersAttorneyCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLERS_ATTORNEY'">
							<ContactTypeName>SellersAttorney</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'BUYERS_AGENT'">
							<ContactTypeName>BuyersAgent</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLERS_AGENT'">
							<ContactTypeName>SellersAgent</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLER'">
							<ContactTypeName>Seller</ContactTypeName>
							<xsl:if test="Phone">
								<HomePhone>
									<xsl:value-of select="Phone" />
								</HomePhone>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLER2'">
							<ContactTypeName>Seller2</ContactTypeName>
							<xsl:if test="Phone">
								<HomePhone>
									<xsl:value-of select="Phone" />
								</HomePhone>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLER3'">
							<ContactTypeName>Seller3</ContactTypeName>
							<xsl:if test="Phone">
								<HomePhone>
									<xsl:value-of select="Phone" />
								</HomePhone>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLER4'">
							<ContactTypeName>Seller4</ContactTypeName>
							<xsl:if test="Phone">
								<HomePhone>
									<xsl:value-of select="Phone" />
								</HomePhone>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'NOTARY'">
							<ContactTypeName>Notary</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'BUILDER'">
							<ContactTypeName>Builder</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'HAZARD_INSURANCE'">
							<ContactTypeName>HazardInsurance</ContactTypeName>
							<xsl:if test="$HazardInsuranceCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$HazardInsuranceCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'MORTGAGE_INSURANCE'">
							<ContactTypeName>MortgageInsurance</ContactTypeName>
							<xsl:if test="$MortgageInsuranceCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$MortgageInsuranceCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SURVEYOR'">
							<ContactTypeName>Surveyor</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'FLOOD_INSURANCE'">
							<ContactTypeName>FloodInsurance</ContactTypeName>
							<xsl:if test="$FloodInsuranceCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$FloodInsuranceCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'CREDIT_COMPANY'">
							<ContactTypeName>CreditCompany</ContactTypeName>
						    <xsl:if test="$CreditCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$CreditCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'UNDERWRITER'">
							<ContactTypeName>Underwriter</ContactTypeName>
                            <xsl:if test="$UnderWriterCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$UnderWriterCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SERVICING'">
							<ContactTypeName>Servicing</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'DOC_SIGNING'">
							<ContactTypeName>DocSigning</ContactTypeName>
                            <xsl:if test="$DocSigningCompanyName !=''">
								<CompanyId>
									<xsl:value-of select="$DocSigningCompanyName" />
								</CompanyId>
							</xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'WAREHOUSE'">
							<ContactTypeName>Warehouse</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'FINANCIAL_PLANNER'">
							<ContactTypeName>FinancialPlanner</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'INVESTOR'">
							<ContactTypeName>Investor</ContactTypeName>
						 <xsl:if test="InvestorLicense">
                            <BizLicenseNumber>
							    <xsl:value-of select="InvestorLicense" />
						    </BizLicenseNumber>
					      </xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'ASSIGNTO'">
							<ContactTypeName>AssignTo</ContactTypeName>
						   <xsl:if test="OrganizationType">
                            <ReferenceNumber>
							    <xsl:value-of select="OrganizationType" />
						    </ReferenceNumber>
					      </xsl:if>
					      <xsl:if test="ReferenceNumber">
                            <OrganizationType>
							    <xsl:value-of select="ReferenceNumber" />
						    </OrganizationType>
					      </xsl:if>
							
						</xsl:when>
						<xsl:when test="ContactType = 'BROKER'">
						<ContactTypeName>Broker</ContactTypeName>
						  <xsl:if test="ReferenceNumber">
                            <BizLicenseNumber>
							    <xsl:value-of select="ReferenceNumber" />
						    </BizLicenseNumber>
					      </xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'DOCSPREPAREDBY'">
							<ContactTypeName>DocsPreparedBy</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'SETTLEMENT_AGENT'">
							<ContactTypeName>SettlementAgent</ContactTypeName>
							<xsl:if test="License">
                            <BizLicenseNumber>
							    <xsl:value-of select="License" />
						    </BizLicenseNumber>
					      </xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'CUSTOM'">
							<ContactTypeName>Custom</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'LOAN_OFFICER'">
							<ContactTypeName>LoanOfficer</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'BROKER_LENDER'">
							<ContactTypeName>BrokerLender</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'BROKER_LENDERSsnCompanyAgent'">
							<ContactTypeName>BrokerLendersCompanyAgent</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'MORTGAGEE'">
							<ContactTypeName>Mortgagee</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'LOAN_CLOSER'">
							<ContactTypeName>LoanCloser</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'LOAN_UNDERWRITER'">
							<ContactTypeName>LoanUnderwriter</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'BROKER_LENDERSsnCompany'">
							<ContactTypeName>BrokerLendersCompany</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'LOAN_PROCESSOR'">
							<ContactTypeName>LoanProcessor</ContactTypeName>
						</xsl:when>
					</xsl:choose>
				</Contact>
			</xsl:for-each>
		</Contacts>
	</xsl:template>

</xsl:stylesheet>