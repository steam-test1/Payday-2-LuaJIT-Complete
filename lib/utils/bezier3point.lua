local sqrt, abs, min, max, sin, cos, radians, degrees, atan2 = math.sqrt, math.abs, math.min, math.max, math.sin, math.cos, math.rad, math.deg, math.atan2

local function hypot(a, b)
	if a == 0 and b == 0 then
		return 0
	end

	a, b = abs(a), abs(b)
	a, b = max(a, b), min(a, b)

	return a * sqrt(1 + (b / a)^2)
end

local function distance(x1, y1, x2, y2)
	return hypot(x2 - x1, y2 - y1)
end

local function distance2(x1, y1, x2, y2)
	return (x2 - x1)^2 + (y2 - y1)^2
end

local function point_around(cx, cy, r, angle)
	angle = radians(angle)

	return cx + cos(angle) * r, cy + sin(angle) * r
end

local function rotate_point(x, y, cx, cy, angle)
	if angle == 0 then
		return x, y
	end

	angle = radians(angle)
	x, y = x - cx, y - cy

	local c, s = cos(angle), sin(angle)

	return cx + x * c - y * s, cy + y * c + x * s
end

local function point_angle(x, y, cx, cy)
	return degrees(atan2(y - cy, x - cx))
end

local function reflect_point(x, y, cx, cy)
	return 2 * cx - x, 2 * cy - y
end

local function reflect_point_distance(x, y, cx, cy, length)
	local d = distance(x, y, cx, cy)

	if d == 0 then
		return cx, cy
	end

	local scale = length / d

	return cx + (cx - x) * scale, cy + (cy - y) * scale
end

return {
	hypot = hypot,
	distance = distance,
	distance2 = distance2,
	point_around = point_around,
	rotate_point = rotate_point,
	point_angle = point_angle,
	reflect_point = reflect_point,
	reflect_point_distance = reflect_point_distance
}
