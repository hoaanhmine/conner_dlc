function onEvent(name,value1,value2)
    if name == 'camzoom' then
        setProperty('defaultCamZoom', value1)
    end
end