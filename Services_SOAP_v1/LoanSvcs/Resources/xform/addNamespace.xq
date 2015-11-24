xquery version "1.0" encoding "Cp1252";
(:: pragma parameter="$noNamespaceXML" type="xs:anyType" ::)
(:: pragma parameter="$namespaceURI" type="xs:string" ::)
(:: pragma type="xs:anyType" ::)
declare namespace xf = "http://tempuri.org/Resources/XQueries/addNamespace/";

declare function xf:addNamespaceToXML($noNamespaceXML as element(*),$namespaceURI as xs:string) as element(*)
{
element {fn:expanded-QName($namespaceURI,fn:local-name($noNamespaceXML))}
{
$noNamespaceXML/@*,
for $node in $noNamespaceXML/node()
return
if (exists($node/node())) then xf:addNamespaceToXML($node,$namespaceURI)
else if ($node instance of element()) then element {fn:expanded-QName($namespaceURI,fn:local-name($node))}{$node/@*}
else $node }
};

declare variable $noNamespaceXML as element(*) external;
declare variable $namespaceURI as xs:string external ;
xf:addNamespaceToXML($noNamespaceXML, $namespaceURI)