local com = require("utils.common")
--

--[[
  Accepts a table of 3 different event handlers
    * onBegan() - User begins editing the field
    * onSubmit(text) - Output resulting text from
    * onChange(text) - Text value has changed
]] local function createSearchField(
  handlers,
  placeholder)
  if placeholder == nil then
    placeholder = "Search"
  end

  local textField = native.newTextField(com.centerX, com.centerY, com.w - 20, 40)
  textField.text = placeholder
  textField.isEditable = true

  textField:setReturnKey("search")

  function textField:addHandler(label, handler)
    handlers[label] = handler
  end

  function textField:reset()
    textField.text = placeholder
  end

  function handleInput(event)
    if (event.phase == "began") then
      if handlers.onBegan then
        handlers.onBegan()
      end
      if textField.text == placeholder then
        textField.text = ""
      end
    elseif (event.phase == "ended") then
      if textField.text == "" then
        textField.text = placeholder
      end
    elseif (event.phase == "submitted") then
      if handlers.onSubmit then
        handlers.onSubmit(textField.text)
      end
    elseif (event.phase == "editing") then
      if handlers.onChange then
        handlers.onChange(event.text)
      end
    end
  end

  textField:addEventListener("userInput", handleInput)

  return textField
end

return createSearchField
