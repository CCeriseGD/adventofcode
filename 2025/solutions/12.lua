local total = 0
for w, h, nums in input.gmatch("(%d+)x(%d+): ([^\n]+)") do
    local size = 0
    for m in nums:gmatch("(%d+)") do
        size = size + tonumber(m)
    end
    if size*9 <= tonumber(w) * tonumber(h) then
        total = total + 1
    end
end
output.part1(total)