--[[
2017-10-19
QQ登陆
王者荣耀
--]]
--require("TSLib")
--require "req_tab1"
--require "abc"
--require "tools"

--iphone_path="/var/mobile/Media/TouchSprite/lua/"
XXT_PHONE_PATH="/var/mobile/Media/1ferver/lua/scripts/xxt_tianlongbabu/"

dofile(XXT_PHONE_PATH.."COMMON_TOOLS.lua")
dofile(XXT_PHONE_PATH.."TAB_ENV.lua")
dofile(XXT_PHONE_PATH.."VAR_SERIALIZE.lua")
dofile(XXT_PHONE_PATH.."XXT_TOUCH_COMMON.lua")
--dofile(iphone_path.."pushover.lua")

function set_jue_se(...)
	wwlog("298 判断是否是仓库号")
	mmsleep(100)	

	wwlog(tostring(VAR_LIST1.tianlei_flag))
	VAR_LIST1.tianlei_flag = true
	wwlog(tostring(VAR_LIST1.tianlei_flag))
	VAR_LIST1.init_setup = true
	fuli_flag = true
	in_game = false

	VAR_LIST1.bag_is_ready = true
	wwlog("340 是仓库号,直接去交易")

	-- body
end


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

--dofile(iphone_path.."main1.lua")
mmsleep(1000)

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
		--before_game = 'Y'
	end
	

if  isFrontApp("com.tencent.smoba") == 0 then
	mmsleep(200)
	runApp("com.tencent.smoba")
	mmsleep(1000)
end

set_jue_se()
record_var1(VAR_LIST1)

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

--pushmsg("title","msg11")

--shake_screen()

--cor_pop_up1()
--mmsleep(3000)
--cor_pop_up1()


dofile(XXT_PHONE_PATH.."pick_color.lua")
mmsleep(1000)

list1= List.new()

List.pushlast(list1,page_login_entrance.button_qq)
List.pushlast(list1,page_login_auth_qq.button_login)


function task_by_loop(list1)
	-- body
	while (true) do
		for k,v in pairs (list1) do
			--print(k)
			if k ~= 'first' and k ~= 'last' then
				nLog("k:"..k)
				if multi_col(v) then
					nLog("multi_col(v)")			
					local click_x,click_y = getClickXY(v)	
					tap(click_x,  click_y)
				end 
				--print_r(v)
			end
			mmsleep(1000)
		end
		mmsleep(1000)
	end
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
	while (true) do
		-- body
		local first_value = List.getfirst(list1)

		local click_x,click_y = getClickXY(first_value)	
		if multi_col(first_value) then
			nLog("multi_col(first_value)")
			List.popfirst(list1)			
			tap(click_x,  click_y)
		end
		if getListSize(list1) == 0 then
			break
		end
		mmsleep(1000)
	end
end

function click_popup_window()
	
	if multi_col({
	{  527,  192, 0xbcb09c},
	{  583,  194, 0x381e07},
	{  386,  274, 0x381e07},
	{  685,  423, 0xe3aa51},
}) then
	ltap(685,  423)
	end
	
end

function click_by_task()
	if multi_col({
	{  471,  539, 0x81e809},
	{  492,  549, 0xeaf1f5},
	{  564,  527, 0x90b163},
}) then
	ltap(564,  527)
	end	
end


task1 = thread.dispatch( -- 派发一个异步任务
    function()
		while (true) do
			mmsleep(2000)
			ttoast("226 before click_popup_window()")
			mmsleep(3000)
			click_popup_window()
		end
    end
)

task2 = thread.dispatch( -- 派发一个异步任务
    function()
		while (true) do 
			mmsleep(1000)
			ttoast("236 before click_by_task()")
			click_by_task()
		end
    end
)


--dialog(trim1("             sdfsdfs                    "))