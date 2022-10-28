local bop = false
function onCreate()

	makeLuaSprite('bg','BG/bg',-370,-300)
	makeLuaSprite('front','BG/faker',-370,-300)
	makeLuaSprite('gradient','gradient',-400,225)
	
	setProperty('gradient.alpha',0)
	setGraphicSize('gradient',2000,400)
	updateHitbox('gradient')
	--setGraphicSize('front',1280,720)
	scaleObject('bg',1.5,1.5);
	scaleObject('front',1.5,1.5);
	setScrollFactor('gradient',0,0.75)
	

	addLuaSprite('bg',false)
	addLuaSprite('front',true)
	addLuaSprite('gradient',true)

end



function onCreatePost()
	if downscroll == false then
		for i = 0,3 do
			noteTweenY('gn1'..i, i, 550, 2, 'quadInOut')
			
			setPropertyFromGroup('opponentStrums',0,'downScroll',true)
			setPropertyFromGroup('opponentStrums',1,'downScroll',true)
			setPropertyFromGroup('opponentStrums',2,'downScroll',true)
			setPropertyFromGroup('opponentStrums',3,'downScroll',true)
		end
	end

	if downscroll == true then
		for i = 0,3 do
			noteTweenY('gn2'..i, i, 50, 2, 'quadInOut')
			
			setPropertyFromGroup('opponentStrums',0,'downScroll',false)
			setPropertyFromGroup('opponentStrums',1,'downScroll',false)
			setPropertyFromGroup('opponentStrums',2,'downScroll',false)
			setPropertyFromGroup('opponentStrums',3,'downScroll',false)
		end
	end

	if middlescroll then
		if not downscroll then
			for i = 0,3 do
				noteTweenY('gn3'..i, i, -9000, 2, 'quadInOut')
			end
		else
			for i = 0,3 do
				noteTweenY('gn33'..i, i, 9000, 2, 'quadInOut')
			end
		end
		doTweenX('hpx', 'healthBar', -150, 2, 'quadInOut')
		setPropertyFromGroup('opponentStrums',0,'alpha',0)
		setPropertyFromGroup('opponentStrums',1,'alpha',0)
		setPropertyFromGroup('opponentStrums',2,'alpha',0)
		setPropertyFromGroup('opponentStrums',3,'alpha',0)
	end

			doTweenY('hpBarangle', 'healthBar', 350, 2, 'quadInOut')
			doTweenAngle('hpBar1', 'healthBar', 90, 2, 'quadInOut')
			doTweenY('scoreTxt', 'scoreTxt', screenHeight*0.11-56,  2, 'quadInOut')
			doTweenY('timeTxt1', 'timeTxt', screenHeight-44,  2, 'quadInOut')
			doTweenY('timeBg1', 'timeBar', screenHeight-44+10,  2, 'quadInOut')
			doTweenY('icon11', 'iconP1', 270,  2, 'quadInOut')
			doTweenY('icon21', 'iconP2', 270,  2, 'quadInOut')
	
end
function onUpdate(elapsed)
	noteCount = getProperty('notes.length');
	if downscroll == false then
		
			for i = 0, noteCount - 1  do
				if getPropertyFromGroup('notes', i, 'isSustainNote') and not getPropertyFromGroup('notes', i, 'mustPress') then
					setPropertyFromGroup('notes', i, 'angle', 180)
				end

			end
	end
	if downscroll == true then
		
		for i = 0, noteCount - 1  do
			if getPropertyFromGroup('notes', i, 'isSustainNote') and not getPropertyFromGroup('notes', i, 'mustPress') then
				setPropertyFromGroup('notes', i, 'angle', 180)
			end

		end
	end
	
	if middlescroll then
		setPropertyFromGroup('opponentStrums',0,'alpha',0)
		setPropertyFromGroup('opponentStrums',1,'alpha',0)
		setPropertyFromGroup('opponentStrums',2,'alpha',0)
		setPropertyFromGroup('opponentStrums',3,'alpha',0)
	end


	newHeight = math.floor(500 - 1000 * elapsed); 
	if newHeight >= 0 then
		setProperty('gradient.alpha',1)
		setGraphicSize('gradient',2000,newHeight)
		updateHitbox('gradient')
		setProperty('gradient.y',225 + 400 - 300)

	end

end

	function bop()
	
		setGraphicSize('gradient',2000, 400);
		updateHitbox('gradient');
		setProperty('gradient.y',225)
		doTweenAlpha('alpha','gradient',0,1,'quartIn')
		
		
	end


function onUpdatePost(elapsed)
	setProperty('iconP2.x', getProperty('healthBar.x') + 150)
	setProperty('iconP1.x', getProperty('healthBar.x') + 270)
	
	--setProperty('iconP1.y', getProperty('healthBar.y'))
	--setProperty('iconP1.y', getProperty('healthBar.y'))	

	P1Mult = getProperty('healthBar.y') - ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP1.scale.y') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.y') - ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.y')) / 2 - 26 * 2)
	setProperty('iconP1.y',P1Mult + 230)
	setProperty('iconP1.origin.y',300)
	setProperty('iconP2.y',P2Mult + 100)
	setProperty('iconP2.origin.y',-200)
	
	songPos = getSongPosition()
        currentBeat = (math.ceil((songPos/5000) * (100/12)) - 1) -- close enough
        if currentBeat % 2 == 0 then
            if not bop then
                bop = true
                setProperty('part2.scale.x', 1.2 * 2)
                setProperty('part2.scale.y', 0.9 * 2)
				setProperty('part3.scale.x', 1.2 * 2)
                setProperty('part3.scale.y', 0.9 * 2)
            end
        elseif currentBeat % 2 == 1 then
            bop = false
        end
	
end
function onBeatHit()
	if curBeat % 1 == 0 then
		Particle()
		setProperty('part2.scale.x', 1.2 * 2)
        setProperty('part2.scale.y', 0.7 * 2)
		setProperty('part3.scale.x', 1.2 * 2)
        setProperty('part3.scale.y', 0.7 * 2)
	end
end

function onStepHit()
    Particle()
	if curStep == 510 then
		addLuaScript("custom_events/glowOnNotes")
	end
	if curStep == 1024 then
		removeLuaScript("custom_events/glowOnNotes")
		doTweenColor('bbb1', 'gradient','FFFFFF',0.2, 'quartIn')
		doTweenColor('bbb3', 'part','FFFFFF',1, 'quartIn')
	end
	if curStep == 1406 then
		
		addLuaScript("custom_events/glowOnNotes")
	end

	if curStep >= 1406 then
		Particle2()
	end
  end
    f = 1
  
    function Particle()
    songPos = getSongPosition()
    currentBeat = (songPos/500)
      f = f + 1
      sus = math.random(2, 12000)
      sus2 = math.random(2, 12000)
	  sus3 = math.random(2, 12000)
      makeLuaSprite('part' .. f, 'particles', math.random(-2500, 5000), 1600)
      doTweenY(sus, 'part' .. f, -900*math.tan((currentBeat+1*0.1)*math.pi), 4)
      scaleObject('part' .. f, 0.5, 0.5);
      addLuaSprite('part' .. f, true)

	  
      if f >= 100 then
      f = 1
      end
    end

	function Particle2()
		songPos = getSongPosition()
    	currentBeat = (songPos/500)
     	 f = f + 1
      	sus2 = math.random(2, 12000)
	  	sus3 = math.random(2, 12000)

		makeLuaSprite('part2' .. f, 'heart', math.random(-2500, 5000), 1000)
		doTweenY(sus2, 'part2' .. f, -900*math.tan((currentBeat+1*0.3)*math.pi), 4)
		scaleObject('part2' .. f, 2, 2);
		addLuaSprite('part2' .. f, true)
		
		makeLuaSprite('part3' .. f, 'retweet', math.random(-2500, 5000), 1000)
		doTweenY(sus3, 'part3' .. f, -900*math.tan((currentBeat+1*0.3)*math.pi), 4)
		scaleObject('part3' .. f, 2, 2);
		addLuaSprite('part3' .. f, true)
		if f >= 100 then
			f = 1
		end
	end