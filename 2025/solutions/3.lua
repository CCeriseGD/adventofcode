local function findlargest(str, numleft)
    local patternend = numleft == 0 and "" or "("..string.rep(".", numleft).."+)"
    for i = 9, 1, -1 do
        local left = str:match("^.-"..i..patternend)
        if left then
            if numleft == 0 then
                return i
            end
            return i * 10^numleft + findlargest(left, numleft-1)
        end
    end
end

local total1 = 0
local total2 = 0
for line in input.lines() do
    total1 = total1 + findlargest(line, 1)
    total2 = total2 + findlargest(line, 11)
end
output.part1(total1)
output.part2(total2)