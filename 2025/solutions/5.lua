local function overlapranges(r1, r2)
    local min1, max1 = unpack(r1)
    local min2, max2 = unpack(r2)
    if min2 > max1 + 1 or min1 > max2 + 1 then
        return false
    elseif min2 >= min1 and max2 <= max1 then
        return r1
    elseif min1 >= min2 and max1 <= max2 then
        return r2
    elseif min2 >= min1 and max2 > max1 then
        return {min1, max2}
    elseif min1 >= min2 and max1 > max2 then
        return {min2, max1}
    else
        error()
    end
end

local ranges = {}
local total1 = 0
for line in input.lines() do
    local n1, n2 = line:match("(%d+)%-?(%d*)")
    if n2 and #n2 > 0 then
        table.insert(ranges, {tonumber(n1), tonumber(n2)})
    elseif not n1 then
        table.sort(ranges, function(r1, r2) return r1[1] < r2[1] end)
        local pos = 1
        while true do
            local r1, r2 = ranges[pos], ranges[pos+1]
            if not r2 then
                break
            end
            local new = overlapranges(r1, r2)
            if new then
                table.remove(ranges, pos)
                table.remove(ranges, pos)
                table.insert(ranges, pos, new)
            else
                pos = pos + 1
            end
        end
    elseif #n1 > 0 then
        n1 = tonumber(n1)
        for _, v in ipairs(ranges) do
            if n1 >= v[1] and n1 <= v[2] then
                total1 = total1 + 1
                break
            end
        end
    end
end
output.part1(total1)

local total2 = 0
for _, v in ipairs(ranges) do
    total2 = total2 + v[2] - v[1] + 1
end
output.part2(total2)


