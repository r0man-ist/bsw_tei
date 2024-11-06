<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                    rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous"/>
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
                <link href="https://fonts.googleapis.com/css2?family=Rouge+Script" rel="stylesheet"/>
                <link rel="stylesheet" href="./../static/styles.css"/>

            </head>
            <body>
                <div class="row shadow">
                    <div class="col-3 nav-bsw">
                        <a class="nav-link active" aria-current="page" href="#">
                            <img
                                src="https://berlinscienceweek.com/themes/custom/berlinscienceweek/logo.svg"
                                width="350px"/>
                        </a>
                    </div>
                    <div class="col-9 nav">
                        <div class="lead">Vom Digitalisat zur Edition: Texte auszeichnen in TEI
                            XML</div>
                        <a class="nav-link" href="#">
                            <img src="./../static/sbb-logo.png" height="50"/>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 bg-sides"/>
                    <div class="col-8 ">
                        <div class="row text-center">
                            <h1 class="display-1 mt-5 mb-5 rouge-script-regular">Fanny &#9829;
                                Wilhelm</h1>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-8 border rounded-start mb-3 p-3">
                                            <b>Titel: </b>
                                            <xsl:apply-templates select="//t:teiHeader//t:title"/>
                                            <br/>
                                            <b>Kontext: </b>
                                            <xsl:apply-templates select="//t:teiHeader//t:authority"
                                            /> am <xsl:value-of
                                                select="format-date(//t:publicationStmt//t:date, '[D]. [MNn] [Y]', 'de', (), ())"/>
                                            <br/>
                                            <table><tr><td><b>Quelle: </b></td>
                                                  <td>
                                                  <xsl:apply-templates
                                                  select="//t:teiHeader//t:repository"/><br/>
                                                  <xsl:apply-templates
                                                      select="//t:teiHeader//t:idno[@type = 'Signatur']"/><br/>
                                                  <a>
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of
                                                      select="concat('https://digital.staatsbibliothek-berlin.de/werkansicht/?PPN=PPN', //t:idno[@type = 'PPN'])"
                                                  /></xsl:attribute><xsl:value-of
                                                  select="//t:idno[@type = 'PPN']"/></a></td>
                                                </tr>
                                            </table>
                                            <xsl:if test="//t:correspContext/t:ref">
                                                
                                                <b>In Beziehung stehender Brief: </b> <a><xsl:attribute name="href"><xsl:value-of select="//t:correspContext/t:ref/@target"/></xsl:attribute><xsl:value-of select="//t:correspContext/t:ref/@target"/></a>
                                            </xsl:if>
                                        </div>
                                        <div class="col-4 border rounded-end mb-3 p-3">TEI
                                            Header</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 border rounded-start mb-3 p-3">

                                            <xsl:apply-templates select="//t:body"/>
                                        </div>
                                        <div class="col-4 border rounded-end mb-3 p-3">TEI
                                            Body</div>
                                    </div>

                                    <div class="row">
                                        <xsl:for-each select="//t:pb/@facs">                                  
                                            <xsl:variable name="image-url" select="."/>
                                        <div class="col-8 border rounded-start mb-3 p-3">
                                            <img src="{$image-url}" width="500px"/>
                                        </div>
                                        <div class="col-4 border rounded-end mb-3 p-3"
                                            >Facsimile</div></xsl:for-each>  
                                    </div>
                                    <div class="row">
                                        <div class="col-8 border rounded-start mb-3 p-3">
                                            <xsl:for-each select="//t:persName">
                                                <xsl:variable name="WikiData-Url" select="./@ref"/>
                                                <a href="{$WikiData-Url}">
                                                  <img
                                                  src="https://upload.wikimedia.org/wikipedia/commons/d/da/Wikidata-Archi38.svg"
                                                  alt="Wikidata Logo" height="20"/>
                                                  <xsl:value-of select="."/>
                                                  <br/>
                                                </a>
                                            </xsl:for-each>
                                        </div>
                                        <div class="col-4 border rounded-end mb-3 p-3">Linked Open
                                            Data</div>
                                    </div>
                                    <!--<div class="row">
                                        <div class="col-6 text-end">
                                            <div class="btn btn-outline-secondary m-3 ">
                                                Zurück</div>
                                        </div>
                                        <div class="col-6 text-start">
                                            <div class="btn btn-outline-secondary m-3">
                                                Nächster</div>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 bg-sides"/>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"/>
            </body>

        </html>

    </xsl:template>




    
    <xsl:template match="t:lb">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>



    <xsl:template match="*[@rend = 'underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>

    <xsl:template match="*[@rend = 'right-align']">
        <div align="right">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="t:fw[@type='fol']">
        <div style="color: #D3D3D3">
            <xsl:next-match/>
        </div>
    </xsl:template>
    
    <xsl:template match="t:choice/t:orig">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:choice/t:reg">
        
        
        
    </xsl:template>
    
    <xsl:template match="t:gap">
        <xsl:variable name="gap" select="./@extent"></xsl:variable>
        <b title="[Lücke im Text von ca. {$gap} Zeichen Länge]">[...]</b>
    </xsl:template>
</xsl:stylesheet>
