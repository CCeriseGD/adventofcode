local boxes = {}
local circuits = {}
for x, y, z in input.linematch("(%d+),(%d+),(%d+)") do
    local box = {x=tonumber(x), y=tonumber(y), z=tonumber(z)}
    local circuit = {box}
    box.circuit = circuit
    table.insert(boxes, box)
    table.insert(circuits, circuit)
end
local boxpairs = {}
for i = 1, #boxes-1 do
    local b1 = boxes[i]
    for j = i+1, #boxes do
        local b2 = boxes[j]
        table.insert(boxpairs, {boxes[i], boxes[j], (b1.x-b2.x)^2 + (b1.y-b2.y)^2 + (b1.z-b2.z)^2})
    end
end

table.sort(boxpairs, function(x, y) return x[3] < y[3] end)
for i = 1, #boxpairs do
    local pair = table.remove(boxpairs, 1)
    local b1, b2 = pair[1], pair[2]
    local c1, c2 = b1.circuit, b2.circuit
    if c1 ~= c2 then
        for j, b in ipairs(c2) do
            table.insert(c1, b)
            b.circuit = c1
            c2[j] = nil
        end
        if #c1 == #boxes then
            output.part2(b1.x*b2.x)
            break
        end
    end
    if i == 1000 then
        table.sort(circuits, function(x, y) return #x > #y end)
        output.part1(#circuits[1]*#circuits[2]*#circuits[3])
    end
end

