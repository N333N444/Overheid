<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:del="http://www.example.org/deliveries4"
	xmlns:adr="http://xml.coverpages.org/HR-XML-PostalAddress-1_2">

	<xsl:template match="/">
		<adr:PostalAddressList xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://xml.coverpages.org/HR-XML-PostalAddress-1_2 PostalAddress-1_2.xsd">
			<xsl:apply-templates select="//del:address" />
		</adr:PostalAddressList>
	</xsl:template>

	<xsl:template match="del:address">
	
		<adr:PostalAddress type="streetAddress">
			<adr:CountryCode><xsl:value-of select="del:country"/></adr:CountryCode>
			<adr:PostalCode><xsl:value-of select="del:zip"/></adr:PostalCode>
			<adr:Municipality><xsl:value-of select="del:city"/></adr:Municipality>
			<adr:DeliveryAddress>
				<adr:StreetName><xsl:value-of select="substring-before(del:street, ' ')"/></adr:StreetName>
				<adr:BuildingNumber><xsl:value-of select="substring-after(del:street, ' ')"/></adr:BuildingNumber>
				<!-- for more XPath functions see e.g. https://www.w3schools.com/xml/xsl_functions.asp -->
			</adr:DeliveryAddress>
		</adr:PostalAddress>	
	
	</xsl:template>

</xsl:stylesheet>