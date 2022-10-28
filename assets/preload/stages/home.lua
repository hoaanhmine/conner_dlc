function onCreate()
 --0.78
 setProperty('skipCountdown', true);
	makeLuaSprite('day','wfh/day',-370,-300)
	makeLuaSprite('dawn','wfh/dawn',-370,-300)
	makeLuaSprite('night','wfh/night',-370,-300)
	--setGraphicSize('front',1280,720)
	scaleObject('day',1.5,1.5);
	scaleObject('dawn',1.5,1.5);
	scaleObject('night',1.5,1.5);

	addLuaSprite('day',false)
	addLuaSprite('dawn',false)
	addLuaSprite('night',false)

	setProperty('day.alpha', 1)
	setProperty('dawn.alpha', 0)
	setProperty('night.alpha', 0)
	setProperty('dad.visible', 0)
	makeLuaSprite('overlay', 'empty', 0, 0)
	makeGraphic('overlay', 1280, 720, '000000')
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.alpha', 0)
	addLuaSprite('overlay', true)
	
	
end

function onCreatePost()
	--0.78
	-- 350 -100
	-- cam 853 681.5
	--setGraphicSize('dad',211,541)
end
function onStepHit()
	if curStep == 15 then
		setProperty('dad.visible', 1)
		triggerEvent('Camera Follow Pos',900,681.5)
		setProperty('defaultCamZoom', 0.3)
		doTweenAlpha('lol','boyfriend',0.4,0.5)
	end
	if curStep == 103 then
		triggerEvent('Camera Follow Pos',853,681.5)
		setProperty('defaultCamZoom', 0.6)
		doTweenAlpha('lol2','boyfriend',1,0.78)
	end
	if curStep == 896 then
		doTweenAlpha('lol3','day',0,0.4)
		doTweenAlpha('lol4','dawn',1,0.4)
	end
	if curStep == 1408 then
		doTweenAlpha('lol5','dawn',0,0.4)
		doTweenAlpha('lol6','night',1,0.4)
	end
	
end