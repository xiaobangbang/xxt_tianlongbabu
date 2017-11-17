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
	{  491,  547, 0xf0f5f6},
	{  475,  540, 0x81e70c},
	{  510,  538, 0x8cae65},
	{  676,  540, 0x8cad64},
},
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
page_login_entrance.enter_game.colors={ {
	{  509,  538, 0xdead64},
	{  535,  542, 0xf1f5de},
	{  565,  539, 0xd9a762},
	{  609,  538, 0xf7f7f3},
},
{
	{  504,  531, 0xdeab66},
	{  546,  537, 0xdcab65},
	{  576,  535, 0xfdfbf7},
	{  603,  535, 0xfaf9f4},
}}
page_login_entrance.enter_game.logmsg="进入游戏"


page_login_entrance.create_player={}
page_login_entrance.create_player.colors={{
	{  947,  582, 0xdead64},
	{  946,  603, 0xdea05b},
	{  994,  582, 0xf7f7ef},
	{ 1021,  588, 0xefedcc},
},
{
	{  948,  585, 0xdca963},
	{  948,  593, 0xde9f5b},
	{  969,  584, 0xfcfaf0},
	{  993,  586, 0xf5f2e3},
	{ 1021,  587, 0xf4edd2},
}}
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
--[[
page_training.in_game_training.color={
	{  105,   43, 0xcd3334},
	{  101,   52, 0x33b2bd},
	{  207,   39, 0xcc3333},
	{  211,   54, 0x18a8b4},
}
--]]
page_training.in_game_training.colors={
	{
	{    9,   75, 0xffffff},
	{   17,   78, 0xfdfdfc},
	{  111,   42, 0xcb3131},
	{  116,   56, 0x18a5bd},
},
	{
	{    9,   75, 0xffffff},
	{   17,   74, 0xfdfdfc},
	{  126,   44, 0xce3333},
	{  125,   55, 0x12a0b2},
},
{
	{    9,   75, 0xffffff},
	{   19,   72, 0xf8f8f7},
	{  112,   44, 0xcd3233},
	{  102,   55, 0x18a8af},
}}
page_training.in_game_training.step="page_training.in_game_training"
page_training.in_game_training.logmsg="角色进入游戏，开场训练,移动到第一个光圈"
page_training.in_game_training.foo= function () 
	--xxtmoveto(145,  551,190,  326,5)
	touch.tap(148,  489,2000)	
	nLog("foo 函数开场训练 ")
	end

page_training.skip_scene={}
page_training.skip_scene.colors={{
	{ 1099,   15, 0xfce4b3},
	{ 1114,   15, 0xfce4b3},
	{ 1103,   15, 0xfce4b3},
	{ 1120,   16, 0xfbe2ad},
},
{
	{ 1068,   41, 0xe6d093},
	{ 1070,   47, 0xb39c68},
	{ 1089,   40, 0xd4bc7f},
	{ 1089,   52, 0xd7bb7a},
}}
page_training.skip_scene.step="page_training.skip_scene"
page_training.skip_scene.logmsg="跳过动画"


page_training.skill_attack={}
page_training.skill_attack.colors={{
	{  785,  342, 0xffff00},
	{  804,  343, 0xfcfd01},
	{  831,  343, 0xfdfd01},
	{  848,  346, 0xffffff},
},
{
	{  773,  341, 0xf8f8f8},
	{  785,  343, 0xffff00},
	{  803,  343, 0xfcfc00},
	{  832,  348, 0xffff00},
}}
page_training.skill_attack.foo=function() 
	ltap(1001,  436)
	mrsleep(3000)
	ltap(1092,  435)
	mrsleep(3000)
	ltap(942,  501)
	mrsleep(3000)
	ltap(943,  594)
	mrsleep(3000)
	
	for i=1,8 do
		ltap(1045,  540)
		mrsleep(3000)
	end
		
	end
page_training.skill_attack.step="page_training.skill_attack"
page_training.skill_attack.logmsg="点击技能键释放技能"



page_training.fetch_artifact={}
page_training.fetch_artifact.color={
	{  527,  565, 0xebc16b},
	{  527,  573, 0xe2a74f},
	{  550,  568, 0xfdf6d3},
	{  561,  569, 0xfdf5d2},
}

page_training.fetch_artifact.step="page_training.fetch_artifact"
page_training.fetch_artifact.logmsg="领取神器，对抗丁春秋"
page_training.fetch_artifact.end_flag = true
page_training.fetch_artifact.foo=function() 
	ltap( 561,  569)
	mrsleep(3000)
	ltap( 1094,  436)
	mrsleep(3000)
	ltap( 1001,  442)
	
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
	for i=1,5 do
		ltap(1048,  542)
		nLog("foo 点击攻击键使用普攻 ")
		mrsleep(4000)
	end 
	
end

page_login_entrance.player_enter_game={}
page_login_entrance.player_enter_game.colors={{
	{  945,  582, 0xdead63},
	{  943,  597, 0xdea05b},
	{  967,  587, 0xefead0},
	{ 1000,  581, 0xdbaa62},
},
{
	{  966,  587, 0xf6eed7},
	{  999,  582, 0xdbab65},
	{ 1012,  581, 0xfdfbf7},
	{ 1036,  580, 0xedece4},
	{ 1064,  590, 0xdea15c},
}}
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
page_popup.notice_ok1.colors = {
	{
			{   74,  119, 0xe2bf77},
			{   77,  171, 0xc69953},
			{  544,  521, 0xe9bd6a},
			{  568,  526, 0xe4ab52},
		},
		{
	{   71,  121, 0xe2b977},
	{   78,  170, 0xc69b55},
	{  541,  521, 0xecbf6b},
	{  564,  525, 0xfcf4d1},
}
	}
page_popup.notice_ok1.logmsg="公告，点击确定"		



page_popup.close_window1={}		
page_popup.close_window1.color = {
	{ 1062,   51, 0xfef7b3},
	{ 1073,   50, 0xfef7b3},
	{ 1062,   64, 0xfef7b3},
	{ 1079,   58, 0x542210},
	{ 1067,   57, 0xfef7b3},
}
page_popup.close_window1.logmsg="活动窗口，点击关闭"



page_popup.use_money={}		
page_popup.use_money.colors={
	{
	{  776,  457, 0xfef7d3},
	{  776,  464, 0xfef7d3},
	{  784,  454, 0xfaf2ce},
	{  803,  456, 0xfef7d4},
},
	{
	{  776,  456, 0xfff8d5},
	{  780,  456, 0xfef7d3},
	{  798,  449, 0xfff8d5},
	{  807,  454, 0xfff8d5},
},
	{
	{  763,  447, 0xf0cc73},
	{  767,  459, 0xe4a84f},
	{  776,  457, 0xfff8d5},
	{  780,  456, 0xfff8d5},
	{  801,  449, 0xfff8d5},
},
	{
	{  769,  448, 0xefc873},
	{  767,  462, 0xe0a34c},
	{  776,  459, 0xfef7d3},
	{  796,  454, 0xfff8d5},
	{  808,  459, 0xfff8d5},
}}
page_popup.use_money.logmsg="使用铜钱"	


page_popup.use={}
page_popup.use.color={
	{  776,  456, 0xfff8d5},
	{  776,  463, 0xfff8d5},
	{  796,  453, 0xfff8d5},
	{  803,  458, 0xfff8d5},
}
page_popup.use_money.logmsg="使用"	


page_popup.first_scene={}		
page_popup.first_scene.color = {
	{  232,   33, 0x000000},
	{  509,   52, 0x000000},
	{  890,   48, 0x000000},
}
page_popup.first_scene.logmsg="跳过开场动画"	


page_popup.no_push_notice={}		
page_popup.no_push_notice.color = {
	{  392,  429, 0x007aff},
	{  429,  437, 0x007aff},
	{  472,  431, 0x007aff},
	{  433,  434, 0xd0cdcc},
	{  436,  445, 0x007aff},
}
page_popup.no_push_notice.logmsg="推送通知，不允许"	


page_popup.new_version_update={}
page_popup.new_version_update.color = {
	{  548,  190, 0x381e07},
	{  583,  197, 0x381e07},
	{  658,  414, 0xedc56f},
	{  678,  421, 0xfff8d5},
}

--{{  595,  560, 0xe5a32d},{  670,  584, 0xe39722},{  621,  576, 0xfefefe},{  652,  572, 0xffffff},}
page_popup.new_version_update.logmsg="版本更新"

page_popup.put_on={}		
page_popup.put_on.color = {
	{  766,  447, 0xf0cc74},
	{  763,  465, 0xde9f49},
	{  785,  454, 0xfef7d3},
	{  799,  461, 0xfef6d3},
}
page_popup.put_on.logmsg="装备"	

page_popup.net_retry={}		
page_popup.net_retry.colors = {
	{
	{  671,  418, 0xfef7d3},
	{  678,  418, 0xfef7d3},
	{  679,  426, 0xfcf4d0},
	{  696,  416, 0xfef7d3},
},
	{
	{  662,  418, 0xebbd67},
	{  662,  422, 0xe2a952},
	{  675,  420, 0xfef7d3},
	{  688,  420, 0xfef7d4},
	{  695,  420, 0xfdf5d2},
}}
page_popup.net_retry.logmsg="网络不稳，重试"	


page_popup.close_pop_window1={}		
page_popup.close_pop_window1.color ={
	{  941,  237, 0xd0bea5},
	{  949,  238, 0xd0bea7},
	{  941,  245, 0xead1b6},
	{  946,  243, 0xe5cfb2},
}
page_popup.close_pop_window1.logmsg="关闭异常弹窗"	



page_main={}
page_main.main_task_guide={}
page_main.main_task_guide.colors={
	{
	{  390,  246, 0xf6f6f6},
	{  399,  245, 0xe7e802},
	{  403,  245, 0xe1e302},
	{  441,  247, 0xebeceb},
},{
	{  390,  247, 0xf5f6f6},
	{  399,  249, 0xbcc007},
	{  407,  247, 0xb1b607},
	{  427,  245, 0xced205},
}}
page_main.main_task_guide.click_xy={124,  244}
page_main.main_task_guide.step="page_main.main_task_guide"
page_main.main_task_guide.logmsg="第一次追踪主任务"

page_main.main_task_chain={}
page_main.main_task_chain.colors={
	{
	{  390,  222, 0xfcfbfb},
	{  406,  222, 0xdddd06},
	{  407,  225, 0xecec03},
	{  426,  222, 0xdcdd04},
},
	{	
	{  390,  246, 0xf6f6f6},
	{  399,  245, 0xe7e802},
	{  403,  245, 0xe1e302},
	{  441,  247, 0xebeceb},
}}
page_main.main_task_chain.click_xy={124,  244}
page_main.main_task_chain.step="page_main.main_task_chain"
page_main.main_task_chain.logmsg="追踪主任务"

page_main.main_task_completed={}
page_main.main_task_completed.color={
	{  112,  265, 0x07e804},
	{  116,  268, 0x00ff00},
	{  127,  266, 0x00ff00},
	{   15,  224, 0x00ff00},
	{   24,  229, 0x00ff00},
}
--page_main.main_task_completed.click_xy={124,  244}
page_main.main_task_completed.step="page_main.main_task_completed"
page_main.main_task_completed.logmsg="点击主线-完成"


page_main.task_completed_guide={}
page_main.task_completed_guide.color={
	{  587,  450, 0xffffff},
	{  602,  448, 0xffff00},
	{  621,  446, 0xffff00},
	{  642,  450, 0xffffff},
}
page_main.task_completed_guide.step="page_main.task_completed_guide"
page_main.task_completed_guide.logmsg="第一次完成任务"
page_main.task_completed_guide.click_xy={866,  454}

page_main.task_completed={}
page_main.task_completed.colors={{
	{  822,  446, 0xa5b35e},
	{  883,  454, 0xfff8d5},
	{  838,  451, 0xfdf6d3},
	{  854,  453, 0xfef7d3},
	{  885,  450, 0x99a95b},
},
{
	{  833,  447, 0xfdf6d3},
	{  839,  455, 0xfdf6d3},
	{  857,  448, 0xf7f0cc},
	{  883,  454, 0xfff8d5},
	{  856,  446, 0xa6b35d},
},
{
	{  834,  447, 0xfff8d5},
	{  836,  451, 0xfdf6d3},
	{  854,  448, 0xf7f0cc},
	{  878,  454, 0xfff8d5},
	{  885,  450, 0x9aaa5a},
}
}
page_main.task_completed.step="page_main.task_completed"
page_main.task_completed.logmsg="完成任务"

page_main.backgroud={}
page_main.backgroud.colors={{
	{  127,   43, 0xce3535},
	{  107,   55, 0x12a1af},
	{ 1121,   11, 0xf7e0a9},
	{ 1116,   16, 0xf7e2ad},
	{ 1112,   14, 0x635231},
},
{
	{  101,   42, 0xce3931},
	{  105,   55, 0x18a9b0},
	{  999,  127, 0xd8b98e},
	{ 1007,  127, 0xdac190},
	{ 1015,  127, 0xd8c190},
}}
page_main.backgroud.logmsg="主界面背景，定时监控右上角，看是否移动"
page_main.backgroud.foo= function() 
		ltap(66,  246) --点击主线任务
		nLog("点击主线任务")
		--mrsleep(3000)
	end

page_main.accept_task={}
page_main.accept_task.colors={{
	{  831,  450, 0xfdf6d3},
	{  836,  455, 0xfdf6d3},
	{  854,  451, 0xfdf7d3},
	{  893,  456, 0xfef7d3},
	{  868,  445, 0xa7b55f},
},
{
	{  830,  449, 0xf0ebc6},
	{  842,  447, 0xfef7d4},
	{  855,  451, 0xfef7d3},
	{  881,  454, 0xfff8d5},
	{  866,  458, 0x7d9249},
}}
page_main.accept_task.step="page_main.accept_task"
page_main.accept_task.logmsg="接受任务"


page_main.arti_fact_piece_guide={}
page_main.arti_fact_piece_guide.colors={{
	{   68,  151, 0xd2a960},
	{   71,  190, 0xdfb673},
	{  480,  372, 0xeeee01},
	{  488,  372, 0xfafa00},
},
{
	{  453,  368, 0xf8f8f8},
	{  471,  372, 0xcece02},
	{  493,  370, 0xe2e201},
	{  545,  373, 0xd5d5d5},
}}
page_main.arti_fact_piece_guide.step="page_main.arti_fact_piece_guide"
page_main.arti_fact_piece_guide.logmsg="领取神器碎片"
page_main.arti_fact_piece_guide.click_xy={463,  500}


page_main.arti_fact_preview_guide={}
page_main.arti_fact_preview_guide.colors={{
	{   62,  154, 0xd1a15d},
	{  146,  397, 0xfcfcfc},
	{  153,  397, 0xfefe00},
	{  176,  397, 0xf5f501},
},
{
	{  141,  395, 0xf9f9f9},
	{  153,  399, 0xfefe00},
	{  163,  394, 0xfbfb00},
	{  178,  397, 0xf5f501},
}}
page_main.arti_fact_preview_guide.step="page_main.arti_fact_preview_guide"
page_main.arti_fact_preview_guide.logmsg="预览神器"
page_main.arti_fact_preview_guide.click_xy={167,  497}

page_main.arti_fact_preview_close_guide={}
page_main.arti_fact_preview_close_guide.color={
	{  726,  177, 0xffff00},
	{  708,  175, 0xfefefe},
	{  737,  175, 0xf4f402},
	{  765,  171, 0xf4f4f3},
}
page_main.arti_fact_preview_close_guide.step="page_main.arti_fact_preview_close_guide"
page_main.arti_fact_preview_close_guide.logmsg="关闭预览神器界面"
page_main.arti_fact_preview_close_guide.click_xy={934,  101}

page_main.arti_fact_close_guide={}
page_main.arti_fact_close_guide.color={
	{  826,  176, 0xfdfdfd},
	{  839,  174, 0xf4f401},
	{  855,  175, 0xf2f201},
	{  897,  167, 0xf7f7f7},
}
page_main.arti_fact_close_guide.step="page_main.arti_fact_close_guide"
page_main.arti_fact_close_guide.logmsg="关闭神器预开启界面"
page_main.arti_fact_close_guide.click_xy={1062,  110}


page_main.picture_move={}
page_main.picture_move.color={
	{  461,   80, 0xc7a367},
	{  551,   86, 0xdab884},
	{  681,   87, 0xc69b61},
	{  728,  233, 0xd9af6e},
	{  402,  494, 0xcaaa68},
}
page_main.picture_move.logmsg="画像，拼接完整"
page_main.picture_move.foo = function()
	mrsleep(2000)
	xxtmoveto(215,  184,572,  185,1)
	mrsleep(2000)
	xxtmoveto( 218,  440,520,  462,1)
	mrsleep(2000)
	xxtmoveto(909,  314,631,  279,1)

	end


page_main.picture_onemore={}
page_main.picture_onemore.color={
	{  477,  341, 0xa0af5d},
	{  491,  347, 0xfff8d5},
	{  519,  342, 0xfef7d3},
	{  541,  346, 0xfef7d4},
}
page_main.picture_onemore.logmsg="画像，再试一次"


page_main.menu_guide={}
page_main.menu_guide.color={
	{  871,  264, 0xfcfcfc},
	{  884,  264, 0xfbfb01},
	{  893,  262, 0xefef00},
	{  910,  262, 0xf9f900},
}
page_main.menu_guide.click_xy={1094,  350}
page_main.menu_guide.logmsg="打开功能菜单"

page_main.skill_menu_guide={}
page_main.skill_menu_guide.color={
	{  836,  439, 0xfefefd},
	{  849,  438, 0xfdfd00},
	{  858,  441, 0xfefe00},
	{  875,  439, 0xfefe00},
}
page_main.skill_menu_guide.click_xy={1089,  438}
page_main.skill_menu_guide.logmsg="打开技能界面"

page_main.auto_fighting_guide={}
page_main.auto_fighting_guide.color={
	{  569,  420, 0xffffff},
	{  584,  422, 0xfefe00},
	{  602,  417, 0xfcfc00},
	{  606,  425, 0xfdfd00},
}
page_main.auto_fighting_guide.click_xy={788,  523}
page_main.auto_fighting_guide.logmsg="打开自动挂机"

page_main.adopt_pet={}
page_main.adopt_pet.color={
	{  700,  503, 0xedc66f},
	{  704,  515, 0xe2a44c},
	{  718,  509, 0xfef7d3},
	{  730,  507, 0xfff8d5},
	{  736,  511, 0xfdf5d2},
}
page_main.adopt_pet.logmsg="领取宠物"

page_main.pet_menu={}
page_main.pet_menu.color={
	{  189,  124, 0xfaf9f8},
	{  202,  126, 0xfcfc00},
	{  211,  127, 0xfefe00},
	{  225,  127, 0xfdfd00},
}
page_main.pet_menu.click_xy={36,  127}
page_main.pet_menu.logmsg="宠物menu"

page_main.pet_menu_close_guide={}
page_main.pet_menu_close_guide.colors={
	{
	{  872,  147, 0xfefdfd},
	{  889,  150, 0xfdfd00},
	{  901,  151, 0xf4f201},
	{  901,  156, 0xf3f201},
},{
	{  876,  149, 0xf4f2f2},
	{  885,  150, 0xf6f300},
	{  901,  148, 0xf4f201},
	{  914,  149, 0xdad202},
}}
page_main.pet_menu_close_guide.click_xy={1082,   64}
page_main.pet_menu_close_guide.logmsg="关闭宠物界面"


page_main.choose_pet={}
page_main.choose_pet.color={
	{  491,  346, 0xfdf6d3},
	{  511,  345, 0xfcf5d2},
	{  532,  346, 0xfff8d5},
	{  557,  348, 0xfcf6d2},
}
page_main.choose_pet.logmsg="选择宠物"


page_main.big_skill={}
page_main.big_skill.color={
	{  705,  329, 0xf9f9f8},
	{  686,  329, 0xfdfdfc},
	{  724,  333, 0xf9f900},
	{  735,  329, 0xffff00},
}
page_main.big_skill.click_xy={925,  420}
page_main.big_skill.logmsg="释放绝世神功"

page_main.skill_upgrade_guide={}
page_main.skill_upgrade_guide.color={
	{  888,  468, 0xffffff},
	{  902,  470, 0xffff00},
	{  912,  470, 0xffff00},
	{  919,  472, 0xffff00},
}
page_main.skill_upgrade_guide.click_xy={919,  565}
page_main.skill_upgrade_guide.logmsg="升级技能"

page_main.skill_menu_close_guide={}
page_main.skill_menu_close_guide.color={
	{  872,  148, 0xfefefe},
	{  887,  150, 0xf5f502},
	{  901,  150, 0xf4f402},
	{  937,  150, 0xf1f0f0},
}
page_main.skill_menu_close_guide.click_xy={1082,   67}
page_main.skill_menu_close_guide.logmsg="关闭界面"

page_main.close_func_menu_guide={}
page_main.close_func_menu_guide.color={
	{  871,  260, 0xfdfdfd},
	{  886,  262, 0xe8e704},
	{  900,  262, 0xf6f700},
	{  979,  262, 0xfdfdfd},
}
page_main.close_func_menu_guide.click_xy={1094,  350}
page_main.close_func_menu_guide.logmsg="关闭功能菜单"


page_main.pet_go_fighting_guide={}
page_main.pet_go_fighting_guide.color={
	{  948,  446, 0xffff00},
	{  935,  449, 0xffffff},
	{  952,  456, 0xfdfd00},
	{  968,  455, 0xfdfd00},
}
page_main.pet_go_fighting_guide.click_xy={960,  558}
page_main.pet_go_fighting_guide.logmsg="点击出战珍兽"

page_main.adopt_horse={}
page_main.adopt_horse.color={
	{  351,  540, 0xfef6d3},
	{  358,  540, 0xfef7d3},
	{  365,  540, 0xfdf6d3},
	{  376,  539, 0xfdf5d2},
}
page_main.adopt_horse.logmsg="领取坐骑-黑玫瑰"

page_main.black_horse_active={}
page_main.black_horse_active.color={
	{  779,  452, 0xfef7d3},
	{  782,  458, 0xfef7d4},
	{  800,  454, 0xfef7d4},
	{  810,  462, 0xfef7d4},
}
page_main.black_horse_active.logmsg="黑玫瑰-激活"


page_main.exam_activity={}
page_main.exam_activity.color={
	{  442,  453, 0xb1a48e},
	{  872,  463, 0xb4a692},
	{  283,  434, 0xb1a38e},
	{  399,  266, 0xb1a58e},
	{  439,  239, 0xa1917e},
}
page_main.exam_activity.logmsg="科举考试5道题"

page_main.shop_buy_pos7={}
page_main.shop_buy_pos7.color={
	{  476,  449, 0xfdf5d2},
	{  479,  454, 0xfef6d3},
	{  495,  455, 0xfef7d3},
	{  504,  445, 0xfef7d3},
}
page_main.shop_buy_pos7.logmsg="商店购买净*砂"


page_main.buy_ok={}
page_main.buy_ok.color={
	{  551,  413, 0xfdf5d2},
	{  554,  422, 0xf9f0cb},
	{  560,  421, 0xfdf6d3},
	{  577,  419, 0xfef7d4},
}
page_main.buy_ok.logmsg="确定"

page_main.shenmifensha={}
page_main.shenmifensha.color={
	{  490,  342, 0xfef7d4},
	{  496,  347, 0xfdf6d3},
	{  504,  341, 0xfdf6d3},
	{  519,  343, 0xfef7d3},
}
page_main.shenmifensha.logmsg="神秘砂粉"

page_main.submit_task_needed={}
page_main.submit_task_needed.color={
	{  551,  489, 0xfdf6d3},
	{  556,  486, 0xfdf6d3},
	{  572,  485, 0xfff8d5},
	{  583,  485, 0xfff8d5},
}
page_main.submit_task_needed.logmsg="提交"

page_main.letter_deal_button={}
page_main.letter_deal_button.color={
	{  491,  344, 0xfef7d3},
	{  499,  350, 0xfdf6d3},
	{  511,  344, 0xfdf6d3},
	{  517,  346, 0xfdf6d3},
}
page_main.letter_deal_button.logmsg="擦拭信件"
