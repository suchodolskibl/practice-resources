on run {input, parameters}
	set homePath to POSIX path of (path to home folder)

	set templatePath to homePath & "Library/Group Containers/UBF8T346G9.Office/User Content.localized/Templates.localized/Normal.docx"
	set defaultFolder to homePath & "Library/CloudStorage/OneDrive-Personal"

	set documentsPath to homePath & "Documents"
	set cloudPath to homePath & "Library/CloudStorage"
	set mobilePath to homePath & "Library/Mobile Documents"

	tell application "Finder"
		try
			set selectedItems to selection
		
			if (count of selectedItems) > 0 then
				-- Something is selected: use it
				set selectedItem to item 1 of selectedItems
			
				if class of selectedItem is folder then
					set candidateFolder to selectedItem as alias
				else
					set candidateFolder to container of selectedItem as alias
				end if
			
			else if (count of Finder windows) > 0 then
				-- Nothing selected: use the folder shown in the frontmost Finder window
				set candidateFolder to target of front Finder window as alias
			
			else
				-- No selection and no Finder window
				set candidateFolder to missing value
			end if
		end try
	end tell

	-- Accept the Finder location only if it is inside Documents or OneDrive
	if candidateFolder is not missing value then
		set candidatePath to POSIX path of candidateFolder
	
		if my pathIsWithin(candidatePath, documentsPath) or my pathIsWithin(candidatePath, cloudPath) or my pathIsWithin(candidatePath, mobilePath) then
			set defaultFolder to candidateFolder
		end if
	end if

	-- Open the genuine macOS Save dialogue
	set destinationFile to Â
		choose file name with prompt Â
			"Create New Word Document" default location defaultFolder Â
			default name "New Document.docx"

	set destinationPath to POSIX path of destinationFile

	-- Add the Word extension if omitted
	if destinationPath does not end with ".docx" then
		set destinationPath to destinationPath & ".docx"
	end if

	-- Prevent accidental replacement
	do shell script "if [ -e " & quoted form of destinationPath & " ]; then exit 1; fi"

	-- Copy the blank document and open the new copy in Word
	do shell script "/bin/cp " & quoted form of templatePath & space & quoted form of destinationPath
	do shell script "/usr/bin/open -a " & quoted form of "Microsoft Word" & space & quoted form of destinationPath
end run

on pathIsWithin(candidatePath, permittedRoot)
	set candidatePath to my removeTrailingSlash(candidatePath)
	set permittedRoot to my removeTrailingSlash(permittedRoot)
	
	return candidatePath is permittedRoot or Â
		candidatePath starts with permittedRoot & "/"
end pathIsWithin


on removeTrailingSlash(thePath)
	repeat while thePath ends with "/" and (length of thePath) > 1
		set thePath to text 1 thru -2 of thePath
	end repeat
	
	return thePath
end removeTrailingSlash