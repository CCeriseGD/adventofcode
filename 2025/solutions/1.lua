local dial = 50
local total1 = 0
local total2 = 0
for dir, num in input.linematch("([LR])(%d+)") do
    num = tonumber(num)
    if num > 100 then
        total2 = total2 + math.floor(num / 100)
        num = num % 100
    end
    num = dir == "R" and num or -num
    local prevdial = dial
    dial = dial + num
    if dial % 100 ~= dial and prevdial ~= 0 and dial % 100 ~= 0 then
        total2 = total2 + 1
    end
    dial = dial % 100
    if dial == 0 then
        total1 = total1 + 1
        total2 = total2 + 1
    end
end
output.part1(total1)
output.part2(total2)