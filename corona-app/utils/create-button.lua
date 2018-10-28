--[[
   Creates a button widget with a given label and click handler
      @param {string} label - The text to display on the button
      @param {function} handler - The function to call when the button is clicked
      @param {boolean} [small] - A flag to specify that the button should use a smaller font
      @param {table} [libs] - The libraries to use, if a library is not provided then it will be imported (for testing)
      @return {GroupObject} - A display group containing the button and associated elements
]]--
function createButton(label, handler, small, libs)
   local libs = libs or {}
   local com = libs.com or require("utils.common")
   local display = libs.display or display
   local widget = libs.widget or require("widget")

   local group = display.newGroup(com.w - 20, 100)

   local bgShadow = display.newRoundedRect(3, 3, com.w - 20, 90, 7)
   bgShadow:setFillColor(0)
   bgShadow.alpha = 0.3
   group:insert(bgShadow)

   local fontSize = 32
   if small then
      fontSize = 24
   end

   local button = widget.newButton(
      {
         label = label,
         onEvent = function(event)
            if event.phase == "ended" then
               handler(event)
            end
         end,
         emboss = false,
         -- Properties for a rounded rectangle button
         shape = "roundedRect",
         width = com.w - 20,
         height = 90,
         cornerRadius = 5,
         x = 0,
         y = 0,
         fillColor = {
            default = {1, 1, 1},
            over = {.8, .8, .8}
         },
         labelColor = {
            default = {0, 0, 0}
         },
         fontSize = fontSize
      }
   )
   group:insert(button)

   return group
end

return createButton
