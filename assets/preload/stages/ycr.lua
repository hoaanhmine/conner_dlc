
local spotlightdo = false
function onCreate()

	setProperty('skipCountdown', true);

	makeLuaSprite('YCR_sky', 'ycrbg/p2_sky', -1000, -500);
	makeLuaSprite('YCR_floor', 'ycrbg/p2_ground', -500, -100)
	makeLuaSprite('YCR_trees', 'ycrbg/p2_trees', -500, -100)
	makeLuaSprite('YCR_backtrees', 'ycrbg/p2_backtrees', -500, -200)
	makeLuaSprite('YCR_greenhill', 'ycrbg/GreenHill', -300,-500)

	

	makeLuaSprite('sussyred','ycrbg/RedVG',0,0)
	scaleObject('YCR_greenhill', 2.5, 2.5);
	scaleObject('YCR_sky', 2.0, 2.0);
	setScrollFactor('YCR_sky', 0.9, 0.9);
	setProperty('YCR_greenhill.visible', false)

	setObjectCamera('sussyred', 'other');
	setScrollFactor('sussyred', 0, 0)
	setProperty('sussyred.alpha', 0);
	setScrollFactor('YCR_backtrees', 1.05, 1.0);
	setScrollFactor('YCR_trees', 1.025, 1.0);

	addLuaSprite('YCR_sky', false)
	addLuaSprite('YCR_backtrees', false)
	addLuaSprite('YCR_trees', false)
	addLuaSprite('YCR_floor', false)
	addLuaSprite('YCR_greenhill', false)
	addLuaSprite('sussyred',true)

	--CONNER STAGE BULLSHIT
	makeLuaSprite('bg','ycrbg/bg1',-600, -200)
	makeLuaSprite('bgdark','ycrbg/bg2',-600, -200)
	makeLuaSprite('spot1','ycrbg/spotlight',-30, -400)
	makeLuaSprite('spot2','ycrbg/spotlight',650, -400)
	
	
	makeLuaSprite('blackbg', 'empty', 0, 0)
	makeGraphic('blackbg', 1280, 720, '000000')
	setObjectCamera('blackbg', 'hud')
	setProperty('blackbg.alpha', 0)

	setProperty('spot2.visible',false);
	setProperty('spot1.visible',false);
	setProperty('bgdark.visible',false);
	setProperty('blackbg.visible',false);
	setProperty('bg.visible',false);

	addLuaSprite('bg', false);
	addLuaSprite('bgdark', false)
	addLuaSprite('blackbg', true);
	setProperty("blackbg.alpha", 0.5)

	

end

function onUpdate()
	if mustHitSection and spotlightdo then
		setProperty('spot2.visible',true);
		setProperty('spot1.visible',false);
	--	doTweenColor('b2', 'boyfriend','FFFFFF',0.1, 'quartIn')
	else
		setProperty('spot1.visible',true);
		setProperty('spot2.visible',false);
		--doTweenColor('b1', 'boyfriend','000000',0.1, 'quartIn')
	end
end

function onCreatePost()
	addCharacterToList('conner', 'dad')
end

function setthem(visible)
	setProperty('YCR_sky.visible', visible);
	setProperty('YCR_floor.visible', visible);
	setProperty('YCR_trees.visible', visible);
	setProperty('YCR_backtrees.visible', visible);
	setProperty('YCR_greenhill.visible', visible);

	if visible then
		setProperty('boyfriend.x',770)
		setProperty('boyfriend.y',450)

		setProperty('dad.x',-180)
		setProperty('dad.y',110)
		

	elseif not visible then
			setProperty('boyfriend.x',770)
			setProperty('boyfriend.y',620)

			setProperty('dad.x',100)
			setProperty('dad.y',300)
	end
	
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'vrug' then
		runTimer('vrug2', 1.2)
		doTweenAlpha('sussyredAlpha', 'sussyred', 0, 1.0, 'quintIn')
	end

	if tag == 'vrug2' then
		runTimer('vrug', 0.6)
		doTweenAlpha('sussyredAlpha', 'sussyred', 1.0, 1.0, 'quintOut')
	end
end

function onBeatHit()

	if getProperty('curBeat') == 19 then
		runTimer('vrug', 0.6)
		doTweenAlpha('sussyredAlpha', 'sussyred', 1.0, 1.0, 'quintOut')
	end

	if getProperty('curBeat') == 132 then
		setProperty('sussyred.visible', false)
	end
end

function onStepHit()
	if curStep == 528 then
		setthem(false)
		setProperty('bgdark.visible',false);
		setProperty('blackbg.visible',false);
		setProperty('bg.visible',true);
	end
	if curStep == 656 then --896
		cameraFlash('hud','000000',1)
		spotlightdo = true
		addLuaSprite('spot1', true)
		addLuaSprite('spot2', true)
		setProperty('bgdark.visible',true);
		setProperty('blackbg.visible',true);
		setProperty('bg.visible',true);
	end
	if curStep == 784 then --896
		spotlightdo = false
		setthem(true)
		removeLuaSprite('spot1', false)
		removeLuaSprite('spot2', false)
		setProperty('bgdark.visible',false);
		setProperty('bg.visible',false);
		setProperty('blackbg.visible',false);
	end

	if curStep == 783 then
		setProperty('sussyred.visible', true)
	end
end

function onEndSong()

	return Function_Continue;
	
end
