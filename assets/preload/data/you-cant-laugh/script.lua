function onCreate()
    setProperty('health',2);
end

function onCreatePost()
    setProperty('healthBar.flipX', true)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
    setProperty('iconP2.alpha', 0)
    setProperty('iconP1.alpha', 0)

    --HEALTH 
    makeLuaText('healththing', 'HP:', 0, 0, 0)
    setProperty('healththing.y', getProperty('healthBar.y') - 6)
    setProperty('healththing.x', getProperty('healthBar.x') - 670)
    setTextAlignment('healththing', 'center')
    setTextWidth('healththing', getTextWidth('scoreTxt'))
    setTextSize('healththing', 20)
    addLuaText('healththing')
end
function onUpdatePost()
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    setProperty('iconP1.x', x2)
    setProperty('iconP2.x', x1)
    setProperty('healthGain',0)
end