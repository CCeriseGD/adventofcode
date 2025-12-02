local total1 = 0
local total2 = 0
local found = {}
for n1, n2 in input.gmatch("(%d+)%-(%d+)") do
    local ranges = {}
    if #n1 == #n2 then
        table.insert(ranges, {tonumber(n1), tonumber(n2)})
    else
        table.insert(ranges, {tonumber(n1), 10^#n1-1})
        table.insert(ranges, {10^#n1, tonumber(n2)})
    end
    for _, v in ipairs(ranges) do
        local min, max = unpack(v)
        local mins, maxs = tostring(min), tostring(max)
        for len = 1, math.floor(#mins/2) do
            if #mins/len % 1 == 0 then
                local substmin = mins:sub(1, len)
                local substmax = maxs:sub(1, len)
                for subst = substmin, substmax do
                    local repcount = #mins/len
                    local rep = tonumber(string.rep(subst, repcount))
                    if rep >= min and rep <= max then
                        if repcount == 2 then
                            total1 = total1 + rep
                        end
                        if not found[rep] then
                            total2 = total2 + rep
                            found[rep] = true
                        end
                    end
                end
            end
        end
    end
end
output.part1(total1)
output.part2(total2)