
AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ooc" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^6OOC | ^7" .. name, { 128, 128, 128 }, string.sub(msg,5))
	end

	if sm[1] == "/me" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^3Me | ^7" .. name, { 128, 128, 128 }, string.sub(msg,5))
	end

	if sm[1] == "/911" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^8(911) | ^7" .. name, { 255, 255, 255 }, string.sub(msg,5))
	end

	if sm[1] == "/news" then
        CancelEvent()
        TriggerClientEvent("chatMessage", -1, "^3News", {255, 255, 255}, string.sub(msg,6))
    end

    if sm[1] == "/ad" then
        CancelEvent()
        TriggerClientEvent("chatMessage", -1, "^2AD | " .. name, {255, 255, 255}, string.sub(msg,5))
    end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
