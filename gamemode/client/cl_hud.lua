function GAMEMODE:HUDPaint()

end

-- Hide the standard HUD stuff
local hud = {"CHudHealth", "CHudBattery","CHudAmmo", "CHudSecondaryAmmo"}
function GAMEMODE:HUDShouldDraw(name)
   for k, v in pairs(hud) do
      if name == v then return false end
   end

   return true
end
