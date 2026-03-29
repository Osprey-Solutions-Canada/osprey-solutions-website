$footer = @'
  <footer class="border-t border-navy-700 py-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="grid md:grid-cols-4 gap-12">
        <div class="md:col-span-1">
          <div class="mb-4"><img src="/osprey-logo.webp" alt="Osprey Solutions" class="h-10 w-auto"></div>
          <p class="text-muted text-sm mb-4">Helping local businesses get more calls, more customers, and more revenue.</p>
          <p class="text-muted text-sm">Vernon, BC &middot; Serving North America</p>
        </div>
        <div>
          <h4 class="font-heading font-bold text-white mb-4">Services</h4>
          <ul class="space-y-2 text-sm text-muted">
            <li><a href="/services/google-business-management.html" class="hover:text-white transition-colors">Google Business Management</a></li>
            <li><a href="/services/google-ads.html" class="hover:text-white transition-colors">Google Ads</a></li>
            <li><a href="/services/ai-voice-agents.html" class="hover:text-white transition-colors">AI Voice Agents</a></li>
            <li><a href="/services/roofquote.html" class="hover:text-white transition-colors">RoofQuote</a></li>
            <li><a href="/services/website-design.html" class="hover:text-white transition-colors">Website Design</a></li>
            <li><a href="/services/seo-content.html" class="hover:text-white transition-colors">SEO Content Engine</a></li>
          </ul>
        </div>
        <div>
          <h4 class="font-heading font-bold text-white mb-4">Industries</h4>
          <ul class="space-y-2 text-sm text-muted">
            <li><a href="/industries/contractors.html" class="hover:text-white transition-colors">Contractors &amp; Home Services</a></li>
            <li><a href="/industries/restaurants.html" class="hover:text-white transition-colors">Restaurants &amp; Caf&eacute;s</a></li>
            <li><a href="/industries/salons.html" class="hover:text-white transition-colors">Hair Salons &amp; Beauty</a></li>
            <li><a href="/industries/professional-services.html" class="hover:text-white transition-colors">Professional Services</a></li>
            <li><a href="/industries/movers.html" class="hover:text-white transition-colors">Moving Companies</a></li>
            <li><a href="/industries/ecommerce.html" class="hover:text-white transition-colors">E-Commerce &amp; Retail</a></li>
          </ul>
        </div>
        <div>
          <h4 class="font-heading font-bold text-white mb-4">Get In Touch</h4>
          <ul class="space-y-3 text-sm text-muted">
            <li><a href="tel:+17789100756" class="flex items-center gap-2 hover:text-white transition-colors"><svg class="w-4 h-4 text-cta" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/></svg>(778) 910-0756</a></li>
            <li><a href="mailto:tyson@osprey.solutions" class="flex items-center gap-2 hover:text-white transition-colors"><svg class="w-4 h-4 text-accent" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/></svg>tyson@osprey.solutions</a></li>
            <li><a href="https://calendar.osprey.solutions" target="_blank" class="flex items-center gap-2 hover:text-white transition-colors"><svg class="w-4 h-4 text-green-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>Book a Free Call</a></li>
          </ul>
        </div>
      </div>
      <div class="border-t border-navy-700 mt-12 pt-8 flex flex-col sm:flex-row items-center justify-between gap-4">
        <p class="text-muted text-sm">&copy; 2026 Osprey Solutions. All rights reserved.</p>
        <div class="flex gap-6 text-sm text-muted">
          <a href="/privacy" class="hover:text-white transition-colors">Privacy Policy</a>
          <a href="/terms" class="hover:text-white transition-colors">Terms of Service</a>
        </div>
      </div>
    </div>
  </footer>
'@

# Process all pages EXCEPT index.html (it already has the right footer)
$files = @()
$files += Get-ChildItem "G:\OpenClaw\workspace\osprey-website\services\*.html"
$files += Get-ChildItem "G:\OpenClaw\workspace\osprey-website\industries\*.html"
$files += Get-ChildItem "G:\OpenClaw\workspace\osprey-website\blog\*.html"
$files += Get-Item "G:\OpenClaw\workspace\osprey-website\google-for-business.html"

$fixed = 0
foreach ($f in $files) {
    $c = Get-Content $f.FullName -Raw -Encoding UTF8
    
    # Fix image paths — ../assets/ -> /assets/
    $c = $c -replace "url\('\.\./assets/", "url('/assets/"
    $c = $c -replace 'url\("\.\./assets/', 'url("/assets/'
    
    # Replace the footer — match from <footer to </footer>
    if ($c -match '(?s)<footer.*?</footer>') {
        $c = $c -replace '(?s)<footer.*?</footer>', $footer.Trim()
        $fixed++
    }
    
    [System.IO.File]::WriteAllText($f.FullName, $c, [System.Text.Encoding]::UTF8)
}

Write-Host "Fixed footers + image paths in $fixed pages"
