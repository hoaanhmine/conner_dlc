function onUpdate()
	if curBeat >= 32 and setcam then
		setProperty('defaultCamZoom',0.78);
		if mustHitSection then
		
			triggerEvent('Camera Follow Pos',1637.5, 809)

		else
            
			triggerEvent('Camera Follow Pos',641,588)

		end

        else if not setcam then

        end
    end
end

function onEvent(n,v1,v2)

	if n == "setcam" then
	
		setcam = v1 == "true"
	
	end
end