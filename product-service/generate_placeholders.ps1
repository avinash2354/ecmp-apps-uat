$images = @(
    @{ Name = "wireless_earbuds"; Title = "Wireless Earbuds" },
    @{ Name = "portable_projector"; Title = "Portable Projector" },
    @{ Name = "gaming_controller"; Title = "Gaming Controller" },
    @{ Name = "usb_microphone"; Title = "USB Microphone" },
    @{ Name = "ring_light"; Title = "Ring Light" },
    @{ Name = "laptop_cooling_pad"; Title = "Laptop Cooling Pad" },
    @{ Name = "drawing_tablet"; Title = "Drawing Tablet" },
    @{ Name = "security_camera"; Title = "Security Camera" },
    @{ Name = "fitness_tracker"; Title = "Fitness Tracker" },
    @{ Name = "portable_hdd"; Title = "Portable HDD" },
    @{ Name = "gaming_mousepad"; Title = "Gaming Mousepad" },
    @{ Name = "phone_gimbal"; Title = "Phone Gimbal" },
    @{ Name = "charging_dock"; Title = "Charging Dock" },
    @{ Name = "wifi_router"; Title = "WiFi Router" },
    @{ Name = "portable_ssd_2"; Title = "Portable SSD 1TB" },
    @{ Name = "mechanical_numpad"; Title = "Mechanical Numpad" },
    @{ Name = "laptop_stand"; Title = "Laptop Stand" },
    @{ Name = "desk_lamp"; Title = "Desk Lamp" },
    @{ Name = "cable_organizer"; Title = "Cable Organizer" },
    @{ Name = "usb_hub"; Title = "USB Hub" }
)

$outputDir = "c:\Users\OM\Documents\google antigravity\ecmp-apps-uat\product-service\PUBLIC\images"

foreach ($img in $images) {
    $fileName = "$($img.Name).svg"
    $filePath = Join-Path $outputDir $fileName
    
    $svgContent = @"
<svg width="400" height="400" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#f6f8fa;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#e1e4e8;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="100%" height="100%" fill="url(#grad)"/>
  <rect width="100%" height="100%" fill="none" stroke="#d1d5da" stroke-width="2"/>
  <text x="50%" y="45%" font-family="Segoe UI, Arial, sans-serif" font-size="40" fill="#959da5" text-anchor="middle">📷</text>
  <text x="50%" y="60%" font-family="Segoe UI, Arial, sans-serif" font-size="24" font-weight="bold" fill="#24292e" text-anchor="middle">$($img.Title)</text>
</svg>
"@

    Set-Content -Path $filePath -Value $svgContent
    Write-Host "Created $fileName"
}
