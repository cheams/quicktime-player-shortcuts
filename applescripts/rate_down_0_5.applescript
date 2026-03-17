tell application "QuickTime Player"
	if not (exists document 1) then return
	
	set theDoc to front document
	set currentRate to get «property rate» of theDoc
	if currentRate < 1.0 then set currentRate to 1.0
	set newRate to currentRate - 0.5
	if newRate < 0.5 then set newRate to 0.5
	«event MVWRplay» theDoc
	delay 0.05
	set «property rate» of theDoc to newRate
end tell
