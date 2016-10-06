#!/usr/bin/osascript

tell application "System Events"
	set frontApp to the name of the first application process whose frontmost is true
end tell

try
    tell application frontApp to set frontDocument to the name of the front document
on error
    try
        tell application frontApp to set frontDocument to the name of the front window
    on error
        set frontDocument to ""
    end try
end try
get frontApp & "\n" & frontDocument
