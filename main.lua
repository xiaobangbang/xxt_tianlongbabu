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

--task_list={}

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
List.pushlast(list01,page_popup.net_lost_window)
List.pushlast(list01,page_popup.close_window1)
--List.pushlast(list01,page_popup.use_money)
List.pushlast(list01,page_popup.notice_ok1)
List.pushlast(list01,page_popup.first_scene)
List.pushlast(list01,page_popup.no_push_notice)
List.pushlast(list01,page_popup.new_version_update)
--List.pushlast(list01,page_popup.put_on)
List.pushlast(list01,page_popup.net_retry)
--List.pushlast(list01,page_popup.use)

list777= List.new()
List.pushlast(list777,page_popup.use_money)
List.pushlast(list777,page_popup.put_on)
List.pushlast(list777,page_popup.use)

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
List.pushlast(list03,page_main.picture_onemore)
List.pushlast(list03,page_main.picture_move)
List.pushlast(list03,page_main.menu_guide)
List.pushlast(list03,page_main.skill_menu_guide)
List.pushlast(list03,page_main.auto_fighting_guide)
List.pushlast(list03,page_main.adopt_pet)
List.pushlast(list03,page_main.choose_pet)
List.pushlast(list03,page_main.pet_menu)
List.pushlast(list03,page_main.big_skill)
List.pushlast(list03,page_main.skill_upgrade_guide)
List.pushlast(list03,page_main.skill_menu_close_guide)
List.pushlast(list03,page_main.pet_menu_close_guide)
List.pushlast(list03,page_main.pet_go_fighting_guide)
List.pushlast(list03,page_main.main_task_chain)
List.pushlast(list03,page_main.close_func_menu_guide)
List.pushlast(list03,page_main.adopt_horse)
List.pushlast(list03,page_main.black_horse_active)
List.pushlast(list03,page_main.exam_activity)
List.pushlast(list03,page_main.shop_buy_pos7)
List.pushlast(list03,page_main.buy_ok)
List.pushlast(list03,page_main.shenmifensha)
List.pushlast(list03,page_main.submit_task_needed)
List.pushlast(list03,page_main.letter_deal_button)
List.pushlast(list03,page_main.clean_letter)
List.pushlast(list03,page_training.skip_scene)
--下面这行代码，放在最后
--List.pushlast(list03,page_popup.close_pop_window1)

list04= List.new()
List.pushlast(list04,page_main.backgroud)

list05= List.new()
List.pushlast(list05,page_email.email_icon)
List.pushlast(list05,page_email.sys_email)
List.pushlast(list05,page_email.receive_email)
List.pushlast(list05,page_popup.close_welfare_window)

list06= List.new()
List.pushlast(list06,icon_welfare.welfare)


list07= List.new()
List.pushlast(list07,page_welfare.welfare_find_back)
List.pushlast(list07,page_welfare.scroll_bottom)

list07_1= List.new()
List.pushlast(list07_1,page_welfare.datu_show)
List.pushlast(list07_1,page_welfare.datu_popup)
--List.pushlast(list07_1,page_welfare.find_back_close)

list08= List.new()
List.pushlast(list08,page_bag.bag_icon)
List.pushlast(list08,page_bag.pack_bag)
List.pushlast(list08,page_bag.material1)
List.pushlast(list08,page_bag.material2)
List.pushlast(list08,page_bag.material3)
List.pushlast(list08,page_bag.material4)
List.pushlast(list08,page_bag.material5)
List.pushlast(list08,page_bag.close_bag)

list09= List.new()
List.pushlast(list09,page_xishi.popup)

list10= List.new()
List.pushlast(list10,page_next_charactor.func_menu)

list11= List.new()
List.pushlast(list11,page_next_charactor.setup)
List.pushlast(list11,page_next_charactor.change_account)
List.pushlast(list11,page_next_charactor.change_account_ok)

list12= List.new()
List.pushlast(list12,page_clear.welfare_window)

list13= List.new()
List.pushlast(list13,page_close.all_big_window)


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
					local click_x,click_y = getClickXY(v1)						
					--wwlog(v.step)
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
				local click_x,click_y = getClickXY(v1)						
				--wwlog(v.step)
				wwlog(v.logmsg)
				dosomething2(v1,v)
				mrsleep(SLEEP_TIME)				
				--大于当前任务号的,且在某一个数组中的开关都置为ON， 
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

--[[
function ttkill(task_id) 
	for k,v in pairs(task_list) do
		wwlog(v.id)
		if v.id < task_id then
			thread.kill(v.id)
			wwlog("thread.kill(v.id)")
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
--]]

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
--local thread_kill = false
local email_flag= false --领取邮件后设置为true，然后才允许打开背包
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

func_monitor_popup=function()
	while (true) do
		if popup_switch == true  then --领取邮件之后，接着领取福利，然后在使用/领用奖励
			--wwlog(debug.getinfo(1).currentline..":处理物品、装备、弹窗")				
			local ret = task_by_loop2(list777)				
		end
		mrsleep(SLEEP_TIME)
	end
end

local thread_409 = -409
local thread_410 = -410

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
			--mrsleep(SLEEP_TIME)
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
	--table.insert(task_list,{id=current_thread_id,info="登录成功之后，进入游戏",SWITCH="ON"})
	while(true) do	
		if training_switch ==true then
			wwlog(tostring(current_thread_id)..":on")
			mrsleep(1000)
			wwlog(debug.getinfo(1).currentline..":登录成功之后，进入游戏:thread.current_id:"..tostring( current_thread_id))				
			local ret = task_by_order2(list02)					
		end
		mrsleep(SLEEP_TIME*2)			
	end
end


local training_task = -100
--登录模块
task1 = thread.dispatch( 
	function()
		local ret_flag1 = true
		local current_thread_id = thread.current_id()		
		while(true) do 
			if login_switch ==true then
				--wwlog(debug.getinfo(1).currentline..":登录模块:thread.current_id:"..tostring( current_thread_id))				
				local ret =task_by_loop2(list0)				
				if ret =="following_function" then					
					nLog("新手训练任务开启")
					training_task = thread.timer_start(5,function() func_training() end)
					---------------测试-------------------------start
				
					---------------测试-------------------------end					
				end				
			end
			mrsleep(SLEEP_TIME)
		end
	end
)

wwlog("task1:"..tostring(task1))

--游戏主界面模块
task3 = thread.dispatch( 
	function()
		local ret_flag1 = true
		local current_thread_id = thread.current_id()
		--table.insert(task_list,{id=current_thread_id,info="游戏主界面",SWITCH="ON"})
		while(true) do 
			if main_task_switch ==true and TAB_ENV.MAIN_TASK_SWITCH ==true then				
				--wwlog(debug.getinfo(1).currentline..":游戏主界面:thread.current_id:"..tostring( current_thread_id))					
				local ret =task_by_loop2(list03)					
				if ret =="end_color" then
					ret_flag1 = false						
				end					
			end
			mrsleep(SLEEP_TIME)
		end
	end
)
wwlog("task3:"..tostring(task3))


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

--处理物品、装备弹窗，一般以小窗口为主
--task777= thread.dispatch( 
task777= thread.timer_start(1,
	function()
		func_monitor_popup()
	end
)
wwlog("task777:"..tostring(task777))

--关闭弹窗，领取邮件作为第一个任务开始
--task12= thread.dispatch( 
task12 = thread.timer_start(1,
	function()
		while (true) do			
			wwlog(debug.getinfo(1).currentline..":关闭弹窗，领取邮件作为第一个任务开始")				
			local ret = task_by_loop2(list12)							
			mrsleep(SLEEP_TIME)
		end
	end
)
wwlog("task12:"..tostring(task12))

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
				--thread.timer_stop(task4)						
				break
			end
		end
		mrsleep(SLEEP_TIME)
	end
end

--领取邮件
task4= thread.dispatch(
	function()
		func_email()
		check_popup()
	end
)
wwlog("task4:"..tostring(task4))
mrsleep(500)
thread.wait(task4)
mrsleep(1000)
thread.timer_stop(task12)

if training_task > 0 then
	thread.timer_stop(training_task)
end

func_welfare_icon= function()
	while (true) do
		if welfare_switch == true then
			--wwlog(debug.getinfo(1).currentline..":点击福利图标")				
			local ret = task_by_order2(list06)	
			if ret == "in" then
				welfare_flag = true					
			end
			if ret == "end_color" then
				wwlog("退出while 循环")
				break
			end
		end
		mrsleep(SLEEP_TIME)
	end
	wwlog("func_welfare_icon after while 循环")
end

--点击福利图标
task6= thread.dispatch(function()
		func_welfare_icon()
		wwlog("after func_welfare_icon()")
	end
)
wwlog("task6:"..tostring(task6))
thread.wait(task6)
wwlog("福利图标点击完毕")


--找回
func_find_back = function()
	while (true) do
		if find_back_switch == true then
			--wwlog(debug.getinfo(1).currentline..":找回")				
			local ret = task_by_order2(list07)
			if ( ret =="end_color" )  then
				wwlog("找回，下拉到最底部，skip while" )
				break					
			end
		end
		mrsleep(SLEEP_TIME)
	end
end
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
end
--bag_switch = false
local task_datu= -679
task7= thread.timer_start(1,
	function()
		func_find_back()
		task_datu = thread.timer_start(1,function() func_datu() end)	
		wwlog("task 7 :func_find_back()..............end")
	end
)
wwlog("task7:"..tostring(task7))
mrsleep(3000)
wwlog(debug.getinfo(1).currentline)		
thread.wait(task7)
mrsleep(1000)
wwlog(debug.getinfo(1).currentline)	
thread.wait(task_datu)
wwlog("thread.wait(task_datu)")
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

--打开背包，检测稀世
task8= thread.dispatch(
	function()
		check_popup()
		func_open_bag()
	end
)
wwlog("task8:"..tostring(task8))

--找寻稀世藏宝图
task9= thread.dispatch(
	function()
		func_find_xishi()
	end
)
wwlog("task9:"..tostring(task9))

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

--wwlog(task_list)
