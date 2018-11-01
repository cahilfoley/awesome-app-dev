--[[
   Creates a text field for searching
      @param {table} - A table of three different event handlers
         * onBegan() - User begins editing the field
         * onSubmit(text) - Output resulting text from
         * onChange(text) - Text value has changed
      @param {string} placeholder - A placeholder value when the field is empty
      @param {table} [libs] - The libraries to use, if a library is not provided then it will be imported (for testing)
      @return {TextField} - The native text field
]]
local function createSearchField(handlers, placeholder, libs)
   local libs = libs or {}
   local com = libs.com or require("utils.common")
   local native = libs.native or native

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
