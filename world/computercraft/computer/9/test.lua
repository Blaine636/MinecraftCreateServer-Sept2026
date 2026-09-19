--item_list = peripheral.call('bottom', 'list')

--print(item_list[i].name)
bottom = peripheral.wrap('bottom')
for i=1,5,1 do
		item = bottom.getItemDetail(i)
		print(item)
		print(item.name)
		print(item.maxCount)
end
