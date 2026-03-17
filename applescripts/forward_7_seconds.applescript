tell application "QuickTime Player"
	if not (exists document 1) then return
	
	set theDoc to front document
	set docDuration to get «property durn» of theDoc
	set newTime to (get «property time» of theDoc) + 7
	if newTime > docDuration then set newTime to docDuration
	set «property time» of theDoc to newTime
end tell
