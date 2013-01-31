MsgN("Initializing OpenSC")

GM.Version = "0.1"
GM.Name = "OpenSC"
GM.Author = "Cookie"

local basefolder = GM.FolderName .. "/gamemode/"

local files = file.Find( basefolder .. "shared/*.lua", "LUA" )
if #files > 0 then
	for _, file in ipairs( files ) do
		Msg( "[OpenSC] Loading SHARED module: " .. file .. "\n" )
		include( basefolder .. "shared/" .. file )
		AddCSLuaFile( basefolder .. "shared/" .. file )
	end
end

local files = file.Find( basefolder .. "server/*.lua", "LUA" )
if #files > 0 then
	for _, file in ipairs( files ) do
		Msg( "[OpenSC] Loading SERVER module: " .. file .. "\n" )
		include( basefolder .. "server/" .. file ) 
	end
end 

local files = file.Find( basefolder .. "client/*.lua", "LUA" )
if #files > 0 then
	for _, file in ipairs( files ) do
		Msg( "[OpenSC] Sending CLIENT module: " .. file .. "\n" )
		AddCSLuaFile( basefolder .. "client/" .. file )
	end
end