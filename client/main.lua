local IsNew = false

RegisterNetEvent('qb-interior:client:SetNewState', function(bool)
	IsNew = bool
end)

-- Functions

local function DespawnInterior(objects, cb)
    CreateThread(function()
        for k, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end

        cb()
    end)
end

function TeleportToInterior(x, y, z, h)
    CreateThread(function()
        SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), h)

        Wait(100)

        DoScreenFadeIn(1000)
    end)
end

-- Starting Apartment

local function CreateApartmentFurnished(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -1.50, "y": 10.0, "z": 1.3, "h":358.50}')
	POIOffsets.clothes = json.decode('{"x": -6.028, "y": -9.5, "z": 1.2, "h":2.263}')
	POIOffsets.stash = json.decode('{"x": -7.305, "y": -3.922, "z": 0.5, "h":2.263}')
	POIOffsets.logout = json.decode('{"x": -0.8, "y": 1.0, "z": 1.0, "h":2.263}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do
	    Wait(3)
	end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + 1.5, spawn.y - 10.0, spawn.z, POIOffsets.exit.h)
	if IsNew then
		SetTimeout(750, function()
			TriggerEvent('qb-clothes:client:CreateFirstCharacter')
			IsNew = false
		end)
	end
    return { objects, POIOffsets }
end

-- Shells (in order by tier starting at 1)

local function CreateApartmentShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.693, "y": -6.015, "z": 1.11, "h":358.634}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_v16low`)
	while not HasModelLoaded(`shell_v16low`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_v16low`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateTier1House(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.561, "y": -14.305, "z": 1.147, "h":2.263}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_v16mid`)
	while not HasModelLoaded(`shell_v16mid`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_v16mid`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateTrevorsShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.374, "y": -3.789, "z": 2.428, "h":358.633}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trevor`)
	while not HasModelLoaded(`shell_trevor`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trevor`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateCaravanShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":3.3, "y":-2.1, "x":-1.4, "h":358.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trailer`)
	while not HasModelLoaded(`shell_trailer`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trailer`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateLesterShell(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.780, "y":-0.795, "z":1.1,"h":270.30}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_lester`)
	while not HasModelLoaded(`shell_lester`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_lester`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateRanchShell(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.257, "y":-5.469, "z":2.5, "h":270.57,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_ranch`)
	while not HasModelLoaded(`shell_ranch`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_ranch`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouseRobbery(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do
	    Wait(1000)
	end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellmedium3(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-2.5239868164063, "y":7.7714233398438, "z":6, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_medium3`)
	while not HasModelLoaded(`shell_medium3`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_medium3`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shelllester(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x":-1.6512145996094, "y":-6.0126342773438, "z":0.35986328125, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_lester`)
	while not HasModelLoaded(`shell_lester`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_lester`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellfrankaunt(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x":-0.33334350585938, "y":-5.9446105957031, "z":1.5599365234375, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_frankaunt`)
	while not HasModelLoaded(`shell_frankaunt`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_frankaunt`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shelltrailer(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.3285827636719, "y":-2.0115661621094, "z":1.4691772460938, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trailer`)
	while not HasModelLoaded(`shell_trailer`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trailer`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellmedium2(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":6.0094604492188, "y":0.28695678710938, "z":0.6507873535156, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_medium2`)
	while not HasModelLoaded(`shell_medium2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_medium2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellv16low(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":4.635009765625, "y":-6.5882263183594, "z":0.6448974609375, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_v16low`)
	while not HasModelLoaded(`shell_v16low`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_v16low`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shelltrevor(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":0.18386840820313, "y":-3.8077392578125, "z":1.3983764648438, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trevor`)
	while not HasModelLoaded(`shell_trevor`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trevor`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellv16mid(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":1.3710327148438, "y":-14.351745605469, "z":0.4822082519531, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_v16mid`)
	while not HasModelLoaded(`shell_v16mid`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_v16mid`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellapartment2(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-2.2558898925781, "y":8.9857788085938, "z":8.212249755859, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_apartment2`)
	while not HasModelLoaded(`shell_apartment2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_apartment2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellapartment1(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-2.2137756347656, "y":8.95556640625, "z":8.2123107910156, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_apartment1`)
	while not HasModelLoaded(`shell_apartment1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_apartment1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellhighendv2(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-10.472412109375, "y":0.82540893554688, "z":5.9453125, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_highendv2`)
	while not HasModelLoaded(`shell_highendv2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_highendv2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellhighend(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-22.357116699219, "y":-0.3636474609375, "z":6.2174072265625, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_highend`)
	while not HasModelLoaded(`shell_highend`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_highend`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellapartment3(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":11.430450439453, "y":4.4891662597656, "z":8.01904296875, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_apartment3`)
	while not HasModelLoaded(`shell_apartment3`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_apartment3`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellmichael(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-9.3757629394531, "y":5.6485290527344, "z":10.05322265625, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_michael`)
	while not HasModelLoaded(`shell_michael`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_michael`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellwestons(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":4.3998336791992, "y":10.373115539551, "z":5.95943603515625, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_westons`)
	while not HasModelLoaded(`shell_westons`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_westons`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellwestons2(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.8435668945313, "y":10.505462646484, "z":5.9590087890625, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_westons2`)
	while not HasModelLoaded(`shell_westons2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_westons2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shellbanham(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-3.3586883544922, "y":-1.5261611938477, "z":5.24725341796875, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_banham`)
	while not HasModelLoaded(`shell_banham`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_banham`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_stashhouse1(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":21.6624, "y":-0.4912, "z":18.7154, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`stashhouse1_shell`)
	while not HasModelLoaded(`stashhouse1_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`stashhouse1_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_stashhouse2(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":0.0035, "y":5.4052, "z":2.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`stashhouse3_shell`)
	while not HasModelLoaded(`stashhouse3_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`stashhouse3_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_stashhouse3(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":0.0512, "y":-5.7187, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`container2_shell`)
	while not HasModelLoaded(`container2_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`container2_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_barberShop(spawn) -- borber
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":1.6, "y":5.32, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_barber`)
	while not HasModelLoaded(`shell_barber`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_barber`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_decentWarehouse(spawn) -- nice warehouse
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-6.29, "y":8.61, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_coke1`)
	while not HasModelLoaded(`shell_coke1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_coke1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_biggerWarehouse(spawn) -- bigger coke warehouse
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-6.34, "y":8.64, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_coke2`)
	while not HasModelLoaded(`shell_coke2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_coke2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_largeGarage(spawn) -- big garage
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":11.96, "y":-14.22, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_garagel`)
	while not HasModelLoaded(`shell_garagel`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_garagel`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_mediumGarage(spawn) -- medium garage
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":13.2, "y":1.69, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_garagem`)
	while not HasModelLoaded(`shell_garagem`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_garagem`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_smallGarage(spawn) -- small garage
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":5.96, "y":3.65, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_garages`)
	while not HasModelLoaded(`shell_garages`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_garages`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_gunStore(spawn) -- gun store
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.05, "y":-5.65, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_gunstore`)
	while not HasModelLoaded(`shell_gunstore`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_gunstore`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_test8(spawn) -- same shit as before DELETE
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":0.0, "y":0.0, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_gunstore`)
	while not HasModelLoaded(`shell_gunstore`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_gunstore`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_test9(spawn) -- DOESNT LOAD -- DELETE
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":0.0, "y":0.0, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_medium`)
	while not HasModelLoaded(`shell_medium`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_medium`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_methWarehouse(spawn) -- meth warehouse
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-6.33, "y":9.35, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_meth`)
	while not HasModelLoaded(`shell_meth`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_meth`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_smallOffice(spawn) -- small office/house
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":1.34, "y":4.99, "z":1.05, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_office1`)
	while not HasModelLoaded(`shell_office1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_office1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_smallFancyOffice(spawn) -- fancy small ofice
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":3.10, "y":-1.87, "z":0.0, "h":0.38,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_office2`)
	while not HasModelLoaded(`shell_office2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_office2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_execOffice(spawn) -- big exec office
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-12.98, "y":-1.65, "z":4.3, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_officebig`)
	while not HasModelLoaded(`shell_officebig`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_officebig`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_smallStore(spawn) -- small shitty store
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-2.54, "y":-4.69, "z":0.8, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_store1`)
	while not HasModelLoaded(`shell_store1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_store1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_mediumStore(spawn) -- medium shit store
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-0.67, "y":-5.08, "z":0.01, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_store2`)
	while not HasModelLoaded(`shell_store2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_store2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_liquorStore(spawn) -- liquor store
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-0.08, "y":-7.79, "z":1.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_store3`)
	while not HasModelLoaded(`shell_store3`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_store3`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_smallWarehouse(spawn) -- decent warehouse small
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-8.87, "y":0.19, "z":0.03, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_warehouse1`)
	while not HasModelLoaded(`shell_warehouse1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_warehouse1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_biggerWarehouse(spawn) -- nice warehouse kinda big
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-12.55, "y":5.59, "z":0.03, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_warehouse2`)
	while not HasModelLoaded(`shell_warehouse2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_warehouse2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_shitWarehouse(spawn) -- crappy small warehouse
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":2.52, "y":-1.63, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_warehouse3`)
	while not HasModelLoaded(`shell_warehouse3`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_warehouse3`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_hugeWarehouse(spawn) -- BIG warehouse for weed
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":17.79, "y":11.74, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_weed`)
	while not HasModelLoaded(`shell_weed`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_weed`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouse_weedPropWarehouse(spawn) -- BIG warehouse for weed WITH WEED PROPS
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":17.79, "y":11.74, "z":0.0, "h":0.0,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_weed2`)
	while not HasModelLoaded(`shell_weed2`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_weed2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

-- Exports

exports('DespawnInterior', DespawnInterior)
exports('CreateRanchShell', CreateRanchShell)
exports('CreateTier1House', CreateTier1House)
exports('CreateLesterShell', CreateLesterShell)
exports('CreateHouseRobbery', CreateHouseRobbery)
exports('CreateTrevorsShell', CreateTrevorsShell)
exports('CreateCaravanShell', CreateCaravanShell)
exports('CreateApartmentShell', CreateApartmentShell)
exports('CreateApartmentFurnished', CreateApartmentFurnished)
exports('CreateHouseMedium3', CreateHouse_shellmedium3)
exports('CreateHouseLester', CreateHouse_shelllester)
exports('CreateHouseFrankAunt', CreateHouse_shellfrankaunt)
exports('CreateHouseTrailer', CreateHouse_shelltrailer)
exports('CreateHouseMedium2', CreateHouse_shellmedium2)
exports('CreateHousev16low', CreateHouse_shellv16low)
exports('CreateHouseTrevor', CreateHouse_shelltrevor)
exports('CreateHousev16mid', CreateHouse_shellv16mid)
exports('CreateHouseApartment2', CreateHouse_shellapartment2)
exports('CreateHouseApartment1', CreateHouse_shellapartment1)
exports('CreateHouseHighEndv2', CreateHouse_shellhighendv2)
exports('CreateHouseHighEnd', CreateHouse_shellhighend)
exports('CreateHouseApartment3', CreateHouse_shellapartment3)
exports('CreateHouseMichael', CreateHouse_shellmichael)
exports('CreateHouseWestons', CreateHouse_shellwestons)
exports('CreateHouseWestons2', CreateHouse_shellwestons2)
exports('CreateHouseBanham', CreateHouse_shellbanham)
exports('CreateHouseStashHouse1', CreateHouse_stashhouse1)
exports('CreateHouseStashHouse2', CreateHouse_stashhouse2)
exports('CreateHouseStashHouse3', CreateHouse_stashhouse3)
exports('CreateHouseBarberShop', CreateHouse_barberShop)
exports('CreateHouseDecentWarehouse', CreateHouse_decentWarehouse)
exports('CreateHouseBiggerWarehouse', CreateHouse_biggerWarehouse)
exports('CreateHouseLargeGarage', CreateHouse_largeGarage)
exports('CreateHouseMediumGarage', CreateHouse_mediumGarage)
exports('CreateHouseSmallGarage', CreateHouse_smallGarage)
exports('CreateHouseGunStore', CreateHouse_gunStore)
exports('CreateHouseMethProduction', CreateHouse_methWarehouse)
exports('CreateHouseSmallOffice', CreateHouse_smallOffice)
exports('CreateHouseSmallOffice2', CreateHouse_smallFancyOffice)
exports('CreateHouseExecOffice', CreateHouse_execOffice)
exports('CreateHouseSmallStore', CreateHouse_smallStore)
exports('CreateHouseMediumStore', CreateHouse_mediumStore)
exports('CreateHouseLiquorStore', CreateHouse_liquorStore)
exports('CreateHouseSmallWarehouse', CreateHouse_smallWarehouse)
exports('CreateHouseBiggerWarehouse', CreateHouse_biggerWarehouse)
exports('CreateHouseShitWarehouse', CreateHouse_shitWarehouse)
exports('CreateHouseHugeWarehouse', CreateHouse_hugeWarehouse)
exports('CreateHouseWeedPrefilledWarehouse', CreateHouse_weedPropWarehouse)
