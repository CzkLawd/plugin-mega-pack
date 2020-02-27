whitelist = {
	"steam:11000010e6c5cd5",	--Czk_Lawd
	"steam:110000100000000",	--Name
	"steam:110000100000000",	--Name
}
RegisterServerEvent('white')
AddEventHandler('white', function()
	local numIds = GetPlayerIdentifiers(source)
	for i,admin in ipairs(whitelist) do
		for i,theId in ipairs(numIds) do
			if admin == theId then -- is the player an admin?
				TriggerClientEvent("checkwhitelist", source, "gg")
				print('An admin joined')
			end
		end
	end
end)
