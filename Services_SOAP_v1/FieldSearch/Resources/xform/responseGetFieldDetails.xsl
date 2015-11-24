<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xsi"
                              xmlns:fs="http://www.elliemae.com/encompass/platform"
                              xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" />
  <xsl:strip-space elements="*" />

<!-- Define keys to use in Grouping -->
<xsl:key name="group" match="fs:BizCustomField" use="fs:Category" />

<xsl:key name="fde" match="fs:RuleItem" use="fs:FieldId" />
<xsl:key name="fde2" match="fs:RuleItem/fs:PreRequiredFields/fs:FieldId" use="text()" />

<xsl:key name="val" match="fs:FieldId" use="text()" />
<xsl:key name="milestone" match="fs:MilestoneCompletionCondition" use="fs:MilestoneId" />
<xsl:key name="ratelock" match="fs:RateLockCondition" use="fs:Action" />  
                                  
 <xsl:template match="fs:RuleDetailGetResponse/*">
    <fs:GetFieldDetailsResponse>
<!-- SearchResultTypeData -->    
      <fs:SearchResultTypeData>
        <xsl:if test="fs:Name">
          <fs:Name> <xsl:value-of select="fs:Name"/> </fs:Name>
        </xsl:if>
         <xsl:if test="fs:Type">
          <fs:Type> <xsl:value-of select="fs:Type"/> </fs:Type>
        </xsl:if>

<!-- Channels -->        
        <fs:Channels>
          <xsl:if test="fs:Channels">
            <xsl:call-template name="tokenize"/>
          </xsl:if>
        </fs:Channels>
        
<!-- ConditionFields -->        
        <fs:ConditionFields>
          <xsl:for-each select="fs:ConditionFields/fs:Field">
            <fs:Field>
              <fs:FieldId>
                <xsl:if test="fs:Id/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                    <xsl:value-of select="fs:Id/@xsi:nil"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="fs:Id"/>
              </fs:FieldId>
              <fs:FieldType>
                <xsl:if test="fs:Type/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                    <xsl:value-of select="fs:Type/@xsi:nil"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="fs:Type"/>
              </fs:FieldType>
              <fs:FieldDescription>
                <xsl:if test="fs:Description/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                    <xsl:value-of select="fs:Description/@xsi:nil"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="fs:Description"/>
              </fs:FieldDescription>
            </fs:Field>
          </xsl:for-each>
        </fs:ConditionFields>
        <xsl:if test="fs:ConditionText">
          <fs:RuleCondition>
            <xsl:value-of select="fs:ConditionText"/>
          </fs:RuleCondition>
        </xsl:if>

<!-- ResultsFields -->
        <fs:ResultFields>
          <xsl:for-each select="fs:ResultsFields/fs:Field">
            <fs:Field>
              <xsl:if test="fs:Id">
                <xsl:element name="fs:FieldId"> <xsl:value-of select="fs:Id" /> </xsl:element>
              </xsl:if>
              <xsl:if test="fs:Type">
                <xsl:element name="fs:FieldType"> <xsl:value-of select="fs:Type" /> </xsl:element>
              </xsl:if>
              <xsl:if test="fs:Description">
                <xsl:element name="fs:FieldDescription"> <xsl:value-of select="fs:Description" /> </xsl:element>
              </xsl:if>
            </fs:Field>
          </xsl:for-each>
          <xsl:if test="fs:Fields">
             <xsl:apply-templates mode="copy" select="fs:Fields" />
          </xsl:if>
        </fs:ResultFields>

<!-- Piggyback Loan Synchronization -->
       <xsl:if test="fs:Verifications">
        <fs:Verifications>
          <xsl:for-each select="fs:Verifications/fs:Item">
            <fs:Value> <xsl:value-of select="text()"/> </fs:Value>
          </xsl:for-each>
        </fs:Verifications>
       </xsl:if>

<!-- Lock Request Loan Data -->
      <xsl:variable name="node" select="name()"/>    
        <xsl:if test="count(fs:LoanSnapshotFields | fs:LockRequestFields) &gt; 0">
          <fs:LockRequestData>
            <xsl:for-each select="fs:LockRequestFields">
              <fs:LockRequestForm>
                <xsl:for-each select="fs:LRField">
                  <fs:Field>
                    <fs:AdditionalField> <xsl:value-of select="fs:FieldId" /> </fs:AdditionalField>
                    <fs:Description> <xsl:value-of select="fs:Description" /> </fs:Description>
                    <fs:NewFieldId> <xsl:value-of select="fs:NewFieldId" /> </fs:NewFieldId>
                    <fs:Type> <xsl:value-of select="fs:Type" /> </fs:Type>
                  </fs:Field>
                </xsl:for-each>
              </fs:LockRequestForm>
            </xsl:for-each>
            <xsl:for-each select="fs:LoanSnapshotFields">
              <fs:LockSnapshot>
                <xsl:for-each select="fs:LRField">
                  <fs:Field>
                    <fs:AdditionalField> <xsl:value-of select="fs:FieldId" /> </fs:AdditionalField>
                    <fs:Description> <xsl:value-of select="fs:Description" /> </fs:Description>
                    <fs:NewFieldId> <xsl:value-of select="fs:NewFieldId" /> </fs:NewFieldId>
                    <fs:Type> <xsl:value-of select="fs:Type" /> </fs:Type>
                  </fs:Field>
                </xsl:for-each>
              </fs:LockSnapshot>
            </xsl:for-each>
          </fs:LockRequestData>
        </xsl:if>

<!-- Company Status Online -->
        <xsl:variable name="curNode" select="local-name()"/>
        <xsl:if test="$curNode = 'StatusOnlineTrigger'">
          <fs:TriggerFields>
            <!--  <fs:Value> <xsl:value-of select="fs:RequirementType" /> </fs:Value>  commented out as per SERV-1730-->
            <xsl:call-template name="tokenize2"/>
          </fs:TriggerFields>
          <fs:EmailTemplates>
            <fs:Value> <xsl:value-of select="fs:EmailTemplate"/> </fs:Value>
          </fs:EmailTemplates>
        </xsl:if>


<!-- Loan Custom Fields -->
        <xsl:if test="local-name()='LoanCustomField'">
            <fs:CustomField>
              <fs:FieldId> <xsl:value-of select="fs:FieldId"/> </fs:FieldId>
              <fs:Description> <xsl:value-of select="fs:Description"/> </fs:Description>
              <fs:Calculation> <xsl:value-of select="fs:Calculation"/> </fs:Calculation>
              <fs:MaxLength> <xsl:value-of select="fs:MaxLength"/> </fs:MaxLength>
              <fs:Format> <xsl:value-of select="fs:Format"/> </fs:Format>
              <xsl:if test="fs:Options">
                 <xsl:apply-templates mode="copy" select="fs:Options" />
              </xsl:if>
            </fs:CustomField>
        </xsl:if>

<!-- Business Custom Fields -->
        <xsl:if test="fs:BizCustomFields">
          <fs:CustomData> 
            <xsl:for-each select="fs:BizCustomFields">
            <xsl:if test="fs:BizCustomField">
              <fs:CustomCategoryData> 
                <xsl:for-each select="fs:BizCustomField[generate-id(.)=generate-id(key('group',fs:Category)[1])]" >
                  <fs:Category> <xsl:attribute name="value"> <xsl:value-of select="fs:Category" /> </xsl:attribute>
                     <xsl:for-each select="key('group',fs:Category)">
                        <fs:Field>
                           <fs:FieldDescription> <xsl:value-of select="fs:FieldDescription" /> </fs:FieldDescription>
                           <fs:FieldType> <xsl:value-of select="fs:FieldFormat" /> </fs:FieldType>
                           <fs:FieldNumber> <xsl:value-of select="fs:FieldNumber" /> </fs:FieldNumber>
                           <fs:LoanFieldId> <xsl:value-of select="fs:LoanFieldId" /> </fs:LoanFieldId>
                           <fs:BothWays> <xsl:value-of select="fs:TwoWayTransfer"/> </fs:BothWays>
                        </fs:Field>
                     </xsl:for-each>
                  </fs:Category>
                </xsl:for-each>
              </fs:CustomCategoryData>
            </xsl:if>
            </xsl:for-each>
            <xsl:if test="fs:CustomFields">
              <fs:CustomFieldsToLoanFields>
                <xsl:for-each select="fs:CustomFields/fs:CustomField">
                  <fs:Field>
                      <fs:LoanFieldId> <xsl:value-of select="fs:LoanFieldId"/> </fs:LoanFieldId>
                      <fs:FieldDescription> <xsl:value-of select="fs:Label"/> </fs:FieldDescription>
                      <fs:FieldType> <xsl:value-of select="fs:FieldType"/> </fs:FieldType>
                      <fs:LabelID> <xsl:value-of select="fs:LabelID"/> </fs:LabelID>
                      <fs:OwnerID> <xsl:value-of select="fs:OwnerID"/> </fs:OwnerID>
                      <fs:BothWays> <xsl:value-of select="fs:TwoWayTransfer"/> </fs:BothWays>
                  </fs:Field>
                </xsl:for-each>
              </fs:CustomFieldsToLoanFields>
            </xsl:if>
            <xsl:if test="count(fs:Page1Name) &gt; 0">
          	<fs:TabNames>
          		<fs:Page1> <xsl:value-of select="fs:Page1Name"/> </fs:Page1>
          		<fs:Page2> <xsl:value-of select="fs:Page2Name"/> </fs:Page2>
          		<fs:Page3> <xsl:value-of select="fs:Page3Name"/> </fs:Page3>
          		<fs:Page4> <xsl:value-of select="fs:Page4Name"/> </fs:Page4>
          		<fs:Page5> <xsl:value-of select="fs:Page5Name"/> </fs:Page5>
          	</fs:TabNames>
          </xsl:if>
          </fs:CustomData>
        </xsl:if>
  

<!-- Borrower Custom Fields -->
        <xsl:variable name="node2" select="local-name()"/>
        <xsl:if test="$node2 = 'BorrowerCustomFields'">
          <fs:CustomData>
          <xsl:for-each select="fs:CustomFields">
            <fs:CustomFields>
              <xsl:for-each select="fs:CustomField">
                <fs:Field>
                    <fs:LoanFieldId> <xsl:value-of select="fs:LoanFieldId"/> </fs:LoanFieldId>
                    <fs:FieldDescription> <xsl:value-of select="fs:Label"/> </fs:FieldDescription>
                    <fs:FieldType> <xsl:value-of select="fs:FieldType"/> </fs:FieldType>
                    <fs:LabelID> <xsl:value-of select="fs:LabelID"/> </fs:LabelID>
                    <fs:OwnerID> <xsl:value-of select="fs:OwnerID"/> </fs:OwnerID>
                    <fs:BothWays> <xsl:value-of select="fs:TwoWayTransfer"/> </fs:BothWays>
                </fs:Field>
              </xsl:for-each>
            </fs:CustomFields>
          </xsl:for-each>
          <xsl:if test="count(fs:Page1Name) &gt; 0">
          	<fs:TabNames>
          		<fs:Page1> <xsl:value-of select="fs:Page1Name"/> </fs:Page1>
          		<fs:Page2> <xsl:value-of select="fs:Page2Name"/> </fs:Page2>
          		<fs:Page3> <xsl:value-of select="fs:Page3Name"/> </fs:Page3>
          		<fs:Page4> <xsl:value-of select="fs:Page4Name"/> </fs:Page4>
          		<fs:Page5> <xsl:value-of select="fs:Page5Name"/> </fs:Page5>
          	</fs:TabNames>
          </xsl:if>
          </fs:CustomData>
        </xsl:if>

<!-- TPO Custom Fields -->
		<xsl:variable name="node3" select="local-name()"/>
		<xsl:if test="$node3='TPOCustomFields'">
          <fs:CustomData>
          <xsl:for-each select="fs:CustomFields">
            <fs:CustomFields>
              <xsl:for-each select="fs:CustomField">
                <fs:Field>
                    <fs:LoanFieldId> <xsl:value-of select="fs:LoanFieldId"/> </fs:LoanFieldId>
                    <fs:FieldDescription> <xsl:value-of select="fs:Label"/> </fs:FieldDescription>
                    <fs:FieldType> <xsl:value-of select="fs:FieldType"/> </fs:FieldType>
                    <fs:LabelID> <xsl:value-of select="fs:LabelID"/> </fs:LabelID>
                    <fs:OwnerID> <xsl:value-of select="fs:OwnerID"/> </fs:OwnerID>
                    <fs:BothWays> <xsl:value-of select="fs:TwoWayTransfer"/> </fs:BothWays>
                </fs:Field>
              </xsl:for-each>
            </fs:CustomFields>
          </xsl:for-each>
          <xsl:if test="count(fs:Page1Name) &gt; 0">
          	<fs:TabNames>
          		<fs:Page1> <xsl:value-of select="fs:Page1Name"/> </fs:Page1>
          		<fs:Page2> <xsl:value-of select="fs:Page2Name"/> </fs:Page2>
          		<fs:Page3> <xsl:value-of select="fs:Page3Name"/> </fs:Page3>
          		<fs:Page4> <xsl:value-of select="fs:Page4Name"/> </fs:Page4>
          		<fs:Page5> <xsl:value-of select="fs:Page5Name"/> </fs:Page5>
          	</fs:TabNames>
          </xsl:if>
          </fs:CustomData>
        </xsl:if>


<!-- Alert -->
	<!-- Type - Custom Alert -->
        <xsl:if test="count(fs:CustomAlert) &gt; 0">
          <fs:Alerts>
            <fs:Alert>
              <fs:AlertName> <xsl:value-of select="fs:Name"/> </fs:AlertName>
               <fs:AlertType> <xsl:text>CustomAlert</xsl:text> </fs:AlertType>
             <!--  <fs:TriggerFieldDateId> <xsl:value-of select="fs:Timing"/> </fs:TriggerFieldDateId>-->
               <fs:TriggerFieldDateId>
              <xsl:for-each select="fs:TriggerFieldList/fs:Item">
          		  <fs:Item> <xsl:value-of select="text()"/> </fs:Item>
         		 </xsl:for-each>
         	  </fs:TriggerFieldDateId>
              <fs:Condition> 
                  <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                    <xsl:value-of select="fs:CustomAlert/fs:ConditionXml" disable-output-escaping="yes"/>
                  <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
              </fs:Condition>
              <fs:ConditionSummary> <xsl:value-of select="fs:CustomAlert/fs:ConditionSummary"/> </fs:ConditionSummary>
            </fs:Alert>
          </fs:Alerts>
        </xsl:if>
	<!-- Type - Regulation Alert -->
        <xsl:if test="count(fs:RegulationAlert) &gt; 0">
          <fs:Alerts>
            <fs:Alert>
              <fs:AlertName> <xsl:value-of select="fs:Name"/> </fs:AlertName>
              <fs:AlertType> <xsl:text>RegulationAlert</xsl:text> </fs:AlertType>
              <fs:TriggerFieldIds>
              	<xsl:for-each select="fs:RegulationAlert/fs:TriggerFieldIds/fs:AlertTriggerField">
          		  <fs:FieldId> <xsl:value-of select="fs:FieldId"/> </fs:FieldId>
         		</xsl:for-each>
         	  </fs:TriggerFieldIds>
            </fs:Alert>
          </fs:Alerts>
        </xsl:if>
	<!-- Type - Workflow Alert -->
        <xsl:if test="count(fs:WorkflowAlert) &gt; 0">
          <fs:Alerts>
            <fs:Alert>
              <fs:AlertName> <xsl:value-of select="fs:Name"/> </fs:AlertName>
              <fs:AlertType> <xsl:text>WorkflowAlert</xsl:text> </fs:AlertType>
              	<xsl:for-each select="fs:WorkflowAlert/fs:TriggerDescription">
          		  <fs:TriggerDescription> <xsl:value-of select="text()"/> </fs:TriggerDescription>
         		</xsl:for-each>
            </fs:Alert>
          </fs:Alerts>
        </xsl:if>


<!--  HTML Email Template -->
		<xsl:variable name="context" select="local-name()"/>
		<xsl:if test="$context='HtmlEmailTemplate'">
		        <fs:Name> <xsl:value-of select="fs:Name"/> </fs:Name>
		        <fs:Type> <xsl:value-of select="fs:Type"/> </fs:Type>
		        <fs:Template>
		           <fs:Type> <xsl:value-of select="fs:Type" /> </fs:Type>
		           <fs:Name> <xsl:value-of select="fs:Name" /> </fs:Name>
		           <fs:Content> <xsl:value-of select="fs:Html" /> </fs:Content>
		        </fs:Template>
		</xsl:if> 

<!-- End of SearchResultTypeData -->        
      </fs:SearchResultTypeData>
<!-- FieldData -->
    <fs:FieldData>
      
<!-- LoanAccessRights or Persona Access to Loans -->
        <xsl:if test="fs:LoanAccessRights">
          <xsl:for-each select="fs:LoanAccessRights">
            <fs:Field>
              <xsl:if test="fs:FieldID">
                <fs:FieldId> <xsl:value-of select="fs:FieldID"/> </fs:FieldId>
              </xsl:if>
            <!--  <xsl:for-each select="fs:AccessRights">  -->
                <fs:LoanFileAcccess>
                  <xsl:for-each select="fs:AccessRight">
                    <fs:Persona>
                      <fs:Name> <xsl:value-of select="fs:PersonaName"/> </fs:Name>
                      <fs:Value> <xsl:value-of select="fs:AccessRight"/> </fs:Value>
                    </fs:Persona>
                  </xsl:for-each>
                </fs:LoanFileAcccess>
            <!--  </xsl:for-each>  -->
            </fs:Field>
          </xsl:for-each>      
        </xsl:if>

<!-- FieldAccessRights or Persona Access to Fields -->
        <xsl:if test="fs:FieldAccessRights/fs:FieldAccessRight">
          <xsl:for-each select="fs:FieldAccessRights/fs:FieldAccessRight">
            <fs:Field>
              <xsl:if test="fs:FieldID">
                <fs:FieldId> <xsl:value-of select="fs:FieldID"/> </fs:FieldId>
              </xsl:if>
              <xsl:for-each select="fs:AccessRights">
                <fs:AssignRights>
                  <xsl:for-each select="fs:AccessRight">
                    <fs:Persona>
                      <fs:Name> <xsl:value-of select="fs:PersonaName"/> </fs:Name>
                      <fs:Value> <xsl:value-of select="fs:Right"/> </fs:Value>
                    </fs:Persona>
                  </xsl:for-each>
                </fs:AssignRights>
              </xsl:for-each>
            </fs:Field>
          </xsl:for-each>      
        </xsl:if>

<!-- Field Trigger Rule -->
<!--
        <xsl:if test="fs:TriggerEvents">
          <xsl:for-each select="fs:TriggerEvents/fs:TriggerEvent">
          	<fs:Field>
             <fs:Action>
            	<xsl:copy-of select="fs:CompleteTasksAction/*
             						|fs:AssignmentAction/*
             						|fs:CopyAction/*
             						|fs:AdvancedCodeAction/*"></xsl:copy-of>
             	<xsl:if test="fs:EmailAction">
             		<xsl:copy-of select="fs:EmailAction/fs:Type"/>
             		<xsl:copy-of select="fs:EmailAction/fs:Templates/*" />
             	</xsl:if>
             </fs:Action>
             <xsl:for-each select="fs:ValueChangeConditions/fs:ValueChangeCondition
             					  |fs:ValueListConditions/fs:ValueListCondition
             					  |fs:FixedValueConditions/fs:FixedValueCondition
             					  |fs:RangeConditions/fs:RangeCondition
             					  |fs:MilestoneCompletionConditions/fs:MilestoneCompletionCondition
             					  |fs:RateLockConditions/fs:RateLockCondition">
	             <fs:Condition>
                             <Type> <xsl:value-of select="local-name()"></xsl:value-of> </Type>
		             <xsl:copy-of select="./*"/>
	             </fs:Condition>
	         </xsl:for-each>
            </fs:Field>
          </xsl:for-each>
        </xsl:if>
-->
        <xsl:if test="fs:TriggerEvents">
       		<xsl:apply-templates mode="copy" select="fs:TriggerEvents" />
        </xsl:if>        

<!-- Field Data Entry or Field Rule -->
		<xsl:if test="fs:RuleItems/fs:RuleItem">
			<xsl:for-each select="fs:RuleItems">
				<xsl:for-each
					select="fs:RuleItem[generate-id(.)=generate-id(key('fde',fs:FieldId)[1])]">
					<fs:Field>
						<fs:FieldId> <xsl:value-of select="fs:FieldId" /> </fs:FieldId>
							<xsl:for-each select="key('fde',fs:FieldId)">
								<fs:FieldRules>
									<fs:Description>
										<xsl:value-of select="fs:Description" />
									</fs:Description>
									<fs:Details>
										<xsl:if test="fs:AdvancedCode | fs:FRRange| fs:FRList">
											<xsl:apply-templates mode="copy"
												select="fs:AdvancedCode | fs:FRRange| fs:FRList" />
										</xsl:if>
									</fs:Details>
									<fs:Id>
										<xsl:value-of select="fs:FieldId" />
									</fs:Id>
									<xsl:if test="fs:PreRequiredFields">
										<fs:PreRequiredFields>
											<xsl:for-each select="fs:PreRequiredFields/fs:FieldId">
												<fs:FieldId>
													<xsl:value-of select="." />
												</fs:FieldId>
											</xsl:for-each>
										</fs:PreRequiredFields>
									</xsl:if>
									<fs:RuleType>
										<xsl:if test="fs:FRRange">
											<xsl:text>Range</xsl:text>
										</xsl:if>
										<xsl:if test="fs:FRList">
											<xsl:text>List</xsl:text>
										</xsl:if>
										<xsl:if test="fs:AdvancedCode">
											<xsl:text>Advanced Code</xsl:text>
										</xsl:if>
									</fs:RuleType>
								</fs:FieldRules>
							</xsl:for-each>
					</fs:Field>
				</xsl:for-each>
				<xsl:for-each
					select="fs:RuleItem/fs:PreRequiredFields/fs:FieldId[generate-id(.)=generate-id(key('fde2',text())[1])]">
					<fs:Field>
						<fs:FieldId> <xsl:value-of select="text()" /> </fs:FieldId>
							<xsl:for-each select="key('fde2',text())">
								<fs:FieldRules>
									<fs:Description>
										<xsl:value-of select="../../fs:Description" />
									</fs:Description>
									<fs:Details>
										<xsl:if
											test="../../fs:AdvancedCode | ../../fs:FRRange| ../../fs:FRList">
											<xsl:apply-templates mode="copy"
												select="../../fs:AdvancedCode | ../../fs:FRRange| ../../fs:FRList" />
										</xsl:if>
									</fs:Details>
									<fs:Id>
										<xsl:value-of select="../../fs:FieldId" />
									</fs:Id>
									<xsl:if test="../../fs:PreRequiredFields">
										<fs:PreRequiredFields>
											<xsl:for-each select="../../fs:PreRequiredFields/fs:FieldId">
												<fs:FieldId>
													<xsl:value-of select="." />
												</fs:FieldId>
											</xsl:for-each>
										</fs:PreRequiredFields>
									</xsl:if>
									<fs:RuleType>
										<xsl:if test="../../fs:FRRange">
											<xsl:text>Range</xsl:text>
										</xsl:if>
										<xsl:if test="../../fs:FRList">
											<xsl:text>List</xsl:text>
										</xsl:if>
										<xsl:if test="../../fs:AdvancedCode">
											<xsl:text>Advanced Code</xsl:text>
										</xsl:if>
									</fs:RuleType>
								</fs:FieldRules>
							</xsl:for-each>
					</fs:Field>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>


<!-- Automated Conditions -->
        <xsl:if test="fs:AutomatedConditions">
          <xsl:for-each select="fs:AutomatedConditions">
            <fs:Field>
              <xsl:if test="fs:FieldID">
                <fs:FieldId> <xsl:value-of select="fs:FieldID"/> </fs:FieldId>
              </xsl:if>
              <xsl:for-each select="fs:AutomatedCondition">
                <fs:FieldEvents>
                      <fs:ConditionType> <xsl:value-of select="fs:Type"/> </fs:ConditionType>
                      <fs:ConditionName> <xsl:value-of select="fs:Name"/> </fs:ConditionName>
                </fs:FieldEvents>
              </xsl:for-each>
            </fs:Field>
          </xsl:for-each>      
        </xsl:if>

<!-- End of FieldData-->  
      </fs:FieldData>    

<!-- Input Form List -->
      <xsl:if test="fs:Forms">
        <fs:FormList>
          <xsl:for-each select="fs:Forms/fs:Item">
            <fs:Value> <xsl:value-of select="."/></fs:Value>
          </xsl:for-each>
        </fs:FormList>
      </xsl:if>
    </fs:GetFieldDetailsResponse>
  </xsl:template>

<!-- - - - - - - - - - -->
<!-- Templates -->
<!-- - - - - - - - - - -->

  <!-- create <Channel> for each value in Channels seperated by comma-->
  <xsl:template match="fs:Channels/text()" name="tokenize">
    <xsl:param name="text" select="fs:Channels"/>
    <xsl:param name="separator" select="','"/>
    <xsl:choose>
      <xsl:when test="not(contains($text, $separator))">
          <fs:Channel>
              <xsl:value-of select="normalize-space($text)"/>
          </fs:Channel>
      </xsl:when>
      <xsl:otherwise>
          <fs:Channel>
              <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
          </fs:Channel>
          <xsl:call-template name="tokenize">
              <xsl:with-param name="text" select="substring-after($text, $separator)"/>
          </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>  

  <!-- create <Value> for each value in RequirementData seperated by comma-->
  <xsl:template match="fs:RequirementData/text()" name="tokenize2">
    <xsl:param name="text" select="fs:RequirementData"/>
    <xsl:param name="separator" select="','"/>
    <xsl:choose>
      <xsl:when test="not(contains($text, $separator))">
          <fs:Value>
              <xsl:value-of select="normalize-space($text)"/>
          </fs:Value>
      </xsl:when>
      <xsl:otherwise>
          <fs:Value>
              <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
          </fs:Value>
          <xsl:call-template name="tokenize2">
              <xsl:with-param name="text" select="substring-after($text, $separator)"/>
          </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>  

<!--  copy node elements for FRList, FRRange and AdvancedCode -->
  <xsl:template match="*" mode="copy">
    <xsl:element name="{name()}" namespace="{namespace-uri()}">
      <xsl:apply-templates select="@*|node()" mode="copy" />
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="@*|text()|comment()" mode="copy">
    <xsl:copy/>
  </xsl:template>


</xsl:stylesheet>