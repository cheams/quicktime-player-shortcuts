tell application "QuickTime Player"
	if not (exists document 1) then return
	
	set theDoc to front document
	«event MVWRplay» theDoc
	delay 0.05
	set «property rate» of theDoc to 1.0
end tell
