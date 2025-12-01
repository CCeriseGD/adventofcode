local dial = 50
local total1 = 0
local total2 = 0
for dir, num in input.linematch("([LR])(%d+)") do
    num = tonumber(num)
    if num > 100 then
        total2 = total2 + math.floor(num / 100)
        num = num % 100
    end
    local step = dir == "R" and 1 or -1
    for i = 1, num do
        dial = (dial + step) % 100
        if dial == 0 then
            total2 = total2 + 1
        end
    end
    if dial == 0 then
        total1 = total1 + 1
    end
end
output.part1(total1)
output.part2(total2)