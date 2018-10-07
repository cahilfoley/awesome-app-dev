function createPageHeader(content)
  local title = display.newGroup()
  local titleBackground = display.newRect(display.contentCenterX, 50, display.contentWidth, 100)
  titleBackground:setFillColor(33 / 255, 150 / 255, 243 / 255)
  title:insert(titleBackground)

  local titleText = display.newText(content, display.contentCenterX, 70, 'Roboto', 32)
  titleText:setFillColor(1)
  title:insert(titleText)

  function title:updateTitle(newContent)
    titleText.text = newContent
  end

  return title
end

return createPageHeader
