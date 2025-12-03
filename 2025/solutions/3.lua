local function findlargest(str, len, highest)
    local res = 0
    local last = 0
    for i = 1, len do
        local maxn, maxpos = 0, 0
        for pos = last + 1, #str - len + i do
            local n = tonumber(str:sub(pos, pos))
            if n > maxn then
                maxn = n
                maxpos = pos
                if n == 9 then
                    break
                end
            end
        end
        res = res * 10 + maxn
        last = maxpos
    end
    return res
end

local total1 = 0
local total2 = 0
for line in input.lines() do
    total1 = total1 + findlargest(line, 2)
    total2 = total2 + findlargest(line, 12)
end
output.part1(total1)
output.part2(total2)