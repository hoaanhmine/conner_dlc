function onCreate()
    makeLuaSprite('songnamebar1', 'empty', 0, -900)
	makeGraphic('songnamebar1', 1280, 720, '000000')
	setObjectCamera('songnamebar1', 'other')
	addLuaSprite('songnamebar1', true)


	--THE BOTTOM BAR
	makeLuaSprite('songnamebar2', 'empty', 0, 720)
	makeGraphic('songnamebar2', 1280, 220, '000000')
	setObjectCamera('songnamebar2', 'other')
	addLuaSprite('songnamebar2', true)

    makeLuaText('songnametext', 'mom', 0, 0, 0)
    setProperty('songnametext.y', 330)
    setProperty('songnametext.x', -900) --0
    setTextAlignment('songnametext', 'center')
    setObjectCamera('songnametext','other')
    setTextWidth('songnametext', getTextWidth('scoreTxt'))
    setTextSize('songnametext', 100)
    addLuaText('songnametext')

    --LOL
    makeLuaSprite('overlaylol', 'empty', 0, 0)
    scaleObject('overlaylol', 2.0, 2.0);
	makeGraphic('overlaylol', 1920, 1080, '000000')
	setObjectCamera('overlaylol', 'other')
	setProperty('overlaylol.alpha', 0)
    addLuaSprite('overlaylol',false)
end

function onSongStart()
    doTweenAlpha('alpha','overlaylol',0.6,1,'quartIn')
    doTweenY('L', 'songnamebar1', -500, 1, 'Linear')
	doTweenY('L2', 'songnamebar2', 500, 1, 'Linear')

    doTweenX('tweenname','songnametext',250,1,'cubein')
    doTweenY('tweenname2','songnametext',330,1,'bouncein')
    doTweenColor('color','songnametext','FFFFFF',0.2)
    setTextString('songnametext',songName)
    runTimer('wait',3)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'wait' then
        doTweenAlpha('alphaoverlay','overlaylol',0,1,'quartIn')
        doTweenY('L3', 'songnamebar1', -900, 0.2, 'Linear')
	    doTweenY('L4', 'songnamebar2', 720, 0.2, 'Linear')
        doTweenX('tweenname3','songnametext',2000,1,'bounceout')
    end
    
end

function onTweenCompleted(tag)
    if tag == 'tweenname3' then
        removeLuaSprite('songnamebar1')
        removeLuaSprite('songnamebar2')
        removeLuaSprite('overlaylol')
        removeLuaText('songnametext')
    end
end