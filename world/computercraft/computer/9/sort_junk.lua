max_list = {}

storage_list = peripheral.call('bottom', 'list')

count = 0
last_name = ''
for i=1,#storage_list do
    name = storage_list[i].name
    if name == last_name or last_name == '' then
        last_name = name
        print(i)
        item = peripheral.call('bottom', 'getItemDetail', i)
        print(item)
        count = count + item.maxCount
    else
        local file = fs.open("max_item_list.txt", "a")
        if file then
            info = '{'..name..', '..count..'},'
            file.writeLine(info)
            file.close()
        end
        last_name = ''
        count = 0
    end
end

