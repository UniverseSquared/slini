local slini = {
	_LOVE2D = love ~= nil
}

function slini.parse(data)
	-- Add trailing \n
	if data:sub(-1) ~= "\n" then
		data = data .. "\n"
	end
	
	local out = {}
	local section = nil
	for line in data:gmatch("(.-)\n") do
		-- Remove comments
		line = line:gsub("%s*;.+", "")
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

function slini.serialize(data)
	local out = ""
	for section, d in pairs(data) do
		out = out .. "[" .. section .. "]\n"
		for key, value in pairs(d) do
			out = out .. key .. "=" .. value .. "\n"
		end
	end
	
	return out
end

function slini.load(filePath)
	if slini._LOVE2D then
		return slini.parse(love.filesystem.read(filePath))
	else
		local file = io.open(filePath, "r")
		local out = slini.parse(file:read("a"))
		file:close()
		return out
	end
end

function slini.save(filePath, data)
	if slini._LOVE2D then
		love.filesystem.write(filePath, slini.serialize(data))
	else
		local file = io.open(filePath, "w")
		file:write(slini.serialize(data))
		file:close()
	end
end

return slini
