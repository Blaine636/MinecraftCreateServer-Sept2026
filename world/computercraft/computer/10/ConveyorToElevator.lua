-- Redstone latch: right = ON, back (checked ≤1/s) = OFF
local rs = redstone  -- or peripheral.wrap("top") etc. if needed

local checkInterval = 1.0  -- seconds

while true do
  -- Check back input once per interval
  if rs.getInput("back") then
    print("rs input back")
    rs.setOutput("left", true)
  elseif rs.getInput("right") then
    print("rs input right")
    rs.setOutput("left", false)
  end

  sleep(checkInterval)
end