local beams = defaulttable(0)
local total1 = 0
local ignoreline = false
for line in input.lines() do
    if not ignoreline then
        local newbeams = defaulttable(0)
        for i = 1, #line do
            local c = line:sub(i, i)
            if c == "S" then
                newbeams[i] = 1
            elseif c == "." then
                newbeams[i] = newbeams[i] + beams[i]
            elseif c == "^" then
                newbeams[i] = 0
                if beams[i] > 0 then
                    newbeams[i-1] = newbeams[i-1] + beams[i]
                    newbeams[i+1] = beams[i]
                    total1 = total1 + 1
                end
            end
        end
        beams = newbeams
    end
    ignoreline = not ignoreline
end
output.part1(total1)
local total2 = 0
for _, v in ipairs(beams) do
    total2 = total2 + v
end
output.part2(total2)