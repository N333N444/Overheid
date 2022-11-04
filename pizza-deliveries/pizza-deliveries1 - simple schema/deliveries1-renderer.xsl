<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:del="http://www.example.org/deliveries1">
	<xsl:template match="/">
	
		<html>
			<body>
				<h1>Deliveries</h1>
				
				<xsl:for-each select="//del:delivery">
					
					<h3><xsl:value-of select="del:item"/> (<xsl:value-of select="@time"/>)</h3>
					
					From <b><xsl:value-of select="del:seller"/></b> to <b><xsl:value-of select="del:buyer"/></b>
					
				</xsl:for-each>
				
			</body>
		</html>
		
	</xsl:template>
</xsl:stylesheet>