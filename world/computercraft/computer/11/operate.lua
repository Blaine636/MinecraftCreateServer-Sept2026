function up()
	rs.setOutput('bottom', false)
	sleep(.2)
	rs.setOutput('right', false)
	sleep(.2)
	rs.setOutput('front', false)
	sleep(.2)
	rs.setOutput('back', false)
	sleep(.2)
	rs.setOutput('left', false)
end

function down()
	rs.setOutput('left', true)
	sleep(.2)
	rs.setOutput('back', true)
	rs.setOutput('front', true)
	sleep(.2)
	rs.setOutput('left', false)
	sleep(.2)
	rs.setOutput('left', true)
	sleep(.2)
	rs.setOutput('bottom', true)
	rs.setOutput('right', true)
	sleep(.2)
	rs.setOutput('front', false)
	sleep(.2)
	rs.setOutput('front', true)
	sleep(.2)
	rs.setOutput('back', false)
	sleep(.2)
	rs.setOutput('back', true)
end

while true do
	if rs.getInput('top') then
		down()
		sleep(5)
		up()
	end
	sleep(1.5)
end