-- CONFIG --

-- Blacklisted ped models
pedblacklist = {"a_c_chickenhawk","a_c_fish","a_c_humpback","a_c_stingray","a_c_sharktiger","a_c_sharkhammer","a_c_killerwhale","a_c_seagull","a_c_pigeon","a_c_dolphin",
 "a_c_chimp","a_c_cormorant","a_c_coyote",
 "a_c_hen",
 "a_c_rabbit_01",
 "a_c_rat",
 "a_c_rhesus",
 "a_c_mtlion",
 "ap_sp_dick",
 "ap_fra_ped",
 "S_M_M_MovAlien_01",
 "S_M_M_MovSpace_01",
 "U_M_Y_RSRanger_01",
 "U_M_Y_Zombie_01",
 "a_m_m_og_boss_01",
 "a_m_m_soucent_04",
 "a_c_chimp",
 "a_c_cormorant",
 "a_c_coyote",
 "a_c_hen",
 "a_c_rabbit_01",
 "a_c_rat",
 "a_c_rhesus",
 "a_c_mtlion",
 "ap_sp_dick",
 "ap_fra_ped",
 "S_M_M_MovAlien_01",
 "S_M_M_MovSpace_01",
 "U_M_Y_RSRanger_01",
 "U_M_Y_Zombie_01",
 "a_m_m_og_boss_01",
  "a_m_m_soucent_04",
  "a_c_chop",
  "a_c_cat_01",
  "a_c_shepherd",
  "a_c_cow",
  "a_c_crow",
  "a_c_deer",
  "a_c_husky",
  "a_c_pig",
  "a_c_boar",
  "a_c_poodle", 
  "a_c_pug",
  "a_c_retriever",
  "a_c_rottweiler",
  "a_c_westy",

}

-- Defaults to this ped model if an error happened
defaultpedmodel = "a_m_y_skater_01"

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if whitelisted == nil and playerPed then
			playerModel = GetEntityModel(playerPed)

			if not prevPlayerModel then
				if isPedBlacklisted(prevPlayerModel) then
					SetPlayerModel(PlayerId(), GetHashKey(defaultpedmodel))
				else
					prevPlayerModel = playerModel
				end
			else
				if isPedBlacklisted(playerModel) then
					SetPlayerModel(PlayerId(), prevPlayerModel)
					sendForbiddenMessage("This ped model is blacklisted!")
				end

				prevPlayerModel = playerModel
			end
		end
	end
end)

function isPedBlacklisted(model)
	for _, blacklistedPed in pairs(pedblacklist) do
		if model == GetHashKey(blacklistedPed) then
			return true
		end
	end

	return false
end
