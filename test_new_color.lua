XXT_PHONE_PATH="/var/mobile/Media/1ferver/lua/scripts/xxt_tianlongbabu/"
dofile(XXT_PHONE_PATH.."TAB_ENV.lua")
dofile(XXT_PHONE_PATH.."COMMON_TOOLS.lua")
dofile(XXT_PHONE_PATH.."XXT_TOUCH_COMMON.lua")

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

page_login_entrance={}
page_login_entrance.button_wx={}

page_login_entrance.button_wx.colors={
{
	{  471,  539, 0x81e809},
	{  492,  549, 0xeaf1f5},
	{  564,  527, 0x90b163},
}, 
{
	{  471,  539, 0x81e809},
	{  492,  549, 0xeaf1f5},
	{  564,  527, 0x90b163},
}}


page_login_entrance.button_wx.click_xy={564,  527}
page_login_entrance.button_wx.step="page_login_entrance.button_wx"
page_login_entrance.button_wx.logmsg="选择微信登陆"


page_login_entrance.button_besure_wx={}
page_login_entrance.button_besure_wx.color={
	{  908,  326, 0x04be02},
	{  932,  373, 0xffffff},
	{  937,  347, 0xffffff},
	{  936,  310, 0xffffff},
	{  925,  302, 0x04be02},
}
page_login_entrance.button_besure_wx.step="page_login_entrance.button_besure_wx"
page_login_entrance.button_besure_wx.logmsg="微信授权-确认登陆"


list0= List.new()
List.pushlast(list0,page_login_entrance.button_wx)
List.pushlast(list0,page_login_entrance.button_besure_wx)


screen.init(1)
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

function task_by_loop(list1)
	-- body
	--while (true) do
		for k,v in pairs (list1) do
			--print(k)
			if k ~= 'first' and k ~= 'last' then
				nLog("k:"..k)
				
				--nLog(v.color)
				--nLog(v.colors)
				--nLog( table_to_str(v) )
				local colors
				if v.color ~= nil then
					colors = {v.color}
				else
					colors = v.colors
				end
				
				for k1,v1 in pairs(colors )	do 
				if multi_col(v1) then
					--nLog("multi_col(v)")			
					local click_x,click_y = getClickXY(v1)	
					tap(click_x,  click_y)
					nLog(v.step)
					nLog(v.logmsg)
					break
				end 
				end
			
				--print_r(v)
				mmsleep(1000)
			end
			mmsleep(1000)
		end
		mmsleep(1000)
	--end
end

task1 = thread.dispatch( -- 派发一个异步任务
	function()
		while (true) do
			mmsleep(2000)
			nLog("260 before task_by_loop()")
			--mmsleep(3000)
			--click_popup_window()
			task_by_loop(list0)
		end
	end
)



