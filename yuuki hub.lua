getgenv().Config = {
    ["Key"] = "SzfBsrwKVBOxVYSnwoEcdeSKExzSDgaf",
    ["Redeem Code"] = true,
    ["Skip Tutorial"] = true, -- After Rejoin You Must Need Waiting For Valid You (5mins-10mins)
    ["Webhook"] = {
        ["Enable"] = true,
        ["Url"] = "l",
        ["Mentions ID"] = "https://discord.com/api/webhooks/1422761452791402516/gtl4AJdA5MfCkpK3vqwF6gxI1qEzJrSiNScH4FDFqzjPUDqADXIjcH8Gc7XuIY1WbS9s", -- Discord ID
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
                ["Diamond"] = true,
                ["Neon"] = true,
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
        ["UI"] = false,
    },
    ["Auto Play"] = {
        ["Auto Equiped Best Brainrot"] = {
            ["Enable"] = true,
            ["Auto Buy More Slot Brainrot Zone"] = true,
            ["Delays"] = 60, -- [ Seconds ]
        }, -- Auto Equiped In Brainrot Zone
        ["Auto Collect Money"] = {
            ["Enable"] = true, -- Auto Claim Money From Brainrot
            ["Delays"] = 60 -- -- [ Seconds ]
        },
        ["Auto Unlock Rows"] = {
            ["Enable"] = true,
            ["Max Unlock"] = 7 -- 7 Rows, Priority Lowest Price To Unlock
        },
        ["Auto Rebirth"] = {
            ["Enable"] = true,
            ["Max Rebirth Reach"] = 2 -- You may select the rebirth of your choice [ Max 2 ]
        },
        ["Auto Plant"] = {
            ["Enable"] = true, -- Enable Plant
            ["Auto Plant Best Seed"] = {
                ["Enable"] = true,
                ["Only Plant When Event"] = false, -- Only Plant Seed When Event,
                ["New Seed Plant"] = 1, -- Plant New Seed [ Priority High Rarity ]
                ["Auto Use Water Bucket"] = true, -- Only Work In Private Server
                ["Limit Countdowns Seeds"] = {
                    ["Enable"] = true, -- Stop Plant New Seed When Many Countdowns Seeds [ Only Work In Private Server ]
                    ["Limit"] = 2
                },
                ["Delays"] = 60, -- [ Seconds ]
            },-- Clear all plants and replant the best seeds/plants
        },
        ["Auto Sell"] = {
            ["Sell If Max"] = true, -- Only Sell After Full Inventory
            ["Brainrot"] = {
                ["Enable"] = true,
                ["Dont Sell Weight Above"] = 99.9, -- KG
                ["Ignore Sell"] = {
                    ["Tralalero Tralala"] = true, -- Rebirth 1
                    ["Bombini Gussini"] = true, -- Rebirth 1
                    ["Vacca Saturno Saturnita"] = true, -- Rebirth 2,3,4
                    ["Los Tralaleritos"] = true, -- Rebirth 2,3,4
                    ["Dragon Cannelloni"] = true -- Limited
                },
                ["Select Brainrot Rarity"] = {
                    ["Rare"] = true,
                    ["Epic"] = true,
                    ["Legendary"] = true,
                    ["Mythic"] = false,
                    ["Godly"] = false,
                    ["Limited"] = false,
                    ["Serect"] = false
                },
                ["Select Brainrot Mutation"] = {
                    ["Normal"] = true,
                    ["Diamond"] = true,
                    ["Neon"] = true,
                    ["Gold"] = true,
                    ["Rainbow"] = true,
                    ["Galactic"] = true,
                    ["Frozen"] = true
                }
            },
            ["Plants"] = {
                ["Enable"] = true,
                ["Dont Sell Weight Above"] = 99.9, -- KG
                ["Ignore Sell"] = {
                    ["Tomatrio"] = true,
                    ["Shroombino"] = true,
                },
                ["Select Plants Rarity"] = {
                    ["Rare"] = true,
                    ["Epic"] = true,
                    ["Legendary"] = false,
                    ["Mythic"] = false,
                    ["Godly"] = false,
                    ["Limited"] = false,
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
    },
    ["Auto Buy Gears"] = {
        ["Enable"] = true,
        ["Select Gear"] = {
            ["Water Bucket"] = true,
            ["Frost Grenade"] = false,
            ["Banana Gun"] = false,
            ["Frost Blower"] = false,
            ["Carrot Launcher"] = false,
        }
    },
    ["Auto Buy Seeds"] = {
        ["Enable"] = true,
        ["Select Seeds"] = {
            ["Cactus Seed"] = true,
            ["Strawberry Seed"] = true,
            ["Pumpkin Seed"] = true,
            ["Sunflower Seed"] = true,
            ["Dragon Fruit Seed"] = true,
            ["Eggplant Seed"] = true,
            ["Watermelon Seed"] = true,
            ["Cocotank Seed"] = true,
            ["Grape Seed"] = true,
            ["Carnivorous Plant Seed"] = true,
            ["Mr Carrot Seed"] = true,
            ["Tomatrio Seed"] = true,
            ["Shroombino Seed"] = true
        }
    }
}
script_key=getgenv().Config["Key"];
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a0ef4b49bca056c6d0ebcf051948d4a8.lua"))()
