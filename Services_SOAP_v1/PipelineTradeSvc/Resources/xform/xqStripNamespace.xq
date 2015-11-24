declare namespace xf = "http://tempuri.org/Encompass_SOAP_v1/FieldSearch/Resources/xform/xqFDEGrouping/";

declare variable $inputRequest as element() external;
declare function xf:strip-namespace($inputRequest  as element()) as element()
{
element {xs:QName(local-name($inputRequest ))}
{
for $child in $inputRequest /(@*,node())
return
if ($child instance of element())
then xf:strip-namespace($child)
else $child
}
};

xf:strip-namespace($inputRequest)