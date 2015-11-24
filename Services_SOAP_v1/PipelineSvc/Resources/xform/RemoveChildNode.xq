declare namespace fn = "http://www.w3.org/2004/07/xpath-functions";

declare variable $cursorNode as element() external;
declare variable $nodeSequence as element()* external;
declare function xqRemoveChildNode($nodeSequence  as element()*, $cursorNode as element()) as element()
{
let $cursorPosition := fn:index-of($nodeSequence/*, $cursorNode)
let $seq := fn:remove($nodeSequence/*, xs:integer($cursorPosition))
return
<CursorList>
{
for $item in $seq
return
  $item
}
</CursorList>

};

xqRemoveChildNode($nodeSequence, $cursorNode)