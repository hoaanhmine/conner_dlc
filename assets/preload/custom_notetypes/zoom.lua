function opponentNoteHit(id, dir, type, sustain) 
    if type == 'zoom' and not sustain then
		triggerEvent('Add Camera Zoom',0.4,0.05)
	end
		
end

function goodNoteHit(id, dir, type, sustain) 
    if type == 'zoom' and not sustain then
		triggerEvent('Add Camera Zoom',0.4,0.05)
	end
end