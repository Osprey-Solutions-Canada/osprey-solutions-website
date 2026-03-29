# Build remaining 9 blog pages from markdown
# Articles 07-15

$articles = @(
  @{file='07-digital-marketing-cost-contractors.md'; slug='digital-marketing-cost-contractors'; title='How Much Does Digital Marketing Cost for Contractors?'; metaTitle='Digital Marketing Cost for Contractors | 2026 Pricing Guide'; metaDesc='What should contractors pay for Google Ads, GBP management, SEO, and websites? Real pricing from an agency managing 100+ accounts.'; keyword='digital marketing cost contractors'},
  @{file='08-gbp-costing-you-leads.md'; slug='gbp-costing-you-leads'; title='5 Google Business Profile Mistakes Costing You Leads'; metaTitle='5 GBP Mistakes Costing You Leads | Fix Them Today'; metaDesc='Your Google Business Profile is probably losing you calls right now. Here are the 5 most common mistakes and exactly how to fix each one.'; keyword='google business profile mistakes'},
  @{file='09-case-study-3x-leads.md'; slug='case-study-3x-leads'; title='How We Helped a Roofer 3x Their Leads in 90 Days'; metaTitle='Roofing Case Study: 3x Leads in 90 Days | Osprey Solutions'; metaDesc='Real results from a real roofing client. How we tripled their monthly leads in 90 days using Google Ads optimization and GBP management.'; keyword='roofing lead generation case study'},
  @{file='10-meta-vs-google-ads.md'; slug='meta-vs-google-ads'; title='Meta Ads vs Google Ads for Contractors: Which Is Better?'; metaTitle='Meta vs Google Ads for Contractors | Which Gets More Leads?'; metaDesc='Should contractors spend on Facebook/Meta ads or Google Ads? We manage both for 100+ clients. Here is the real data on which performs better.'; keyword='meta vs google ads contractors'},
  @{file='11-ai-replacing-answering-services.md'; slug='ai-replacing-answering-services'; title='Why AI Voice Receptionists Are Replacing Answering Services in 2026'; metaTitle='AI Replacing Answering Services in 2026 | The Shift Is Here'; metaDesc='Traditional answering services charge per minute and read scripts. AI voice agents cost less and do more. Here is why contractors are switching.'; keyword='ai replacing answering services'},
  @{file='12-ai-search-optimization-contractors.md'; slug='ai-search-optimization-contractors'; title='AI Search Optimization: How to Get Recommended by ChatGPT'; metaTitle='AI Search Optimization for Contractors | Get Found by ChatGPT'; metaDesc='ChatGPT processes 2.5 billion prompts daily and recommends local businesses. Here is how to make sure it recommends yours.'; keyword='ai search optimization contractors'},
  @{file='13-why-83-contractors-trust-us.md'; slug='why-contractors-trust-us'; title='Why 100+ Local Businesses Trust Osprey Solutions'; metaTitle='Why 100+ Businesses Trust Osprey Solutions | Our Story'; metaDesc='From 1 client to 100+. How Osprey Solutions became the go-to digital marketing partner for contractors and local businesses across North America.'; keyword='osprey solutions reviews'},
  @{file='14-contractor-website-design.md'; slug='contractor-website-design'; title='Contractor Website Design That Actually Generates Leads'; metaTitle='Contractor Website Design | Sites That Generate Calls'; metaDesc='Most contractor websites are digital brochures that generate zero leads. Here is how to build one that actually makes your phone ring.'; keyword='contractor website design'},
  @{file='15-roofquote-vs-skyquote-eagleview.md'; slug='roofquote-vs-skyquote-eagleview'; title='RoofQuote vs SkyQuote vs EagleView: Honest Comparison'; metaTitle='RoofQuote vs SkyQuote vs EagleView | 2026 Comparison'; metaDesc='Comparing instant roof estimate tools for contractors. Features, pricing, accuracy, and which one actually generates leads.'; keyword='roofquote vs skyquote vs eagleview'}
)

$templateTop = @'
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>META_TITLE</title>
  <meta name="description" content="META_DESC">
  <link rel="canonical" href="https://osprey.solutions/blog/SLUG">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Michroma&family=Exo+2:wght@400;500;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <script>tailwind.config={theme:{extend:{colors:{navy:{900:'#0a0f1e',800:'#111827',700:'#1a2332',600:'#243044'},accent:{DEFAULT:'#e8781f',light:'#f59542',dark:'#c95f10'},muted:'#94a3b8'},fontFamily:{heading:['Michroma','sans-serif'],subheading:['"Exo 2"','sans-serif'],body:['Inter','sans-serif']}}}}</script>
  <script type="application/ld+json">{"@context":"https://schema.org","@type":"BlogPosting","headline":"TITLE","author":{"@type":"Organization","name":"Osprey Solutions"},"datePublished":"2026-03-27","publisher":{"@type":"Organization","name":"Osprey Solutions","url":"https://osprey.solutions"},"description":"META_DESC","keywords":"KEYWORD"}</script>
  <style>
    *{margin:0;padding:0;box-sizing:border-box}body{background:#0a0f1e;color:#f1f5f9;font-family:'Inter',sans-serif;overflow-x:hidden}
    h1{font-family:'Michroma',sans-serif;letter-spacing:.02em}
    h2{font-family:'Michroma',sans-serif;letter-spacing:.02em;font-size:1.5rem;margin:2.5rem 0 1rem;background:linear-gradient(135deg,#e8781f,#f59542,#fbbf24);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
    h3{font-family:'Exo 2',sans-serif;font-size:1.2rem;margin:2rem 0 0.75rem;color:#f1f5f9}
    h4{font-family:'Exo 2',sans-serif;font-size:1.05rem;margin:1.5rem 0 0.5rem;color:#e8781f}
    .article-body p{margin:1rem 0;line-height:1.8;color:#94a3b8}
    .article-body strong{color:#f1f5f9}
    .article-body a{color:#e8781f;text-decoration:underline;text-underline-offset:2px}
    .article-body a:hover{color:#f59542}
    .article-body ul,.article-body ol{margin:1rem 0;padding-left:1.5rem;color:#94a3b8}
    .article-body li{margin:0.5rem 0;line-height:1.7}
    .article-body blockquote{border-left:3px solid #e8781f;padding:1rem 1.5rem;margin:1.5rem 0;background:rgba(232,120,31,0.05);border-radius:0 8px 8px 0;color:#c4c4c4;font-style:italic}
    .article-body table{width:100%;border-collapse:collapse;margin:1.5rem 0}
    .article-body th{background:rgba(232,120,31,0.1);padding:0.75rem;text-align:left;border-bottom:1px solid rgba(232,120,31,0.2);color:#f1f5f9;font-family:'Exo 2',sans-serif}
    .article-body td{padding:0.75rem;border-bottom:1px solid rgba(255,255,255,0.05);color:#94a3b8}
    .article-body hr{border:none;height:1px;background:linear-gradient(90deg,transparent,#e8781f,transparent);margin:2rem 0;opacity:0.3}
    .cta-callout{background:rgba(232,120,31,0.08);border:1px solid rgba(232,120,31,0.25);border-radius:12px;padding:1.5rem;margin:2rem 0;text-align:center}
    .cta-callout a{background:linear-gradient(135deg,#e8781f,#c95f10);color:#0a0f1e;font-weight:700;padding:0.75rem 2rem;border-radius:10px;text-decoration:none;display:inline-block;margin-top:0.5rem}
    .nav-blur{backdrop-filter:blur(16px);background:rgba(10,15,30,.85);border-bottom:1px solid rgba(232,120,31,.1)}
    .bg-grid{background-image:linear-gradient(rgba(232,120,31,.02) 1px,transparent 1px),linear-gradient(90deg,rgba(232,120,31,.02) 1px,transparent 1px);background-size:60px 60px}
    .gradient-text{background:linear-gradient(135deg,#e8781f,#f59542,#fbbf24);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
    .mountain-bg{position:absolute;bottom:0;left:0;right:0;width:100%;pointer-events:none}
    .float-call{position:fixed;bottom:24px;right:24px;z-index:50;width:60px;height:60px;background:linear-gradient(135deg,#e8781f,#c95f10);border-radius:50%;display:flex;align-items:center;justify-content:center;box-shadow:0 4px 20px rgba(232,120,31,.5);animation:pr 2s ease infinite}
    @keyframes pr{0%{box-shadow:0 0 0 0 rgba(232,120,31,.5)}70%{box-shadow:0 0 0 15px rgba(232,120,31,0)}100%{box-shadow:0 0 0 0 rgba(232,120,31,0)}}
    @media(max-width:768px){.mountain-bg{display:none!important}}
  </style>
</head>
<body class="bg-grid">
<nav class="fixed top-0 left-0 right-0 z-50 nav-blur"><div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"><div class="flex items-center justify-between h-16 lg:h-20"><a href="/osprey/"><img src="../osprey-logo.png" alt="Osprey Solutions" class="h-10 lg:h-12 w-auto"></a><div class="hidden lg:flex items-center gap-8"><a href="/osprey/#services" class="text-slate-400 hover:text-white text-sm">Services</a><a href="/osprey/#blog" class="text-slate-400 hover:text-white text-sm">Blog</a><a href="tel:+17789100756" class="text-white font-semibold">(778) 910-0756</a><a href="https://calendar.osprey.solutions" target="_blank" class="cta-callout a" style="margin:0;padding:0.5rem 1.2rem;font-size:0.875rem;background:linear-gradient(135deg,#e8781f,#c95f10);color:#0a0f1e;border-radius:8px;text-decoration:none;font-weight:600">Book Free Call</a></div><a href="tel:+17789100756" class="lg:hidden text-accent font-bold">(778) 910-0756</a></div></div></nav>
<section class="relative pt-32 pb-16 lg:pt-40 lg:pb-24 overflow-hidden" style="background:linear-gradient(180deg,#0a0f1e 0%,#0f1525 50%,#1a1520 80%,#2a1a12 100%)">
  <div class="mountain-bg" style="bottom:0;z-index:1;"><svg viewBox="0 0 1440 100" preserveAspectRatio="none"><path d="M0,100 L0,70 L80,50 L160,65 L240,40 L320,55 L400,35 L480,50 L560,30 L640,45 L720,25 L800,40 L880,30 L960,45 L1040,25 L1120,40 L1200,35 L1280,50 L1360,40 L1440,55 L1440,100Z" fill="#0d1520"/></svg></div>
  <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
    <a href="/osprey/#blog" class="text-accent text-sm font-semibold hover:underline mb-4 inline-block">&larr; Back to Blog</a>
    <h1 class="font-heading text-2xl sm:text-3xl lg:text-4xl font-bold leading-tight mt-4">TITLE</h1>
    <div class="flex items-center gap-4 mt-6 text-sm text-slate-400"><span>By Osprey Solutions</span><span>|</span><span>March 2026</span></div>
  </div>
</section>
<article class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-12 lg:py-16 article-body">
'@

$templateBottom = @'
</article>
<div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 pb-16">
  <div class="cta-callout">
    <p class="text-white font-semibold text-lg mb-1">Ready to grow your business?</p>
    <p class="text-slate-400 text-sm mb-3">Book a free 15-minute strategy call. Real advice, no pitch.</p>
    <a href="https://calendar.osprey.solutions" target="_blank">Book Free Strategy Call &rarr;</a>
  </div>
</div>
<footer class="border-t border-slate-800 py-12"><div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"><div class="flex flex-col md:flex-row items-center justify-between gap-6"><a href="/osprey/"><img src="../osprey-logo.png" alt="Osprey Solutions" class="h-8 w-auto"></a><div class="flex flex-wrap gap-6 text-sm text-slate-400"><a href="/osprey/services/google-business-management.html" class="hover:text-white">GBP</a><a href="/osprey/services/google-ads.html" class="hover:text-white">Google Ads</a><a href="/osprey/services/ai-voice-agents.html" class="hover:text-white">Voice AI</a><a href="/osprey/services/roofquote.html" class="hover:text-white">RoofQuote</a><a href="/osprey/services/website-design.html" class="hover:text-white">Websites</a><a href="/osprey/services/seo-content.html" class="hover:text-white">SEO</a></div><p class="text-slate-500 text-sm">&copy; 2026 Osprey Solutions</p></div></div></footer>
<a href="tel:+17789100756" class="float-call lg:hidden" aria-label="Call"><svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/></svg></a>
</body></html>
'@

foreach ($a in $articles) {
  $md = Get-Content "G:\OpenClaw\workspace\seo-content\osprey\$($a.file)" -Raw -Encoding UTF8
  
  # Strip front matter (title, meta lines, keywords, ---)
  $md = $md -replace '(?s)^#[^\n]+\n+\*\*Meta Title:.*?---\s*', ''
  $md = $md -replace '(?s)^#[^\n]+\n+---\s*', ''
  
  # Convert markdown to HTML
  $html = $md
  $html = $html -replace '83 contractors', '100+ contractors'
  $html = $html -replace '83 businesses', '100+ businesses'
  $html = $html -replace '83 local', '100+ local'
  
  # Headers
  $html = $html -replace '(?m)^#### (.+)$', '<h4>$1</h4>'
  $html = $html -replace '(?m)^### (.+)$', '<h3>$1</h3>'
  $html = $html -replace '(?m)^## (.+)$', '<h2>$1</h2>'
  
  # Bold and italic
  $html = $html -replace '\*\*\*(.+?)\*\*\*', '<strong><em>$1</em></strong>'
  $html = $html -replace '\*\*(.+?)\*\*', '<strong>$1</strong>'
  $html = $html -replace '\*(.+?)\*', '<em>$1</em>'
  
  # Links
  $html = $html -replace '\[([^\]]+)\]\(([^\)]+)\)', '<a href="$2">$1</a>'
  
  # CTA links → callout boxes
  $html = $html -replace '<p>(<a href="https://calendar\.osprey\.solutions"[^<]+</a>)</p>', '<div class="cta-callout">$1</div>'
  
  # Unordered lists
  $html = $html -replace '(?m)^- (.+)$', '<li>$1</li>'
  $html = $html -replace '(<li>.*</li>\n?)+', '<ul>$0</ul>'
  
  # Horizontal rules
  $html = $html -replace '(?m)^---\s*$', '<hr>'
  
  # Paragraphs — wrap remaining text lines
  $lines = $html -split "`n"
  $result = @()
  foreach ($line in $lines) {
    $trimmed = $line.Trim()
    if ($trimmed -eq '') { $result += ''; continue }
    if ($trimmed -match '^<') { $result += $trimmed; continue }
    if ($trimmed -match '^\|') { $result += $trimmed; continue }
    $result += "<p>$trimmed</p>"
  }
  $html = $result -join "`n"
  
  # Clean up double-wrapped
  $html = $html -replace '<p><(h[234]|ul|ol|li|hr|div|blockquote)', '<$1'
  $html = $html -replace '</(h[234]|ul|ol|li|hr|div|blockquote)></p>', '</$1>'
  
  # Build page
  $page = $templateTop
  $page = $page -replace 'META_TITLE', $a.metaTitle
  $page = $page -replace 'META_DESC', $a.metaDesc
  $page = $page -replace 'SLUG', $a.slug
  $page = $page -replace 'TITLE', $a.title
  $page = $page -replace 'KEYWORD', $a.keyword
  $page += $html
  $page += $templateBottom
  
  $outPath = "G:\OpenClaw\workspace\osprey-website\blog\$($a.slug).html"
  [System.IO.File]::WriteAllText($outPath, $page, [System.Text.Encoding]::UTF8)
  Write-Host "Built: $($a.slug).html"
}
