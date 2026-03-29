# Enhance all service pages with 3D effects
$files = Get-ChildItem "G:\OpenClaw\workspace\osprey-website\services\*.html"

# CSS to inject — mountain parallax, card tilt, animated glow, mobile-safe
$cssInject = @'
    /* ---- SVG MOUNTAIN PARALLAX HERO ---- */
    .mountain-bg { position:absolute; bottom:0; left:0; right:0; width:100%; pointer-events:none; }
    .mountain-layer-1 { z-index:1; }
    .mountain-layer-2 { z-index:2; }
    .mountain-layer-3 { z-index:3; }
    .tree-sway { transform-origin:bottom center; animation:treeSway 4s ease-in-out infinite alternate; }
    .tree-sway-slow { transform-origin:bottom center; animation:treeSway 6s ease-in-out infinite alternate; animation-delay:-2s; }
    @keyframes treeSway { 0%{transform:rotate(-0.7deg)} 100%{transform:rotate(0.7deg)} }
    .card-glare { position:absolute; top:0; left:0; width:100%; height:100%; border-radius:inherit; pointer-events:none; background:radial-gradient(circle at 50% 50%,rgba(255,255,255,0.06),transparent 60%); opacity:0; transition:opacity .3s ease; z-index:5; }
    .glass-card:hover .card-glare { opacity:1; }
    .glass-card { transform-style:preserve-3d; perspective:1000px; }
    @media (max-width:768px) { .mountain-bg{display:none!important} .reveal{opacity:1!important;transform:none!important} }
    @media (prefers-reduced-motion:reduce) { .tree-sway,.tree-sway-slow{animation:none!important} .reveal{opacity:1!important;transform:none!important} }
'@

# Mountain SVG to inject into hero (smaller version for service pages)
$mountainSvg = @'

    <!-- Mountain silhouettes (desktop) -->
    <div class="mountain-bg mountain-layer-1" style="bottom:8%;z-index:1;">
      <svg viewBox="0 0 1440 200" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0,200 L0,130 L80,110 L160,80 L220,100 L300,50 L380,75 L440,40 L520,70 L580,35 L660,60 L720,30 L800,55 L860,25 L940,50 L1000,35 L1080,65 L1140,30 L1220,55 L1300,40 L1380,70 L1440,45 L1440,200Z" fill="#0c1220"/>
      </svg>
    </div>
    <div class="mountain-bg mountain-layer-2" style="bottom:3%;z-index:2;">
      <svg viewBox="0 0 1440 160" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0,160 L0,100 L100,80 L180,55 L260,75 L340,40 L420,65 L500,45 L580,70 L660,50 L720,75 L800,55 L880,40 L960,60 L1040,35 L1120,55 L1200,45 L1280,65 L1360,50 L1440,70 L1440,160Z" fill="#111a28"/>
      </svg>
    </div>
    <div class="mountain-bg mountain-layer-3" style="bottom:0;z-index:3;">
      <svg viewBox="0 0 1440 100" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0,100 L0,70 L60,60 L120,50 L200,65 L280,55 L360,45 L440,60 L520,50 L600,60 L680,70 L760,60 L840,50 L920,55 L1000,45 L1080,55 L1160,50 L1240,60 L1320,55 L1440,65 L1440,100Z" fill="#0d1520"/>
        <g class="tree-sway"><polygon points="60,52 68,20 76,52" fill="#0c1620"/></g>
        <g class="tree-sway-slow"><polygon points="160,48 170,12 180,48" fill="#0b1520"/></g>
        <g class="tree-sway"><polygon points="320,50 328,18 336,50" fill="#0c1620"/></g>
        <g class="tree-sway-slow"><polygon points="500,52 510,22 520,52" fill="#0b1520"/></g>
        <g class="tree-sway"><polygon points="1100,48 1110,15 1120,48" fill="#0c1620"/></g>
        <g class="tree-sway-slow"><polygon points="1260,50 1268,20 1276,50" fill="#0b1520"/></g>
        <g class="tree-sway"><polygon points="1380,52 1388,24 1396,52" fill="#0c1620"/></g>
      </svg>
    </div>
    <div class="hidden lg:block absolute bottom-0 left-0 right-0 h-32 z-[2]" style="background:radial-gradient(ellipse 80% 100% at 50% 100%,rgba(232,120,31,0.1) 0%,transparent 70%)"></div>
'@

# Card tilt + parallax JS
$jsInject = @'
    // Mountain parallax
    (function(){
      var layers=document.querySelectorAll('.mountain-bg');
      if(!layers.length) return;
      var speeds=[0.1,0.2,0.35];
      window.addEventListener('scroll',function(){
        var s=window.pageYOffset;
        layers.forEach(function(l,i){ l.style.transform='translateY('+(s*(speeds[i]||0.1))+'px)'; });
      },{passive:true});
    })();
    // Card tilt (desktop)
    if(window.innerWidth>768){
      document.querySelectorAll('.glass-card').forEach(function(c){
        c.addEventListener('mousemove',function(e){
          var r=c.getBoundingClientRect(),x=e.clientX-r.left,y=e.clientY-r.top;
          var rx=(y/r.height-.5)*-10,ry=(x/r.width-.5)*10;
          c.style.transform='perspective(1000px) rotateX('+rx+'deg) rotateY('+ry+'deg) scale(1.02)';
        });
        c.addEventListener('mouseleave',function(){ c.style.transform='perspective(1000px) rotateX(0) rotateY(0) scale(1)'; });
      });
    }
    // IntersectionObserver reveals (reliable on mobile+desktop)
    var ro=new IntersectionObserver(function(entries){
      entries.forEach(function(e){ if(e.isIntersecting){ gsap.to(e.target,{opacity:1,y:0,scale:1,duration:.7,ease:'power2.out'}); ro.unobserve(e.target); }});
    },{threshold:.05,rootMargin:'0px 0px 50px 0px'});
    document.querySelectorAll('.reveal').forEach(function(el){ ro.observe(el); });
'@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    # 1. Inject CSS before </style>
    if ($content -notmatch 'mountain-bg') {
        $content = $content -replace '</style>', "$cssInject`n  </style>"
    }

    # 2. Inject mountain SVG into hero section (after the first <section...overflow-hidden">)
    if ($content -notmatch 'mountain-layer') {
        # Change hero background to gradient
        $content = $content -replace '(<section class="relative pt-32 pb-20 lg:pt-40 lg:pb-28 overflow-hidden">)', '<section class="relative pt-32 pb-20 lg:pt-40 lg:pb-28 overflow-hidden" style="background:linear-gradient(180deg,#0a0f1e 0%,#0f1525 40%,#1a1520 65%,#2a1a12 85%,#3d2210 100%)">' + $mountainSvg
        # Remove duplicate tag if pattern replacement doubled it
        $content = $content -replace '<section class="relative pt-32 pb-20 lg:pt-40 lg:pb-28 overflow-hidden"><section', '<section'
    }

    # 3. Add card-glare div inside glass-cards (if not already present)
    if ($content -notmatch 'card-glare') {
        $content = $content -replace '(<div class="glass-card rounded-2xl p-8[^"]*">)', '$1<div class="card-glare"></div>'
        $content = $content -replace '(<div class="glass-card rounded-xl p-6[^"]*">)', '$1<div class="card-glare"></div>'
    }

    # 4. Replace old GSAP script with enhanced version
    if ($content -notmatch 'IntersectionObserver') {
        $content = $content -replace "gsap\.registerPlugin\(ScrollTrigger\);\s*document\.querySelectorAll\('\.reveal'\)\.forEach\(el\s*=>\s*\{[^}]+\}\);\s*\}\);", "$jsInject"
    }

    Set-Content $file.FullName $content -NoNewline
    Write-Host "Enhanced: $($file.Name)"
}

Write-Host "`nAll service pages enhanced!"
