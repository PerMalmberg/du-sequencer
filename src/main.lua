system.print("Sequencer by Yoarii of Svea")

local StartSequence = require("Sequence")

---@alias Row number[]

-- Each row starts with a delay in seconds and up to 10 0/1

---@type Row[]
local sequence = {
    { 0.3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0.3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0.3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 },
    { 0.3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
    { 0.3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
    { 0.3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
    { 0.3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 },
    { 0.3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 }
}

-- If true, the sequence will loop
local loop = true

StartSequence(sequence, loop)
