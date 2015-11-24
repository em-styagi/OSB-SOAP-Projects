xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$strJSON" type="xs:anyType" ::)
(:: pragma  parameter="$strKey" type="xs:string" ::)

declare namespace xf = "http://tempuri.org/Services_SOAP_v1/InputFormSvcs/Resources/xform/extractFromJson/";

declare function xf:extractFromJson($strJSON as xs:string, $strKey as xs:string)
    as xs:string {
    
    let $tokens 	:= fn:tokenize(fn:substring-after(fn:normalize-space($strJSON), $strKey), ',')
    let $token 		:= $tokens[1]
    let $keyvalue 	:= fn:replace(fn:replace($token,'["}]',' '),'^([:\s]+)',' ')
    
    return fn-bea:trim($keyvalue)
};

declare variable $strJSON 		as xs:string external;
declare variable $strKey 	as xs:string external;

xf:extractFromJson($strJSON, $strKey)