local devices = {}
for dev, out in input.linematch("(...): (.+)") do
    local t = {}
    for outdev in out:gmatch("(%S%S%S)") do
        table.insert(t, outdev)
    end
    devices[dev] = t
end

local function countpaths(start, finish)
    local counts = defaulttable(0)
    counts[start] = 1
    local total = 0
    while true do
        local newcounts = defaulttable(0)
        local done = true
        for dev, v in pairs(counts) do
            for _, out in ipairs(devices[dev]) do
                if out == finish then
                    total = total + v
                elseif out ~= "out" then
                    newcounts[out] = newcounts[out] + v
                    done = false
                end
            end
        end
        if done then break end
        counts = newcounts
    end
    return total
end

output.part1(countpaths("you", "out"))
output.part2(countpaths("svr", "dac") * countpaths("dac", "fft") * countpaths("fft", "out")
           + countpaths("svr", "fft") * countpaths("fft", "dac") * countpaths("dac", "out"))