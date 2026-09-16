-- Physical configuration
-- cc = computercraft computer
-- rs = redstone dust
-- rt = redstone torch (attached to back of computer)
-- gs = gearshift
--
--  gantry--------clutch--gs--<input
--            rs    rt    rs
--			  rs rs cc rs rs
--            
-- Depends on a redstone inverter between computer "back" and a clutch (Can be achieved by just putting a redstone torch on the back of the computer)
-- rs.setOutput("back", true) means `Power the shaft`


-- Variables
local DESCEND_TIME = 300
local ASCEND_TIME = DESCEND_TIME / 4

-- Functions
function reset()
	print("Reset")
	rs.setOutput("back", false)		-- Clutch Engage
	rs.setOutput("right", false) 	-- Shaft Forward
	rs.setOutput("left", false) 	-- Power Gantry
end

function descend_timed()
	print("Descend", DESCEND_TIME, "seconds")
	rs.setOutput("back", true) 		-- Clutch Disengage
	rs.setOutput("right", false) 	-- Shaft Forward
	rs.setOutput("left", true) 		-- Stop Gantry, Power Pulley
	sleep(DESCEND_TIME)
end

function ascend_timed()
	print("Ascend", ASCEND_TIME, "seconds")
	rs.setOutput("back", true) 		-- Clutch Disengage
	rs.setOutput("right", true) 	-- Shaft Reverse
	rs.setOutput("left", true) 		-- Stop Gantry, Power Pulley
	sleep(ASCEND_TIME)
end

function advance()
	print("Move forward")
	rs.setOutput("back", true) 		-- Clutch Disengage
	rs.setOutput("right", false) 	-- Shaft Forward
	rs.setOutput("left", false) 	-- Power Gantry
	sleep(0.3)
	reset()
end

function descend()
	print("Descend")
	rs.setOutput("back", true) 		-- Clutch Disengage
	rs.setOutput("right", false) 	-- Shaft Forward
	rs.setOutput("left", true) 		-- Stop Gantry, Power Pulley
	
	print ("While not bottomed-out... descend")
	while true do
		sleep(2)
		if rs.getInput("front") == false then
			break
		end
	end
	print("Bottomed out")
end

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

--

-- Start
sleep(3)
while true do
	descend()
	ascend()
	advance()
end





-- Timed descent
--reset()
--descend_timed()
--ascend_timed()
--advance()
--reset()







