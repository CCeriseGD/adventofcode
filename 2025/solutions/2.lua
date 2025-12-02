local total1 = 0
local total2 = 0
for n1, n2 in input.gmatch("(%d+)%-(%d+)") do
    for i = n1, n2 do
        local str = tostring(i)
        local invalid = false
        for len = 1, #str/2 do
            if #str % len == 0 then
                if str == string.rep(str:sub(1, len), #str/len) then
                    if not invalid then
                        total2 = total2 + i
                    end
                    invalid = true
                    if len == #str/2 then
                        total1 = total1 + i
                        break
                    end
                end
            end
        end
    end
end
output.part1(total1)
output.part2(total2)