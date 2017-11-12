--require("TSLib")
SLEEP_TIME=3000
--iphone_path="/var/mobile/Media/TouchSprite/lua/"
XXT_PHONE_PATH="/var/mobile/Media/1ferver/lua/scripts/xxt_tianlongbabu/"

dofile(XXT_PHONE_PATH.."COMMON_TOOLS.lua")
dofile(XXT_PHONE_PATH.."TAB_ENV.lua")
dofile(XXT_PHONE_PATH.."VAR_SERIALIZE.lua")
dofile(XXT_PHONE_PATH.."XXT_TOUCH_COMMON.lua")
--dofile(iphone_path.."pushover.lua")

function record_var1(o)
	local out =assert(io.open(XXT_PHONE_PATH.."VAR_SERIALIZE.lua","w"))
	out:write("VAR_LIST1 = ")
	f_abc = function(o)
		if type(o) == "number" then
			out:write(o)
		elseif type(o) == "string" then
			out:write(string.format("%q",o) )		
		elseif type(o) == "boolean" then
			if o ==true then
				out:write( "true")
			else
				out:write( "false")
			end
		elseif type(o) == "table" then		
			out:write("{\n")
			for k,v in pairs(o) do
				out:write(" ",k,"=")
				f_abc(v)
				out:write(",\n")
			end
			out:write("}\n")
		else
			error("cannot serialize a "..type(o))
		end
	end

	f_abc(o)
	assert (out:close())

end

mmsleep(200)

while (f_is_device_locked()) do
	unlock_device()
	mmsleep(1000)
end
ttoast("屏幕已解锁，脚本开始")

init_screen(1)
init("com.tencent.cyoutstl",1)

if front_app() == "com.tencent.xin" then
	wwlog("74 微信程序ing...")
elseif  front_app() ~= "com.tencent.cyoutstl" then
	mmsleep(200)
	open_app("com.tencent.cyoutstl")
	wwlog("game start")
	--mmsleep(7000)
	--ltap( 565,  332) --点击跳过动画
	--wwlog("93 --点击跳过动画")
	mmsleep(2000)		
end

record_var1(VAR_LIST1)

--[[
co1 = coroutine.create( function() 
		while true do
			--for i = 1,2 do
			ttoast("before yield")
			coroutine.yield("sdfsdfsfdsdf")
			mmsleep(3000)
			ttoast("after yield")
		end
	end ) 

function cor_pop_up1()
	local a,b = coroutine.resume(co1)
	if a then
		ttoast(tostring(b))
	end
	return b
end
--]]

--pushmsg("title","msg11")

--shake_screen()

--cor_pop_up1()
--mmsleep(3000)
--cor_pop_up1()

dofile(XXT_PHONE_PATH.."pick_color.lua")
--mmsleep(1000)

list1= List.new()
--List.pushlast(list1,page_login_entrance.button_wx)
List.pushlast(list1,page_login_entrance.enter_game)
List.pushlast(list1,page_login_entrance.player_enter_game)


list3= List.new()
List.pushlast(list3,page_login_entrance.enter_game)
List.pushlast(list1,page_login_entrance.player_enter_game)

list4= List.new()
List.pushlast(list4,page_login_entrance.player_enter_game)


list2= List.new()
List.pushlast(list2,page_popup.new_version_update)
List.pushlast(list2,page_popup.tips_ok1)
List.pushlast(list2,page_popup.notice_ok1)

list0= List.new()
List.pushlast(list0,page_login_entrance.button_wx)
List.pushlast(list0,page_login_entrance.button_besure_wx)
List.pushlast(list0,page_popup.notice_ok1)
List.pushlast(list0,page_popup.tips_ok1)
List.pushlast(list0,page_login_entrance.enter_game)
List.pushlast(list0,page_login_entrance.create_player)
List.pushlast(list0,page_login_entrance.player_enter_game)

list01= List.new()
List.pushlast(list01,page_login_entrance.player_name_exist)
List.pushlast(list01,page_login_entrance.player_direct_game)
List.pushlast(list01,page_login_entrance.net_lost_window)


list02= List.new()
List.pushlast(list02,page_login_entrance.in_game_training)


function task_by_loop(list1)
	-- body
	--while (true) do
	for k,v in pairs (list1) do
		--print(k)
		if k ~= 'first' and k ~= 'last' then
			--nLog("k:"..k)
			if multi_col(v) then
				--nLog("multi_col(v)")			
				local click_x,click_y = getClickXY(v)	
				tap(click_x,  click_y)
			end 
			--print_r(v)
			--mmsleep(1000)
		end
		--mmsleep(1000)
	end
	mmsleep(1000)
	--end
end

function dosomething2(v_color,v)
	if v.click_xy ~= nil then
		nLog(v.click_xy)
		local click_x,click_y = getClickXY({v.click_xy})	
		tap(click_x,  click_y)
		nLog(v.step)
		wwlog(v.logmsg)
	else
		if v.foo ~= nil then
			v.foo()		
		else	
			local click_x,click_y = getClickXY(v_color)	
			tap(click_x,  click_y)
			nLog(v.step)
			wwlog(v.logmsg)
		end	
	end
end

function task_by_loop2(list1)
	local ret = nil
	for k,v in pairs (list1) do
		--nLog(k)
		--nLog(v)
		if k ~= 'first' and k ~= 'last' then
			local colors
			if v.color ~= nil then
				colors = {v.color}
			else
				colors = v.colors
			end
			for k1,v1 in pairs(colors )	do 
				if multi_col(v1) then
					ret = "in"
					local click_x,click_y = getClickXY(v1)	
					--tap(click_x,  click_y)
					nLog(v.step)
					nLog(v.logmsg)

					dosomething2(v1,v)
					mmsleep(SLEEP_TIME)
					
					--小于当前任务号的,且在某一个数组中的task都KIll，
					if v.task_id ~=nil then
						--thread.kill(5)
						ret="kill"
					end
					 
					--大于当前任务号的,且在某一个数组中的开关都置为ON， 
					if v.end_flag then
						ret = "next_on"
						nLog("if v.end_flag then")
					end
					--VAR_LIST1.IN_GAME_SWITCH="ON"
					break
				end
				--mmsleep(1000)
			end						
		end
		--mmsleep(1000)
	end
	return ret
end

function  getListSize(list1)
	-- body
	--[[
	local size =0
	for k,v in pairs (list1) do		
		if k ~= 'first' and k ~= 'last' then
			size = size +1
		end
	end
	return size
	--]]
	return list1.last + 1
end	

function task_by_order(list1)
	-- body	
	--for i =1, getListSize(list1) do
	--while (true) do
	-- body
	if list1.first <= list1.last then
		local first_value = List.getfirst(list1)		
		local click_x,click_y = getClickXY(first_value)	
		if multi_col(first_value) then				
			if list1.first <= list1.last then
				List.popfirst(list1)
			end
			tap(click_x,  click_y)
		end
		mmsleep(1000)
	end
	if getListSize(list1) == 0 then
		--break
		print("break")
	end
	mmsleep(1000)
	--end
end

task0 = thread.dispatch( -- 派发一个异步任务
	function()
		while(true) do 							
			nLog("249 backgroud monitor thread ")			
			mmsleep(SLEEP_TIME)
		end
	end
)
nLog("task0:"..tostring(task0))
task_list={}

function ttkill(task_id) 

	for k,v in pairs(task_list) do
		nLog(v.id)
		if v.id < task_id then
			thread.kill(v.id)
			nLog("thread.kill(v.id)")
		end
	end
end

function ttswitch_off(task_id) 

	for k,v in pairs(task_list) do
		if v.id > task_id then
		for k1,v1 in pairs(v) do				
				if k1~= "id" and k1~="info" then
					--nLog(k1)
					local loadstr="task_list["..tostring(k).."]."..k1.."='OFF'"
					--nLog(loadstr)
					f1=load(loadstr)
					f1()
					
					local loadstr2="VAR_LIST1."..k1.."='OFF'"
					nLog(loadstr2)
					f2=load(loadstr2)
					f2()
					--task_list[1].LOGIN_SWITCH=1
				end
				--nLog(v1)
		end	
		end
	end
end


function ttswitch_on(task_id) 

	for k,v in pairs(task_list) do
		if v.id > task_id then
		for k1,v1 in pairs(v) do				
				if k1~= "id" and k1~="info" then
					--nLog(k1)
					local loadstr="task_list["..tostring(k).."]."..k1.."='ON'"
					--nLog(loadstr)
					f1=load(loadstr)
					f1()
					
					local loadstr2="VAR_LIST1."..k1.."='ON'"
					nLog(loadstr2)
					f2=load(loadstr2)
					f2()
					--task_list[1].LOGIN_SWITCH=1
				end
				--nLog(v1)
		end	
		end
	end
end

--登录模块，
task1 = thread.dispatch( -- 派发一个异步任务
	function()
		local ret_flag1 = true
		while(true) do 
			if (VAR_LIST1.LOGIN_SWITCH=="ON") then				
				nLog("261 登录模块:thread.current_id:"..tostring( thread.current_id()))
				--mmsleep(3000)
				--click_popup_window()
				local ret =task_by_loop2(list0)
				if ret=="in" and ret_flag1 ==true then
					ttswitch_off(thread.current_id())			
				elseif ret =="next_on" then
					ret_flag1 = false
					--VAR_LIST1.IN_GAME_SWITCH="ON"
					ttswitch_on(thread.current_id())
					--nLog('VAR_LIST1.IN_GAME_SWITCH="ON"')
				end
			end
			mmsleep(SLEEP_TIME)
		end
	end
)

nLog("task1:"..tostring(task1))
table.insert(task_list,{id=task1,info="登录模块",LOGIN_SWITCH="ON"})

--登录成功之后，进入游戏
task2= thread.dispatch( -- 派发一个异步任务
	function()
		while(true) do
			if VAR_LIST1.IN_GAME_SWITCH=="ON" then
				mmsleep(1000)
				nLog("287 登录成功之后，进入游戏:thread.current_id:"..tostring( thread.current_id()))				
				local ret = task_by_loop2(list02)
				
				if ret=="kill" then				
					--thread.kill(5)
					ttkill(thread.current_id())
					nLog('thread.kill before:'..tostring( thread.current_id()))				
				end
				
			end
			mmsleep(SLEEP_TIME)
			--nLog("292 after while 登录成功之后，进入游戏")
		end
	end
)
nLog("task2:"..tostring(task2))
table.insert(task_list,{id=task2,info="登录成功之后，进入游戏",IN_GAME_SWITCH="ON"})

--处理弹窗，一般以小窗口为主
task999= thread.dispatch( -- 派发一个异步任务
	function()
		while (true) do
			mmsleep(SLEEP_TIME)
			nLog("274 处理弹窗，一般以小窗口为主")
			--mmsleep(3000)
			--click_popup_window()
			task_by_loop2(list01)
		end
	end
)
nLog("task999:"..tostring(task999))
--table.insert(task_list,{id=task999,info="处理弹窗，一般以小窗口为主"})

nLog(task_list)

function getRandomNum(...)	
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	local var1 = math.random(1,100) 		
	return var1
end
