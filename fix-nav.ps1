$nav = @'
<nav class="fixed top-0 left-0 right-0 z-50 nav-blur">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex items-center justify-between h-16 lg:h-20">
      <a href="/"><img src="/osprey-logo.webp" alt="Osprey Solutions" class="h-14 lg:h-[70px] w-auto"></a>
      <div class="hidden lg:flex items-center gap-8">
        <a href="/google-for-business.html" class="text-accent hover:text-white transition-colors text-sm font-semibold">Google for Business</a>
        <div class="relative group">
          <a href="/#services" class="text-muted hover:text-white transition-colors text-sm font-medium flex items-center gap-1">Services <svg class="w-3 h-3 transition-transform group-hover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/></svg></a>
          <div class="absolute top-full left-0 mt-2 w-64 rounded-xl bg-navy-800 border border-navy-600 shadow-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 py-2">
            <a href="/services/google-business-management.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Google Business Profile</a>
            <a href="/services/google-ads.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Google Ads</a>
            <a href="/services/ai-voice-agents.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">AI Voice Agents</a>
            <a href="/services/roofquote.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">RoofQuote</a>
            <a href="/services/website-design.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Website Design</a>
            <a href="/services/seo-content.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">SEO Content Engine</a>
          </div>
        </div>
        <div class="relative group">
          <a href="/#industries" class="text-muted hover:text-white transition-colors text-sm font-medium flex items-center gap-1">Industries <svg class="w-3 h-3 transition-transform group-hover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/></svg></a>
          <div class="absolute top-full left-0 mt-2 w-64 rounded-xl bg-navy-800 border border-navy-600 shadow-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 py-2">
            <a href="/industries/contractors.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Contractors &amp; Home Services</a>
            <a href="/industries/restaurants.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Restaurants &amp; Caf&eacute;s</a>
            <a href="/industries/salons.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Hair Salons &amp; Beauty</a>
            <a href="/industries/professional-services.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Professional Services</a>
            <a href="/industries/ecommerce.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">E-Commerce &amp; Retail</a>
            <a href="/industries/movers.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Moving Companies</a>
            <a href="/industries/entertainment.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Entertainment &amp; Recreation</a>
            <a href="/industries/print-shops.html" class="block px-4 py-2.5 text-sm text-muted hover:text-white hover:bg-navy-700 transition-colors">Print Shops &amp; Signage</a>
          </div>
        </div>
        <a href="/blog/" class="text-muted hover:text-white transition-colors text-sm font-medium">Blog</a>
        <a href="tel:+17789100756" class="text-white font-semibold flex items-center gap-2">
          <svg class="w-4 h-4 text-cta" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/></svg>
          (778) 910-0756
        </a>
        <a href="https://calendar.osprey.solutions" target="_blank" class="cta-btn text-white font-semibold px-6 py-2.5 rounded-lg text-sm" style="background:linear-gradient(135deg,#e8781f,#c95f10)">Book Free Call</a>
      </div>
      <button id="mobile-toggle" class="lg:hidden text-white p-2">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/></svg>
      </button>
    </div>
  </div>
  <div id="mobile-menu" class="lg:hidden hidden bg-navy-800 border-t border-navy-600 px-4 py-6 space-y-4">
    <a href="/google-for-business.html" class="block text-accent hover:text-white transition-colors font-semibold">Google for Business</a>
    <div class="block text-white font-medium mt-2">Services</div>
    <div class="pl-4 space-y-2">
      <a href="/services/google-business-management.html" class="block text-sm text-muted hover:text-accent transition-colors">Google Business Profile</a>
      <a href="/services/google-ads.html" class="block text-sm text-muted hover:text-accent transition-colors">Google Ads</a>
      <a href="/services/ai-voice-agents.html" class="block text-sm text-muted hover:text-accent transition-colors">AI Voice Agents</a>
      <a href="/services/roofquote.html" class="block text-sm text-muted hover:text-accent transition-colors">RoofQuote</a>
      <a href="/services/website-design.html" class="block text-sm text-muted hover:text-accent transition-colors">Website Design</a>
      <a href="/services/seo-content.html" class="block text-sm text-muted hover:text-accent transition-colors">SEO Content</a>
    </div>
    <div class="block text-white font-medium mt-2">Industries</div>
    <div class="pl-4 space-y-2">
      <a href="/industries/contractors.html" class="block text-sm text-muted hover:text-accent transition-colors">Contractors</a>
      <a href="/industries/restaurants.html" class="block text-sm text-muted hover:text-accent transition-colors">Restaurants</a>
      <a href="/industries/salons.html" class="block text-sm text-muted hover:text-accent transition-colors">Salons</a>
      <a href="/industries/professional-services.html" class="block text-sm text-muted hover:text-accent transition-colors">Professional Services</a>
      <a href="/industries/ecommerce.html" class="block text-sm text-muted hover:text-accent transition-colors">E-Commerce</a>
      <a href="/industries/movers.html" class="block text-sm text-muted hover:text-accent transition-colors">Movers</a>
      <a href="/industries/entertainment.html" class="block text-sm text-muted hover:text-accent transition-colors">Entertainment</a>
      <a href="/industries/print-shops.html" class="block text-sm text-muted hover:text-accent transition-colors">Print Shops</a>
    </div>
    <a href="/blog/" class="block text-muted hover:text-white transition-colors font-medium">Blog</a>
    <div class="pt-4 border-t border-navy-600 space-y-3">
      <a href="tel:+17789100756" class="block text-cta font-semibold text-lg">(778) 910-0756</a>
      <a href="https://calendar.osprey.solutions" target="_blank" class="block text-center text-white font-semibold px-6 py-3 rounded-lg" style="background:linear-gradient(135deg,#e8781f,#c95f10)">Book Free Strategy Call</a>
    </div>
  </div>
</nav>
'@

# Process all pages EXCEPT index.html (it already has the right nav)
$files = @()
$files += Get-ChildItem "G:\OpenClaw\workspace\osprey-website\services\*.html"
$files += Get-ChildItem "G:\OpenClaw\workspace\osprey-website\industries\*.html"
$files += Get-ChildItem "G:\OpenClaw\workspace\osprey-website\blog\*.html"
$files += Get-Item "G:\OpenClaw\workspace\osprey-website\google-for-business.html"

$fixed = 0
foreach ($f in $files) {
    $c = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($c -match '(?s)<nav.*?</nav>') {
        $c = [regex]::Replace($c, '(?s)<nav.*?</nav>', $nav.Trim(), [System.Text.RegularExpressions.RegexOptions]::Singleline)
        [System.IO.File]::WriteAllText($f.FullName, $c, [System.Text.Encoding]::UTF8)
        $fixed++
    }
}

Write-Host "Updated nav in $fixed pages"
