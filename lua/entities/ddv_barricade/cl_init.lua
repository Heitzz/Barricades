--[[
	Script: Metal Detector
	Version: 1.0
	Created by DidVaitel (http://steamcommunity.com/profiles/76561198108670811)
]]
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
