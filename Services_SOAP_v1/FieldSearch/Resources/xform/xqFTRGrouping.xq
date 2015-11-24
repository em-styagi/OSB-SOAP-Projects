declare namespace ns1 = "http://www.elliemae.com/encompass/platform";
declare namespace ns0 = "http://www.elliemae.com/encompass/platform";
declare namespace xf = "http://tempuri.org/Encompass_SOAP_v1/FieldSearch/Resources/xform/xqFTRGrouping/";

declare function xf:xqFTRGrouping($triggerRule1 as element(ns0:FieldData))
 as element(ns1:FieldData) {
        <ns1:FieldData>
            {
            let $idsx:= distinct-values(xf:combineids($triggerRule1)//Item)
            
            for $id in $idsx
            let $events := $triggerRule1/ns0:TriggerEvents/ns0:TriggerEvent[//ns0:FieldId/text()=$id or //ns0:Item/text()=$id]
                  return
                 
                     <ns1:Field>
                       <ns1:FieldId>{$id}</ns1:FieldId>
                       <ns1:ActionData>
                             {
                             for $event at $position in $events
                             return
                             if($event//ns0:FieldId = $id or $event//ns0:Item = $id) then
                              <ns1:FieldEvent>{ $event/node()}</ns1:FieldEvent>
                             else ""
                             }
                       </ns1:ActionData>
                     </ns1:Field>
           
            }
        </ns1:FieldData>
};

declare function xf:combineids($triggerRule1 as element(ns0:FieldData)) as element(FieldId){
      <FieldId>
      {
	      for $eachid in $triggerRule1/ns0:TriggerEvents//ns0:FieldId
		  	return
			      <Item> {data($eachid)} </Item>
	      }
	      {
	      for $eachitem in $triggerRule1/ns0:TriggerEvents//ns0:FieldIds/ns0:Item
	      	return
	      		<Item> {data($eachitem)} </Item>
	  }
      </FieldId>
};

 
declare variable $triggerRule1 as element(ns0:FieldData) external;

xf:xqFTRGrouping($triggerRule1)