local lines = {}
local fulllines = {}
for line in input.lines() do
    table.insert(fulllines, line)
    local t = {}
    for m in line:gmatch("(%S+)") do
        table.insert(t, m)
    end
    table.insert(lines, t)
end
local total1 = 0
for problem = 1, #lines[1] do
    local mult = lines[#lines][problem] == "*"
    local res = mult and 1 or 0
    for i = 1, #lines - 1 do
        res = mult and res * tonumber(lines[i][problem]) or res + tonumber(lines[i][problem])
    end
    total1 = total1 + res
end
output.part1(total1)

local total2 = 0
for minpos, op, maxpos in (fulllines[#fulllines].." "):gmatch("()([+*])%s+()%s") do
    maxpos = maxpos - 1
    local mult = op == "*"
    local res = mult and 1 or 0
    for x = minpos, maxpos do
        local num = ""
        for y = 1, #fulllines-1 do
            num = num..fulllines[y]:sub(x, x)
        end
        res = mult and res * tonumber(num) or res + tonumber(num)
    end
    total2 = total2 + res
end
output.part2(total2)