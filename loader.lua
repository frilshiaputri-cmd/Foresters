-- Foresters stable loader
-- Keep this URL unchanged; update farm_hub.lua on the main branch to publish updates.
local RAW_URL = "https://raw.githubusercontent.com/frilshiaputri-cmd/Foresters/main/farm_hub.lua"

local ok, source = pcall(function()
    return game:HttpGet(RAW_URL)
end)

if not ok or type(source) ~= "string" or source == "" then
    warn("[Foresters Loader] Gagal mengambil farm_hub.lua dari GitHub.")
    return
end

local compileOk, chunk = pcall(loadstring, source)
if not compileOk or type(chunk) ~= "function" then
    warn("[Foresters Loader] Gagal memuat kode. Periksa farm_hub.lua.")
    return
end

local runOk, err = pcall(chunk)
if not runOk then
    warn("[Foresters Loader] Script berhenti karena error: " .. tostring(err))
end
