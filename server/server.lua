ESX.RegisterServerCallback('fs_joblock:ToggleClock', function(src, cb, jobName, clockIn)
    local jobTable = Config.Jobs[jobName]
    if jobTable == nil then return cb(false) end

    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayerJob = xPlayer.getJob()

    local job = jobTable.ClockedOutJob

    if clockIn then
        job = jobTable.ClockedInJob
    end

    if ESX.DoesJobExist(job, xPlayerJob.grade) then
        xPlayer.setJob(job, xPlayerJob.grade)

        cb(true)
    else
        cb(false)
    end
end)