print("=======================")
print("Cuff+ Script by ECLIP3S Loaded")
print("=======================")

AddEventHandler("chatMessage", function(source, name, message)
	cm = stringsplit(message, " ")

	if cm[1] == "/cuff" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local tPID = tonumber(cm[2])
			TriggerClientEvent("Handcuff", tPID)
		end
	end

	if cm[1] == "/hu" then
		CancelEvent()
		TriggerClientEvent("Handsup", source)
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

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end