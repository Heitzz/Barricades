//=============================================================================//
//========= Daniel Heitz, All rights reserved. ============//
//
// @Author: Daniel Heitz <DidVaitel>
// @Email: contact@gmodhub.com
// @Created: 11.06.2020
// @Modified: 11.06.2020
//
//=============================================================================//

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

local vec = Vector(0,0,30)

function ENT:Initialize()

	self:SetModel("models/props_wasteland/interior_fence002e.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType(SIMPLE_USE)
	self:SetMaterial('phoenix_storms/gear')
	self:GetPhysicsObject():Sleep()

	self:SetMode(1) // Sleeping Mode

end

function ENT:Think()
	local cen = self:OBBCenter()
	local real = self:LocalToWorld(Vector(cen.x, cen.y, self:OBBMins().z)) + vec

	for _, ent in ipairs(ents.FindInSphere(self:GetPos(), 35)) do
		if ent:IsPlayer() and ((not ent.LastChecked) or (ent.LastChecked <= CurTime())) and (ent:GetPos():Distance(real) < 35) then
			ent.LastChecked = CurTime() + 2
			for k, v in pairs(ent:GetWeapons()) do
				if v:GetClass() == nil then continue end

				if self.IllegalWeapons and table.HasValue(self.IllegalWeapons, v:GetClass()) or (string.sub(v:GetClass(), 0, 6) == "weapon" and !table.HasValue(self.WeaponWhiteList, v:GetClass())) then
					self:Alarm()
					self:NextThink(CurTime() + 2)
					return
				end
			end
			self:Pass()
			self:NextThink(CurTime() + 1)
		end
	end
end

function ENT:UpdateTables(table1, table2)
	self.IllegalWeapons = table1
	self.WeaponWhiteList = table2
end

function ENT:Alarm()

	self:SetMode(3)

	for i = 1, 3 do
		timer.Simple(i - 1, function()
			if IsValid(self) then
				self:EmitSound('ambient/alarms/klaxon1.wav')
				if (i == 3) then
					self:SetMode(1)
				end
			end
		end)
	end

end


function ENT:Pass()

	self:SetMode(2)
	self:EmitSound('HL1/fvox/bell.wav')

	timer.Simple(0.75, function()
		if IsValid(self) then
			self:SetMode(1)
		end
	end)

end
