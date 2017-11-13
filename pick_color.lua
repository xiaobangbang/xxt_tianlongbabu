page_new_version_update={}
page_new_version_update.button_update={{  595,  560, 0xe5a32d},{  670,  584, 0xe39722},{  621,  576, 0xfefefe},{  652,  572, 0xffffff},}
page_new_version_update.button_cancel={{  773,  569, 0x1e9ad4},{  771,  583, 0x1c95d7},{  463,  575, 0x3590ce},{  415,  576, 0xffffff},}
page_notice={}
page_notice.close={{  228,  159, 0xc9cadc},{  290,  158, 0xcbccde},{  345,  167, 0xcbccde},{  938,   92, 0x35d1ea},}

page_login_entrance={}
--page_login_entrance.button_qq={{  762,  522, 0xffffff},{  826,  523, 0xffffff},{  850,  523, 0xffffff},{  917,  516, 0xffffff},}

page_login_entrance.button_qq={{  739,  519, 0x357ec1},{  761,  523, 0xffffff},{  804,  517, 0xffffff},{  846,  516, 0x349dd6},}
page_login_entrance.button_qq.click_xy={846,  516}

page_login_auth_qq={}
page_login_auth_qq.button_login={{  869,  342, 0xffffff},{  874,  336, 0x00aced},{  879,  304, 0xffffff},{  890,  304, 0xffffff},}
page_login_auth_qq.link_change_qq={{   75,  143, 0xffffff},{   91,  121, 0xffffff},{   78,   66, 0xffffff},}


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

page_login_entrance.enter_game={}
page_login_entrance.enter_game.color= {
	{  509,  538, 0xdead64},
	{  535,  542, 0xf1f5de},
	{  565,  539, 0xd9a762},
	{  609,  538, 0xf7f7f3},
}
page_login_entrance.enter_game.logmsg="进入游戏"


page_login_entrance.create_player={}
page_login_entrance.create_player.color={
	{  947,  582, 0xdead64},
	{  946,  603, 0xdea05b},
	{  994,  582, 0xf7f7ef},
	{ 1021,  588, 0xefedcc},
}
page_login_entrance.create_player.step="page_login_entrance.create_player"
page_login_entrance.create_player.logmsg="创建角色,默认天龙-男"
page_login_entrance.create_player.foo= function ()  
	ltap(1079,  512)
	mmsleep(500)
	ltap(1021,  588)
	nLog("点击签筒，重新获取名字")
	end

page_login_entrance.player_name_exist={}
page_login_entrance.player_name_exist.color={
	{  534,  413, 0xedc670},
	{  535,  427, 0xe1a14a},
	{  559,  421, 0xfcf5d1},
	{  579,  419, 0xfef7d4},
}

page_login_entrance.player_name_exist.step="page_login_entrance.player_name_exist"
page_login_entrance.player_name_exist.logmsg="角色名称重复"

page_login_entrance.player_direct_game={}
page_login_entrance.player_direct_game.color={
	{  474,  303, 0x391f08},
	{  505,  305, 0x381e07},
	{  519,  308, 0x381e07},
	{  446,  423, 0xfef7d3},
}
page_login_entrance.player_direct_game.step="page_login_entrance.player_direct_game"
page_login_entrance.player_direct_game.logmsg="当前角色已在线，是否直接进入游戏，点击取消"


page_login_entrance.net_lost_window={}
page_login_entrance.net_lost_window.color={
	{  460,  291, 0x381e07},
	{  474,  293, 0x391f08},
	{  487,  291, 0x381e07},
	{  511,  291, 0x381e07},
	{  568,  422, 0xe4ab52},
}
page_login_entrance.net_lost_window.step="page_login_entrance.net_lost_window"
page_login_entrance.net_lost_window.logmsg="与服务器断开连接，请坚持网络(345)"


page_training={}

page_training.in_game_training={}
page_training.in_game_training.color={
	{  105,   43, 0xcd3334},
	{  101,   52, 0x33b2bd},
	{  207,   39, 0xcc3333},
	{  211,   54, 0x18a8b4},
}
page_training.in_game_training.step="page_login_entrance.in_game_training"
page_training.in_game_training.logmsg="角色进入游戏，开场训练"
page_training.in_game_training.foo= function () 
	--xxtmoveto(145,  551,190,  326,5)
	touch.tap(148,  489,2000)
	
	nLog("foo 函数开场训练 ")
	end

page_training.first_attack={}
page_training.first_attack.colors={
	{
	{  726,  539, 0xfcfcfc},
	{  746,  541, 0xffffff},
	{  815,  541, 0xffffff},
	{  866,  541, 0xf9f9f9},
},
	{
	{  758,  538, 0xf8f800},
	{  769,  537, 0xffff00},
	{  781,  540, 0xffff00},
	{  803,  540, 0xffff00},
},
{
	{  725,  539, 0xfcfcfc},
	{  758,  542, 0xf8f800},
	{  781,  543, 0xffff00},
}
}

page_training.first_attack.logmsg="点击攻击键使用普攻"

page_training.first_attack.foo = function() 
	for i=1,8 do
		ltap(1048,  542)
		nLog("foo 点击攻击键使用普攻 ")
		mrsleep(3000)
	end 
	
end

page_login_entrance.player_enter_game={}
page_login_entrance.player_enter_game.color={
	{  945,  582, 0xdead63},
	{  943,  597, 0xdea05b},
	{  967,  587, 0xefead0},
	{ 1000,  581, 0xdbaa62},
}
page_login_entrance.player_enter_game.logmsg="选定角色后点击进入游戏"
page_login_entrance.player_enter_game.end_flag=true
page_login_entrance.player_enter_game.foo= function()
	if VAR_LIST1.FIRST_ROLE =="READY" then
		ltap(121,  167)
		mmsleep(1500)
		ltap(998,  587)
		nLog('VAR_LIST1.FIRST_ROLE =="READY"')
	elseif VAR_LIST1.SECOND_ROLE =="READY" then
		ltap(118,  287)
		mmsleep(1500)
		ltap(998,  587)
		nLog('VAR_LIST1.SECOND_ROLE =="READY"')
	end
end
page_popup={}
page_popup.new_version_update={
			{  527,  192, 0xbcb09c},
			{  583,  194, 0x381e07},
			{  386,  274, 0x381e07},
			{  685,  423, 0xe3aa51},
		}
page_popup.tips_ok1={}		
page_popup.tips_ok1.color={
			{  548,  190, 0x381e07},
			{  582,  188, 0x391f08},
			{  543,  417, 0xeabf6c},
			{  571,  419, 0xfef7d4},
		}
page_popup.tips_ok1.logmsg="弹出提示信息"

page_popup.notice_ok1={}		
page_popup.notice_ok1.color = {
			{   74,  119, 0xe2bf77},
			{   77,  171, 0xc69953},
			{  544,  521, 0xe9bd6a},
			{  568,  526, 0xe4ab52},
		}
page_popup.notice_ok1.logmsg="公告，点击确定"		

--[[
if multi_col({
			{  527,  192, 0xbcb09c},
			{  583,  194, 0x381e07},
			{  386,  274, 0x381e07},
			{  685,  423, 0xe3aa51},
			}) then
		ltap(685,  423)
	elseif multi_col({
			{  548,  190, 0x381e07},
			{  582,  188, 0x391f08},
			{  543,  417, 0xeabf6c},
			{  571,  419, 0xfef7d4},
			}) then
		ltap(571,  419)
		wwlog("214 提示，点击确定")
		write_object_to_file("214 提示，点击确定", XXT_PHONE_PATH.."test2.txt")

	elseif multi_col({
			{   74,  119, 0xe2bf77},
			{   77,  171, 0xc69953},
			{  544,  521, 0xe9bd6a},
			{  568,  526, 0xe4ab52},
			}) then
		ltap(568,  526)
		wwlog("214 系统公告")
		write_object_to_file("214 系统公告", XXT_PHONE_PATH.."test2.txt")
	elseif multi_col({
	{  659,  501, 0x007aff},
	{  658,  469, 0x007aff},
	{  667,  435, 0x007aff},
	{  670,  403, 0x007aff},
}) then
		ltap(670,  403)
		wwlog("214 微信-不再提示")
	end
--]]