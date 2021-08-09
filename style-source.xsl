<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" cdata-section-elements="description" encoding="UTF-8" />

	<xsl:template match="/rss/channel">
		<html lang="nl">
			<head>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<link rel="stylesheet" type="text/css" href="style.css?v=8"></link>
				<meta name="description" content="{ title } - { description }" />
				<link rel="alternate" type="application/rss+xml" title="{ title }" href="podcast.xml" />
				<link rel="shortcut icon" href="favicon.ico"></link>
				<title><xsl:value-of select="title" /></title>
			</head>

			<body>
				<div class="logo">
					<img src="logo-drig.svg" alt="Logo 'De Rest Is Geschiedenis'" width="163" height="163" />
				</div>
				<div class="main">
					<section class="introduction">
						<h1><xsl:value-of select="title" /></h1>
						<p class="podcastDescription"><xsl:value-of select="description" /></p>

						<p>
							<b>Abonneer</b> op deze podcast via <a class="textlink" href="https://podcasts.apple.com/nl/podcast/de-rest-is-geschiedenis/id1517155449">iTunes</a>,
							<a class="textlink" href="https://open.spotify.com/show/2Kvn8qXKPrY6XHHiOCYtkt">Spotify</a>,
							<a class="textlink" href="https://podcasts.google.com/feed/aHR0cHM6Ly9idWZmLmx5LzJ6WWRkcGY">Google Podcasts</a> of
							<a class="textlink" href="https://www.iheart.com/podcast/269-de-rest-is-geschiedenis-65031930/">iHeartRadio</a>.
							Degenen die liever direct abonneren via podcast feeds kunnen dat met deze link: <span class="rssLink">http://derestisgeschiedenis.nl/podcast.xml</span>
						</p>

						<p>
							<b>Deel</b> deze podcast als je 'm leuk vindt en wil dat anderen dit ook ontdekken. Laat een review achter in je podcast app en deel deze pagina op social media.
						</p>
					</section>

          
					<ul class="posts">
						<xsl:for-each select="./item">
							<li>
								<h2>
									<a href="{ substring-after(*[local-name()='image']/@href,'derestisgeschiedenis.nl/') }" title="Bekijk afbeelding" class="episode-cover">
										<picture>
											<xsl:if test="contains(*[local-name()='webimage']/@href, 'jpg')">
										  	<source srcset="{
													concat(
														substring-before(*[local-name()='webimage']/@href,'.jpg'),
														'.avif',
														substring-after(*[local-name()='webimage']/@href,'.jpg')
													)}" type="image/avif" />
										  	<source srcset="{
													concat(
														substring-before(*[local-name()='webimage']/@href,'.jpg'),
														'.webp',
														substring-after(*[local-name()='webimage']/@href,'.jpg')
													)}" type="image/webp" />
											</xsl:if>
  										<img src="{ *[local-name()='webimage']/@href }" width="400" height="400" alt="" loading="lazy" />
										</picture>
									</a>
									<span class="episode-title"><xsl:value-of select="title" /></span>
								</h2>
								<div class="play-box">
									<div class="play-box__link">
										<a href="{ substring-after(*[local-name()='content']/@url,'derestisgeschiedenis.nl/') }">
											Beluister
											<span class="hideOnMobile">aflevering</span>
										</a>
									</div>
									<time class="time" datetime="{ *[local-name()='duration'] }">duur: <xsl:value-of select="*[local-name()='duration']" /></time>
								</div>
								<p>
									<time class="pubDate" datetime="{ pubDate }"><xsl:value-of select="pubDateNL" /></time>
									<xsl:value-of select="description" />
								</p>
							</li>
						</xsl:for-each>
					</ul>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>