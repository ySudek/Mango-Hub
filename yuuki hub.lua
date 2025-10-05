getgenv().Config = {
    ["Key"] = "SzfBsrwKVBOxVYSnwoEcdeSKExzSDgaf",
    ["Redeem Code"] = true,
    ["Skip Tutorial"] = true, 
    ["Webhook"] = {
        ["Enable"] = true,
        ["Url"] = "https://discord.com/api/webhooks/1422761452791402516/gtl4AJdA5MfCkpK3vqwF6gxI1qEzJrSiNScH4FDFqzjPUDqADXIjcH8Gc7XuIY1WbS9s",
        ["Mentions ID"] = "", 
        ["Ping Mentions when"] = {
            ["Rarity"] = {
                ["Rare"] = false,
                ["Epic"] = false,
                ["Legendary"] = false,
                ["Mythic"] = false,
                ["Godly"] = false,
                ["Limited"] = true,
                ["Secret"] = true
            },
            ["Mutation"] = {
                ["Normal"] = true,
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
        ["FPS Lock"] = 5,
        ["Setting Low Ingame"] = true,
        ["FPS Boost"] = false,
        ["UI"] = false,
    },
    ["Event"] = {
        ["Enable"] = true,
        ["Auto Redeem Pet Wanted"] = true,
        ["Auto Reset When Completed"] = true
    },
    ["Auto Play"] = {
        ["Auto Equiped Best Brainrot"] = {
            ["Enable"] = true,
            ["Auto Buy More Slot Brainrot Zone"] = true,
            ["Delays"] = 60, 
        },
        ["Auto Collect Money"] = {
            ["Enable"] = true,
            ["Delays"] = 300
        },
        ["Auto Plant"] = { -- ĐỔI từ Auto Plant Seeds sang Auto Plant
            ["Enable"] = true,
            ["Auto Plant Best Seed"] = {
                ["Enable"] = true,
                ["Only Plant When Event"] = false,
                ["New Seed Plant"] = 1,
                ["Auto Use Water Bucket"] = true,
                ["Limit Countdowns Seeds"] = {
                    ["Enable"] = true,
                    ["Limit"] = 2
                },
                ["Delays"] = 180, 
            },
        },
        ["Auto Unlock Rows"] = {
            ["Enable"] = true,
            ["Max Unlock"] = 7
        },
        ["Auto Rebirth"] = {
            ["Enable"] = true,
            ["Max Rebirth Reach"] = 4
        },
        ["Auto Sell"] = {
            ["Sell If Max"] = true,
            ["Brainrot"] = {
                ["Enable"] = true,
                ["Dont Sell Weight Above"] = 99.9,
                ["Ignore Sell"] = {
                    ["Tralalero Tralala"] = true, -- Rebirth 1
                    ["Bombini Gussini"] = true, -- Rebirth 1
                    ["La Tomatoro"] = true, -- Rebirth 2,3,4
                    ["Los Tralaleritos"] = true, -- Rebirth 2,3,4
                    ["Los Sekolitos"] = true, -- Rebirth 5
                    ["Crazylone Pizaione"] = true, -- Rebirth 5
                    ["Dragon Cannelloni"] = true -- Limited
                },
                ["Select Brainrot Rarity"] = {
                    ["Rare"] = true,
                    ["Epic"] = true,
                    ["Legendary"] = true,
                    ["Mythic"] = true,
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
                ["Dont Sell Weight Above"] = 99.9,
                ["Ignore Sell"] = {
                    ["Tomatrio"] = true,
                    ["Shroombino"] = true,
                },
                ["Select Plants Rarity"] = {
                    ["Rare"] = true,
                    ["Epic"] = true,
                    ["Legendary"] = true,
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
            ["Shroombino Seed"] = true,
            ["Mango Seed"] = true
        }
    }
}
script_key=getgenv().Config["Key"]; 
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a0ef4b49bca056c6d0ebcf051948d4a8.lua"))()
