-- main.lua
local api = require("api")
local Config = require("config")
local simpledrm = require("simpledrm")

local simpledrm = {}

function simpledrm.checkAPI(apiToCheck, storedAPI)
    return apiToCheck == storedAPI
end

function simpledrm.getUrl(url, apiToCheck, storedAPI)
    if not simpledrm.checkAPI(apiToCheck, storedAPI) then
        print("Invalid API. The link will not execute.")
        return ""
    end

    local isr = getUrlInputStream(url)
    if not isr then
        print("Error opening stream from URL.")
        return ""
    end

    local content = ""
    local line = isr:readLine()
    while line ~= nil do
        content = content .. "\n" .. line
        line = isr:readLine()
    end

    isr:close()

    print("Content retrieved from URL:")
    print(content)

    return content
end

function simpledrm.executeCodeFromURL(url, apiToCheck, storedAPI)
    local content = simpledrm.getUrl(url, apiToCheck, storedAPI)

    if content == "" then
        print("Error retrieving content from URL.")
        return
    end

    local chunk, err = loadstring(content)

    if chunk then
        chunk()
    else
        print("Error loading code: " .. err)
    end
end

function simpledrmapi()
    local correctAPI = Config.APIKey
    local storedAPI = api.getKey()

    local modID = Config.ModID

    if storedAPI ~= correctAPI then
        if getActivatedMods():contains(modID) then
            deactivateMod(modID)
            print("Mod disabled.")
        else
            print("Mod was not enabled.")
        end

        return
    end

    local phpURL = Config.PHPURL .. "?captcha=ModID&apikey=" .. correctAPI
    simpledrm.executeCodeFromURL(phpURL, correctAPI, storedAPI)

    print("Mod initialized successfully.")
end

simpledrmapi()
