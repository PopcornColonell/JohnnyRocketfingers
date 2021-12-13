function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
	if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ebola' then
		setPropertyFromGroup('unspawnNotes', i, 'texture', 'Pnotes');
		setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end
end
--function goodNoteHit(id, noteData, noteType, isSustainNote)
--	if noteType == 'ebola' then
--	runTimer('dmg', 0.001, 0);	
--	doTweenAlpha('dabitch', 'dabitch', 1, 0.00001, 'linear' )
--	objectPlayAnimation('dabitch', 'bruh', false);
--	soundName = string.format('V/jajas/laugh%i', math.random(1, 4));
--	playSound(soundName, 1, 'laugh');	
--    setProperty('songMisses', getProperty('songMisses')+1);
--	end
--end

--function onTimerCompleted(tag, loops, loopsLeft)
--	if tag == 'dmg' then
--	setProperty('health', getProperty('health')-0.001, 9000000);
--	end
--end

function min(a,b) if a > b then return b else return a end end
local notes = {
    ["ebola"] = {
        misses = 0,
        max = 10,
        func = function(self)
            gonnaDie = true
            gonnaDieAmm = (min(self.misses,self.max) * 0.001);
        end,
    },
}
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if (notes[noteType]) then
        notes[noteType].misses = notes[noteType].misses + 1
        if notes[noteType].func then
            notes[noteType].func(notes[noteType])
			ghostmisses = ghostmisses + 1;
        end
    end
end
gonnaDie = false;
gonnaDieAmm = 0;

function onUpdate(elapsed)
    if (gonnaDie) then
        setProperty('health', getProperty('health') - gonnaDieAmm);
    end
end