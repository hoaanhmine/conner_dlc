local colors = {
	[0] = "C24B99",
	[1] = "00FFFF",
	[2] = "12FA05",
	[3] = "F9393F"
}

function onUpdate()
	doTweenAlpha('alpha','gradient',0,1,'quartIn')
end

function goodNoteHit(id, dir, type, sus)
	if (sus) then return end
	
	doTweenColor('bb1', 'gradient',colors[dir],0.2, 'quartIn')
	doTweenColor('bb3', 'part',colors[dir],1, 'quartIn')
end

function opponentNoteHit(id, dir, type, sus)
	if (sus) then return end
	
	doTweenColor('bb2', 'gradient',colors[dir],0.2, 'quartIn')
	doTweenColor('bb4', 'part',colors[dir],0.2, 'quartIn')
end