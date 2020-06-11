//=============================================================================//
//========= Daniel Heitz, All rights reserved. ============//
//
// @Author: Daniel Heitz <DidVaitel>
// @Email: contact@gmodhub.com
// @Created: 11.06.2020
// @Modified: 11.06.2020
//
//=============================================================================//

Barricades = Barricades or {
	Translation = {}
}

Barricades.IncludeServerSide = (SERVER) and include or function() end
Barricades.IncludeClientSide = (SERVER) and AddCSLuaFile or include
Barricades.IncludeSharedSide = function( File )

	Barricades.IncludeServerSide( File )
	Barricades.IncludeClientSide( File )

end

Barricades.IncludeFolder = function( Folder, Inside )

	local Folder = Folder .. "/"

	local Files, Folders = file.Find( Folder .. "*", "LUA" )

	for _, FileDir in ipairs( Files ) do

    local FileName = Folder .. FileDir

    if ( string.find( FileName, "sv_" ) ) then
      Barricades.IncludeServerSide( FileName )
    elseif ( string.find( FileName, "cl_" ) ) then
      Barricades.IncludeClientSide( FileName )
    elseif ( string.find( FileName, "sh_" ) ) then
      Barricades.IncludeSharedSide( FileName )
    end

	end

	if ( Inside == true ) then
		for _, FileDir in ipairs( Folders ) do
			Barricades.IncludeFolder( Folder .. FileDir, true )
		end
	end

end

Barricades.IncludeFolder( "ddv_barricades", true )
