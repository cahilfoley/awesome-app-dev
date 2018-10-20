local widget = require("widget")
local com = require("utils.common")

local function createPageHeader(content)
   local title = display.newGroup()
   local titleBackground = display.newRect(com.centerX, 50, com.w, 100)
   titleBackground:setFillColor(33 / 255, 150 / 255, 243 / 255)
   title:insert(titleBackground)

   local titleText = display.newText(content, com.centerX, 70, "Roboto", 32)
   titleText:setFillColor(1)
   title:insert(titleText)

   local menuButton = widget.newButton(
      {
         defaultFile = "data/icons/menu-icon.png",
         width = 40,
         height = 40
      }
   )
   menuButton.x = 40
   menuButton.y = 70
   -- menuButton.isVisible = false
   title:insert(menuButton)

   function title:updateTitle(newContent)
      titleText.text = newContent
   end

   function title:registerMenuHandler(loadMenu)
      menuButton:addEventListener("tap", loadMenu)
   end

   function title:showMenuButton()
      menuButton.isVisible = true
   end

   function title:hideMenuButton()
      menuButton.isVisible = false
   end

   return title
end

return createPageHeader
