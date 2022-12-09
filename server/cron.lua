-- Variables
local Jobs = {}

-- Functions
function GetTime()
	local timestamp = os.time()
	local day = tonumber(os.date('*t', timestamp).wday)
	local hour = tonumber(os.date('%H', timestamp))
	local min = tonumber(os.date('%M', timestamp))

	return {day = day, hour = hour, min = min}
end

function CheckTimes(day, hour, min)
	for i = 1, #Jobs, 1 do
		local data = Jobs[i]
		if data.hour == hour and data.min == min then
			data.cb(day, hour, min)
		end
	end
end

-- Exports
exports("CreateCronJob", function(hour, min, cb)
	if hour and type(hour) == "number" and min and type(min) == "number" and cb and (type(cb) == "function" or type(cb) == "table") then
		table.insert(Jobs, {
			min  = min,
			hour  = hour,
			cb = cb
		})

		return #Jobs
	else
		print("WARN: Invalid arguments for cronrunAt(hour, min, cb)")
		return nil
	end
end)

exports("StopCronJob", function(idx)
	if Jobs[idx] then
		Jobs[idx] = nil
	end
end)

-- Main Loop
Citizen.CreateThread(function()
	while true do
		local time = GetTime()
		CheckTimes(time.day, time.hour, time.min)

		Citizen.Wait(60 * 1000)
	end
end)
