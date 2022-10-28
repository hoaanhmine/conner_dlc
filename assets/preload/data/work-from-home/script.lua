startedPlaying = false
finishedGameover = false
function onUpdate(elapsed)
    if inGameOver and not startedPlaying and not finishedGameover then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.2);
        setProperty('boyfriend.visible',false)
    end
    if not finishedGameover and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' and not startedPlaying then
        math.randomseed(curBeat * 4)
        soundName = string.format('conner/conner_%i', math.random(0, 8))
        playSound(soundName, 2, 'connersound')
        startedPlaying = true
    end
end

function onGameOverConfirm(reset)
    finishedGameover = true;
end

function onSoundFinished(tag)
    if tag == 'connersound' and not finishedGameover then
        soundFadeIn(nil, 4, 0.2, 1)
    end
end