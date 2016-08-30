<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <xsl:for-each select="events/event">
      <div class="events-table">
        <table>
          <tr>
            <td rowspan="3">
              <i class="fa fa-calendar fa-3x" aria-hidden="true"></i>
            </td>
            <td>
              <b>Event Name</b>
            </td>
            <td>
              <xsl:value-of select="title"/>
            </td>
          </tr>
          <tr>
            <td>
              <b>Event Date</b>
            </td>
            <td>
              <xsl:value-of select="date"/>
            </td>
          </tr>
          <tr>
            <td>
              <b>Event Location</b>
            </td>
            <td>
              <xsl:value-of select="location"/>
            </td>
          </tr>
        </table>
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
