function onCreate()
 --0.78
 luaDebugMode = true
	makeLuaSprite('bg','clown/bg',-370,-300)
	makeLuaSprite('stage','clown/stage',-370,-300)
	makeLuaSprite('stage-alt','clown/stage-alt',-370,-300)
	makeLuaSprite('portal','clown/portal',990,300)
	--setGraphicSize('front',1280,720)
	scaleObject('bg',1.5,1.5);
	scaleObject('stage',1.5,1.5);
	scaleObject('stage-alt',1.5,1.5);
	scaleObject('portal',0.001,0.001);
	--scaleObject('front',1.5,1.5);
	setScrollFactor('portal',1.05,0.75)
	setProperty('portal.height', 1.5)

	setProperty('stage-alt.visible',false)
	addLuaSprite('bg',false)
	addLuaSprite('portal',false)
	addLuaSprite('stage-alt',false)
	addLuaSprite('stage',false)

	makeLuaSprite('overlay', 'empty', 0, 0)
	makeGraphic('overlay', 1280, 720, '000000')
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.alpha', 0)
	addLuaSprite('overlay', true)
	
	
end
-- bf = 1637.5 809
-- dad = 641 588
function portalpop()
	cameraShake('game',0.04,0.5)
	doTweenX('pop1','portal.scale', 1.5,0.1, 'quartIn')
	doTweenY('pop2','portal.scale', 1.5,0.1, 'quartIn')
	setProperty('stage-alt.visible',true)
	setProperty('stage.visible',false)
	--doTweenX('pop3','portal.width', 1.5,0.1, 'quartIn')
	--doTweenY('pop4','portal.height', 1.5,0.1, 'quartIn')
	--scaleObject('portal',1.5,1.5);
end

function onCreatePost()
	--0.78
	
end

function onUpdate(elapsed)
	if curStep >= 959 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/120)
	  doTweenY('portalfloat', 'portal', 300-100*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
  end

function onStepHit()
	if curStep == 2 then
		doTweenZoom('cambf','camGame',1,10, 'liner')
		doTweenAlpha('camfade','camHUD', 0, 1, 'Linear')	
	end
	if curStep == 127 then
		doTweenAlpha('camfade2','camHUD', 1, 0.5, 'quartIn')	
	end
	if curStep == 895 then
		doTweenAlpha('camfade3','overlay', 1, 0.5, 'quartIn')	
	end
	if curStep == 927 then
		triggerEvent('Camera Follow Pos',1200,50)
		setProperty('defaultCamZoom', 0.5)
		doTweenAlpha('camfade4','overlay', 0, 1, 'quartIn')	
		doTweenZoom('camzoom2','camGame',1,3, 'liner')
	end
	if curStep == 943 then
		--doTweenZoom('cam2','camGame',0.7,2, 'liner')
	end

	if curStep == 959 then
		portalpop()
		triggerEvent('Camera Follow Pos',1200,500)
		setProperty('defaultCamZoom', 0.5)
		cameraFlash('hud','FFFFFF',1,true)
		cancelTween('camzoom2')
	end
	if curStep == 1279 then
		triggerEvent('setcam',true)
	end
	if curStep == 2048 then
		--doTweenX('bye1','boyfriend', 1200,0.5, 'quartIn')
		--doTweenY('bye2','boyfriend', -500,0.5, 'quartIn')
		--doTweenAngle('bye3','boyfriend', 180,0.5, 'quartIn')
		doTweenAlpha('cambye','camGame', 0, 0.001, 'Linear')	
		doTweenAlpha('cambye2','camHUD', 0, 0.001, 'Linear')
	end
end