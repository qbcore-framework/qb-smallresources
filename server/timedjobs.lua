-- Variables
local jobs = {}

-- Functions
function GetTime()
	local timestamp = os.time()
	local day = tonumber(os.date('*t', timestamp).wday)
	local hour = tonumber(os.date('%H', timestamp))
	local min = tonumber(os.date('%M', timestamp))

	return {day = day, hour = hour, min = min}
end

function CheckTimes(day, hour, min)
	for i = 1, #jobs, 1 do
		local data = jobs[i]
		if data.hour == hour and data.min == min then
			data.cb(day, hour, min)
		end
	end
end

-- Exports

---Creates a Timed Job
---@param hour number
---@param min number
---@param cb function
exports("CreateTimedJob", function(hour, min, cb)
	if hour and type(hour) == "number" and min and type(min) == "number" and cb and (type(cb) == "function" or type(cb) == "table") then
		jobs[#jobs + 1] = {
			min = min,
			hour = hour,
			cb = cb
		}

		return #jobs
	else
		print("WARN: Invalid arguments for export CreateTimedJob(hour, min, cb)")
		return nil
	end
end)

---Force runs a Timed Job
---@param idx number
exports("ForceRunTimedJob", function(idx)
	if jobs[idx] then
		local time = GetTime()
		jobs[idx].cb(time.day, time.hour, time.min)
	end
end)

---Stops a Timed Job
---@param idx number
exports("StopTimedJob", function(idx)
	if jobs[idx] then
		jobs[idx] = nil
	end
end)

-- Main Loop
CreateThread(function()
	while true do
		local time = GetTime()
		CheckTimes(time.day, time.hour, time.min)

		Wait(60 * 1000)
	end
end)
