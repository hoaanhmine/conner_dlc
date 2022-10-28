local ratingbullshit = {'BANGER!', 'NICE!', 'BAD', 'SHIT', 'FIRE!', 'COOL!', 'BAD', 'SHIT'}
local defalutrate = 'CAT!';
local countscore = 0;
local countcombo = 0;
local sick = 0;
local good = 0;
local bad = 0;
local shit = 0;
local endplease = false;
local nowend = false;
local ittime = false;
function onCreate()
        --COMBO SHIT
        makeLuaText('likee', 'Likes: 0', 0, 0, 0)
        if middlescroll and downscroll then
            setProperty('likee.y', getProperty('healthBar.y') + 200) 
        elseif middlescroll then
                setProperty('likee.y', getProperty('healthBar.y') - 350)   
        else
            setProperty('likee.y', getProperty('healthBar.y') - 50)
           
        end
        
        setProperty('likee.x', getProperty('healthBar.x') + 100)
        setTextAlignment('likee', 'center')
        setTextWidth('likee', getTextWidth('scoreTxt'))
        setTextSize('likee', 40)
        addLuaText('likee')

        --RATING SHIT 
        makeLuaText('users', 'User:', 0, 0, 0)
        setProperty('users.y', getProperty('likee.y') + 40)
        setProperty('users.x', getProperty('healthBar.x') + 100 - 35)
        setTextAlignment('users', 'center')
        setTextWidth('users', getTextWidth('scoreTxt'))
        setTextSize('users', 40)
        setProperty('users.alpha', 0)
        addLuaText('users')

        setProperty('showRating',false)
        setProperty('showComboNum',false)

        makeLuaText('rateme', defalutrate, 0, 0, 0)
        setProperty('rateme.y', getProperty('likee.y') + 40)
        setProperty('rateme.x', getProperty('likee.x') + 200)
        setTextWidth('rateme', getTextWidth('scoreTxt'))
        setTextSize('rateme', 40)
        setObjectCamera('rateme', 'hud')
        setTextAlignment('rateme', 'center')
        setProperty('rateme.alpha', 0)
        addLuaText('rateme')

        setProperty('showRating',false)
		setProperty('showComboNum',false)
end

function onUpdate(elapsed)
    setTextString('likee','Likes: '..countcombo..'')
    if countscore > 0 then
        
        
        setTextString('rateme', defalutrate)
    end


    if countscore < 0 then
        countscore = 0
        runTimer('gone', 0.1)
        endplease = false;
        
        
    end

    if ittime then
		countcombo = 9999
	end

    if nowend == true then
        countscore = round(countscore - 111, 0);
        
        if endplease == true then
            countscore = round(countscore - 0 * 2 + elapsed/100, 0);
        end
    end
    if countcombo < 0 then
        countcombo = 0
    end
end

function onRecalculateRating()
    
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        countcombo = countcombo + 1
        if sick < getProperty('sicks') then
            countscore = countscore + 350;
            sick = sick + 1;
            defalutrate = ratingbullshit[5]

            bopping()
            doTweenColor('colrate','rateme','f4ff29',0.2)
        elseif good < getProperty('goods') then
            countscore = countscore + 200;
            good = good + 1;

            defalutrate = ratingbullshit[2]
            doTweenColor('colrate','rateme','2dff29',0.2)
            bopping()
        elseif bad < getProperty('bads') then
            countscore = countscore + 100;
            bad = bad + 1;
            defalutrate = ratingbullshit[3]
            doTweenColor('colrate','rateme','ffadbc',0.2)
            bopping()
        elseif shit < getProperty('shits') then
            countscore = countscore + 50;
            shit = shit + 1;
            defalutrate = ratingbullshit[4]
            doTweenColor('colrate','rateme','ff4265',0.2)
            bopping()
        else 
        
        end
        setProperty('rateme.alpha', 1)
        cancelTween('alpha22')
        cancelTween('wow2')
        
        setProperty('rateme.x', getProperty('likee.x') + 100)
        cancelTimer('goaway')
        nowend = false;
        runTimer('goaway', 2.05)
    end
end
function round(num, dp) -- i stole this
    local mult = 10^(dp or 0);
    return math.floor(num * mult + 0.5)/mult;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'goaway' then
        runTimer('gogogo', 1)
        nowend = true;
        if not ittime then
            countcombo = round(countcombo - 2,1);
            smol()
        end
        
        cancelTween('col')
    end

    if tag == 'gogogo' then
        endplease = true;
        doTweenAlpha('alpha','rateme',0,0.1,'quartIn')
    end
    
    if tag == 'gone' then
    end
end

function onTweenCompleted(tag)
    if tag == 'wow' then
        doTweenX('wow2', 'rateme', getProperty('likee.x') +150, 1, 'pingpong')
        doTweenAlpha('alpha22','rateme',0,1,'quartIn')
    end

    if tag == 'bop' or 'bop2' then

        
        doTweenColor('col4','likee','FFFFFF',0.2)
    end

    if tag == 'colrate' then
   
        doTweenColor('colrate2','rateme','FFFFFF',0.2)
    end

    if tag == 'bop3' or 'bop4' then

        doTweenColor('col2','likee','FFFFFF',0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        defalutrate = 'FURRY!'
        doTweenX('wow', 'rateme', getProperty('likee.x') + 100 - 120, 0.1, 'quartIn')
        setProperty('rateme.alpha', 1)
        cancelTween('alpha22')
        cancelTween('wow2')
        doTweenColor('colrate','rateme','ff4265',0.2)
        setProperty('rateme.x', getProperty('likee.x') + 100)
        if countscore >= 10 then
            countscore = countscore - 10;
        end
    end
end

function onBeatHit()
    if curBeat %1 == 0 then
        if ittime then
            bopalone()
        end
    end
end

function onStepHit()
    
    if curStep == 1406 then
		ittime = true
	end
    
end

function bopping()
    cancelTween('col4')
    if not ittime then
        setProperty('likee.scale.x', 1.175)
        setProperty('likee.scale.y', 1.175)
        doTweenX('bop','likee.scale', 1,0.2)
        doTweenY('bop2','likee.scale', 1,0.2)
        doTweenColor('col','likee','00FF00',0.2)
    end
    
    doTweenX('wow', 'rateme', getProperty('likee.x') + 100 - 120, 0.1, 'quartIn')
end
function bopalone()
    setProperty('likee.scale.x', 1.175)
    setProperty('likee.scale.y', 1.175)
    doTweenX('bop','likee.scale', 1,0.2)
    doTweenY('bop2','likee.scale', 1,0.2)
end
function smol()
    cancelTween('colrate2')
    setProperty('likee.scale.x', 0.175)
    setProperty('likee.scale.y', 0.175)
    doTweenX('bop3','likee.scale', 1,0.2)
    doTweenY('bop4','likee.scale', 1,0.2)
    doTweenColor('col3','likee','FF0000',0.2)
end