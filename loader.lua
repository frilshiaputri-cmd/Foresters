-- K5-HUB Foresters stable loader
-- This loader runs farm_hub.lua from THIS repository only.
-- Keep this loader URL unchanged; publish updates by editing farm_hub.lua on main.

local RAW_URL = "https://raw.githubusercontent.com/frilshiaputri-cmd/Foresters/main/farm_hub.lua"

local fetchOk, source = pcall(function()
    return game:HttpGet(RAW_URL)
end)

if not fetchOk then
    warn("[Foresters Loader] Gagal mengambil farm_hub.lua: " .. tostring(source))
    return
end

if type(source) ~= "string" or source == "" then
    warn("[Foresters Loader] farm_hub.lua kosong atau tidak tersedia.")
    return
end

local compileOk, chunk, compileError = pcall(loadstring, source)
if not compileOk then
    warn("[Foresters Loader] loadstring gagal: " .. tostring(chunk))
    return
end

if type(chunk) ~= "function" then
    warn("[Foresters Loader] Gagal compile farm_hub.lua: " .. tostring(compileError))
    return
end

local runOk, runError = pcall(chunk)
if not runOk then
    warn("[Foresters Loader] farm_hub.lua berhenti karena error: " .. tostring(runError))
end
