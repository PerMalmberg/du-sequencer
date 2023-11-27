local sw = require("Stopwatch").New()
local timer = require("Timer").Instance()

---@param sequence Row[]
---@param loop boolean
return function(sequence, loop)
    local slots = { slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 }

    local curr = 1

    ---@param row number[]
    local function setOutputs(row)
        for i = 2, #row, 1 do
            local activate = row[i] == 1
            local slot = slots[i - 1]
            if slot then
                if activate then
                    slot.activate()
                else
                    slot.deactivate()
                end
            end
        end
    end

    local function tick()
        if curr > #sequence then
            if loop then
                curr = 1
            else
                unit.exit()
                return
            end
        end

        local row = sequence[curr]
        if sw.Elapsed() >= row[1] then
            setOutputs(row)
            curr = curr + 1
            sw.Restart()
        end
    end

    sw.Start()
    timer.Add("tick", tick, 0.1)

    unit:onEvent("onStop", function()
        setOutputs({ 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 })
    end)
end
