repeat wait() until game.Players; repeat wait() until game.Players.LocalPlayer;
if not getgenv().spritedev_drivingempire then
    getgenv().spritedev_drivingempire = {
        ["Language"] = "en", -- [th / en] เลือกภาษา (th = ไทย / en = อังกฤษ) | Select language (th = thai / en = english)
        ["Roblox Account Manager"] = {--การตั้ง Description ในโปรแกรม Roblox Account Manager | Set Description in Roblox Account Manager
            ["Enable"] = true, --เปิดใช้งานหรือไม่ true = เปิด / false = ปิด | Enable? true or false
            ["Loop"] = true, --วนลูปหรือไม่ true = เปิด / false = ปิด | Loop? true or false
            ["Delay"] = 10, --ดีเลย์ [แนะนำ 10วิ-20วิ] (วินาที) | Delay [recommend 10s-20s] (Sec)
        },
        ["WebHook"] = {--การแจ้งเตือนผ่าน Discord | Discord Webhook Notification
            ["Enable"] = false, --เปิดใช้งานหรือไม่ true = เปิด / false = ปิด | Enable? true or false
            ["Link"] = "https://discord.com/api/webhooks/1072446961032114186/fExwu3Xthp6YTJzPVSsE2IRbkYcTS3KvGa2AEL_AX1VzRYvnT5_rfv-7OOP49xw10Gi9" --ลิงค์ Webhook | Link Webhook
        }
    }
end

local RAMAccount = loadstring(game:HttpGet "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua")()
local MyAccount = RAMAccount.new(game:GetService "Players".LocalPlayer.Name)

function robloxaccountmanager_check()
    name = "Name: " .. game.Players.LocalPlayer.DisplayName .. "\n"
    money = "Money: " .. Format_Number(game.Players.LocalPlayer.leaderstats.Cash.Value, 1) .. " / " .. MyAccount:GetAlias() .. "\n"
    bounty = "Bounty: " .. Format_Number(game.Players.LocalPlayer.leaderstats.Bounty.Value, 1) .. "\n"
    time = "Last: " .. os.date("!%H:%M", os.time() + 7.05 * 60 * 60) .. "\n"
end

local abbreviations = {"", "K", "M"}

function Format_Number(value, idp)
    local ex = math.floor(math.log(math.max(1, math.abs(value)), 1000))
    local abbrevs = abbreviations[1 + ex] or ("e+" .. ex)
    local normal = math.floor(value * ((10 ^ idp) / (1000 ^ ex))) / (10 ^ idp)
    return ("%." .. idp .. "f%s"):format(normal, abbrevs)
end

spawn(function()
    pcall(function()
        while task.wait() do
            --if getgenv().spritedev_drivingempire["WebHook"]["Enable"] then
            --    local message_data = {
            --        ["content"] = ""
            --        ["embeds"] = {{
            --                ["title"] = "**Driving Empire**",
            --                ["description"] = "Test",
            --                ["color"] = tonumber(0xffffff),
            --            }}
            --    }
            --    game:GetService("HttpService"):PostAsync(getgenv().spritedev_drivingempire["WebHook"]["Link"], game:GetService("HttpService"):JSONEncode(message_data))
            --end
            if getgenv().spritedev_drivingempire["Roblox Account Manager"]["Enable"] and not getgenv().spritedev_drivingempire["Roblox Account Manager"]["Loop"] then
                if MyAccount then
                    if not MyAccount:GetAlias() or MyAccount:GetAlias() == nil or MyAccount:GetAlias() == "" or MyAccount:GetAlias() == " " then
                        MyAccount:SetAlias(" - ")
                    end
                    robloxaccountmanager_check()
                    MyAccount:SetDescription(name .. money .. bounty .. time)
                    break
                end
            elseif getgenv().spritedev_drivingempire["Roblox Account Manager"]["Enable"] and getgenv().spritedev_drivingempire["Roblox Account Manager"]["Loop"] then
                if MyAccount then
                    if not MyAccount:GetAlias() or MyAccount:GetAlias() == nil or MyAccount:GetAlias() == "" or MyAccount:GetAlias() == " " then
                        MyAccount:SetAlias(" - ")
                    end
                    robloxaccountmanager_check()
                    MyAccount:SetDescription(name .. money .. bounty .. time)
                    wait(getgenv().spritedev_drivingempire["Roblox Account Manager"]["Delay"])
                end
            end
        end
    end)
end)
