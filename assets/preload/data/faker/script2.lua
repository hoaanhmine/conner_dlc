startedPlaying = false
finishedGameover = false
function onCreate()
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'meow');
end
function onUpdate(elapsed)
    if inGameOver and not startedPlaying and not finishedGameover then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.2);
        setProperty('boyfriend.visible',false)
    end
    if not finishedGameover and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' and not startedPlaying then
        math.randomseed(curBeat * 4)
        soundName = string.format('faker/snow_%i', math.random(0, 9))
        playSound(soundName, 2, 'snowspit')
        startedPlaying = true
    end
end

function onGameOverConfirm(reset)
    finishedGameover = true;
end

function onSoundFinished(tag)
    if tag == 'snowspit' and not finishedGameover then
        soundFadeIn(nil, 4, 0.2, 1)
    end
end

