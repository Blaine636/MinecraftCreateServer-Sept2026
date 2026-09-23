item_max = {
{'minecraft:bone', 576},
{'minecraft:gunpowder', 576},
{'minecraft:spider_eye', 64},
{'minecraft:arrow', 64},
{'minecraft:glowstone_dust', 128},
{'minecraft:carrot', 64},
{'minecraft:glass_bottle', 64},
{'minecraft:potato', 64},
{'minecraft:sugar', 64},
{'minecraft:string', 64},
{'minecraft:ender_pearl', 80},
{'minecraft:slime_ball', 256},
{'minecraft:rotten_flesh', 1152},
}

function home()
 print('Homing...')
	while true do
		front,data = turtle.inspect()
		if front and data.name == 'minecraft:barrel' then
			return
		else
			turtle.turnRight()
		end
	end
end


function get_desired_count(item_name)
	for i=1,#item_max do
		if item_max[i][1] == item_name then return item_max[i][2] end
	end
	return 0
end


function get_stored_amount(stored_list, item_name)
	local count = 0
	for i=1,#stored_list do
		if stored_list[i].name == item_name then
			count = count + stored_list[i].count
		end
	end
	return count
end


home()
print('Running...')
while true do
	turtle.suck()
	item = turtle.getItemDetail(1)
	if item then
		desired_count = get_desired_count(item.name)
		if desired_count > 0 then
			storage_contents = peripheral.call('bottom', 'list')
			total = get_stored_amount(storage_contents, item.name)
			max_amount = desired_count - total
			push_amount = math.min(item.count, max_amount)
			turtle.dropDown(push_amount)
		end
		
		if turtle.getItemDetail(1) then
			turtle.turnRight()
			turtle.turnRight()
			turtle.drop()
			turtle.turnRight()
			turtle.turnRight()
		end
	end
end
print('Exited main loop')
