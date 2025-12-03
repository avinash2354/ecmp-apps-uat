# Image Generation Script for New Products
# Run this script after the image generation quota resets (around 00:50:21 UTC)

# List of images to generate with their prompts
images_to_generate = [
    {
        "filename": "wireless_earbuds.png",
        "prompt": "A modern wireless earbuds charging case, sleek black design with LED indicators, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "portable_projector.png",
        "prompt": "A portable projector device, compact modern design, silver and black colors, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "gaming_controller.png",
        "prompt": "A gaming controller, modern design with RGB lighting, ergonomic shape, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "usb_microphone.png",
        "prompt": "A USB microphone for podcasting, professional studio quality, black metal finish with shock mount, product photography on white background, high quality"
    },
    {
        "filename": "ring_light.png",
        "prompt": "A ring light for photography and video, circular LED design with adjustable stand, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "laptop_cooling_pad.png",
        "prompt": "A laptop cooling pad with RGB fans, sleek gaming aesthetic, black design, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "drawing_tablet.png",
        "prompt": "A digital drawing tablet with stylus pen, professional graphics tablet, black surface, product photography on white background, high quality"
    },
    {
        "filename": "security_camera.png",
        "prompt": "A security camera, modern white dome design, smart home security device, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "fitness_tracker.png",
        "prompt": "A fitness tracker band, modern sleek design, black silicone strap with digital display, product photography on white background, high quality"
    },
    {
        "filename": "portable_hdd.png",
        "prompt": "A portable hard drive, compact external storage device, metallic silver finish, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "gaming_mousepad.png",
        "prompt": "A mechanical gaming mouse pad, large RGB extended mousepad with LED edges, black surface, product photography on white background, high quality"
    },
    {
        "filename": "phone_gimbal.png",
        "prompt": "A smartphone gimbal stabilizer, 3-axis handheld gimbal, professional black design, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "charging_dock.png",
        "prompt": "A wireless charging dock station for multiple devices, modern white design with multiple charging pads, product photography on white background, high quality"
    },
    {
        "filename": "wifi_router.png",
        "prompt": "A network router with multiple antennas, modern black gaming router with LED lights, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "portable_ssd_2.png",
        "prompt": "A portable SSD drive, compact external solid state drive, sleek metallic design, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "mechanical_numpad.png",
        "prompt": "A mechanical numpad keyboard, compact numeric keypad with RGB backlighting, black design, product photography on white background, high quality"
    },
    {
        "filename": "laptop_stand.png",
        "prompt": "A laptop stand, aluminum adjustable laptop riser, modern silver design, product photography on white background, high quality, professional lighting"
    },
    {
        "filename": "desk_lamp.png",
        "prompt": "A desk lamp with wireless charging base, modern LED desk lamp with adjustable arm, white and silver design, product photography on white background, high quality"
    },
    {
        "filename": "cable_organizer.png",
        "prompt": "A cable management box, modern organizer for hiding cables and power strips, white minimalist design, product photography on white background, high quality"
    },
    {
        "filename": "usb_hub.png",
        "prompt": "A USB hub with multiple ports, modern aluminum USB-C hub with various ports, sleek silver design, product photography on white background, high quality, professional lighting"
    }
]

print("=" * 60)
print("Product Image Generation Reference")
print("=" * 60)
print(f"\nTotal images to generate: {len(images_to_generate)}")
print("\nQuota Reset Time: 2025-12-02T00:50:21Z")
print("\nImage Details:")
print("-" * 60)

for i, img in enumerate(images_to_generate, 1):
    print(f"\n{i}. {img['filename']}")
    print(f"   Prompt: {img['prompt']}")

print("\n" + "=" * 60)
print("NOTE: Use the generate_image tool in Antigravity to create these images")
print("Save all images to: product-service/PUBLIC/images/")
print("=" * 60)
