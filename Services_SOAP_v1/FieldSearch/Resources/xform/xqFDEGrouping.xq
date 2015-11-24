declare namespace ns1 = "http://www.elliemae.com/encompass/platform";
declare namespace ns0 = "http://www.elliemae.com/encompass/platform";
declare namespace xf = "http://tempuri.org/Encompass_SOAP_v1/FieldSearch/Resources/xform/xqFTRGrouping/";

declare function xf:xqFDEGrouping($fieldData1 as element(ns0:FieldData))
 as element(ns1:FieldData) {
        <ns0:FieldData>
            {
            for $id in distinct-values($fieldData1/ns1:Field/ns1:FieldId)
                  let $rules := $fieldData1/ns1:Field[ns1:FieldId/text()=$id]/ns1:FieldRules
                  return
            <ns0:Field>
                  <ns0:FieldId>{ $id }</ns0:FieldId>
                  <ns0:FieldRules>
                  {
                  for $rule in $rules
                  return
                  <ns0:FieldRule>{$rule/node()}</ns0:FieldRule>
                  }
                  </ns0:FieldRules>
            </ns0:Field>
            }
        </ns0:FieldData>

};
 
declare variable $fieldData1 as element(ns0:FieldData) external;

xf:xqFDEGrouping($fieldData1)