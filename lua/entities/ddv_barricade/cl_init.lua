//=============================================================================//
//========= Daniel Heitz, All rights reserved. ============//
//
// @Author: Daniel Heitz <DidVaitel>
// @Email: contact@gmodhub.com
// @Created: 11.06.2020
// @Modified: 11.06.2020
//
//=============================================================================//

include("shared.lua")

local colors = { Color(0, 0, 0), Color(0, 255, 0), Color(255, 0, 0) }

function ENT:Draw()

	self:DrawModel()

	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)

	cam.Start3D2D(self:GetPos() + ang:Up() * 0.65, ang, 0.1)
		surface.SetDrawColor(colors[self:GetMode()])
		surface.DrawRect(-225, -606, 460, 144)
	cam.End3D2D()

end
