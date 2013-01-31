MsgN("Initializing Clientside OpenSC")


local basefolder = GM.FolderName .. "/gamemode/"

local files = file.Find( basefolder .. "shared/*.lua", "LUA" )
if #files > 0 then
	for _, file in ipairs( files ) do
		Msg( "[OpenSC] Loading SHARED module: " .. file .. "\n" )
		include( basefolder .. "shared/" .. file )
	end
end

local files = file.Find( basefolder .. "client/*.lua", "LUA" )
if #files > 0 then
	for _, file in ipairs( files ) do
		Msg( "[OpenSC] Sending CLIENT module: " .. file .. "\n" )
		include( basefolder .. "client/" .. file )
	end
end