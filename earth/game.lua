-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	physics.start()
	physics.setDrawMode("hybrid")
	

	--- 배경 추가------------
	local background = display.newImageRect("image/배경.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	--- 캐릭터 추가 ---------
	local player = display.newImage("image/캐릭터_옆면3.png")
	player.x, player.y = display.contentWidth*0.16, display.contentHeight*0.3
	player.name = "player"

	--- 캐릭터 움직이기 ---------

	local function onKeyEvent(event)
		local playerX, playerY = player.x, player.y

	    if event.phase == "down" then
	        if event.keyName == "right" then
	        	playerX, playerY = player.x, player.y
	        	display.remove(player)
	        	player = display.newImage("image/캐릭터_옆면3.png")
	            player.x, player.y = playerX + 100, playerY
	        elseif event.keyName == "left" then
	        	playerX, playerY = player.x, player.y
	        	display.remove(player)
	        	player = display.newImage("image/캐릭터_옆면2.png")
	            player.x, player.y = playerX - 100, playerY
	        elseif event.keyName == "up" then
	        	playerX, playerY = player.x, player.y
	        	display.remove(player)
	        	player = display.newImage("image/캐릭터_뒷면1.png")
	            player.x, player.y = playerX, playerY - 100
	        elseif event.keyName == "down" then
	            playerX, playerY = player.x, player.y
	        	display.remove(player)
	        	player = display.newImage("image/캐릭터_정면.png")
	            player.x, player.y = playerX, playerY + 100
	        end
	    end
	end

	Runtime:addEventListener("key", onKeyEvent)

	--- 외계인 퀘스트 -------
	local quest1 = display.newImage("image/퀘스트박스.png")
	quest1.x, quest1.y = 300, 860

	local function checkQuest(quest)
		if (player.x > quest.x - 100 and player.x < quest.x + 100
			and player.y > quest.y - 100 and player.y < quest.y + 100) then

			composer.showOverlay("quest_alien")
			-- display.remove(quest)
		end
	end

	local function onEnterFrame(event)
    	checkQuest(quest1)
	end

	Runtime:addEventListener("enterFrame", onEnterFrame)

	--- 에어컨 온도 맞추기 -----
	local quest2 = display.newImage("image/퀘스트박스.png")
	quest2.x, quest2.y = 300, 560

	local function checkQuest2(quest)
		if (player.x > quest.x - 100 and player.x < quest.x + 100
			and player.y > quest.y - 100 and player.y < quest.y + 100) then

			composer.showOverlay("quest_temp")
			-- display.remove(quest)
		end
	end

	local function onEnterFrame(event)
    	checkQuest2(quest2)
	end

	Runtime:addEventListener("enterFrame", onEnterFrame)
	

	--- 점수 추가 -----------
	local score = display.newText(0, display.contentWidth*0.62, display.contentHeight*0.1)
	score.size = 100

	score:setFillColor(0)

	--- 타이머 추가 -----------
	local time= display.newText(75, display.contentWidth*0.37, display.contentHeight*0.1)
 	time.size = 100
 	time:setFillColor(0)


 	sceneGroup:insert(background)
 	sceneGroup:insert(player)
 	sceneGroup:insert(score)
 	sceneGroup:insert(time)
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
