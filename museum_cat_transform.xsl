<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Каталог Музеи</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
      </head>
      <script>
        var region = 0;
        var scope = 0;
        var type = 0;

        function showCollection(list) {
          for (var i = 0; i &lt; list.length; i++){
            list[i].style.display = 'block';
          }
        }

        function hideCollection(list) {
          for (var i = 0; i &lt; list.length; i++){
            list[i].style.display = 'none';
          }
        }

        function sortRegions() {
          ++region;
          showCollection(document.getElementsByClassName("region" + (region % 3 + 1)));
          hideCollection(document.getElementsByClassName("region" + ((region + 1) % 3 + 1)));
          hideCollection(document.getElementsByClassName("region" + ((region + 2) % 3 + 1)));
        };
        function sortScope() {
          ++scope;
          showCollection(document.getElementsByClassName("scope" + (scope % 3 + 1)));
          hideCollection(document.getElementsByClassName("scope" + ((scope + 1) % 3 + 1)));
          hideCollection(document.getElementsByClassName("scope" + ((scope + 2) % 3 + 1)));
        };
        function sortType() {
          ++type;
          showCollection(document.getElementsByClassName("type" + (type % 6 + 1)));
          hideCollection(document.getElementsByClassName("type" + ((type + 1) % 6 + 1)));
          hideCollection(document.getElementsByClassName("type" + ((type + 2) % 6 + 1)));
          hideCollection(document.getElementsByClassName("type" + ((type + 3) % 6 + 1)));
          hideCollection(document.getElementsByClassName("type" + ((type + 4) % 6 + 1)));
          hideCollection(document.getElementsByClassName("type" + ((type + 5) % 6 + 1)));
        };
      </script>
      <body>
        <div class="flex justify-between">
          <h1>Каталог Музеи</h1>
          <div class="flex flex-row">
            <button class="button" onclick="sortRegions();">
              Региони
            </button>
            <button class="button" onclick="sortScope()">
              Обхват
            </button>
            <button class="button" onclick="sortType()">
              Тип
            </button>
          </div>
        </div>
        <div class="flex flex-row">
          <div class="flex small-grow"></div>
          <div class="flex full-grow flex-col">
            <xsl:for-each select="museum-catalog/museum-list/museum">
              <div class="flex flex-col container region{regionId} scope{scopeID} type{typeID}">
                <div class="museum-header"><xsl:value-of select="name" /></div>
                <div class="flex flex-row">
                  <img src="images/{id}.jpg"/>
                  <div class="flex flex-col">
                    <div class="museum-description"><xsl:value-of select="description" /></div>
                    <div class="flex flex-row justify-around">
                      <div class="flex flex-col justify-around">
                        <a class="website" href="{website/@href}">
                          <xsl:value-of select="website/@href" />
                        </a>
                        <div class="phone"><xsl:value-of select="phone" /></div>
                      </div>
                      <div class="address"><xsl:value-of select="address" /></div>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </div>
          <div class="flex small-grow"></div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
