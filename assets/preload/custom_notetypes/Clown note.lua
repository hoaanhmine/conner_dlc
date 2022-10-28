function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Clown note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'CLOWNNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-500'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Clown note' then
		cameraFlash('hud','ff4265',1,true)

		playSound('clown/scratch', 2, 'snowspit')
		setProperty('health', getProperty('health') -0.0223);
		setProperty('daRating.score',-500);
					makeLuaSprite('boo', 'clown/attack/'..getRandomInt(0, 2)..'' , 0, 0)
					setScrollFactor('boo', 0, 0);
					setObjectOrder('boo', getObjectOrder('boyfriendGroup') + 100)
					screenCenter('boo')
					setObjectCamera('boo', 'other')
					doTweenAlpha('LL', 'boo', 0, 0, 'linear')
					addLuaSprite('boo')
					playAnim('boyfriend', 'hurt', true);
					runTimer('fade', 0.1, 1)
				
		
		
		
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'fade' then
		doTweenAlpha('in', 'boo', 1, 0.3, 'linear')
		runTimer('out', 0.4, 1)
	end 
	if tag == 'out' then
		doTweenAlpha('goo', 'boo', 0, 1, 'linear')
	end
end