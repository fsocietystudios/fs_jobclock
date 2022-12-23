CreateThread(function()
    for i, j in pairs(Config.Jobs) do
        for _, v in pairs(j.Locations) do
            if GetResourceState("ox_target") ~= "missing" then
                exports.ox_target:addSphereZone({
                    coords = v,
                    radius = 1,
                    debug = false,
                    options = {
                        {
                            name = i,
                            icon = 'fa-solid fa-business-time',
                            label = '[' .. i .. '] ' .. 'Clock in/out!',
                            canInteract = function(entity, distance, coords, name)
                                local playerData = ESX.GetPlayerData()
                                local jobTable = Config.Jobs[name]
                                local jobName = playerData.job.name

                                if distance < 2 and (jobName == jobTable.ClockedInJob or jobName == jobTable.ClockedOutJob) then
                                    return true
                                else
                                    return false
                                end
                            end,
                            onSelect = function (data)
                                local playerData = ESX.GetPlayerData()
                                local jobTable = Config.Jobs[data.name]
                                local jobName = playerData.job.name

                                if jobName == jobTable.ClockedInJob then
                                    ESX.TriggerServerCallback("fs_joblock:ToggleClock", function(sucess)
                                        if not sucess then return ESX.ShowNotification("Couldn't clock you out...") end

                                        return ESX.ShowNotification("You are clocked off!")
                                    end, data.name, false)
                                elseif jobName == jobTable.ClockedOutJob then
                                    ESX.TriggerServerCallback("fs_joblock:ToggleClock", function(sucess)
                                        if not sucess then return ESX.ShowNotification("Couldn't clock you in...") end

                                        return ESX.ShowNotification("You are clocked in!")
                                    end, data.name, true)
                                end
                            end
                        }
                    }
                })
            end
        end
    end
end)