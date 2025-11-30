require "utils"
function runday(year, n)
    input.file = year.."/inputs/"..n
    local t1 = love.timer.getTime()
    require(year.."/solutions/"..n)
    local t2 = love.timer.getTime()
    local time = t2-t1
    local timestr = math.floor(time * 100) / 100 .. " s"
    if time < 1 then
        timestr = math.floor(time * 100000) / 100 .." ms"
    end
    print(string.format("finished in %s", timestr))
end
function love.load(args)
    local year = args[2] or "2025"
    if args[1] == "all" then
        local t = {}
        for i, f in ipairs(love.filesystem.getDirectoryItems(year.."/solutions")) do
            table.insert(t, tonumber(f:match("(.+)%.lua")))
        end
        table.sort(t)
        for i, day in ipairs(t) do
            print("\nday "..day)
            runday(year, day)
        end
    else
        runday(year, args[1])
    end
end
love.event.quit()