# Description

This AppleScript (.applescript file) creates a blank Microsoft Word document (.docx file) and runs the 'Save As...' dialogue before that new file is first opened in Micoroft Word. Microsoft Word in effect asks you to have the new document named and saved in a location before it is edited in any way.

New Word documents made within Microsoft Word normally become an unsaved 'Document1'. As unsaved copies proliferate into 'Document2', 'Document3' and so on, it becomes more and more difficult for practitioners to keep files that only have to be saved after much time in order.

# Requirements

- macOS
- Microsoft Word
- OneDrive
- Shortcuts

# Usage

1. Create a Microsoft Word document (.docx file) and format it in accordance with your preferences. This .docx file will be used as a template; the script will copy it and that copy will be opened as a new file.
  
2. Save this .docx file with a stable path. The code assumes this path is: *Library/Group Containers/UBF8T346G9.Office/User Content.localized/Templates.localized/Normal.docx*. Should that path be different, update *templatePath* in the script accordingly. 

3. The code assumes the path to the relevant OneDrive folder is: *Library/CloudStorage/OneDrive-Personal*. Should that path be different, update *defaultFolder* in the script accordingly. 

4. Open the Shortcuts App and create a shortcut with the action Run AppleScript.
  
5. Copy the code into the Run AppleScript text box. 

6. Open the information icon (i) in the top right, then *Details* and ensure *Services Menu* is selected.
  
7. Click *Add Keyboard Shortcuts* and set a preferred shortcut. ⌥⇧⌘N is suggested to mirror the creation of a new folder with ⇧⌘N.
   
8. Name the Shortcut. *Create New Word Document* is suggested.

# Finder Behaviour

The topmost Finder window affects the 'Save As...' dialog.

If Finder has selected or open in its topmost window a folder in *Documents*, *Library/CloudStorage* or *Library/Mobile Documents* being either the location of documents in iOS or the locations of document clouds, then the 'Save As...' dialog displays that folder and the user does not have to renavigate to it from within the 'Save As...' dialog.

Otherwise, the 'Save As...' dialog displays OneDrive which is assumed to be under the path *Library/CloudStorage/OneDrive-Personal*. Should you wish another default, update *defaultFolder* in the script accordingly.
