local color = minetest.colorize

local hypertext = minetest.formspec_escape([[
	<global halign=justify valign=center background=#CCF color=#444 actioncolor=darkblue margin=10>
	<center><bigger>Furnace</bigger></center>
	<style color=black>Furnaces</style> are <action name="crafting">crafted</action> and used by the player for the purpose of cooking food and <action name="smelting">smelting</action> various items.
	<item name=default:furnace float=right width=128 rotate=yes>
	<style color=black>Type:</style> Solid block
	<style color=black>Drops:</style> Itself
	<style color=black>Physics:</style> No
	<style color=black>Luminance:</style> Inactive:No Active:Yes (8)
	<style color=black>Flammable:</style> No
	<style color=black>Generated:</style> No
	<style color=black>Renewable:</style> Yes
	<style color=black>Stackable:</style> Yes (99)
	<style color=black>Itemstring:</style> default:furnace default:furnace_active
	<big>Usage</big>
	The furnace menu can be accessed by <action name="using">using</action> the furnace.
	The furnace has 3 <action name="inventory">inventories</action>: An input slot, a fuel slot and 4 output slots. The fire in the furnace will automatically start when there is a smeltable item in the input slot and a fuel in the fuel slot.
	As long as the fire is on, the furnace will smelt any smeltable item in the input slot, one by one, until it is empty. When the fire goes off, it will smelt the next item until there are no smeltable items and no fuel items left.
	The current stage of cooking can be seen by <action name="pointing">pointing</action> the furnace or by viewing the furnace menu. In the furnace menu, the flame symbol roughly shows the remaining burning time. The arrow symbol shows the progress of the current smelting process.
	<big>Renewing</big>
	Furnaces can be crafted from e.g. <action name="default:cobblestone">cobblestone</action>, a renewable resource.
	<big>Crafting</big>
	Sorry no way to display crafting yet in formspec pages.
	<big>Fuel</big>
	See <action name="smelting">Smelting</action> for a list of furnace fuels.
	<big>Recipes</big>
	See the <action name="smelting">Smelting</action> page.
]])


local clip_fs = [[
	style_type[label,button,image_button,item_image_button,
			tabheader,scrollbar,table,animated_image
			,field,textarea,checkbox,dropdown;noclip=%c]

	label[0,0;A clipping test]
	button[0,1;3,0.8;x;A clipping test]
	image_button[0,2;3,0.8;bubble.png;x2;A clipping test]
	item_image_button[0,3;3,0.8;default:sword_steel;x3;A clipping test]
	tabheader[0,4.7;3,0.63;x4;Clip,Test,Text,Tabs;1;false;false]
	field[0,5;3,0.8;x5;Title;]
	textarea[0,6;3,1;x6;Title;]
	checkbox[0,7.5;x7;This is a test;true]
	dropdown[0,8;3,0.8;x8;Select An Item,One,Two,Three,Four,Five;1]
	scrollbar[0,9;3,0.8;horizontal;x9;3]
	tablecolumns[text;text]
	table[0,10;3,1;x10;one,two,three,four;1]
	animated_image[-0.5,11;4.5,1;;test_animation.png;4;100]
]]


local style_fs = [[
	style[one_btn1;bgcolor=red;textcolor=yellow;bgcolor_hovered=orange;
		bgcolor_pressed=purple]
	button[0,0;2.5,0.8;one_btn1;Button]

	style[one_btn2;border=false;textcolor=cyan] ]]..
	"button[0,1.05;2.5,0.8;one_btn2;Text " .. color("#FF0", "Yellow") .. [[]

	style[one_btn3;bgimg=bubble.png;bgimg_hovered=default_apple.png;
		bgimg_pressed=heart.png]
	button[0,2.1;1,1;one_btn3;Bor]

	style[one_btn4;bgimg=bubble.png;bgimg_hovered=default_apple.png;
		bgimg_pressed=heart.png;border=false]
	button[1.25,2.1;1,1;one_btn4;Bub]

	style[one_btn5;bgimg=bubble.png;bgimg_hovered=default_apple.png;
		bgimg_pressed=heart.png;border=false;alpha=false]
	button[0,3.35;1,1;one_btn5;Alph]

	style[one_btn6;border=true]
	image_button[0,4.6;1,1;bubble.png;one_btn6;Border]

	style[one_btn7;border=false]
	image_button[1.25,4.6;1,1;bubble.png;one_btn7;NoBor]

	style[one_btn8;border=false]
	image_button[0,5.85;1,1;bubble.png;one_btn8;Border;false;true;heart.png]

	style[one_btn9;border=true]
	image_button[1.25,5.85;1,1;bubble.png;one_btn9;NoBor;false;false;heart.png]

	style[one_btn10;alpha=false]
	image_button[0,7.1;1,1;bubble.png;one_btn10;NoAlpha]

	style[one_btn11;alpha=true]
	image_button[1.25,7.1;1,1;bubble.png;one_btn11;Alpha]

	style[one_btn12;border=true]
	item_image_button[0,8.35;1,1;default:sword_steel;one_btn12;Border]

	style[one_btn13;border=false]
	item_image_button[1.25,8.35;1,1;default:sword_steel;one_btn13;NoBor]

	style[one_btn14;border=false;bgimg=test_bg.png;fgimg=bubble.png]
	style[one_btn14:hovered;bgimg=test_bg_hovered.png;fgimg=default_apple.png;textcolor=red]
	style[one_btn14:pressed;bgimg=test_bg_pressed.png;fgimg=heart.png;textcolor=green]
	style[one_btn14:hovered+pressed;textcolor=blue]
	image_button[0,9.6;1,1;bubble.png;one_btn14;Bg]

	style[one_btn15;border=false;bgimg=test_bg.png;bgimg_hovered=test_bg_hovered.png;bgimg_pressed=test_bg_pressed.png]
	item_image_button[1.25,9.6;1,1;default:sword_steel;one_btn15;Bg]

	style[one_btn16;border=false;bgimg=test_bg_9slice.png;bgimg_hovered=test_bg_9slice_hovered.png;bgimg_pressed=test_bg_9slice_pressed.png;bgimg_middle=4,6]
	button[2.5,9.6;2,1;one_btn16;9-Slice Bg]



	container[2.75,0]

	style[one_tb1;textcolor=Yellow]
	tabheader[0,3;2.5,0.63;one_tb1;Yellow,Text,Tabs;1;false;false]

	style[one_f1;textcolor=yellow]
	field[0,4.25;2.5,0.8;one_f1;Field One;Yellow Text]

	style[one_f2;border=false;textcolor=cyan]
	field[0,5.75;2.5,0.8;one_f2;Field Two;Borderless Cyan Text]

	style[one_f3;textcolor=yellow]
	textarea[0,7.025;2.5,0.8;one_f3;Label;]] ..
		minetest.formspec_escape("Yellow Text\nLine two") .. [[ ]

	style[one_f4;border=false;textcolor=cyan]
	textarea[0,8.324999999999999;2.5,0.8;one_f4;Label;]] ..
		minetest.formspec_escape("Borderless Cyan Text\nLine two") .. [[ ]

	container_end[]
]]

--style_type[label;textcolor=green]
--label[0,0;Green]
--style_type[label;textcolor=blue]
--label[0,1;Blue]
--style_type[label;textcolor=;border=true]
--label[1.2,0;Border]
--style_type[label;border=true;bgcolor=red]
--label[1.2,1;Background]
--style_type[label;border=;bgcolor=]
--label[0.75,2;Reset]


local pages = {
	[[
		formspec_version[3]
		size[12,12]
		image_button[0,0;1,1;logo.png;;1x1]
		image_button[1,0;2,2;logo.png;;2x2]
		button[0,2;1,1;;1x1]
		button[1,2;2,2;;2x2]
		item_image[0,4;1,1;air]
		item_image[1,4;2,2;air]
		item_image_button[0,6;1,1;test:node;;1x1]
		item_image_button[1,6;2,2;test:node;;2x2]
		field[3,.5;3,.5;name;Field;text]
		pwdfield[6,.5;3,1;name;Password Field]
		field[3,1;3,1;;Read-Only Field;text]
		textarea[3,2;3,.5;name;Textarea;text]
		textarea[6,2;3,2;name;Textarea;text\nmore text]
		textarea[3,3;3,1;;Read-Only Textarea;text\nmore text]
		textlist[3,4;3,2;name;Textlist,Perfect Coordinates;1;false]
		tableoptions[highlight=#ABCDEF75;background=#00000055;border=false]
		table[6,4;3,2;name;Table,Cool Stuff,Foo,Bar;2]
		dropdown[3,6;3,1;name;This,is,a,dropdown;1]
		dropdown[6,6;3,2;name;I,am,a,bigger,dropdown;5]
		image[0,8;3,2;ignore.png]
		box[3,7;3,1;#00A3FF]
		checkbox[3,8;name;Check me!;false]
		checkbox[3,9;name;Uncheck me now!;true]
		scrollbar[0,11.5;11.5,.5;horizontal;name;500]
		scrollbar[11.5,0;.5,11.5;vertical;name;0]
		list[current_player;main;6,8;3,2;1]
		button[9,0;2.5,1;name;]
		button[9,1;2.5,1;name;]
		button[9,2;2.5,1;name;] ]]..
		"label[9,0.5;This is a label.\nLine\nLine\nLine\nEnd]"..
		[[button[9,3;1,1;name;]
		vertlabel[9,4;VERT]
		label[10,3;HORIZ]
		tabheader[6.5,0;6,0.65;name;Tab 1,Tab 2,Tab 3,Secrets;1;false;false]
	]],

		"formspec_version[3]size[12,12]" ..
		("label[0.375,0.375;Styled - %s %s]"):format(
			color("#F00", "red text"),
			color("#77FF00CC", "green text")) ..
		"label[6.375,0.375;Unstyled]" ..
		"box[0,0.75;12,0.1;#999]" ..
		"box[6,0.85;0.1,11.15;#999]" ..
		"container[0.375,1.225]" ..
		style_fs ..
		"container_end[]container[6.375,1.225]" ..
		style_fs:gsub("one_", "two_"):gsub("style%[[^%]]+%]", ""):gsub("style_type%[[^%]]+%]", "") ..
		"container_end[]",

		"formspec_version[3]size[12,13]" ..
		"label[0.1,0.5;Clip]" ..
		"container[-2.5,1]" .. clip_fs:gsub("%%c", "false") .. "container_end[]" ..
		"label[11,0.5;Noclip]" ..
		"container[11.5,1]" .. clip_fs:gsub("%%c", "true") .. "container_end[]",

		[[
			formspec_version[3]
			size[12,12]
			animated_image[0.5,0.5;1,1;;test_animation.png;4;100]
			animated_image[0.5,1.75;1,1;;test_animation.jpg;4;100]
			animated_image[1.75,0.5;1,1;;test_animation.png;100;100]
			animated_image[3,0.5;1,1;ani_img_1;test_animation.png;4;1000]
			button[4.25,0.5;1,1;ani_btn_1;Current
Number]
			animated_image[3,1.75;1,1;ani_img_2;test_animation.png;4;1000;2]
			button[4.25,1.75;1,1;ani_btn_2;Current
Number]
			animated_image[3,3;1,1;;test_animation.png;4;0]
			animated_image[3,4.25;1,1;;test_animation.png;4;0;3]
			animated_image[5.5,0.5;5,2;;test_animation.png;4;100]
			animated_image[5.5,2.75;5,2;;test_animation.jpg;4;100]
		]],

		"formspec_version[3]"..
		"size[12,12]"..
		"button[8.5,1;1,1;bla;Bla]"..
		"box[1,1;8,6;#00aa]"..
		"scroll_container[1,1;8,6;scrbar;vertical]"..
			"button[0,1;1,1;lorem;Lorem]"..
			"button[0,10;1,1;ipsum;Ipsum]"..
			"pwdfield[2,2;1,1;lorem2;Lorem]"..
			"list[current_player;main;4,4;1,5;]"..
			"box[2,5;3,2;#ffff00]"..
			"image[1,10;3,2;bubble.png]"..
			"image[3,1;bubble.png]"..
			"item_image[2,6;3,2;default:mese]"..
			"label[2,15;bla Bli\nfoo bar]"..
			"item_image_button[2,3;1,1;default:dirt_with_grass;itemimagebutton;ItemImageButton]"..
			"tooltip[0,11;3,2;Buz;#f00;#000]"..
			"box[0,11;3,2;#00ff00]"..
			"hypertext[3,13;3,3;;" .. hypertext .. "]" ..
			"container[0,18]"..
				"box[1,2;3,2;#0a0a]"..
				"scroll_container[1,2;3,2;scrbar2;horizontal;0.06]"..
					"button[0,0;6,1;butnest;Nest]"..
					"label[10,0.5;nest]"..
				"scroll_container_end[]"..
				"scrollbar[1,0;3.5,0.3;horizontal;scrbar2;0]"..
			"container_end[]"..
			"dropdown[0,6;2;hmdrpdwn;apple,bulb;1]"..
			"image_button[0,4;2,2;bubble.png;bubblebutton;bbbbtt;false;true;heart.png]"..
			"box[1,22.5;4,1;#a00a]"..
		"scroll_container_end[]"..
		"scrollbaroptions[max=170]".. -- lowest seen pos is: 0.1*170+6=23 (factor*max+height)
		"scrollbar[7.5,0;0.3,4;vertical;scrbar;0]"..
		"scrollbar[8,0;0.3,4;vertical;scrbarhmmm;0]"..
		"dropdown[0,6;2;hmdrpdwnnn;apple,bulb;1]",
}

local function show_test_formspec(pname, page_id)
	page_id = page_id or 2

	local fs = pages[page_id] .. "tabheader[0,0;8,0.65;maintabs;Real Coord,Styles,Noclip,MiscEle,Scroll Container;" .. page_id .. ";false;false]"

	minetest.show_formspec(pname, "test:formspec", fs)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "test:formspec" then
		return false
	end

	if fields.maintabs then
		show_test_formspec(player:get_player_name(), tonumber(fields.maintabs))
		return true
	end

	if fields.ani_img_1 and fields.ani_btn_1 then
		minetest.chat_send_all(fields.ani_img_1)
	elseif fields.ani_img_2 and fields.ani_btn_2 then
		minetest.chat_send_all(fields.ani_img_2)
	end
end)

minetest.register_node("test:node", {
	tiles = { "air.png" }
})

minetest.register_chatcommand("formspec", {
	func = function(name)
		if not minetest.get_player_by_name(name) then
			return false, "You need to be online!"
		end

		show_test_formspec(name)
		return true, "Opened formspec"
	end,
})
