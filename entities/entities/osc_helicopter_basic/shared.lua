
if SERVER then
	AddCSLuaFile()
end

ENT.Base = "osc_helicopterbase"
ENT.Type = "anim"

ENT.Model = "models/military2/air/air_h500.mdl"
ENT.TopRotorModel = "models/military2/air/air_h500_r.mdl"
ENT.BackRotorModel = "models/military2/air/air_h500_sr.mdl"

ENT.TopRotorPos = Vector(0, 50, 0)
ENT.BackRotorPos = Vector(-185, 13, -3)
