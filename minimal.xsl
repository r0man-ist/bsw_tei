<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>

            <body>
                <xsl:apply-templates/>
            </body>

        </html>

    </xsl:template>






<!--        <xsl:template match="t:lb">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>-->

<!--    <xsl:template match="*[@rend = 'underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
-->
    
<!--    <xsl:template match="t:choice/t:orig">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:choice/t:reg">-->
    
<!--    <xsl:template match="*[@rend = 'right-align']">
        <div align="right">
            <xsl:apply-templates/>
        </div>
    </xsl:template>-->
    
<!--    <xsl:template match="t:fw[@type='fol']">
        <div style="color: #D3D3D3">
            <xsl:next-match/>
        </div>
    </xsl:template>-->
    
    
</xsl:stylesheet>
