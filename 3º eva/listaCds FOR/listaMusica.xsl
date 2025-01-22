<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/">
  <html>
  <body>
  <h1>Lista Musica</h1>
   <table>
     <tr bgcolor="#2aa0cb">
    <th>Título</th>
    <th>Artista</th>
    <th>titulo Cancion </th>
    <th>duracion Cancion </th>
    <th>sello</th>
    <th>year</th>
  </tr>
  <xsl:for-each select="listaMusica/cd">
  <tr>
    <td><xsl:value-of select="titulo"/></td>
    <td><xsl:value-of select="artista"/></td>
    <td>
    <xsl:for-each select="cancion">
      <xsl:value-of select="tituloCancion"/><br/>
    </xsl:for-each>
    </td>
    <td>
    <xsl:for-each select="cancion">
      <xsl:value-of select="tiempoCancion"/><br/>
    </xsl:for-each>
    </td>
    <td><xsl:value-of select="sello"/></td>
    <td><xsl:value-of select="yr"/></td>
 </tr>   
  </xsl:for-each>
  </table>
  </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
