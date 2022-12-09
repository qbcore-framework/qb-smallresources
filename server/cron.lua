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
	for i,v in pairs(Jobs) do
		if v.hour == hour and v.min == min then
			v.cb(day, hour, min)
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
	else
		print("WARN: Invalid arguments for cronrunAt(hour, min, cb)")
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
