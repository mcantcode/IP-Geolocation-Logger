# 🌐 IP Geolocation Logger
A Luau script developed by @mcantcode from Discord, logs geolocation data and sends it to a [Discord webhook](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) using a Roblox executor.

## 🖼️ Showcase
![](https://i.ibb.co.com/bgQgW6Tv/IP-Geolocation-Logger-Showcase.jpg)

## ✨ Features
- Simple, and easy to use.
- Fully costumizable webhook URL.
- Lightweight, and optimized for performance.
- Retrieves geolocation data (country, city, etc.) using an [IP Geolocation API](https://ipapi.co/).
- Retrieves Roblox's account information (avatar, profile, etc.) using a [Thumbnails API](https://create.roblox.com/docs/cloud/legacy/thumbnails/v1#/).

## ⚙️ Configuration
To configure the webhook URL, set `getgenv().WebhookURL` to your Discord webhook URL as a string in the script. Example:
```lua
getgenv().Webhook_URL = "https://discord.com/api/webhooks/your-webhook-id/your-webhook-token"
```

## 📝 Notes
- This script doesn't support any actions that violate [Roblox's Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use).
- The script runs only on a Roblox executor that fully supports UNC (Unified Naming Convention).
