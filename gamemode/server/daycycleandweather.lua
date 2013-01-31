concommand.Add("mist_setday", function(ply, cmd, args)
	local day = tobool(args[1])

	local sp = ents.FindByClass("env_skypaint")[1]

	local top = Vector( 0.2, 0.5, 1.0 )
	local bottom = Vector( 0.8, 1.0, 1.0 )

	if day then
		sp:SetStarTexture( "skybox/clouds" )

		sp:SetTopColor( top * 0.8 )
		sp:SetBottomColor( bottom * 0.8 )
	else
		sp:SetStarTexture( "skybox/starfield" )

		sp:SetTopColor( top * 0.05 )
		sp:SetBottomColor( bottom * 0.05 )
	end
end)

concommand.Add("mist_rain", function(ply, cmd, args)
	local eff = EffectData()
	eff:SetMagnitude(90)
	util.Effect("rain", eff)
end)