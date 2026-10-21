# Downloads the design images from Figma into .\assets
# Run once in PowerShell:  .\download-assets.ps1   (Figma links expire ~28 Oct 2026)
$P = "https://www.figma.com/api/mcp/asset/ce66cd01-bcf7-477e-b248-691169f33fbe"
$dir = Join-Path $PSScriptRoot "assets"; New-Item -ItemType Directory -Force -Path $dir | Out-Null
$map = @"
a88e6.svg icon-search.svg
5a001.svg nav-home.svg
2bdb4.svg nav-search.svg
3578e.svg nav-add.svg
3276f.svg nav-posts.svg
e8284.svg nav-user.svg
fb501.svg arrow.svg
8f70f.svg arrow-dark.svg
2cbea.svg status-icons.svg
ed0d1.png logo.png
44c9c.png avatar.png
74967.png event-left.png
bb2fd.png event-center.png
c93c3.png event-right.png
52ad2.png qa-recharge.png
8e1ff.png qa-bills.png
997b7.png qa-experts.png
424de.png qa-market.png
1e8bd.png cat-properties.png
56c2e.png cat-vehicles.png
d2aa4.png cat-home-services.png
34aa1.png cat-market.png
2a638.png cat-events.png
6d750.png cat-education.png
cf461.png cat-health.png
596f8.png cat-news.png
1ebe5.png fire.png
191e4.png deal-1.png
cbd31.png deal-2.png
94f67.png deal-3.png
04cc4.png deal-4.png
44045.png deal-5.png
3bc2f.png property-1.png
1b3ca.png property-2.png
1da3a.png property-3.png
b77d3.png market-1.png
7c255.png market-2.png
b17ed.png market-3.png
d38a7.png market-4.png
2d65e.png market-5.png
f3ddb.png vehicle-1.png
126f0.png vehicle-2.png
58082.png vehicle-3.png
6e6cc.png news-1.png
b77d8.png news-2.png
"@
foreach ($line in $map -split "`n") {
  $id, $name = $line.Trim() -split " "
  try { Invoke-WebRequest -Uri "$P/$id" -OutFile (Join-Path $dir $name) -UseBasicParsing; Write-Host "ok    $name" }
  catch { Write-Host "FAIL  $name" }
}
