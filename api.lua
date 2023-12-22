-- api.lua
local Api = {}
local Config = require("config")

function Api.getKey()
    local correctAPI = Config.APIKey
    local storedAPI = "ceb7e483-c6a6-4b17-bfca-b8a6fea35de7"

    local commonMessage = [[
        
        $$$$$$$\  $$$$$$$\  $$\      $$\          $$$$$$\  $$$$$$$\ $$$$$$\ 
        $$  __$$\ $$  __$$\ $$$\    $$$ |        $$  __$$\ $$  __$$\\_$$  _|
        $$ |  $$ |$$ |  $$ |$$$$\  $$$$ |        $$ /  $$ |$$ |  $$ | $$ |  
        $$ |  $$ |$$$$$$$  |$$\$$\$$ $$ |$$$$$$\ $$$$$$$$ |$$$$$$$  | $$ |  
        $$ |  $$ |$$  __$$< $$ \$$$  $$ |\______|$$  __$$ |$$  ____/  $$ |  
        $$ |  $$ |$$ |  $$ |$$ |\$  /$$ |        $$ |  $$ |$$ |       $$ |  
        $$$$$$$  |$$ |  $$ |$$ | \_/ $$ |        $$ |  $$ |$$ |     $$$$$$\ 
        \_______/ \__|  \__|\__|     \__|        \__|  \__|\__|     \______|
    ]]

    if storedAPI == correctAPI then
        print(commonMessage .. "\nValid API authorized access")
        return storedAPI
    else
        print(commonMessage .. "\nInvalid API access denied")
        return nil
    end
end

return Api

