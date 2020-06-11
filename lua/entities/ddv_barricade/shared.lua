--[[
	Script: Metal Detector
	Version: 1.0
	Created by DidVaitel (http://steamcommunity.com/profiles/76561198108670811)
]]

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Metal Detector"
ENT.Author = "DidVaitel"
ENT.Contact = "contact@poorpixel.eu"
ENT.Purpose = "Detect weapons"
ENT.Category = "DidVaitel Entities"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupDataTables()
	self:NetworkVar('Int', 1, 'Mode')
end

function ENT:SpawnFunction( ply, tr, ClassName )

	if ( !tr.Hit ) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 65
	local SpawnAng = ply:EyeAngles()
	SpawnAng.p = 0
	SpawnAng.y = SpawnAng.y + 180
	
	local ent = ents.Create( ClassName )
	ent:SetPos( SpawnPos )
	ent:SetAngles( SpawnAng )
	ent:Spawn()
	ent:Activate()
	
	return ent

end