
function xxtmoveto(x1,y1,x2,y2,step)
	touch.on(x1, y1):delay(500):move(x2,y2):delay(500):off() 
end

if TAB_ENV.LUA_VERSION == "TOUCH" then
	open_app= runApp
	front_app = frontAppBid
	mmsleep = mSleep
	init_screen = init
	init_log = initLog
	wt_log= wLog
	close_log = closeLog
	multi_col = multiColor
	ltap = tap
	move2 = moveTo
	findcolor = findMultiColorInRegionFuzzy
	ttoast = toast
	unlock_device = unlockDevice
	is_device_lock = deviceIsLock
	getcolorr = getColor
	set_screen_light = setBacklightLevel
	get_screen_light = getBacklightLevel
	keep_screen = keepScreen

elseif TAB_ENV.LUA_VERSION == "XXT" then
	open_app= app.run
	close_app= app.close
	front_app = app.front_bid
	mmsleep = sys.msleep
	init_screen = screen.init
	wx_log= sys.log
	multi_col = screen.is_colors
	ltap = touch.tap
	move2 =xxtmoveto
	findcolor = screen.find_color
	ttoast = sys.toast
	unlock_device = device.unlock_screen
	is_device_lock = device.is_screen_locked
	getcolorr = screen.get_color
	set_screen_light = device.set_brightness
	get_screen_light = device.brightness
	keep_screen = screen.keep
	unkeep_screen = screen.unkeep
end
--log_file = "tianlong.log"
function f_keep_screen(flag)
	if TAB_ENV.LUA_VERSION == "TOUCH" then 
		if flag == true then
			keep_screen(true)
		else
			keep_screen(false)
		end
	elseif TAB_ENV.LUA_VERSION == "XXT" then
		if flag == true then
			keep_screen()
		else
			unkeep_screen()
		end
	end
end

if TAB_ENV.LUA_VERSION == "TOUCH" then
	init_log(log_file, 1)
end	

function wwlog(msg)	
	if TAB_ENV.LOG_MODE ==true then 
		if TAB_ENV.LUA_VERSION == "TOUCH" then		
			wt_log(log_file,msg)
		elseif TAB_ENV.LUA_VERSION == "XXT" then
			wx_log(msg)
		end	
	end
	if TAB_ENV.DEBUG_MODE == true then
		nLog(msg)
	end
end

function f_is_device_locked()
	local ret = false
	if TOUCH_MODE == true then
		if is_device_lock() ~= 0 then
			ret = true	
		end
	elseif XXT_MODE == true then
		ret = is_device_lock()
	end	
	return ret
end

function shake_screen()
	local br = get_screen_light()
	mmsleep(200)
	for i = 1 ,30 do
		set_screen_light(1)
		mmsleep(200)
		set_screen_light(0)
		mmsleep(200)
	end
	set_screen_light(br)
end

local tab_line = {
	{  329,  202, 0x68351b},
	{  440,  203, 0xc3976a},
	{  329,  260, 0x724024},
	{  444,  260, 0x643219},
	{  332,  317, 0x7e4f30},
	{  445,  316, 0x613118},
	{  330,  373, 0x653319},
	{  441,  373, 0x996844},
	{  328,  428, 0xf3c992},
	{  443,  428, 0x763c1d},
}


function get_line_xy(j)
	local ret,x,y
	for i,v in ipairs(tab_line) do
		if i == j then
			ret = true
			x = v[1]	
			y = v[2]			
			break		
		end
	end	
	return ret,x,y	
end


List ={}
function List.new()
	return {first=0,last = -1 }
end

function List.pushfirst(list,value)
	local first = list.first -1
	list.first = first
	list[first] = value
end

function List.pushlast(list,value)
	local last = list.last +1
	list.last= last
	list[last] = value
end

function List.popfirst(list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value= list[first]
	list[first] = nil
	list.first= first +1
	return value
end

function List.getfirst(list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value= list[first]
	--list[first] = nil
	--list.first= first +1
	return value
end

function List.poplast(list)
	local last = list.last
	if list.first > last then error("list is empty") end
	local value = list[last]
	list[last]= nil
	list.last = last -1
	return value
end

function List.popList (list1,k1)
	if getListSize(list1) > 2 then
		for k,v in pairs(list1) do			
			local value= list1[k1]
			print(value)
			list1[k1] = nil

			if k1 == list1.last then
				local last = list1.last
				local value = list1[last]
				if list1.first ~= list1.last then
					list1.last = last -1
				end

			end

			if k1 == list1.first then
				local first = list1.first				
				local value= list1[first]				
				if list1.first ~= list1.last then
					list1.first= first +1
				end
			end
		end
	end
end

function  getListSize(list1)	
	return list1.last + 1
end	

function getClickXY(color_arr)
	local click_index = #color_arr
	local click_xy = color_arr[click_index] 
	local click_x = click_xy[1]
	local click_y = click_xy[2]
	return click_x,click_y
	-- body
end

function mrsleep(ss)
	local n1= getRandomNum(ss*0.3) 
	--nLog(ss+n1)
	mmsleep(ss+n1)
end
	
function f_no_color_changed ()
	local tab_luoxia ={
	{ 1001,   32, 0xffffff},
	{ 1001,   37, 0xffffff},
	{ 1009,   33, 0xf6f7f7},
	{ 1019,   31, 0xffffff},
	{ 1035,   34, 0xffffff},
	{ 1042,   33, 0xffffff},
	{ 1052,   32, 0xffffff},
	{ 1052,   38, 0xffffff},
	{ 1023,   38, 0xcbcfd4},
}

	return function (v_over_time) 
		local ret = true
		local over_time = v_over_time or 1
		over_time = over_time * 1000
		mrsleep(over_time)
		for k,v in  ipairs(tab_luoxia) do				
			local c = getcolorr(v[1],   v[2])		
			if c ~= v[3] then			
				v[3] = c
				ret = false
			end
		end
		return ret
	end
end
