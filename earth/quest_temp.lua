-----------------------------------------------------------------------------------------
--
-- quest_temp.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
 	local background = display.newRoundedRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*0.85, display.contentHeight*0.75, 55)
 	background.strokeWidth = 10
	background:setStrokeColor( 0.6 )
 	background:setFillColor(1, 1, 0.9 )

 	local title = display.newText("에어컨 온도 조절", display.contentWidth/2, display.contentHeight*0.2)
 	title:setFillColor( 0.6 )
 	title.size = 70

 	local number = 0

 	local numberText = display.newText(tostring(number), display.contentWidth/2, display.contentHeight/2)

 	local randomNumber = math.random(15, 40) -- 15부터 40까지의 랜덤 숫자 생성
    number = randomNumber
    numberText.text = tostring(number)


 	
 	-- local temp = math.random(15, 40)
 	-- temp.x, temp.y = 300, 300
 	-- temp.size = 70


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