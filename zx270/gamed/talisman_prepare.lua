-- Mcncc.com 出品
talisman_tab = {};

function AddTalismanItem(id, init, levelup, reset)
	talisman_tab[id] = {};
	talisman_tab[id].Init = init;
	talisman_tab[id].LevelUp = levelup;
	talisman_tab[id].Reset = reset;
end

--	talisman对象接口分成三部分，分别如下：
--	A:获取基本数据
--	QueryLevel()		得到法宝级别
--	QueryExp()		得到法宝当前经验

--	B:获取和设置参数 
--	  所谓参数，就是脚本定义的数据， 参数都是float类型，以index/value形式保存和定义
--        法宝的初始数值成长率等都以参数的方式存在。 参数区占用的空间和GetDataCount()的返回值
--	  成正比。所以不要随意给很大的index索引，这样会占用大量的内存和数据库空间。
--	QueryData(index)	获取制定索引的参数 如果该索引无对应参数，则返回0.0
--	GetDataCount()		返回当前所有的参数数目 这个值就是最大的有效index+1
--	UpdateData(index, value)更新一个参数，如果index不存在，则增加一个条目 value必须是一个数值
--	ClearData()		清除所有存在的参数

-- Mcncc.com 出品

--	C:设置法宝属性
--	  法宝属性是法宝真正的效果作用， 法宝属性应该从参数计算得到,法宝属性都是整数,不能使用浮点数.
--	  注意每次设置前,法宝所有的属性包括附加属性都会被清空,所以每次设置都应设置全部属性
--	SetStamina(value)	设置法宝最大的精力值
--	SetQuality(value)	设置法宝的品阶, 供客户端显示使用
--	SetHP(value)		设置法宝增加的血量
--	SetMP(value)		设置法宝增加的真气
--	SetAttackRate(value)	设置法宝增加的命中
--	SetDamage(low,high)	设置法宝增加的攻击力
--	SetDodge(value)		设置法宝增加的闪躲
--	SetDefense(value)	设置法宝增加的防御
--	SetResistance(index,value) 设置法宝增加的抗性
--	SetAddon(addon)		设置法宝的附加属性, 每次设置都会增加一个附加属性 addon是模板中的附加属性模板ID

----------------------------------------------亲爱的于2010年2月10日修改---------------------------------------------------
--	法宝融合函数说明
--	CombineTalismans(id1,id2, talisman1,talisman2,cid,output)
--	id1 id2 为需要融合的两件法宝的 id
--	talisman1 talisman2 为需要融合的两件法宝的对象 这两个对象同init reset levelup三个调用传入的talisman
--	cid 为融合调整道具的id
--	output 为产出控制对象， 此对象可以调用CreateItem接口

--	output产出控制对象接口如下
--	CreateItem(id)		表明要创建一个新物品，如果不调用此接口， 则无产出物品;
--				创建使用此接口创建一个法宝物品之后，则可以开始使用
--				talisman对象的所有其他接口， 如QueryData UpdateData Set...系列接�
--				如果没有创建物品或者创建了非法宝物品，则也不应调用output对象的其他接口。

xdofile("script/talisman.lua");
xdofile("script/talisman_addon.lua");
xdofile("script/talisman_combine.lua");

