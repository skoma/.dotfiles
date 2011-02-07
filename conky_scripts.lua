local netfile = "/tmp/.conky_net"
local mailfile = "/tmp/.conky_mail"

function conky_proc_run()
	val = tonumber(conky_parse(string.format('${running_processes}')))
	local retval = "j"
	if val == nil or val >= 4 then
		retval = "8"
	else
		retval = string.char(string.byte(retval) + val)
	end
	return retval
end

function exists(filename)
	local file = io.open(filename)
	if file then
		io.close(file)
		return true
	else
		return false
	end
end

function conky_getmail(yescol, nocol)
	col = nocol
	if exists(mailfile) then
		col = yescol
	end
	return string.format("${color %s}${font OpenLogos:size=24}Q", col)
end

function getNetString(color, dev, down, up, signal)
	str = string.format("    ${voffset -5}${color %s}${font PizzaDude Bullets:size=15}%s$font$color ${downspeed %s} ${voffset -5}${color %s}${font PizzaDude Bullets:size=15}%s$font$color ${upspeed %s}", color, down, dev, color, up, dev)
	if signal then
		str = string.format("%s ${voffset -5}${color %s}${font PizzaDude Bullets:size=15}:$font$color ${wireless_link_qual_perc %s}%s", str, color, dev, "%")
	end
	return str
end

function conky_printnet(color)
	retval = ""
	file = io.open(netfile)
	if file then
		line = file.read(file)
		io.close(file)
		if line then
			dev = string.match(line, "^eth%d$")
			if dev and dev == "eth0" then
				retval = getNetString(color, dev, "T", "N", false)
			else
				if dev and dev == "eth1" then
					retval = getNetString(color, dev, "S", "M", true)
				end
			end
		end
	end
	return retval
end
