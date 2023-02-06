repeat wait() until game.Players; repeat wait() until game.Players.LocalPlayer;
if not getgenv().kamizshop_drivingempire then
    getgenv().kamizshop_drivingempire = {
            --["Roblox Account Manager"]
            ["Set Description Account Manager"] = true, --Only Port [7963]!!
            repeat_set = true, -- loop set description wait delay
            delay_set = 10, -- delay set account manager
    }
end

local RAMAccount = loadstring(game:HttpGet 'https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua')()
local MyAccount = RAMAccount.new(game:GetService 'Players'.LocalPlayer.Name)

function robloxaccountmanager_check()
    name = "Name: " .. game.Players.LocalPlayer.DisplayName .. "\n"
    money = "Money: " .. Format_Number(game.Players.LocalPlayer.leaderstats.Cash.Value, 1) .. ' / ' .. MyAccount:GetAlias() .. "\n"
    bounty = "Bounty: " .. Format_Number(game.Players.LocalPlayer.leaderstats.Bounty.Value, 1) .. "\n"
    
    hour = os.date("!*t")["hour"]
    min = os.date("!*t")["min"]
    sec = os.date("!*t")["sec"]
    time = 'Last:  '..hour..':'..min..':'..sec..':'.."\n"
end

local abbreviations = {"", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp"}

function Format_Number(value, idp)
    local ex = math.floor(math.log(math.max(1, math.abs(value)), 1000))
    local abbrevs = abbreviations[1 + ex] or ("e+" .. ex)
    local normal = math.floor(value * ((10 ^ idp) / (1000 ^ ex))) / (10 ^ idp)
    
    return ("%." .. idp .. "f%s"):format(normal, abbrevs)
end
------------------------------------Check
spawn(function()
    pcall(function()
        while task.wait() do
            if getgenv().kamizshop_drivingempire["Set Description Account Manager"] and not getgenv().kamizshop_drivingempire.repeat_set then
                if MyAccount then
                    robloxaccountmanager_check()
                    MyAccount:SetDescription(name .. money .. bounty)
                    break
                end
            elseif getgenv().kamizshop_drivingempire["Set Description Account Manager"] and getgenv().kamizshop_drivingempire.repeat_set then
                if MyAccount then
                    robloxaccountmanager_check()
                    MyAccount:SetDescription(name .. money .. bounty)
                    wait(getgenv().kamizshop_drivingempire.delay_set)
                end
            end
        end
    end)
end)
