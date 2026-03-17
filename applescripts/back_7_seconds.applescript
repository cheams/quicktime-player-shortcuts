tell application "QuickTime Player"
	if not (exists document 1) then return
	
	set theDoc to front document
	set newTime to (get «property time» of theDoc) - 7
	if newTime < 0 then set newTime to 0
	set «property time» of theDoc to newTime
end tell
