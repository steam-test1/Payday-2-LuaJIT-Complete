Bitwise = Bitwise or class()

function Bitwise:init()
	return
end

function Bitwise:lshift(x, by)
	return x * 2^by
end

function Bitwise:rshift(x, by)
	return math.floor(x / 2^by)
end
