//=============================================================================//
//========= Daniel Heitz, All rights reserved. ============//
//
// @Author: Daniel Heitz <DidVaitel>
// @Email: contact@gmodhub.com
// @Created: 11.06.2020
// @Modified: 11.06.2020
//
//=============================================================================//

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Barricade"
ENT.Author = "DidVaitel"
ENT.Contact = "contact@gmodhub.com"
ENT.Purpose = "Barricade Base"
ENT.Category = "DidVaitel Entities"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

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
