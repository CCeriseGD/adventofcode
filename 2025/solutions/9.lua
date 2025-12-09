local tiles = {}
for x, y in input.linematch("(%d+),(%d+)") do
    table.insert(tiles, {tonumber(x), tonumber(y)})
end

local areas = {}
local lines = {}
for i = 1, #tiles do
    local t1 = tiles[i]
    for j = i+1, #tiles do
        local t2 = tiles[j]
        local minx, miny, maxx, maxy = math.min(t1[1], t2[1]), math.min(t1[2], t2[2]), math.max(t1[1], t2[1]), math.max(t1[2], t2[2])
        local area = (maxx-minx+1) * (maxy-miny+1)
        table.insert(areas, {area, minx, miny, maxx, maxy})
    end

    local t2 = tiles[i+1] or tiles[1]
    local minx, miny, maxx, maxy = math.min(t1[1], t2[1]), math.min(t1[2], t2[2]), math.max(t1[1], t2[1]), math.max(t1[2], t2[2])
    table.insert(lines, {minx, miny, maxx, maxy})
end
table.sort(areas, function(x, y) return x[1] > y[1] end)
output.part1(areas[1][1])

local function pointinsquare(sminx, sminy, smaxx, smaxy, px, py)
    return px > sminx and px < smaxx and py > sminy and py < smaxy
end
local function lineinsquare(sminx, sminy, smaxx, smaxy, lminx, lminy, lmaxx, lmaxy)
    return pointinsquare(sminx, sminy, smaxx, smaxy, lminx, lminy)
    or pointinsquare(sminx, sminy, smaxx, smaxy, lmaxx, lmaxy)
    or lminx == lmaxx and lminx > sminx and lminx < smaxx and lminy <= sminy and lmaxy >= smaxy
    or lminy == lmaxy and lminy > sminy and lminy < smaxy and lminx <= sminx and lmaxx >= smaxx
end

for i, v in ipairs(areas) do
    local area, sminx, sminy, smaxx, smaxy = unpack(v)
    local valid = true
    for j, w in ipairs(lines) do
        local lminx, lminy, lmaxx, lmaxy = unpack(w)
        if lineinsquare(sminx, sminy, smaxx, smaxy, lminx, lminy, lmaxx, lmaxy) then
            valid = false
            break
        end
    end
    if valid then
        output.part2(area)
        break
    end
end

