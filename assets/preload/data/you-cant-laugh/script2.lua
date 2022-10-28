function onCreate()
    makeLuaSprite('UpperBar', 'empty', 0, -900)
	makeGraphic('UpperBar', 1280, 720, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', 'empty', 0, 720)
	makeGraphic('LowerBar', 1280, 220, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)
end

function onCreatePost()

    --lyrics 
    makeLuaText('lyrics', 'mom', 0, 0, 0)
    setProperty('lyrics.y', getProperty('healthBar.y') - 40)
    setProperty('lyrics.x', getProperty('healthBar.x') -350)
    setTextAlignment('lyrics', 'center')
    setTextWidth('lyrics', getTextWidth('scoreTxt'))
    setTextSize('lyrics', 30)
    setProperty('lyrics.alpha',0)
    --setObjectCamera('lyrics', 'other')
    addLuaText('lyrics')
   
    --Lyrics Special
    makeLuaText('slyrics', 'mom', 0, 0, 0)
    setProperty('slyrics.y', 330)
    setProperty('slyrics.x', 800) --0
    setTextAlignment('slyrics', 'center')
    setTextWidth('slyrics', getTextWidth('scoreTxt'))
    setTextSize('slyrics', 100)
    setProperty('slyrics.alpha',0)
    addLuaText('slyrics')
end
function onUpdatePost()
end

function lyricslol(text)
    cancelTween('alpha')
    cancelTimer('goo')
    setProperty('lyrics.alpha',1)
    setTextString('lyrics',''..text..'')
    runTimer('goo',1)
end

function speciallyrics(text,dx,dy,fx,fy,time,color,ease)
        --runTimer('now',0.1)
        
        cancelTimer('goo2')
        cancelTween('alpha2')
        cancelTween('color')
        setProperty('slyrics.alpha',1)
        setProperty('slyrics.x', dx)
        setProperty('slyrics.y', dy)
        doTweenX('woop','slyrics',fx,time,''..ease..'')
        doTweenY('woop2','slyrics',fy,time,''..ease..'')
        doTweenColor('color','slyrics',''..color..'',0.2)
        setTextString('slyrics',''..text..'')

        --setProperty('slyrics.scale.x', 1)
       -- setProperty('slyrics.scale.y', 1)

        runTimer('goo2',1)
        
        --BAR
        doTweenY('Cinematics1', 'UpperBar', -500, 0.1, 'Linear')
	    doTweenY('Cinematics2', 'LowerBar', 500, 0.1, 'Linear')
        noteTweenAlpha('NOTEMOVE1', 0, 0, 1, 'Linear')	
        noteTweenAlpha('NOTEMOVE2', 1, 0, 1, 'Linear')
        noteTweenAlpha('NOTEMOVE3', 2, 0, 1, 'Linear')
        noteTweenAlpha('NOTEMOVE4', 3, 0, 1, 'Linear')
        noteTweenAlpha('NOTEMOVE5', 4, 0, 1, 'Linear')
        noteTweenAlpha('NOTEMOVE6', 5, 0, 1, 'Linear')
        noteTweenAlpha('NOTEMOVE7', 6, 0, 1, 'Linear')
        noteTweenAlpha('NOTEMOVE8', 7, 0, 1, 'Linear')
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'goo' then
        doTweenAlpha('alpha','lyrics',0,1,'quartIn')
    end
    if tag == 'goo2' then
        doTweenAlpha('alpha2','slyrics',0,1,'quartIn')
    end
    if tag == 'now' then
        cancelTimer('woop')

        cancelTween('woop')

    end
    if tag == 'baroff' then
        doTweenY('Cinematics3', 'UpperBar', -900, 0.2, 'Linear')
	    doTweenY('Cinematics4', 'LowerBar', 720, 0.2, 'Linear')
        
    end
end

function onTweenCompleted(tag)
    if tag == 'woop' then
    end
end

function onBeatHit()
    if curBeat %1 == 0 then
        bopalone()
    end
end

function bopalone()
    setProperty('slyrics.scale.x', 1.175)
    setProperty('slyrics.scale.y', 1.175)
    doTweenX('bop','slyrics.scale', 1,0.2)
    doTweenY('bop2','slyrics.scale', 1,0.2)
end

function onStepHit()
    
    if curStep == 127 then
        lyricslol('(LAUGH)')
    end
    if curStep == 768 then
        lyricslol("DON'T YOU LAUGH!")
    end
    if curStep == 1169 then
        lyricslol("WELL WELL WELL")
    end
    if curStep == 1181 then
        lyricslol("THAT WAS COMEDY!")
    end
    if curStep == 1195 then
        lyricslol("OLD")
    end
    if curStep == 1204 then
        lyricslol("OLD FRIEND")
    end
    if curStep == 1216 then
        lyricslol('(LAUGH)')
    end
    if curStep == 1310 then
        setProperty('sussyred.visible', true)
        runTimer('vrug', 0.6)
		doTweenAlpha('sussyredAlpha', 'sussyred', 1.0, 1.0, 'quintOut')
        speciallyrics('THE GAZE OF THE',0,350,0,330,0.1,'FFFFFF','bouncein')
    end
    if curStep == 1319 then
        speciallyrics('GOD',0,350,0,330,0.1,'ff4265','bouncein')
    end
    if curStep == 1323 then
        speciallyrics('IS LEFT BY',0,350,0,330,0.1,'FFFFFF','bouncein')
    end
    if curStep == 1335 then
        speciallyrics('NONE',0,350,0,330,0.1,'ff4265','bouncein')
    end
    if curStep == 1345 then
        speciallyrics('YOU CANT HIDE',0,350,0,330,0.1,'ff4265','bouncein')
    end
    if curStep == 1357 then
        speciallyrics('AND',0,350,0,330,0.1,'FFFFFF','bouncein')
    end
    if curStep == 1359 then
        speciallyrics('YOU CANT RUN',0,350,0,330,0.1,'ff4265','bouncein')
    end
    if curStep == 1376 then
        speciallyrics('BRIMSTONE SURROUNDS US AND',0,350,0,280,0.1,'FFFFFF','bouncein')
    end
    if curStep == 1393 then
        speciallyrics('YOU WONT SURVIVE',0,350,0,330,0.1,'ff4265','bouncein')
    end
    if curStep == 1408 then
        speciallyrics('TAKE YOUR LAST',0,350,0,330,0.1,'FFFFFF','bouncein')
    end
    if curStep == 1416 then
        speciallyrics('BREATH',0,350,0,330,0.1,'ff4265','bouncein')
    end
    if curStep == 1418 then
        speciallyrics('BECAUSE YOUR',0,350,0,330,0.1,'FFFFFF','bouncein')
    end
    if curStep == 1425   then
        speciallyrics('SOUL',0,350,0,330,0.1,'ff4265','bouncein')
    end
    if curStep == 1428   then
        speciallyrics('IS',0,350,0,330,0.1,'FFFFFF','bouncein')
    end
    if curStep == 1432   then
        speciallyrics('MINE',0,350,0,330,0.1,'ff4265','bouncein')
        setProperty('sussyred.visible', false)
        noteTweenAlpha('NOTEMOVE1', 0, 1, 0.2, 'Linear')	
        noteTweenAlpha('NOTEMOVE2', 1, 1, 0.2, 'Linear')
        noteTweenAlpha('NOTEMOVE3', 2, 1, 0.2, 'Linear')
        noteTweenAlpha('NOTEMOVE4', 3, 1, 0.2, 'Linear')
        noteTweenAlpha('NOTEMOVE5', 4, 1, 0.2, 'Linear')
        noteTweenAlpha('NOTEMOVE6', 5, 1, 0.2, 'Linear')
        noteTweenAlpha('NOTEMOVE7', 6, 1, 0.2, 'Linear')
        noteTweenAlpha('NOTEMOVE8', 7, 1, 0.2, 'Linear')
        runTimer('baroff',1)

    end
    if curStep == 1440   then
        lyricslol('(LAUGH)')
    end
end