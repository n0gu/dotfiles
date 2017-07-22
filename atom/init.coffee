# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'body', 'custom:smart-move-up', ->
  editor = atom.workspace.getActiveTextEditor()
  if not editor
    atom.workspace.getElement().focusPaneViewAbove()
    return
  isMultiple = editor.hasMultipleCursors()
  if not isMultiple
    currPosition = editor.getLastCursor().getScreenPosition()
  editor.moveToTop()
  if not isMultiple
    if editor.getLastCursor().getScreenPosition().isEqual(currPosition)
      prevFocusPane = atom.workspace.getActivePane()
      atom.workspace.getElement().focusPaneViewAbove()
      newFocusedPane = atom.workspace.getActivePane()
      if prevFocusPane.id == newFocusedPane.id
        prevFocusPane.splitUp({copyActiveItem:true})

atom.commands.add 'body', 'custom:smart-move-down', ->
  editor = atom.workspace.getActiveTextEditor()
  if not editor
    atom.workspace.getElement().focusPaneViewBelow()
    return
  isMultiple = editor.hasMultipleCursors()
  if not isMultiple
    currPosition = editor.getLastCursor().getScreenPosition()
  editor.moveToBottom()
  if not isMultiple
    if editor.getLastCursor().getScreenPosition().isEqual(currPosition)
      prevFocusPane = atom.workspace.getActivePane()
      atom.workspace.getElement().focusPaneViewBelow()
      newFocusedPane = atom.workspace.getActivePane()
      if prevFocusPane.id == newFocusedPane.id
        prevFocusPane.splitDown({copyActiveItem:true})

atom.commands.add 'body', 'custom:smart-move-left', ->
  editor = atom.workspace.getActiveTextEditor()
  if not editor
    atom.workspace.getElement().focusPaneViewOnLeft()
    return
  if not editor.hasMultipleCursors()
    if editor.getLastCursor().isAtBeginningOfLine()
      prevFocusPane = atom.workspace.getActivePane()
      atom.workspace.getElement().focusPaneViewOnLeft()
      newFocusedPane = atom.workspace.getActivePane()
      if prevFocusPane.id == newFocusedPane.id
        prevFocusPane.splitLeft({copyActiveItem:true})
      return
  editor.moveToFirstCharacterOfLine()

atom.commands.add 'body', 'custom:smart-move-right', ->
  editor = atom.workspace.getActiveTextEditor()
  if not editor
    atom.workspace.getElement().focusPaneViewOnRight()
    return
  if not editor.hasMultipleCursors()
    console.log("hello")
    if editor.getLastCursor().isAtEndOfLine()
      prevFocusPane = atom.workspace.getActivePane()
      atom.workspace.getElement().focusPaneViewOnRight()
      newFocusedPane = atom.workspace.getActivePane()
      if prevFocusPane.id == newFocusedPane.id
        prevFocusPane.splitRight({copyActiveItem:true})
      return
  editor.moveToEndOfScreenLine()
