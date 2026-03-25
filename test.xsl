<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:user="urn:my-scripts">

    <xsl:output method="text" />

    <msxsl:script language="JScript" implements-prefix="user">
        function hello() {
            return "Hello from JScript inside XSL!";
        }
    </msxsl:script>

    <xsl:template match="/">
        <xsl:text>WMIC XSL POC Output:</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:value-of select="user:hello()" />
    </xsl:template>

</xsl:stylesheet>
