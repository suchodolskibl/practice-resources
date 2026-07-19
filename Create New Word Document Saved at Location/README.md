# Description

This AppleScript (.applescript file) creates a blank Microsoft Word document (.docx file) and runs the 'Save As...' dialogue before that new file is first opened in Micoroft Word. Microsoft Word in effect asks you to have the new document named and saved in a location before it is edited in any way.

New Word documents made within Microsoft Word normally become an unsaved 'Document1'. As unsaved copies proliferate into 'Document2', 'Document3' and so on, it becomes more and more difficult for practitioners to keep files that only have to be saved after much time in order.

# Requirements

- macOS
- Microsoft Word
- OneDrive
- Shortcuts

# Usage

1. Create a Microsoft Word document (.docx file) and format it in accordance with your preferences. This .docx file will be used as a template; the script will copy it and the copy will be saved as a new file.
  
2. Save this .docx file with a stable path. The code assumes this path is: *Library/Group Containers/UBF8T346G9.Office/User Content.localized/Templates.localized/Normal.docx*. Should that path be different, update *templatePath* in the code accordingly. 

3. The code assumes the path to the relevant OneDrive folder is: *Library/CloudStorage/OneDrive-Personal*. Should that path be different, update *defaultFolder* in the code accordingly. 

4. f

5. Set the location of that .doxc file . The code uses as a default:

# Finder Behaviour
