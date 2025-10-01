--- Best Farm Kaitun PVB (Wibu)
getgenv().Config = {
    ["Key"] = "SzfBsrwKVBOxVYSnwoEcdeSKExzSDgaf", -- Get Key In Discord Yuuki Hub - https://ads.luarmor.net/get_key?for=-eAuiyQiPmDKX
    ["Redeem Code"] = true,
    ["Skip Tutorial"] = true, -- After Rejoin You Must Need Waiting For Valid You (5mins-10mins)
    ["Webhook"] = {
        ["Enable"] = true,
        ["Url"] = "https://discord.com/api/webhooks/1422761452791402516/gtl4AJdA5MfCkpK3vqwF6gxI1qEzJrSiNScH4FDFqzjPUDqADXIjcH8Gc7XuIY1WbS9s", -- Webhook URL
        ["Mentions ID"] = "", -- Discord ID
        ["Ping Mentions when"] = {
            ["Rarity"] = {
                ["Rare"] = false,
                ["Epic"] = false,
                ["Legendary"] = false,
                ["Mythic"] = true,
                ["Godly"] = true,
                ["Limited"] = true,
                ["Secret"] = true
            },
            ["Mutation"] = {
                ["Normal"] = false,
                ["Diamond"] = false,
                ["Neon"] = false,
                ["Gold"] = true,
                ["Rainbow"] = true,
                ["Galactic"] = true,
                ["Frozen"] = true
            }
        },
    },
    ["Performance"] = {
        ["Auto Rejoin"] = {
            ["Enable"] = true, -- Reduced Bug/Error IDK [ Recommended ]
            ["Delays"] = 1, -- [ Hours ] 0.5 = 30mins
        },
        ["FPS Boost"] = false,
        ["UI"] = true,
    },
    ["Auto Play"] = {
        ["Auto Plant Seeds"] = {
            ["Enable"] = true,
            ["Auto Equiped Best Brainrot"] = {
                ["Enable"] = true,
                ["Delays"] = 60, -- [ Seconds ]
            }, -- Auto Equiped In Brainrot Zone
            ["Auto Plant Best Seed"] = {
                ["Enable"] = true,
                ["Only Plant When Event"] = {
                    ["Enable"] = true, -- Only Plant Seed When Event
                    ["Event"] = {
                        ["Frozen"] = true,
                        ["Rainbow"] = true,
                        ["Golden"] = true,
                        ["Galactic"] = true,
                    }
                },
                ["New Seed Plant"] = 1, -- Plant New Seed [ Priority High Rarity ]
                ["Auto Use Water Bucket"] = true, -- Only Work In Private Server
                ["Limit Countdowns Seeds"] = {
                    ["Enable"] = true, -- Stop Plant New Seed When Many Countdowns Seeds [ Only Work In Private Server ]
                    ["Limit"] = 2
                },
                ["Delays"] = 60, -- [ Seconds ]
            },-- Clear all plants and replant the best seeds/plants
            ["Auto Buy More Slot Brainrot Zone"] = true,
            ["Auto Collect Money"] = {
                ["Enable"] = true, -- Auto Claim Money From Brainrot
                ["Delays"] = 30 -- -- [ Seconds ]
            },
        },
        ["Auto Rebirth"] = {
            ["Enable"] = false,
            ["Max Rebirth Reach"] = 4 -- You may select the rebirth of your choice
        },
        ["Auto Sell"] = {
            ["Sell If Max"] = true, -- Only Sell After Full Inventory
            ["Brainrot"] = {
                ["Enable"] = true,
                ["Select Brainrot Rarity"] = {
                    ["Rare"] = true,
                    ["Epic"] = true,
                    ["Legendary"] = true,
                    ["Mythic"] = true,
                    ["Godly"] = true,
                    ["Serect"] = false
                },
                ["Select Brainrot Mutation"] = {
                    ["Normal"] = true,
                    ["Diamond"] = true,
                    ["Neon"] = true,
                    ["Gold"] = true,
                    ["Rainbow"] = true,
                    ["Galactic"] = false,
                    ["Frozen"] = false
                }
            },
            ["Plants"] = {
                ["Enable"] = true,
                ["Select Plants Rarity"] = {
                    ["Rare"] = true,
                    ["Epic"] = true,
                    ["Legendary"] = true,
                    ["Mythic"] = false,
                    ["Godly"] = false,
                    ["Serect"] = false
                },
                 ["Select Plants Mutation"] = {
                    ["Normal"] = true,
                    ["Diamond"] = false,
                    ["Neon"] = false,
                    ["Gold"] = false,
                    ["Rainbow"] = false,
                    ["Galactic"] = false,
                    ["Frozen"] = false
                }
            }
        },
        ["Auto Unlock Rows"] = {
            ["Enable"] = true,
            ["Max Unlock"] = 7 -- 7 Rows, Priority Lowest Price To Unlock
        },
    },
    ["Auto Buy Gears"] = {
        ["Enable"] = true,
        ["Select Gear"] = {
            ["Water Bucket"] = true,
            ["Frost Grenade"] = true,
            ["Banana Gun"] = false,
            ["Frost Blower"] = false,
            ["Carrot Launcher"] = false,
        }
    },
    ["Auto Buy Seeds"] = {
        ["Enable"] = true,
        ["Select Seeds"] = {
            ["Cactus Seed"] = false,
            ["Strawberry Seed"] = false,
            ["Pumpkin Seed"] = false,
            ["Sunflower Seed"] = false,
            ["Dragon Fruit Seed"] = false,
            ["Eggplant Seed"] = false,
            ["Watermelon Seed"] = true,
            ["Grape Seed"] = true,
            ["Cocotank Seed"] = true,
            ["Carnivorous Plant Seed"] = true,
            ["Mr Carrot Seed"] = true,
            ["Tomatrio Seed"] = true,
            ["Shroombino Seed"] = true
        }
    }
}
script_key=getgenv().Config["Key"];
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a0ef4b49bca056c6d0ebcf051948d4a8.lua"))()