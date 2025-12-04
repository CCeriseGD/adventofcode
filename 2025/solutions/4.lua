local g = input.grid()
g.outdef = "."
local total1 = 0
for x, y, c in g:loop() do
    if c == "@" then
        local count = 0
        for x2, y2, c2 in g:loop(x-1, y-1, x+1, y+1) do
            if not (x2 == x and y2 == y) and c2 ~= "." then
                count = count + 1
            end
        end
        if count < 4 then
            total1 = total1 + 1
        end
        g:set(x, y, count)
    end
end
output.part1(total1)

local total2 = 0
while true do
    local changed = false
    for x, y, c in g:loop() do
        if c ~= "." and c < 4 then
            g:set(x, y, ".")
            total2 = total2 + 1
            for x2, y2, c2 in g:loop(x-1, y-1, x+1, y+1) do
                if c2 ~= "." then
                    g:set(x2, y2, c2-1)
                    changed = true
                end
            end
        end
    end
    if not changed then
        break
    end
end
output.part2(total2)