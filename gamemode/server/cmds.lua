concommand.Add("mist_spawnheli", function(ply)
	local tr = ply:GetEyeTrace()
	local heli = ents.Create("osc_helicopter_basic")
	heli:SetPos(tr.HitPos)
	heli:Spawn()
end)

function GM:PlayerNoClip( pl, on )
	return true
end