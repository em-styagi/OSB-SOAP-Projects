<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:strip-space elements="*"/>
<xsl:output method="xml" indent="yes"/>

<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates/>
    </xsl:copy>
</xsl:template> 

<xsl:template match="Contact">
    <xsl:copy>
        <xsl:apply-templates>
            <xsl:sort select="local-name()"/>
        </xsl:apply-templates>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>