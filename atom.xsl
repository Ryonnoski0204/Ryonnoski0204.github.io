<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" encoding="utf-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="zh-CN">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <title><xsl:value-of select="atom:feed/atom:title"/> · 订阅源</title>
        <style>
          :root{--bg:#efefef;--card:#fff;--text:#555;--strong:#000;--muted:#999;--accent:#23b7e5;--border:#ececec}
          *{box-sizing:border-box}
          body{margin:0;background:var(--bg);color:var(--text);line-height:1.7;
            font-family:"Source Sans Pro","Hiragino Sans GB","Microsoft YaHei",SimSun,Helvetica,Arial,sans-serif}
          .wrap{max-width:760px;margin:0 auto;padding:40px 20px 60px}
          .head{background:var(--card);border-radius:12px;box-shadow:0 1px 4px 1px rgba(0,0,0,.06);padding:28px 30px;margin-bottom:24px}
          .badge{display:inline-block;font-size:12px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;
            color:var(--accent);background:rgba(35,183,229,.1);padding:4px 10px;border-radius:20px}
          h1{margin:14px 0 6px;font-size:26px;color:var(--strong);font-weight:800}
          .sub{color:var(--muted);font-size:14px;margin:0}
          .tip{margin-top:14px;font-size:13px;color:var(--muted);border-top:1px solid var(--border);padding-top:14px}
          .tip code{background:var(--bg);padding:2px 6px;border-radius:4px;color:var(--accent)}
          .item{background:var(--card);border-radius:12px;box-shadow:0 1px 4px 1px rgba(0,0,0,.06);padding:20px 24px;margin-bottom:16px}
          .item h2{margin:0 0 6px;font-size:18px}
          .item h2 a{color:var(--strong);text-decoration:none}
          .item h2 a:hover{color:var(--accent)}
          .date{font-size:12.5px;color:var(--muted)}
          .summary{margin:10px 0 0;font-size:14px;color:var(--text)}
          .foot{text-align:center;color:var(--muted);font-size:13px;margin-top:30px}
          .foot a{color:var(--accent);text-decoration:none}
        </style>
      </head>
      <body>
        <div class="wrap">
          <div class="head">
            <span class="badge">RSS / Atom 订阅源</span>
            <h1><xsl:value-of select="atom:feed/atom:title"/></h1>
            <p class="sub"><xsl:value-of select="atom:feed/atom:subtitle"/></p>
            <p class="tip">这是站点的订阅源页面。复制本页地址到任意 RSS 阅读器（如 Feedly、Inoreader、NetNewsWire）即可订阅，文章更新会自动推送。</p>
          </div>
          <xsl:for-each select="atom:feed/atom:entry">
            <div class="item">
              <h2>
                <a target="_blank">
                  <xsl:attribute name="href"><xsl:value-of select="atom:link/@href"/></xsl:attribute>
                  <xsl:value-of select="atom:title"/>
                </a>
              </h2>
              <div class="date"><xsl:value-of select="substring(atom:updated,1,10)"/></div>
              <p class="summary"><xsl:value-of select="atom:summary"/></p>
            </div>
          </xsl:for-each>
          <div class="foot">
            由 <a href="https://hexo.io/">Hexo</a> 与「一隅」主题生成 ·
            <a><xsl:attribute name="href"><xsl:value-of select="atom:feed/atom:link[@rel='alternate']/@href"/></xsl:attribute>访问站点</a>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
