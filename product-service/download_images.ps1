$images = @(
    @{ Name = "wireless_earbuds"; Query = "earbuds" },
    @{ Name = "portable_projector"; Query = "projector" },
    @{ Name = "gaming_controller"; Query = "game,controller" },
    @{ Name = "usb_microphone"; Query = "microphone" },
    @{ Name = "ring_light"; Query = "lamp" },
    @{ Name = "laptop_cooling_pad"; Query = "fan" },
    @{ Name = "drawing_tablet"; Query = "tablet" },
    @{ Name = "security_camera"; Query = "cctv" },
    @{ Name = "fitness_tracker"; Query = "watch" },
    @{ Name = "portable_hdd"; Query = "harddrive" },
    @{ Name = "gaming_mousepad"; Query = "mousepad" },
    @{ Name = "phone_gimbal"; Query = "camera" },
    @{ Name = "charging_dock"; Query = "charger" },
    @{ Name = "wifi_router"; Query = "router" },
    @{ Name = "portable_ssd_2"; Query = "ssd" },
    @{ Name = "mechanical_numpad"; Query = "keyboard" },
    @{ Name = "laptop_stand"; Query = "laptop" },
    @{ Name = "desk_lamp"; Query = "lamp" },
    @{ Name = "cable_organizer"; Query = "cable" },
    @{ Name = "usb_hub"; Query = "usb" }
)

$outputDir = "c:\Users\OM\Documents\google antigravity\ecmp-apps-uat\product-service\PUBLIC\images"

foreach ($img in $images) {
    $fileName = "$($img.Name).png"
    $filePath = Join-Path $outputDir $fileName
    # Using LoremFlickr
    $url = "https://loremflickr.com/400/400/$($img.Query)/all"
    
    Write-Host "Downloading $fileName from $url..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $filePath
        Write-Host "Successfully downloaded $fileName"
    }
    catch {
        Write-Host "Failed to download $fileName : $_"
    }
    # Sleep to avoid rate limiting
    Start-Sleep -Seconds 1
}
