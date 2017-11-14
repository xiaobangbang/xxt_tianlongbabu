--require("TSLib")
SLEEP_TIME=1000
--iphone_path="/var/mobile/Media/TouchSprite/lua/"
XXT_PHONE_PATH="/var/mobile/Media/1ferver/lua/scripts/xxt_tianlongbabu/"

dofile(XXT_PHONE_PATH.."COMMON_TOOLS.lua")
dofile(XXT_PHONE_PATH.."TAB_ENV.lua")
dofile(XXT_PHONE_PATH.."VAR_SERIALIZE.lua")
dofile(XXT_PHONE_PATH.."XXT_TOUCH_COMMON.lua")
--dofile(iphone_path.."pushover.lua")
task_list={}

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
if TAB_ENV.DEBUG_MODE==false then
	close_app("com.tencent.cyoutstl")
	mrsleep(5000)
end
if front_app() == "com.tencent.xin" then
	wwlog("74 微信程序ing...")
elseif  front_app() ~= "com.tencent.cyoutstl" then
	mmsleep(200)
	open_app("com.tencent.cyoutstl")
	wwlog("game start")
	mmsleep(2000)		
end


dofile(XXT_PHONE_PATH.."pick_color.lua")

list0= List.new()
List.pushlast(list0,page_login_entrance.button_wx)
List.pushlast(list0,page_login_entrance.button_besure_wx)
--List.pushlast(list0,page_popup.notice_ok1)
List.pushlast(list0,page_popup.tips_ok1)
List.pushlast(list0,page_login_entrance.enter_game)
List.pushlast(list0,page_login_entrance.create_player)
List.pushlast(list0,page_login_entrance.player_enter_game)

--小窗口
list01= List.new()
List.pushlast(list01,page_login_entrance.player_name_exist)
List.pushlast(list01,page_login_entrance.player_direct_game)
List.pushlast(list01,page_login_entrance.net_lost_window)
List.pushlast(list01,page_popup.close_window1)
List.pushlast(list01,page_popup.use_money)
List.pushlast(list01,page_popup.notice_ok1)
List.pushlast(list01,page_popup.first_scene)


list02= List.new()
--移动到第一个光圈
List.pushlast(list02,page_training.in_game_training)
--跳过动画
List.pushlast(list02,page_training.skip_scene)
--移动到第二个光圈
List.pushlast(list02,page_training.in_game_training)
--攻击4个强盗
List.pushlast(list02,page_training.first_attack)
--移动到第三个光圈--需要两次移动
List.pushlast(list02,page_training.in_game_training)
List.pushlast(list02,page_training.in_game_training)
--动画过后，移动到第四个光圈--需要两次移动
List.pushlast(list02,page_training.in_game_training)
List.pushlast(list02,page_training.in_game_training)
--点击技能键释放技能
List.pushlast(list02,page_training.skill_attack)
--领取神器，对抗丁春秋
List.pushlast(list02,page_training.fetch_artifact)

list03= List.new()
List.pushlast(list03,page_main.main_task_guide)
List.pushlast(list03,page_main.task_completed_guide)
List.pushlast(list03,page_main.accept_task)
List.pushlast(list03,page_main.arti_fact_piece_guide)
List.pushlast(list03,page_main.arti_fact_preview_guide)
List.pushlast(list03,page_main.arti_fact_preview_close_guide)
List.pushlast(list03,page_main.arti_fact_close_guide)
List.pushlast(list03,page_main.main_task_completed)
List.pushlast(list03,page_main.task_completed)

function dosomething2(v_color,v)
	if v.click_xy ~= nil then
		--nLog(v.click_xy)
		local click_x,click_y = getClickXY({v.click_xy})	
		ltap(click_x,  click_y)
		--nLog(v.step)
		wwlog(v.logmsg)
	else
		if v.foo ~= nil then
			v.foo()		
		else	
			local click_x,click_y = getClickXY(v_color)	
			ltap(click_x,  click_y)
			--nLog(v.step)
			wwlog(v.logmsg)
		end	
	end
end

function task_by_loop2(list1)
	local ret = nil
	for k,v in pairs (list1) do		
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
					nLog(v.step)
					nLog(v.logmsg)

					dosomething2(v1,v)
					mmsleep(SLEEP_TIME)
															
					if v.end_flag then
						ret = "next_on"						
					end					
					break
				end
				--mmsleep(1000)
			end						
		end
		--mmsleep(1000)
	end
	return ret
end


function task_by_order2(list1)
	local ret = nil		
	--for k,v in pairs (list1) do
	if list1.first <= list1.last then
		local v = List.getfirst(list1)			
		--nLog(v)
		--if k ~= 'first' and k ~= 'last' then
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
					nLog(v.step)
					nLog(v.logmsg)

					dosomething2(v1,v)
					mmsleep(SLEEP_TIME)
										
					--大于当前任务号的,且在某一个数组中的开关都置为ON， 
					if v.end_flag then
						ret = "next_on"						
					end
					if list1.first <= list1.last then
						List.popfirst(list1)
					end
					break
				end
				--mmsleep(1000)
			end						
		--end
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
			ltap(click_x,  click_y)
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

function ttkill(task_id) 
	for k,v in pairs(task_list) do
		nLog(v.id)
		if v.id < task_id then
			thread.kill(v.id)
			nLog("thread.kill(v.id)")
		end
	end
end

function ttswitch(task_id,status) 
	for k,v in pairs(task_list) do
		if v.id > task_id then
			v.SWITCH = status	
			break
		end
	end
end

function getSwitchStatus(task_id) 
	for k,v in pairs(task_list) do		
		if v.id == task_id then
			return v.SWITCH
		end
	end
end

local thread_kill = false
--登录模块
task1 = thread.dispatch( -- 派发一个异步任务
	function()
		local ret_flag1 = true
		local current_thread_id = thread.current_id()
		table.insert(task_list,{id=current_thread_id,info="登录模块",SWITCH="ON"})
		while(true) do 
			--if (VAR_LIST1.LOGIN_SWITCH=="ON") then				
			if getSwitchStatus(current_thread_id) =="ON" then
				nLog("261 登录模块:thread.current_id:"..tostring( current_thread_id))
				--mmsleep(3000)				
				local ret =task_by_loop2(list0)
				if ret=="in" and ret_flag1 ==true then					
					ttswitch(current_thread_id,"OFF")
				elseif ret =="next_on" then
					ret_flag1 = false
					--大于当前任务号的,且在某一个数组中的开关都置为ON， 
					ttswitch(current_thread_id,"ON")
					---------------测试-------------------------start
					VAR_LIST1.FIRST_ROLE="FINISHED"
					VAR_LIST1.SECOND_ROLE="READY"
					record_var1(VAR_LIST1)
					---------------测试-------------------------end
					--nLog('VAR_LIST1.IN_GAME_SWITCH="ON"')
				end
				
				if (ret =="in" or ret =="next_on") and thread_kill == false then
					thread_kill=true					
					--ttkill(current_thread_id)
					--nLog('thread.kill before:'..tostring( current_thread_id))				
				end		
				
			end
			mrsleep(SLEEP_TIME)
		end
	end
)

nLog("task1:"..tostring(task1))
--table.insert(task_list,{id=task1,info="登录模块",LOGIN_SWITCH="ON"})

--登录成功之后，进入游戏
task2= thread.dispatch( -- 派发一个异步任务
	function()
		local current_thread_id = thread.current_id()
		table.insert(task_list,{id=current_thread_id,info="登录成功之后，进入游戏",SWITCH="ON"})
		while(true) do			
			if getSwitchStatus(current_thread_id) =="ON" then
				nLog(tostring(current_thread_id)..":on")
				mmsleep(1000)
				nLog("287 登录成功之后，进入游戏:thread.current_id:"..tostring( current_thread_id))				
				local ret = task_by_order2(list02)
				
				--if ret=="kill" then
				if (ret =="in" or ret =="next_on") and thread_kill == false then
					thread_kill=true
					
					ttkill(current_thread_id)
					nLog('thread.kill before:'..tostring( current_thread_id))				
				end				
			else
				nLog(tostring(current_thread_id)..":off")
			end
			mrsleep(SLEEP_TIME)
			--nLog("292 after while 登录成功之后，进入游戏")
		end
	end
)
nLog("task2:"..tostring(task2))
--table.insert(task_list,{id=task2,info="登录成功之后，进入游戏",IN_GAME_SWITCH="ON"})

--游戏主界面模块
task3 = thread.dispatch( 
	function()
		local ret_flag1 = true
		local current_thread_id = thread.current_id()
		table.insert(task_list,{id=current_thread_id,info="游戏主界面",SWITCH="ON"})
		while(true) do 			
			if getSwitchStatus(current_thread_id) =="ON" then
				nLog("395 游戏主界面:thread.current_id:"..tostring( current_thread_id))
				--mmsleep(3000)				
				local ret =task_by_loop2(list03)
				if ret=="in" and ret_flag1 ==true then					
					ttswitch(current_thread_id,"OFF")
				elseif ret =="next_on" then
					ret_flag1 = false
					--大于当前任务号的,且在某一个数组中的开关都置为ON， 
					ttswitch(current_thread_id,"ON")
					---------------测试-------------------------start
					VAR_LIST1.FIRST_ROLE="FINISHED"
					VAR_LIST1.SECOND_ROLE="READY"
					record_var1(VAR_LIST1)
					---------------测试-------------------------end
					--nLog('VAR_LIST1.IN_GAME_SWITCH="ON"')
				end
				
				if (ret =="in" or ret =="next_on") and thread_kill == false then
					thread_kill=true
				end	
			end
			mrsleep(SLEEP_TIME)
		end
	end
)

nLog("task3:"..tostring(task3))


--处理弹窗，一般以小窗口为主
task999= thread.dispatch( -- 派发一个异步任务
	function()
		while (true) do
			mrsleep(SLEEP_TIME)
			nLog("274 处理弹窗，一般以小窗口为主")
			--mmsleep(3000)
			--click_popup_window()
			task_by_loop2(list01)
		end
	end
)
nLog("task999:"..tostring(task999))
--table.insert(task_list,{id=task999,info="处理弹窗，一般以小窗口为主"})

task0 = thread.dispatch( 
	function()
		while(true) do 
			thread_kill = false
			nLog("249 backgroud monitor thread ")			
			mmsleep(SLEEP_TIME)
		end
	end
)
nLog("task0:"..tostring(task0))

nLog(task_list)



