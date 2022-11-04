<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:del="http://www.example.org/deliveries3">

	<xsl:template match="/">
	
		<html>
			<head>
				<style>
					body {
  						background-color: linen;
  						padding-left: 40px;
  						padding-right: 40px;
  						font-family: Helvetica;
					}

					h1 {
  						color: maroon;
  						padding: 10px;
  						border-style: solid;
  						border-width: 2px;
  						border-color: gray;
					}
					
					div.deliv {
						padding: 10px;
						margin-bottom: 20px;
						background-color: #f7cac9;
					}

					div.item {
						margin-top: 10px;
						margin-bottom: 10px;
						padding: 5px;
						font-size: 16pt;
					}

					div.totalPrice {
						margin-top: 0px;
						margin-bottom: 10px;
						padding: 5px;
					}

					div.adress {
						margin-top: 10px;
						margin-bottom: 10px;
						margin-right: 50%;
						padding: 5px;
						background-color: lightGray;
					}
				</style>			
			</head>
			<body>
				<h1>Deliveries</h1>
				
				<xsl:for-each select="//del:delivery">
				
					<div class="deliv">
					
						<div class="delivTime">
							<xsl:value-of select="./@time"/>
						</div>
					
						<xsl:apply-templates select="./del:item"/>
						
						<xsl:if test="count(./del:item) > 1">
							<div class="totalPrice">
								(Total price: <xsl:value-of select="sum(./del:item/@price)"/> €)
							</div>
						</xsl:if>
						
						<div class="adress">
							<!-- mind "current()" in the following, it is the outer "." -->
							From: <xsl:apply-templates select="//del:address[@id = current()/del:seller]"/>
						</div>
						
						<div class="adress">
							To: <xsl:apply-templates select="//del:address[@id = current()/del:buyer]"/>
						</div>
						
						<img src="{//del:address[@id=./del:buyer]/del:idImage/@location}"/>
					
					</div>
					
				</xsl:for-each>
				
			</body>
		</html>
		
	</xsl:template>
	
	<xsl:template match="del:item">
		<div class="item">
			<xsl:value-of select="."/> (<xsl:value-of select="@price"/> €)
		</div>
	</xsl:template>
	
	<xsl:template match="del:address">
		<xsl:value-of select="del:name"/>
			
		<xsl:if test="del:idImage">
			<img src="{del:idImage/@location}" width="150" align="top"/>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>