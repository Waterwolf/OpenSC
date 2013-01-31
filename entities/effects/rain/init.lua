--The Rain Effect

local density=CreateClientConVar("cs_raindensity","1",false,false)

function EFFECT:Init(data)
	self.Particles=data:GetMagnitude()*density:GetInt()
	self.DieTime=CurTime()+1
	self.Emitter=ParticleEmitter(LocalPlayer():GetPos())
end

local function ParticleCollides(particle, pos, norm)
	particle:SetDieTime(0)
	local effectdata = EffectData() 
	effectdata:SetStart(pos)
	effectdata:SetOrigin(pos) 
	--effectdata:SetScale(2)
	effectdata:SetScale( math.random( 1,3 ) )
	util.Effect( "watersplash", effectdata )  
end

function EFFECT:Think()
	if CurTime()>self.DieTime then return false end
	local emitter = self.Emitter
	for i=1, self.Particles do
		local spawnpos = LocalPlayer():GetPos()+Vector(math.random(-1200,1200)+LocalPlayer():GetVelocity().x*2,math.random(-1200,1200)+LocalPlayer():GetVelocity().y*2,400)
		
		local particle = emitter:Add("particle/Water/WaterDrop_001a", spawnpos)
		--local particle = emitter:Add("effects/rain", spawnpos)
		--local particle = emitter:Add("particle/rprain", spawnpos)
		if (particle) then
			particle:SetVelocity(Vector(math.sin(CurTime()/4)*30,50,-700))
			particle:SetLifeTime(0)
			particle:SetDieTime(4)
			particle:SetEndAlpha(255)
			particle:SetStartSize(0)
			--particle:SetEndSize(10)
			particle:SetEndSize(math.random( 10,20 ))
			particle:SetAirResistance(0)
			particle:SetStartAlpha(128)
			particle:SetCollide(true)
			particle:SetBounce(0)
			particle:SetCollideCallback(ParticleCollides)
		end
	end
	return true
end

function EFFECT:Render()

end
