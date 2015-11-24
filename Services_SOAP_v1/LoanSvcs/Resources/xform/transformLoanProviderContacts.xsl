<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />

	<xsl:template match="/">
		<Contacts>
			<xsl:for-each select="Loan/Contacts/Contact">
			 <Contact>
			 	<xsl:if test="ABA">
						<ABA><xsl:value-of select="ABA" /></ABA>
		       </xsl:if>
		       	<xsl:if test="AccountName">
						<AccountName><xsl:value-of select="AccountName" /></AccountName>
		       </xsl:if>
		       <xsl:if test="AddToCdContactInfo">
						<AddToCdContactInfo><xsl:value-of select="AddToCdContactInfo" /></AddToCdContactInfo>
		       </xsl:if>
			   <xsl:if test="Address">
						<Address><xsl:value-of select="Address" /></Address>
		       </xsl:if>
		       <xsl:if test="BizLicenseAuthDate">
			           <BizLicenseAuthDate><xsl:value-of select="BizLicenseAuthDate" /></BizLicenseAuthDate>
			   </xsl:if>
			   <xsl:if test="BizLicenseAuthName">
			          <BizLicenseAuthName><xsl:value-of select="BizLicenseAuthName" /></BizLicenseAuthName>
			   </xsl:if>
			   <xsl:if test="BizLicenseAuthStateCode">
			          <BizLicenseAuthStateCode><xsl:value-of select="BizLicenseAuthStateCode" /></BizLicenseAuthStateCode>
			   </xsl:if>
			   <xsl:if test="BizLicenseAuthType">
			          <BizLicenseAuthType><xsl:value-of select="BizLicenseAuthType" /></BizLicenseAuthType>
			   </xsl:if>
			   <xsl:if test="BusinessPhone">
			          <BusinessPhone><xsl:value-of select="BusinessPhone" /></BusinessPhone>
			   </xsl:if>
			   <xsl:if test="CategoryName">
			          <CategoryName><xsl:value-of select="CategoryName" /></CategoryName>
			   </xsl:if>
			   <xsl:if test="Cell">
			          <Cell><xsl:value-of select="Cell" /></Cell>
			   </xsl:if>
               <xsl:if test="City">
			          <City><xsl:value-of select="City" /></City>
			   </xsl:if>
               <xsl:if test="Comments">
			          <Comments><xsl:value-of select="Comments" /></Comments>
			   </xsl:if>
			   <xsl:if test="CompanyId">
			          <CompanyId><xsl:value-of select="CompanyId" /></CompanyId>
			   </xsl:if>
			   <ContactId>
					  <xsl:value-of select="concat('Provider.',Id)" />
			   </ContactId>
			   <ContactType>Provider</ContactType>
               <xsl:if test="ContactName">
			          <ContactName><xsl:value-of select="ContactName" /></ContactName>
			   </xsl:if>
			   <xsl:if test="ContactNMLSNo">
			          <ContactNMLSNo><xsl:value-of select="ContactNMLSNo" /></ContactNMLSNo>
			   </xsl:if>
               <xsl:if test="ContactTitle">
			          <ContactTitle><xsl:value-of select="ContactTitle" /></ContactTitle>
			   </xsl:if>
			   <xsl:if test="Email">
			          <Email><xsl:value-of select="Email" /></Email>
			   </xsl:if>
			   <xsl:if test="Fax">
			          <Fax><xsl:value-of select="Fax" /></Fax>
			   </xsl:if>
			   <xsl:if test="LineItemNumber">
			          <LineItemNumber><xsl:value-of select="LineItemNumber" /></LineItemNumber>
			   </xsl:if>
			   <xsl:if test="Name">
			          <FullName><xsl:value-of select="Name" /></FullName>
			   </xsl:if>
			   <xsl:if test="HomePhone">
			          <HomePhone><xsl:value-of select="HomePhone" /></HomePhone>
			   </xsl:if>
			   <xsl:if test="NmlsLicense">
			          <NmlsLicense><xsl:value-of select="NmlsLicense" /></NmlsLicense>
			   </xsl:if>
              <xsl:if test="OrganizationState">
			          <OrganizationState><xsl:value-of select="OrganizationState" /></OrganizationState>
			   </xsl:if>
              <xsl:if test="OrganizationType">
			          <OrganizationType><xsl:value-of select="OrganizationType" /></OrganizationType>
			   </xsl:if>
              <xsl:if test="PersonalLicenseAuthDate">
			          <PersonalLicenseAuthDate><xsl:value-of select="PersonalLicenseAuthDate" /></PersonalLicenseAuthDate>
			   </xsl:if>
              <xsl:if test="PersonalLicenseAuthName">
			          <PersonalLicenseAuthName><xsl:value-of select="PersonalLicenseAuthName" /></PersonalLicenseAuthName>
			   </xsl:if>
			   <xsl:if test="PersonalLicenseAuthStateCode">
			          <PersonalLicenseAuthStateCode><xsl:value-of select="PersonalLicenseAuthStateCode" /></PersonalLicenseAuthStateCode>
			   </xsl:if>
			   <xsl:if test="PersonalLicenseAuthType">
			          <PersonalLicenseAuthType><xsl:value-of select="PersonalLicenseAuthType" /></PersonalLicenseAuthType>
			   </xsl:if>
			   <xsl:if test="PersonalLicenseNumber">
			          <PersonalLicenseNumber><xsl:value-of select="PersonalLicenseNumber" /></PersonalLicenseNumber>
			   </xsl:if>
			   <xsl:if test="Phone and ContactType != 'SELLER' and ContactType != 'SELLER2' and ContactType != 'SELLER3' and ContactType != 'SELLER4'">
			          <Phone><xsl:value-of select="Phone" /></Phone>
			   </xsl:if>
			   <xsl:if test="Phone2">
			          <Phone2><xsl:value-of select="Phone2" /></Phone2>
			   </xsl:if>
			   <xsl:if test="PostalCode">
			          <PostalCode><xsl:value-of select="PostalCode" /></PostalCode>
			   </xsl:if>
			   <xsl:if test="RecCity">
			          <RecCity><xsl:value-of select="RecCity" /></RecCity>
			   </xsl:if>
			   <xsl:if test="ReferenceNumber">
			          <ReferenceNumber><xsl:value-of select="ReferenceNumber" /></ReferenceNumber>
			   </xsl:if>
			   <xsl:if test="Relationship">
			          <Relationship><xsl:value-of select="Relationship" /></Relationship>
			   </xsl:if>
			   <xsl:if test="SettlementAgent">
			          <SettlementAgent><xsl:value-of select="SettlementAgent" /></SettlementAgent>
			   </xsl:if>
			   <xsl:if test="State">
			          <State><xsl:value-of select="State" /></State>
			   </xsl:if>
			   <xsl:if test="TaxID">
			          <TaxID><xsl:value-of select="TaxID" /></TaxID>
			   </xsl:if>
			   <xsl:choose>
						<xsl:when test="ContactType = 'LENDER_INVESTOR'">
							  <ContactTypeName>LenderInvestor</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'ESCROW_COMPANY'">
							  <ContactTypeName>EscrowCompany</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'APPRAISAL_COMPANY'">
							  <ContactTypeName>ApparisalCompany</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'TITLE_COMPANY'">
							  <ContactTypeName>TitleCompany</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'BUYERS_ATTORNEY'">
							  <ContactTypeName>BuyersAttorney</ContactTypeName>
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
			                       <HomePhone><xsl:value-of select="Phone" /></HomePhone>
			                   </xsl:if>
						</xsl:when>
					    <xsl:when test="ContactType = 'SELLER2'">
							  <ContactTypeName>Seller2</ContactTypeName>
							  <xsl:if test="Phone">
			                       <HomePhone><xsl:value-of select="Phone" /></HomePhone>
			                   </xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLER3'">
							  <ContactTypeName>Seller3</ContactTypeName>
							  <xsl:if test="Phone">
			                       <HomePhone><xsl:value-of select="Phone" /></HomePhone>
			                   </xsl:if>
						</xsl:when>
						<xsl:when test="ContactType = 'SELLER4'">
							  <ContactTypeName>Seller4</ContactTypeName>
							  <xsl:if test="Phone">
			                       <HomePhone><xsl:value-of select="Phone" /></HomePhone>
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
						</xsl:when>
					    <xsl:when test="ContactType = 'MORTGAGE_INSURANCE'">
							  <ContactTypeName>MortgageInsurance</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'SURVEYOR'">
							  <ContactTypeName>Surveyor</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'FLOOD_INSURANCE'">
							  <ContactTypeName>FloodInsurance</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'CREDIT_COMPANY'">
							  <ContactTypeName>CreditCompany</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'UNDERWRITER'">
							  <ContactTypeName>Underwriter</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'SERVICING'">
							  <ContactTypeName>Servicing</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'DOC_SIGNING'">
							  <ContactTypeName>DocSinging</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'WAREHOUSE'">
							  <ContactTypeName>Warehouse</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'FINANCIAL_PLANNER'">
							  <ContactTypeName>FinancialPlanner</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'INVESTOR'">
							  <ContactTypeName>Investor</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'ASSIGNTO'">
							  <ContactTypeName>AssignTo</ContactTypeName>
						</xsl:when>
						<xsl:when test="ContactType = 'BROKER'">
							  <ContactTypeName>Broker</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'DOCSPREPAREDBY'">
							  <ContactTypeName>DocsPrepredBy</ContactTypeName>
						</xsl:when>
					    <xsl:when test="ContactType = 'SETTLEMENT_AGENT'">
							  <ContactTypeName>SettlementAgent</ContactTypeName>
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