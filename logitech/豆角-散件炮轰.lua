--技能按键设置：

----鼠标左键->盾闪（12s）        

----鼠标右键->战马冲锋(5s)

----1键->奉献(12s)(或天谴)

----2键->钢铁之肤(12s)

----3键->阿卡拉特勇士(36s)

----4键->轰击(16s)


Crusader_Macro_LoopInterval = 10 --脚本循环间隔（毫秒）


function OnEvent(event, arg, family)
    if (event == "G_RELEASED" and arg == 6) then --6为罗技键盘G6键

    --if (event == "MOUSE_BUTTON_RELEASED" and arg == 3) then --3为罗技鼠标中键，5为侧键前进，4为侧键返回

        Crusader_Macro_FullyAuto2()
	elseif(event == "MOUSE_BUTTON_RELEASED" and arg == 4) then 
	   Crusader_Macro_Single()	
    end
end

function Crusader_Macro_Single()
        --按下并释放A键（奉献）、S键（钢铁之肤）、D键（阿卡拉特勇士）、F键（轰击）
        PressKey("rshift")
        PressMouseButton(1)
        Sleep(10)
        ReleaseMouseButton(1)
        ReleaseKey("rshift")
        PressAndReleaseKey("3")                
        Sleep(950)        
        PressAndReleaseKey("4")
        Sleep(10)
        PressAndReleaseKey("2")
        Sleep(10)
        PressAndReleaseKey("1")
        Sleep(10)
	    PressMouseButton(3)
        Sleep(10)
	    ReleaseMouseButton(3)

end
function Crusader_Macro_FullyAuto2()

	t0 = GetRunningTime()
	while(IsKeyLockOn("capslock")) do
		t = (GetRunningTime() - t0) % 16000   
		if t < 100 then
			PressAndReleaseKey("spacebar")             
		end
		if t > 11000 and t < 11100 then 
			PressAndReleaseKey("q")
			Sleep(100)
			PressAndReleaseKey("q")      
		end
		if t > 2000 and t < 2200 then
			PressAndReleaseKey("2")
			Sleep(100)
			PressAndReleaseKey("2") 
			Sleep(100)
			PressAndReleaseKey("2")      
		end
		if t > 3000 and t < 3200 then  
			PressAndReleaseKey("4")
			Sleep(100)
			PressAndReleaseKey("4") 
			Sleep(100)
			PressAndReleaseKey("4")      
		end
		if t > 3900 and t < 4100 then        
			PressAndReleaseKey("3")
			Sleep(100)
			PressAndReleaseKey("3") 
			Sleep(100)
			PressAndReleaseKey("3")     
		end
		Sleep(50)
	end
	
end

function Crusader_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        --按下并释放A键（奉献）、S键（钢铁之肤）、D键（阿卡拉特勇士）、F键（轰击）
        PressKey("rshift")
        PressMouseButton(1)
        Sleep(10)
        ReleaseMouseButton(1)
        ReleaseKey("rshift")
        Left_Mouse_Button_Pressed = true --鼠标左键已按下
        PressAndReleaseKey("3")                
        Sleep(950)        
        PressAndReleaseKey("4")
        Sleep(10)
        PressAndReleaseKey("2")
        Sleep(10)
        PressAndReleaseKey("1")
        Sleep(10)
                 
        --按住鼠标右键（启动右键战马冲锋）

        PressMouseButton(3)
        Alt_Pressed = false

        Times_Key_A = 0
        Times_Key_S = 0
        Times_Key_D = 0
        Times_Key_F = 0
        Times_key_left = 0
    end

    --如果CapsLock键已按下则启动循环，否则退出循环

    while (IsKeyLockOn("capslock")) do               
        Sleep(Crusader_Macro_LoopInterval) --循环间隔


        Times_Key_A = Times_Key_A + 1
        Times_Key_S = Times_Key_S + 1
        Times_Key_D = Times_Key_D + 1
        Times_Key_F = Times_Key_F + 1
        Times_key_left = Times_key_left + 1


        --每2.75秒按下并释放S键（钢铁之肤CD10s ）

        if ((Times_key_left*Crusader_Macro_LoopInterval) == 2500) then
            PressAndReleaseMouseButton(1)
            Times_key_left = 0
        end



        --每5.1秒按下并释放A键（天谴CD 5s）
        if ((Times_Key_A*Crusader_Macro_LoopInterval) == 5100) then
            PressAndReleaseKey("1")
            Times_Key_A = 0
        end

        --每2.75秒按下并释放S键（钢铁之肤CD10s ）

        if ((Times_Key_S*Crusader_Macro_LoopInterval) == 2750) then
            PressAndReleaseKey("2")
            Times_Key_S = 0
        end
         --每6秒按下并释放D键（阿卡拉特勇士 集结号CD31s）
        if ((Times_Key_D*Crusader_Macro_LoopInterval) == 5950) then

            PressAndReleaseKey("3")

            Times_Key_D = 0
        end
          --每3.3秒按下并释放F键（轰击CD13s）
        if ((Times_Key_F*Crusader_Macro_LoopInterval) == 3100) then

            PressAndReleaseKey("4")

            Times_Key_F = 0

        end
                
        --按住lalt键中断战马冲锋（捡东西）

        if (IsModifierPressed("lalt")) then 
            if not (Alt_Pressed) then
                ReleaseMouseButton(3)
                Alt_Pressed = true
            end
        else
            if (Alt_Pressed) then
                PressMouseButton(3)
                Alt_Pressed = false
            elseif not (IsMouseButtonPressed(3)) then
                ReleaseMouseButton(3)
                PressMouseButton(3)
            end
        end
    end

    ReleaseMouseButton(1)
    ReleaseMouseButton(3)
end



