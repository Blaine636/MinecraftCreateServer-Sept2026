function ascend()
	print("Ascend")
	rs.setOutput("back", true) 		-- Clutch Disengage
	rs.setOutput("right", true) 	-- Shaft Reverse
	rs.setOutput("left", true) 		-- Stop Gantry, Power Pulley
	
	print ("While not surfaced... ascend")
	while true do
		sleep(2)
		if rs.getInput("front") == true then
			break
		end
	end
	print("Surfaced")
end

ascend()

local HOMING_TIME = 10
print("Homing for", HOMING_TIME, "seconds")
rs.setOutput("back", true) 		-- Power shaft
rs.setOutput("right", true) 	-- Shaft Reverse
rs.setOutput("left", false) 	-- Power gantry
sleep(HOMING_TIME)

print("Reset")
rs.setOutput("back", false)		-- Power shaft
rs.setOutput("right", false) 	-- Shaft Forward
rs.setOutput("left", false) 	-- Power gantry