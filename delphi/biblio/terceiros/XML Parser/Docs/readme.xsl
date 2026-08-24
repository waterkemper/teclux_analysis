<?xml version="1.0" encoding="ISO8859-1" ?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
    <xsl:template match="/">
      <html>
        <body>
          <table width="760" border="0">
            <tr>
              <td colspan="3">
                <table bgcolor="#31639C" width="100%">
                  <tr>
                    <td>
                      <center>
                        <font color="#ffffff" size="15" style="font-weight: strong;">
                          <xsl:value-of select="component_readme/creator/company"/>
                        </font>
                      </center>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td colspan="3" width="290">
                <h2>
                  <xsl:value-of select="component_readme/name"/>
                </h2>
              </td>
            </tr>
            <tr>
              <td width="200" colspan="2">
                <h3>
                  Author:
                  <xsl:value-of select="component_readme/creator/name"/>
                </h3>
              </td>
              <td width="560">
                <h3>
                  email:
                  <xsl:value-of select="component_readme/creator/email"/>
                </h3>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  License and copyright:
                </b>
                <br/>
                <xsl:value-of select="component_readme/name"/>
                <font>
                  is a freeware component,
you can use it in your commercial or non-commercial applications for free as long as you let me know that you are using it.
                </font>
                <br/>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  Summary:
                </b>
                <br/>
                <xsl:value-of select="component_readme/summary"/>
                <br/>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  History:
                </b>
                <br/>
                <table border="1" width="100%">
                  <tr>
                    <th>
                      Date
                    </th>
                    <th>
                      Version
                    </th>
                    <th>
                      Features
                    </th>
                  </tr>
                  <xsl:for-each select="component_readme/history/version">
                    <tr>
                      <td valign="top" width="130">
                        <xsl:value-of select="date"/>
                      </td>
                      <td valign="top">
                        <xsl:value-of select="number"/>
                      </td>
                      <td valign="top">
                        <table>
                          <xsl:apply-templates/>
                          <xsl:for-each select="feature">
                            <tr>
                              <td>
                                <xsl:value-of select="text()"/>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </table>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  Properties:
                </b>
                <br/>
                <table border="1" width="100%">
                  <tr>
                    <th>
                      Name
                    </th>
                    <th>
                      Description
                    </th>
                  </tr>
                  <xsl:for-each select="component_readme/properties/property">
                    <tr>
                      <td valign="top" width="130">
                        <xsl:value-of select="name"/>
                      </td>
                      <td valign="top">
                        <xsl:value-of select="description"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  Functions:
                </b>
                <br/>
                <table border="1" width="100%">
                  <tr>
                    <th>
                      Name
                    </th>
                    <th>
                      Description
                    </th>
                  </tr>
                  <xsl:for-each select="component_readme/functions/function">
                    <tr>
                      <td valign="top" width="130">
                        <xsl:value-of select="name"/>
                      </td>
                      <td valign="top">
                        <xsl:value-of select="description"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  Methods:
                </b>
                <br/>
                <table border="1" width="100%">
                  <tr>
                    <th>
                      Name
                    </th>
                    <th>
                      Description
                    </th>
                  </tr>
                  <xsl:for-each select="component_readme/methods/method">
                    <tr>
                      <td valign="top" width="130">
                        <xsl:value-of select="name"/>
                      </td>
                      <td valign="top">
                        <xsl:value-of select="description"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  Events:
                </b>
                <br/>
                <table border="1" width="100%">
                  <tr>
                    <th>
                      Name
                    </th>
                    <th>
                      Description
                    </th>
                  </tr>
                  <xsl:for-each select="component_readme/events/event">
                    <tr>
                      <td valign="top" width="130">
                        <xsl:value-of select="name"/>
                      </td>
                      <td valign="top">
                        <xsl:value-of select="description"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <b>
                  Important information:
                </b>
                <br/>
                <xsl:for-each select="component_readme/cinfo">
                  <tr>
                    <td valign="top" colspan="3">
                      <xsl:value-of select="text()"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </td>
            </tr>
          </table>
        </body>
      </html>
    </xsl:template>
  </xsl:stylesheet>
