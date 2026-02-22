<?xml version="1.0" encoding="UTF-8" ?>
<!-- Character contacts -->
<!-- Version -500 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:template name="Qualities">
    <xsl:param name="quality_type" />
    <xsl:param name="condition" />
	
    <xsl:variable name="qualcount" select="number(count(qualities/quality[qualitytype_english=$quality_type]))" />

    <xsl:for-each select="qualities/quality[qualitytype_english=$quality_type]">
      <xsl:sort select="name" />
      <xsl:if test="(position()*2 &gt; $qualcount and $condition - 0) or ((false() = position()*2 &gt; $qualcount) and $condition - 1)">
      <tr style="text-align: left" valign="top">
        <xsl:if test="position() mod 2 != 1">
          <xsl:attribute name="bgcolor">#e4e4e4</xsl:attribute>
        </xsl:if>
        <td>
          <xsl:value-of select="name" />
          <xsl:if test="extra != ''">: <xsl:value-of select="extra" /></xsl:if>
        </td>
        <td />
        <td style="text-align: center">
          <xsl:value-of select="source" />
          <xsl:text> </xsl:text>
          <xsl:value-of select="page" />
        </td>
      </tr>
      <xsl:if test="notes != '' and $ProduceNotes">
        <tr>
          <xsl:if test="position() mod 2 != 1">
            <xsl:attribute name="bgcolor">#e4e4e4</xsl:attribute>
          </xsl:if>
          <td colspan="100" style="padding: 0 2%; text-align: justify;">
            <xsl:call-template name="PreserveLineBreaks">
              <xsl:with-param name="text" select="notes" />
            </xsl:call-template>
          </td>
        </tr>
      </xsl:if>
      <xsl:call-template name="Xline">
        <xsl:with-param name="cntl" select="last()-position()" />
        <xsl:with-param name="nte" select="notes != '' and $ProduceNotes" />
      </xsl:call-template>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="$qualcount mod 2 = 1 and $condition - 1">
      <tr style="text-align: left" valign="top">
        <td>
          <xsl:text>→</xsl:text>
        </td>
        <td />
        <td style="text-align: center">
          <xsl:text>→</xsl:text>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
