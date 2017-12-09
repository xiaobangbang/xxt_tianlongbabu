--require("TSLib")
SLEEP_TIME=1000
--iphone_path="/var/mobile/Media/TouchSprite/lua/"
XXT_PHONE_PATH="/var/mobile/Media/1ferver/lua/scripts/xxt_tianlongbabu/"
log_file = XXT_PHONE_PATH.."tianlong.log"

dofile(XXT_PHONE_PATH.."COMMON_TOOLS.lua")
dofile(XXT_PHONE_PATH.."TAB_ENV.lua")
dofile(XXT_PHONE_PATH.."VAR_SERIALIZE.lua")
dofile(XXT_PHONE_PATH.."XXT_TOUCH_COMMON.lua")
dofile(XXT_PHONE_PATH.."FTP_WX.lua")
--dofile(iphone_path.."pushover.lua")
dofile(XXT_PHONE_PATH.."XXTColorPicking.lua")
dofile(XXT_PHONE_PATH.."LIST_CONFIG.lua")
mrsleep(200)

while (f_is_device_locked()) do
	unlock_device()
	mrsleep(500)
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
	mrsleep(200)
	open_app("com.tencent.cyoutstl")
	wwlog("game start")
	mrsleep(500)		
end

if TAB_ENV.DEBUG_MODE==true then	
	wwlog("等待10 秒钟")
	mrsleep(10000)
end

local start_time=os.time()
--local v_content= '"'..string.gsub(device.type(),",",".")..'"'..","..'"'..string.gsub(device.name(),",",".")..'"'..","..'"'..device.udid()..'"'..","..'"'..device.serial_number()..'"'..","..'"'..os.date("%Y-%m-%d %H:%M:%S")..'"'
local v_content= string.gsub(device.type(),",",".")..","..string.gsub(device.name(),",",".")..","..device.udid()..","..device.serial_number()..","..os.date("%Y-%m-%d %H:%M:%S")
--v_content = v_content .."\n"
wwlog(v_content)
function record_log(table_name,content) 
	local file_name = table_name.."-"..string.gsub(string.gsub(string.gsub(os.date("%Y-%m-%d %H:%M:%S")," ","_"),":",""),"-","").."-"..string.sub(device.udid(),33,40)..".txt"
	local file_with_full_path=XXT_PHONE_PATH..TAB_ENV.WX_USER.."/log/"..file_name
	local out =assert(io.open(file_with_full_path,"w"))
	out:write(v_content)
	assert (out:close())

	upload_wx1(TAB_ENV.WX_USER.."/log/"..file_name)
end

record_log("logon_device",v_content)

if TAB_ENV.FIRST_TIME_OF_DAY == true then
	VAR_LIST1.FIRST_CHARACTOR="NEW"
	VAR_LIST1.SECOND_CHARACTOR="NEW"
	VAR_LIST1.THIRD_CHARACTOR="NEW"
	VAR_LIST1.FOUTH_CHARACTOR="NEW"
end 

record_var1(VAR_LIST1,XXT_PHONE_PATH.."VAR_SERIALIZE.lua")

function dosomething2(v_color,v)
	if v.click_xy ~= nil then
		local click_x,click_y = getClickXY({v.click_xy})	
		ltap(click_x,  click_y)
	else
		if v.foo ~= nil then
			v.foo()		
		else	
			local click_x,click_y = getClickXY(v_color)	
			ltap(click_x,  click_y)
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
					wwlog(v.logmsg)
					dosomething2(v1,v)
					mrsleep(SLEEP_TIME)
					if v.following_function then
						ret = "following_function"						
					end	
					if v.end_color then
						ret = "end_color"						
					end	
					break
				end				
			end	
			if ret == "end_color" then
				break
			end
		end		
	end
	return ret
end


function task_by_foo2(list1)
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
					wwlog(v.logmsg)
					--[[
					if list1.first <= list1.last then
						List.popfirst(list1)
					end
					--]]
					if v.foo2 ~= nil then
						return v.foo2()		
					end
				end				
			end				
		end		
	end
	return ret
end

function task_by_order2(list1)
	local ret = nil		
	if list1.first <= list1.last then
		local v = List.getfirst(list1)			
		local colors
		if v.color ~= nil then
			colors = {v.color}
		else
			colors = v.colors
		end
		for k1,v1 in pairs(colors )	do 
			if multi_col(v1) then
				ret = "in"				
				wwlog(v.logmsg)
				dosomething2(v1,v)
				mrsleep(SLEEP_TIME)					
				if v.end_color then
					ret = "end_color"						
				end
				if list1.first <= list1.last then
					List.popfirst(list1)
				end
				break
			end			
		end		
	end
	return ret
end

function  getListSize(list1)	
	return list1.last + 1
end	


local login_switch= true
local training_switch= true
local main_task_switch= true
local popup_switch= true
local email_switch= true
local welfare_switch = false
local find_back_switch = true
local datu_switch = true
local bag_switch = true
local xishi_switch = false
local next_charactor_switch = false

local email_flag= false 
local popup_flag =false
local welfare_flag = false
local time_count_flag= false
local time_start1 = os.time()


function check_popup()
	while (true) do			
		wwlog(debug.getinfo(1).currentline..":清理物品、装备、弹窗")				
		local ret = task_by_loop2(list777)
		if (ret ==nil  )  then
			wwlog("没有弹窗了，退出while")
			break
		end			
		mrsleep(SLEEP_TIME)
	end
end

function close_all_window()
	while (true) do			
		wwlog(debug.getinfo(1).currentline..":关闭所有窗口，准备退出当前角色")				
		local ret = task_by_loop2(list13)
		if (ret ==nil  )  then
			wwlog("没有窗口了")
			break
		end			
		mrsleep(SLEEP_TIME)
	end
end

func_click_menu =function()
	while (true) do
		--if next_charactor_switch == true then
		wwlog(debug.getinfo(1).currentline..":点击功能菜单")				
		local ret = task_by_order2(list10)	
		if  ret =="end_color"   then
			wwlog("点击功能菜单 退出while")									
			break
		end
		--end
		mrsleep(SLEEP_TIME)
	end
end

func_click_setup =function()
	while (true) do
		--if next_charactor_switch == true then
		wwlog(debug.getinfo(1).currentline..":点击设置按钮")				
		local ret = task_by_order2(list11)	
		if  ret =="end_color"   then
			wwlog("点击设置按钮 退出while")									
			break
		end
		--end
		mrsleep(SLEEP_TIME)
	end
	nLog("after func_click_setup while true")

	if VAR_LIST1.FIRST_CHARACTOR =="NEW" then
		VAR_LIST1.FIRST_CHARACTOR = "FINISHED"
	elseif VAR_LIST1.SECOND_CHARACTOR =="NEW" then
		VAR_LIST1.SECOND_CHARACTOR ="FINISHED"
	elseif VAR_LIST1.THIRD_CHARACTOR =="NEW" then
		VAR_LIST1.THIRD_CHARACTOR ="FINISHED"
	elseif VAR_LIST1.FOUTH_CHARACTOR =="NEW" then
		VAR_LIST1.FOUTH_CHARACTOR ="FINISHED"
	end	
	record_var1(VAR_LIST1,XXT_PHONE_PATH.."VAR_SERIALIZE.lua")
end
local task6 = 0 - debug.getinfo(1).currentline
--领取邮件
func_email = function  ()
	while (true) do
		if email_switch == true then
			wwlog(debug.getinfo(1).currentline..":领取邮件")				
			--local ret = task_by_order2(list05)
			local ret = task_by_loop2(list05)
			if ret =="in"   then
				welfare_switch = true
				email_flag = true
				time_count_flag= true
				welfare_flag = false
			elseif  ret =="end_color"   then
				wwlog("邮件线程关闭")					
				--点击福利图标
				task6= thread.timer_start(1,function()
						func_welfare_icon()
						wwlog("after func_welfare_icon()")
					end
				)

				break
			end
		end
		mrsleep(SLEEP_TIME)
	end
end

--找回
func_find_back = function()
	while (true) do
		if find_back_switch == true then
			wwlog(debug.getinfo(1).currentline..":找回")				
			local ret = task_by_order2(list07)
			if ( ret =="end_color" )  then
				wwlog("找回，下拉到最底部，skip while" )
				break					
			end
		end
		mrsleep(SLEEP_TIME)
	end
end

func_open_bag = function()
	while (true) do
		if bag_switch == true  then
			wwlog(debug.getinfo(1).currentline..":打开背包")				
			local ret = task_by_order2(list08)
			if ret =="in"  then
				xishi_switch = true
				bag_switch = false
			elseif	ret =="end_color"   then
				next_charactor_switch = true
				break
			end
		end
		mrsleep(SLEEP_TIME)
	end
end

func_find_xishi =function()
	while (true) do
		if xishi_switch == true then
			--wwlog(debug.getinfo(1).currentline..":找寻稀世藏宝图")
			local ret = task_by_order2(list09)	
			bag_switch = true
			xishi_switch = false
			if (ret =="in" or ret =="end_color" )  then
				--dialog("宝图在手，啥也不愁")
				next_charactor_switch = true
			end
		end
		mrsleep(SLEEP_TIME)
	end
end


local task8 = 0 - debug.getinfo(1).currentline
local task9 = 0 - debug.getinfo(1).currentline
func_datu = function()
	local time1 = os.time()
	while (true) do
		if datu_switch == true then
			wwlog(debug.getinfo(1).currentline..":逞凶打图")				
			local ret = task_by_loop2(list07_1)
			if ret =="end_color"   then
				wwlog("找回打图结束，skip while" )			
				break					
			end
			if os.time() - time1 >20 then
				time1 = os.time()
				ltap(1082,   66)
				wwlog("找回打图超时...................，skip while" )
				break
			end
		end
		mrsleep(SLEEP_TIME)
	end
	--打开背包，检测稀世
	task8= thread.timer_start(1,
		function()
			check_popup()
			func_open_bag()
		end
	)
--找寻稀世藏宝图
	task9= thread.timer_start(3,
		function()
			func_find_xishi()
		end
	)
end

local task7 = 0 - debug.getinfo(1).currentline
local task_datu= 0 - debug.getinfo(1).currentline
func_welfare_icon= function()
	while (true) do
		if welfare_switch == true then
			wwlog(debug.getinfo(1).currentline..":点击福利图标")				
			local ret = task_by_order2(list06)	
			if ret == "in" then
				welfare_flag = true					
			end
			if ret == "end_color" then
				wwlog("退出while 循环")
				task7= thread.timer_start(1,
					function()
						func_find_back()
						task_datu = thread.timer_start(1,function() func_datu() end)	
						wwlog("task 7 :func_find_back()..............end")
					end
				)
				break
			end
		end
		mrsleep(SLEEP_TIME)
	end
	wwlog("func_welfare_icon after while 循环")
end

func_monitor_popup=function()
	while (true) do
		if popup_switch == true  then --领取邮件之后，接着领取福利，然后在使用/领用奖励
			--wwlog(debug.getinfo(1).currentline..":处理物品、装备、弹窗")				
			local ret = task_by_loop2(list777)				
		end
		mrsleep(SLEEP_TIME)
	end
end

local thread_409 = 0 - debug.getinfo(1).currentline
local thread_410 = 0 - debug.getinfo(1).currentline

task_ftp = thread.dispatch( 
	function()
		while(true) do 
			--thread_kill = false			
			wwlog(debug.getinfo(1).currentline..":ftp  thread ")	

			local file_name1 =TAB_ENV.WX_USER.."/switch_pause/file1.txt"
			local ret = download_wx1(file_name1)
			if ret==true then
				--wwlog("download success")
				if file.exists(XXT_PHONE_PATH..file_name1) then
					--wwlog("file.exists")
					local data = split(file.get_line(XXT_PHONE_PATH..file_name1, 1),",") 
					--wwlog(data)
					local time2 = string2time(data[2])

					if data[1]=="pause" and time2 > start_time then
						login_switch = false
						training_switch = false
						main_task_switch = false
						popup_switch = false
						email_switch = false
						welfare_switch = false
						find_back_switch = false
						datu_switch = false
						bag_switch = false
						next_charactor_switch = false
					elseif data[1]=="continue" and time2>start_time then 
						login_switch = true
						training_switch = true
						main_task_switch = true
						popup_switch = true
						email_switch = true						
						find_back_switch = true
						datu_switch = true						
					end
				end
			end						
			mrsleep(SLEEP_TIME * 5)
		end
	end
)
wwlog("task_ftp:"..tostring(task_ftp))

--backgroud monitor thread
task0 = thread.dispatch( 
	function()
		while(true) do 			
			wwlog(debug.getinfo(1).currentline..":backgroud monitor thread ")	
			--如果找不到稀世藏宝图，领取邮件3分钟之后，换下一个角色
			if email_flag == true and time_count_flag== true then
				time_count_flag = false
				time_start1 = os.time()
				nLog("计时开始:"..tostring( time_start1))
			end
			if email_flag == true then
				if os.time() -time_start1 >TAB_ENV.CHANGE_TIME then	
					time_start1 = os.time()
					next_charactor_switch = true
					wwlog(debug.getinfo(1).currentline..":准备切换下一个角色")
				else
					nLog("当前时间:"..tostring( os.time()))
				end
			end			
			if next_charactor_switch == true and thread_409 < 0 then
				nLog("next_charactor_switch == true")
				--next_charactor_switch = false
				close_all_window()
				thread_409 = thread.timer_start(1,function() 						
						func_click_menu()
					end)
				mrsleep(500)
				thread_410 = thread.timer_start(5,function() 						
						func_click_setup()
					end)
			end
			mrsleep(SLEEP_TIME * 3)
		end
	end
)
wwlog("task0:"..tostring(task0))


--处理异常弹窗
task999= thread.dispatch( 
	function()
		while (true) do
			if popup_switch == true then 
				--wwlog(debug.getinfo(1).currentline..":处理异常弹窗")				
				local ret = task_by_loop2(list01)				
			end
			mrsleep(SLEEP_TIME)
		end
	end
)
wwlog("task999:"..tostring(task999))

func_training=function()
	local current_thread_id = thread.current_id()	
	wwlog(debug.getinfo(1).currentline..":登录成功之后，进入游戏:thread.current_id:"..tostring( current_thread_id))				
	while(true) do	
		if training_switch ==true then			
			mrsleep(1000)			
			local ret = task_by_order2(list02)					
		end
		mrsleep(SLEEP_TIME*2)			
	end
end


local training_task = 0 - debug.getinfo(1).currentline
local task12  = 0 - debug.getinfo(1).currentline
--登录模块
task1 = thread.dispatch( 
	function()
		--local ret_flag1 = true
		local current_thread_id = thread.current_id()		
		while(true) do 
			if login_switch ==true then
				--wwlog(debug.getinfo(1).currentline..":登录模块:thread.current_id:"..tostring( current_thread_id))				
				local ret =task_by_loop2(list0)				
				if ret =="following_function" then					
					nLog("新手训练任务开启")
					if training_task <0 then
						training_task = thread.timer_start(5,function() func_training() end)
					end
				end	
				if ret == "end_color" then 
					task12 = thread.timer_start(5,
						function()
							while (true) do											
								local ret = task_by_foo2(list12)							
								if ret == "training" then
									if training_task <0 then
										training_task = thread.timer_start(5,function() func_training() end)
									end
									break
								elseif ret == "player_in" then									
									break
								elseif ret == "welfare_window" then
									ltap(1082,   64)
									wwlog(debug.getinfo(1).currentline..":关闭弹窗，领取邮件作为第一个任务开始")
									break
								end 
								mrsleep(SLEEP_TIME)
							end
						end
					)
				end
			end
			mrsleep(SLEEP_TIME)
		end
	end
)
wwlog("task1:"..tostring(task1))


func_home_page=function()	
	local current_thread_id = thread.current_id()	
	while(true) do 
		if main_task_switch ==true and TAB_ENV.MAIN_TASK_SWITCH ==true then				
			wwlog(debug.getinfo(1).currentline..":游戏主界面:thread.current_id:"..tostring( current_thread_id))					
			local ret =task_by_loop2(list03)											
		end
		mrsleep(SLEEP_TIME)
	end
end


local task3 = 0 - debug.getinfo(1).currentline
local task4 = 0 - debug.getinfo(1).currentline
local task777 = 0 - debug.getinfo(1).currentline
--监测角色是否成功登入主界面
task14= thread.dispatch( 
	function()
		while (true) do			
			wwlog(debug.getinfo(1).currentline..":监测角色是否成功登入主界面")				
			local ret = task_by_foo2(list14)
			if ret == "player_in"  then
				task4= thread.timer_start(1,
					function()
						func_email()
						check_popup()
					end
				)

				task3 = thread.timer_start(5, 
					function() 
						func_home_page()
					end
				)

				task777= thread.timer_start(1,
					function()
						func_monitor_popup()
					end
				)

				break		
			end
			mrsleep(SLEEP_TIME)
		end
		nLog("exit 监测角色是否成功登入主界面")
	end
)
wwlog("task14:"..tostring(task14))

--主线任务，静止不动的话，就点一下
--[[
task888 = thread.dispatch( 
	function()
		while(true) do 			
			if main_task_switch ==true and TAB_ENV.MAIN_TASK_SWITCH ==true then
				wwlog(debug.getinfo(1).currentline..":主线任务，静止不动的话，就点一下")	
				if f_no_color_changed() then
					local ret = task_by_loop2(list04)
				end 
			end 
			mrsleep(5000)
		end 
	end 
) 
wwlog("task888:"..tostring(task888))
--]]
