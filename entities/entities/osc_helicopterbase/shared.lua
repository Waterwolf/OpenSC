
if SERVER then
	AddCSLuaFile()
end

ENT.Base = "osc_vehicle"
ENT.Type = "anim"

ENT.HeliProps = {}

function ENT:Initialize()
	if SERVER then
		self:SetModel(self.Model)
	
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		
		local phys = self:GetPhysicsObject()
		
		if phys:IsValid() then
			if self.Weight then
				phys:SetMass(self.Weight)
			end
			phys:Wake()
		end

		self:AddRotors()
		self:AddConstraints()

	end

	self.BaseClass.Initialize(self)
end

function ENT:AddConstraints()
	constraint.Axis( self.Entity, self.Entity.HeliProps.RotorProp, 0, 0, (Vector(0,0,0)), Vector(0,0,0) , 0, 0, 0, 1 )	
	constraint.Axis( self.Entity, self.Entity.HeliProps.BackRotorProp, 0, 0, Vector(-185,-3,13) , Vector(0,0,0), 0, 0, 1, 1 ) --Vector(-185,13,-3)	
	constraint.Keepupright( self.Entity.HeliProps.RotorProp, Angle(0,0,0), 0, 15 )	
end

function ENT:AddRotors()
	local RotorProp = ents.Create("prop_physics")
	
	RotorProp:SetModel(self.TopRotorModel)		
	
	local TRPOrig = self.TopRotorPos
	local RPPos = self.Entity:GetPos() + (self.Entity:GetForward() * TRPOrig.x) + (self.Entity:GetUp() * TRPOrig.y) + (self.Entity:GetRight() * TRPOrig.z)
	
	RotorProp:SetPos(RPPos)
	--RotorProp:SetPos(self.Entity:GetPos() + (self.Entity:GetUp() * 50))
	RotorProp:SetOwner(self.Owner)		
	RotorProp:Spawn()
	
	self.Entity.HeliProps.RotorProp = RotorProp
	
	local BackRotorProp = ents.Create( "prop_physics" )
	BackRotorProp:SetModel(self.BackRotorModel)		
	
	local BRPOrig = self.BackRotorPos
	local BRPPos = self.Entity:GetPos() + (self.Entity:GetForward() * BRPOrig.x) + (self.Entity:GetUp() * BRPOrig.y) + (self.Entity:GetRight() * BRPOrig.z)
	
	BackRotorProp:SetPos(BRPPos)	
	--BackRotorProp:SetPos(self.Entity:GetPos() + (self.Entity:GetForward() * -185) + (self.Entity:GetUp() * 13) + (self.Entity:GetRight() * -3) )
	BackRotorProp:SetOwner(self.Owner)		
	BackRotorProp:Spawn()					
	
	self.Entity.HeliProps.BackRotorProp = BackRotorProp
end