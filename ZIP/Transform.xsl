<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ios="http://ed-fi.org/4.0.0"
    xmlns:p="https://almanak.overheid.nl/static/schema/oo/export/2.4.23">

    <xsl:template match="/">
        <p:overheidsorganisaties xmlns:xsi="http://www.w3.org/2001/XMLSchema"
            xsi:schemaLocation="https://almanak.overheid.nl/static/schema/oo/export/2.4.23 oo-export-2.4.23.xsd">
            <xsl:apply-templates select="//ios:InterchangeOrganization"/>
        </p:overheidsorganisaties>
    </xsl:template>

    <xsl:template match="ios:InterchangeOrganization">
        <p:organisatie>
          <p:naam><xsl:value-of select="ios:Name"/></p:naam>
          <p:contact>
                <p:bezoekAdres>
                    <p:adres><xsl:value-of select="ios:Address"/></p:adres>
                </p:bezoekAdres>
                <p:emailadress><xsl:value-of select="ios:ElectronicMailAddress"/></p:emailadress>
                <p:telefoon><xsl:value-of select="ios:Telephone"/></p:telefoon>
                <p:beschrijving><xsl:value-of select="ios:Description"/></p:beschrijving>
                
          </p:contact>
          <p:functies>
                <p:functiesType>
                    <p:functie>
                        <p:medewerkers>
                             <p:medewerkersType> 
                                <p:medewerker><xsl:value-of select="substring-after(ios:ContactPerson,'')"/></p:medewerker>
                            </p:medewerkersType>
                        </p:medewerkers>
                    </p:functie>

                </p:functiesType>

          </p:functies>

         

        </p:organisatie>
    </xsl:template>

</xsl:stylesheet>