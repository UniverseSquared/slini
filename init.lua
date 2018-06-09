local slini = {}

function slini.parse(data)
	-- Add trailing \n
	if data:sub(-1) ~= "\n" then
		data = data .. "\n"
	end
	
	local out = {}
	local section = nil
	for line in data:gmatch("(.-)\n") do
		if line ~= "" then
			local s = line:match("^%[(.-)%]$")
			if s ~= nil then
				section = s
				out[section] = {}
			else
				local key, value = line:match("^(.-)=(.-)$")
				out[section][key] = value
			end
		end
	end

	return out
end

return slini
