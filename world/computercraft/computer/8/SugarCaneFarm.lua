
local width = 14
local depth = 13
local area = (depth * width)
-- width and depth values only used to compute duty cycle sleep time

function home()
    print('Homing...')
    while true do
        if isHome() then 
			print('1')
            return
        else
			print('2')
            turtle.turnRight()
            plow()
        end
    end
end


function isHome()
    local ok, data = turtle.inspect()
    if ok then
        return (data.name == 'create:item_vault')
    end
end


function hasFuel(amount)
    fuel = turtle.getFuelLevel()
    if amount == nil then amount = 1 end
    return fuel >= amount
end


function hook(direction)
    local directions = {right = turtle.turnRight, left = turtle.turnLeft}
    directions[direction]()
    plow(true)
    directions[direction]()
end


function refuel()
    if not hasFuel(1000) then
        turtle.select(16)
        turtle.dropUp()
        turtle.suck(2)
        item = turtle.getItemDetail()
        if item then
            if item.name == 'minecraft:dried_kelp_block' then
                turtle.refuel()
            end
        end
    end
    fuel = turtle.getFuelLevel()
    print('Fuel remaining: '..fuel)
end


function plow(once)
	print('3')
    turtle.select(1)
    local kelps = {'minecraft:sugar_cane'}
    local farming = true
    while farming do
		print('4')
        if once then farming = false end
		print('5')
        local ok, data = turtle.inspect()
        if ok then
			print('6')
            if (data.name == kelps[1]) then
				print('9')
                turtle.dig()
                turtle.suck()
                turtle.suckUp()
                turtle.suckDown()
                turtle.forward()
			else
				print('8')
				break
			end
		else
			print('7')
			local moved, reason = turtle.forward()
			if not moved then error(reason) end
        end
    end
end


function deposit()
    print('Delivering contents...')
    for i=1,16,1 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.select(1)
end


function main_loop()
    print('Harvesting crops...')
    turtle.turnRight()
    plow(true)
    turtle.turnLeft()
    refuel()
    turtle.turnRight()
    plow()
    turtle.turnRight()

    local direction = 1
    local directions = {'right', 'left'}
    while true do
        plow()
        if isHome() then
            deposit()
			-- sleep 5mins - 10second buffer - (1 second * area)
			local sleep_time = math.max(0, 290 - area)
			print('Waiting for growth...', sleep_time, 'seconds...')
			sleep(sleep_time)
			
            return
        else
            hook(directions[direction])
            direction = (direction % 2) + 1
        end
    end
end


term.clear()
term.setCursorPos(1, 1)
print('Harvesting '..tostring(width)..' x '..tostring(depth)..' area')
home()
while true do
    main_loop()
end