script_key="SzfBsrwKVBOxVYSnwoEcdeSKExzSDgaf";
getgenv().Config = {
    ["AutoFarm"] = true,
    ["Webhook"] = {
        ["Enable"] = true,
        ["URL"] = "https://discord.com/api/webhooks/1421801057486635132/70UvFl3WQNYiIoPGyLAUUCh8j4_06KyLLNzcClKJIGD-aTrFZJimBi8xNzfh-1gpLrO-",
        ["Mentions"] = "",
    },
    ["Misc"] = {
        ["Kick if Ping above"] = 750,
        ["Kick if FPS below"] = 5,
    },
    ["Performance"] = {
        ["WhiteScreen"] = false,
        ["FPS Boost"] = true
    },
    ["AutoBuy"] = {
        ["Enable"] = true,
        ["Wait Mutation Event"] = {
            ["Enable"] = true,
            ["Time"] = 10 -- [ Seconds ]
        },
        ["Pet"] = {
            ["Celularcini Viciosini"] = true,
            ["Dragon Cannelloni"] = true,
            ["Los Mobilis"] = true,
            ["Los Tralaleritos"] = true,
            ["Celularcini Viciosini"] = true,
            ["Karkerkar Kurkur"] = true,
            ["Agarrini la Palini"] = true,
            ["Dragon Cannelloni"] = true,
            ["Los Nooo My Hotspotsitos"] = true,
            ["Fragola La La La"] = true,
            ["Mariachi Corazoni"] = true,
            ["Chicleteira Bicicleteira"] = true,
            ["Tacorita Bicicleta"] = true,
            ["Extinct Tralalero"] = true,
            ["La Vacca Saturno Saturnita"] = true,
            ["Strawberry Elephant"] = true,
            ["Graipuss Medussi"] = true,
            ["Los Hotspotsitos"] = true,
            ["Los Combinasionas"] = true,
            ["Las Vaquitas Saturnitas"] = true,
            ["Nuclearo Dinossauro"] = true,
            ["Torrtuginni Dragonfrutini"] = true,
            ["Garama and Madundung"] = true,
            ["La Grande Combinasion"] = true,
          
        }
    }
}
spawn(function() task.wait(30) if not getgenv().Loaded then game.Players.LocalPlayer:Kick("timeout") end end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/18096c933cc4c3739403209c8e725401.lua"))()
